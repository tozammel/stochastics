package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.seq;
import static java.lang.System.out;
import static java.util.Arrays.asList;
import static java.util.Arrays.stream;
import static java.util.stream.Collectors.joining;
import static org.fusesource.jansi.Ansi.ansi;
import static util.Console.println;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.function.IntFunction;

import org.apache.commons.math3.optim.PointValuePair;
import org.fusesource.jansi.Ansi.Color;

import dnl.utils.text.table.TextTable;
import fastmath.DoubleMatrix;
import fastmath.IntVector;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import stochastic.annotations.Units;
import stochastic.pointprocesses.finance.TradingFiltration;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.finance.TradingStrategy;
import stochastic.pointprocesses.selfexciting.BoundedParameter;
import stochastic.pointprocesses.selfexciting.Type;
import util.DateUtils;
import util.TerseThreadFactory;

public class MutuallyExcitingProcessEstimator
{
  @Units(time = TimeUnit.HOURS)
  public static final double W = 0.5; // half hour

  static
  {
    System.setProperty("java.util.concurrent.ForkJoinPool.common.threadFactory", TerseThreadFactory.class.getName());
  }

  private ExponentialMutuallyExcitingProcess process;
  private int trajectoryCount = Runtime.getRuntime().availableProcessors();

  public MutuallyExcitingProcessEstimator(ExponentialMutuallyExcitingProcess process)
  {
    this.process = process;
  }

  public static void
         main(String[] args) throws IOException,
                             CloneNotSupportedException
  {
    // Type type = Type.MultivariateFullExtendedApproximatePowerlaw;
    Type type = Type.MultivariateDiagonalExtendedApproximatePowerlaw;

    String filename = args[0];

    TradingProcess mpp = TradingProcess.loadMppFile(filename);

    int trajectoryCount = Runtime.getRuntime().availableProcessors() * 2 ;

    String symbol = args[1];

    out.println("Estimating parameters for " + filename);
    ArrayList<ExponentialMutuallyExcitingProcess> processes = estimateMutuallyExcitingTradingProcess(type, mpp, filename, trajectoryCount, symbol);

  }

  public static ArrayList<ExponentialMutuallyExcitingProcess>
         estimateMutuallyExcitingTradingProcess(Type type,
                                                TradingProcess tradingProcess,
                                                String filename,
                                                int trajectoryCount,
                                                String symbol) throws IOException
  {
    assert type != null;
    return estimateMutuallyExcitingTradingProcesses(type, trajectoryCount, tradingProcess.getTradingFiltration(), filename);
  }

  /**
   * Return an array of calibrated Hawkes processes by splitting the trading
   * session up into windows of length this{@link #W}
   * 
   * @param type
   *          {@link Type} of self-exciting process to use
   * 
   * @param trajectoryCount
   *          number of random starts for the multistart optimizer to use to
   *          determine optimal parameters
   * @param filename
   * @param times
   * @return
   * @throws IOException
   */
  public static ArrayList<ExponentialMutuallyExcitingProcess>
         estimateMutuallyExcitingTradingProcesses(Type type,
                                                  int trajectoryCount,
                                                  TradingFiltration tradingProcess,
                                                  String filename) throws IOException
  {
    assert type != null;
    Vector times = tradingProcess.times;
    double Edt = times.diff().mean();

    out.println("E[dt]=" + Edt);

    ArrayList<ExponentialMutuallyExcitingProcess> processes = new ArrayList<>();
    int n = (int) (TradingProcess.tradingDuration / W);
    int indexes[] = TradingStrategy.getIndices(times);

    for (int section = 0; section < n; section++)
    {
      Vector timeSlice = times.slice(section == 0 ? 0 : indexes[section - 1], indexes[section]);
      IntVector typeSlice = tradingProcess.types.slice(section == 0 ? 0 : indexes[section - 1], indexes[section]);
      DoubleMatrix markedPointSlice = tradingProcess.markedPoints.sliceRows(section == 0 ? 0 : tradingProcess.tradeIndexes[section - 1],
                                                                            tradingProcess.tradeIndexes[section]);

      ExponentialMutuallyExcitingProcess process = ExponentialMutuallyExcitingProcess.spawnNewProcess(type, tradingProcess);
      process.verbose = true;

      MutuallyExcitingProcessEstimator estimator = new MutuallyExcitingProcessEstimator(process);
      estimator.setTrajectoryCount(trajectoryCount);
      estimator.estimate(markedPointSlice, typeSlice, filename, section);
      processes.add(process);

      File testFile = new File("test" + section + ".mat");
      storeParameterEstimationResults(testFile, timeSlice, process, filename, section);
      // System.out.println("test mode");
      // System.exit(1);
    }

    return processes;
  }

  public static void
         storeParameterEstimationResults(File testFile,
                                         Vector data,
                                         AbstractMutuallyExcitingProcess process,
                                         String filename,
                                         final int i) throws IOException
  {

    Vector intensities[] = seq((IntFunction<Vector>) type -> process.λvector(type).setName("intensity" + type), 0, process.dim() - 1).toArray(Vector[]::new);

    // Vector innov = process.getInnovationSequence();
    out.println("writing timestamp data, compensator, intensity to " + testFile.getAbsolutePath() + " E[data.dt]=" + data.diff().mean());
    MatFile outFile = new MatFile(testFile, MutuallyExcitingProcessEstimator.class.getSimpleName());
    outFile.write(data.createMiMatrix());
    outFile.write(new Vector(process.K).setName("K").createMiMatrix());

    // outFile.write(innov.createMiMatrix());
    // outFile.write(data.createMiMatrix());
    for (int m = 0; m < process.dim(); m++)
    {
      Vector compensator = process.Λ(m).setName("comp" + m);
      Vector times = process.getTimes(m);
      out.println("storing " + times.getName());
      out.println("storing " + compensator.getName());
      out.println("storing " + intensities[m].getName());

      outFile.write(times.createMiMatrix());
      outFile.write(compensator.createMiMatrix());
      outFile.write(intensities[m].createMiMatrix());
    }

    outFile.close();

    File modelFile = new File(filename + "." + process.getType().getFilenameExtension() + "." + i + ".model");
    double firstTimestampInInterval = DateUtils.convertTimeUnits(process.T.getLeftmostValue(), TimeUnit.MILLISECONDS, TimeUnit.HOURS);
    double lastTimestampInInterval = DateUtils.convertTimeUnits(process.T.getRightmostValue(), TimeUnit.MILLISECONDS, TimeUnit.HOURS);

    out.println("Storing estimated parameters in " + modelFile.getAbsolutePath()
                + " covering the range "
                + firstTimestampInInterval
                + " to "
                + lastTimestampInInterval
                + " hours of type "
                + process.getType()
                + " in "
                + modelFile.getAbsolutePath());

    process.storeParameters(modelFile);
  }

  public void
         setTrajectoryCount(int trajectoryCount)
  {
    this.trajectoryCount = trajectoryCount;
  }

  private boolean verbose = true;

  /*
   * 
   * @return number of trajectories do generate during search for optimal
   * parameters
   * 
   */
  public int
         getTrajectoryCount()
  {
    return trajectoryCount;
  }

  public MutuallyExcitingProcess
         estimate(DoubleMatrix markedPoints,
                  IntVector types,
                  String filename,
                  int section) throws IOException
  {
    process.T = markedPoints.col(0);
    process.X = markedPoints;
    process.K = types;

    if (verbose)
    {
      println(ansi().fgRed()
                    .bgBright(Color.WHITE)
                    .a("spawning ")
                    .fgBrightMagenta()
                    .a(getTrajectoryCount())
                    .fgGreen()
                    .a(" " + process.getClass().getSimpleName())
                    .fgRed()
                    .bgBright(Color.WHITE)
                    .a("es to estimate the model parameters ")
                    .fgBrightBlue()
                    .a("[" + asList(process.getParameterFields()).stream().map(field -> field.getName()).collect(joining(",")))
                    .fgRed()
                    .bgBright(Color.WHITE)
                    .a("] most likely to have generated the observed sequence of ")
                    .fgBrightMagenta()
                    .a(process.T.size())
                    .fgRed()
                    .bgBright(Color.WHITE)
                    .a(" timestamps")
                    .reset());
    }

    ParallelMultistartMultivariateOptimizer optimizer = process.estimateParameters(getTrajectoryCount(), j -> out.println("j=" + j), filename, section);
    printResults(optimizer);

    return process;

  }

  public TextTable
         printResults(ParallelMultistartMultivariateOptimizer multiopt)
  {

    BoundedParameter[] params = process.getBoundedParameters();

    println("estimated parameters for " + process.getClass().getSimpleName() + "[" + stream(params).map(param -> param.getName()).collect(joining(",")) + "]");

    PointValuePair[] optima = multiopt.getOptima().toArray(new PointValuePair[0]);

    String[] columnHeaders = process.getColumnHeaders();

    Object[][] data = evaluateStatisticsForEachLocalOptima(optima, columnHeaders);

    TextTable tt = new TextTable(columnHeaders, data);

    tt.setAddRowNumbering(true);
    tt.printTable();

    return tt;
  }

  public Object[][]
         evaluateStatisticsForEachLocalOptima(PointValuePair[] optima,
                                              String[] columnHeaders)
  {
    Object[][] data = new Object[optima.length][columnHeaders.length];

    for (int i = 0; i < optima.length; i++)
    {
      Object[] row = process.evaluateParameterStatistics(optima[i].getPoint());

      for (int j = 0; j < columnHeaders.length; j++)
      {
        data[i][j] = row[j];
      }
    }
    return data;
  }

}

package stochastic.pointprocesses.autoexciting;

import static java.lang.System.out;
import static java.util.Arrays.asList;
import static java.util.stream.Collectors.joining;
import static java.util.stream.IntStream.range;
import static org.fusesource.jansi.Ansi.ansi;
import static util.Console.println;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import org.fusesource.jansi.Ansi.Color;

import fastmath.DoubleColMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import stochastic.annotations.Units;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.finance.TradingStrategy;
import util.TerseThreadFactory;

public class ProcessEstimator
{
  @Units(time = TimeUnit.HOURS)
  public static final double W = 0.5; // half hour

  static
  {
    System.setProperty("java.util.concurrent.ForkJoinPool.common.threadFactory", TerseThreadFactory.class.getName());
  }

  private AbstractAutoExcitingProcess process;

  private int trajectoryCount = Runtime.getRuntime().availableProcessors();

  public ProcessEstimator(AutoExcitingProcess process)
  {
    this.process = (AbstractAutoExcitingProcess) process;
  }

  public static void
         main(String[] args) throws IOException,
                             CloneNotSupportedException
  {

    AutoExcitingProcessFactory.Type type = Type.ExtendedApproximatePowerlaw;
    String filename = args.length > 0 ? args[0] : "/home/stephen/git/fastmath/SPY.mat";
    int cpuMultiplier = 1;

    cpuMultiplier = 4;
    int trajectoryCount = Runtime.getRuntime().availableProcessors() * cpuMultiplier;
    if (args.length > 1)
    {
      trajectoryCount = Integer.valueOf(args[1]);
    }
    String symbol = "SPY";

    out.println("Estimating parameters for " + filename);
    ArrayList<AbstractAutoExcitingProcess> processes = estimateAutoExcitingProcess(type, filename, trajectoryCount, symbol);

  }

  /**
   * estimate the parameters of a Hawkes process model
   * 
   * @param type
   * @param filename
   * @param symbol
   * @return
   * @throws IOException
   */
  public static ArrayList<AbstractAutoExcitingProcess>
         estimateAutoExcitingProcess(AutoExcitingProcessFactory.Type type,
                                     String filename,
                                     String symbol) throws IOException

  {
    return estimateAutoExcitingProcess(type, filename, Runtime.getRuntime().availableProcessors(), symbol);
  }

  public static ArrayList<AbstractAutoExcitingProcess>
         estimateAutoExcitingProcess(AutoExcitingProcessFactory.Type type,
                                     String filename,
                                     int trajectoryCount,
                                     String symbol) throws IOException
  {
    Vector data = loadTimes(filename, symbol);

    return estimateAutoExcitingProcesses(type, trajectoryCount, data);
  }

  /**
   * Return an array of calibrated self-exciting processes by splitting the
   * trading session up into windows of length this{@link #W}
   * 
   * @param type
   *          {@link Type} of self-exciting process to use
   * 
   * @param trajectoryCount
   *          number of random starts for the multistart optimizer to use to
   *          determine optimal parameters
   * @param times
   * @return
   * @throws IOException
   */
  public static ArrayList<AbstractAutoExcitingProcess>
         estimateAutoExcitingProcesses(AutoExcitingProcessFactory.Type type,
                                       int trajectoryCount,
                                       Vector times) throws IOException
  {

    double Edt = times.diff().mean();

    out.println("E[dt]=" + Edt);

    ArrayList<AbstractAutoExcitingProcess> processes = new ArrayList<>();
    int n = (int) (TradingProcess.tradingDuration / W);
    int indexes[] = TradingStrategy.getIndices(times);

    range(0, n).forEachOrdered(i -> {
      Vector slice = times.slice(i == 0 ? 0 : indexes[i - 1], indexes[i]);
      double sliceEdt = slice.diff().mean();
      
      out.println("E_" + i + "[dt]=" + sliceEdt);

      AbstractAutoExcitingProcess process = estimateAutoExcitingProcess(type, trajectoryCount, slice);
      processes.add(process);

      File testFile = new File("test" + i + ".mat");
      File modelFile = new File(testFile.getAbsolutePath() + "." + type.getFilenameExtension() + ".model");

      storeParameterEstimationResults(testFile, slice, process, modelFile);

    });

    return processes;
  }

  public static AbstractAutoExcitingProcess
         estimateAutoExcitingProcess(AutoExcitingProcessFactory.Type type,
                                     int trajectoryCount,
                                     Vector slice)
  {
    AbstractAutoExcitingProcess process = AutoExcitingProcessFactory.spawnNewProcess(type, 1);
    ProcessEstimator estimator = new ProcessEstimator(process);
    estimator.setTrajectoryCount(trajectoryCount);
    estimator.estimate(slice);
    return process;
  }

  public static void
         storeParameterEstimationResults(File testFile,
                                         Vector data,
                                         AbstractAutoExcitingProcess process,
                                         File modelFile)
  {
    Vector compensator = process.Λ().setName("comp");
    Vector intensity = process.λvector().setName("intensity");
    out.println("writing timestamp data, compensator, intensity, and innovation to " + testFile.getAbsolutePath() + " and parameters to " + modelFile);
    Vector innovation = process.getInnovationSequence().setName("innov");

    try
    {
      process.storeParameters(modelFile);
      MatFile.write(testFile, data.createMiMatrix(), compensator.createMiMatrix(), intensity.createMiMatrix(), innovation.createMiMatrix());
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
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

  public AbstractAutoExcitingProcess
         estimate(Vector data)
  {
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
                    .a(data.size())
                    .fgRed()
                    .bgBright(Color.WHITE)
                    .a(" timestamps")
                    .reset());
    }

    process.T = data;
    ParallelMultistartMultivariateOptimizer optimizer = process.estimateParameters(getTrajectoryCount(), null);
    process.printResults(optimizer);
//    double averageError = process.getInnovationSequence().mean();
//    out.println("E(I)=" + process.getMeanPredictionError()
//               
//                + " sqrt(E(I^2))="
//                + process.getRootMeanSquaredPredictionError());
    return process;

  }

  public static Vector
         loadTimes(String filename,
                   String symbol) throws IOException
  {

    DoubleColMatrix matrix = MatFile.loadMatrix(filename, symbol);
    Vector times = matrix.col(0).copy().setName("times");

    return times;
  }

}

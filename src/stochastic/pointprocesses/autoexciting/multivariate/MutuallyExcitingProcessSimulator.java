package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;
import static java.util.stream.IntStream.rangeClosed;
import static util.Console.println;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.math3.optim.PointValuePair;

import dnl.utils.text.table.TextTable;
import fastmath.DoubleColMatrix;
import fastmath.IntVector;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.DiagonalExtendedApproximatePowerlawMututallyExcitingProcess;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;
import util.DateUtils;
import util.TerseThreadFactory;

public class MutuallyExcitingProcessSimulator
{

  static
  {
    System.setProperty("java.util.concurrent.ForkJoinPool.common.threadFactory", TerseThreadFactory.class.getName());
  }

  private AbstractMutuallyExcitingProcess process;

  public MutuallyExcitingProcessSimulator(MutuallyExcitingProcess process)
  {
    this.process = (AbstractMutuallyExcitingProcess) process;
  }

  public static void
         main(String[] args) throws IOException,
                             CloneNotSupportedException,
                             InterruptedException
  {
    // int threadCount = Runtime.getRuntime().availableProcessors();
    int threadCount = 1;

    int seed = args.length > 0 ? Integer.valueOf(args[0]) : 0;
    Vector hello = new Vector(threadCount);
    rangeClosed(0, threadCount - 1).parallel().forEach(thread -> {
      UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess process = new UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(2);
      try
      {
        process.loadParameters(new File("/home/stephen/git/fastmath/SPY.mat.urweapl.7.model"));
      }
      catch (IOException e)
      {
        e.printStackTrace(System.err);
        throw new RuntimeException(e.getMessage(), e);
      }

      process.T = new Vector(new double[] {});
      process.K = new IntVector(process.T.size());
      // process.trace = true;
      hello.set(thread, simulateProcess(process, seed + thread, DateUtils.convertTimeUnits(30, TimeUnit.MINUTES, TimeUnit.HOURS)).diff().mean());
    });
    out.println("mean times: " + hello);
    out.println("average mean time: " + hello.mean());

  }

  public static Vector
         simulateProcess(DiagonalExtendedApproximatePowerlawMututallyExcitingProcess process,
                         int seed,
                         double stoppingTime)
  {
    return process.simulate(seed, stoppingTime);
  }

  public static void
         storeParameterEstimationResults(File testFile,
                                         Vector data,
                                         AbstractMutuallyExcitingProcess process)
  {

    try
    {
      MatFile outFile = new MatFile(testFile, MutuallyExcitingProcessSimulator.class.getSimpleName());
      outFile.write(data.createMiMatrix());
      out.println("writing timestamp data, compensators and intensities to " + testFile.getAbsolutePath());
      for (int m = 0; m < process.dim(); m++)
      {
        Vector compensator = process.Λ(m).setName("comp" + m);
        Vector intensity = process.λvector(m).setName("intensity" + m);
        outFile.write(compensator.createMiMatrix());
        outFile.write(intensity.createMiMatrix());
      }
      outFile.close();
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
  }

  private boolean verbose = true;

  public TextTable
         printResults(ParallelMultistartMultivariateOptimizer multiopt)
  {

    println("estimated parameters for " + process);

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

  public static Vector
         loadTimes(String filename,
                   String symbol) throws IOException
  {

    DoubleColMatrix matrix = MatFile.loadMatrix(filename, symbol);
    Vector data = matrix.col(0).setName("data");

    return data;
  }

}

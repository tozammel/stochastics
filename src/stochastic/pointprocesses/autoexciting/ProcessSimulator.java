package stochastic.pointprocesses.autoexciting;

import static java.lang.Math.abs;
import static java.lang.System.out;
import static java.util.Arrays.stream;
import static java.util.stream.Collectors.joining;
import static java.util.stream.IntStream.rangeClosed;
import static org.fusesource.jansi.Ansi.ansi;
import static util.Console.println;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.StreamSupport;

import org.apache.commons.math3.distribution.ExponentialDistribution;
import org.apache.commons.math3.optim.PointValuePair;
import org.apache.commons.math3.random.JDKRandomGenerator;

import dnl.utils.text.table.TextTable;
import fastmath.DoubleColMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import junit.framework.TestCase;
import util.TerseThreadFactory;

public class ProcessSimulator
{

  static
  {
    System.setProperty("java.util.concurrent.ForkJoinPool.common.threadFactory", TerseThreadFactory.class.getName());
  }

  private AbstractAutoExcitingProcess process;

  public ProcessSimulator(AutoExcitingProcess process)
  {
    this.process = (AbstractAutoExcitingProcess) process;
  }

  public static int lastRejectedPoint = -1;

  
  public static void
         main(String[] args) throws IOException,
                             CloneNotSupportedException,
                             InterruptedException
  {
    int threadCount = Runtime.getRuntime().availableProcessors();

    int seed = args.length > 0 ? Integer.valueOf(args[0]) : 0;
    Vector hello = new Vector(threadCount);
    rangeClosed(0, threadCount - 1).parallel().forEach(thread -> {
      ExtendedApproximatePowerlawAutoExcitingProcess process = ExtendedExponentialPowerlawAutoExcitingProcessTest.constructProcess();
      // process.ε = 0.05;
      process.T = new Vector(new double[]
      { 1 });
      process.dT = new Vector(new double[] {});
      hello.set(thread, simulateProcess(process, seed + thread).diff().mean());
    });
    out.println("mean times: " + hello);
    out.println("average mean time: " + hello.mean());

  }

  public static Vector
         simulateProcess(ExtendedApproximatePowerlawAutoExcitingProcess process,
                         int seed)
  {
    int rejects = 0;
    ExponentialDistribution expDist = new ExponentialDistribution(new JDKRandomGenerator(seed), 1);
    out.println("simulating " + ansi().fgBrightYellow() + process + ansi().fgDefault() + " from " + process.T.size() + " points with seed=" + seed);
    int n = process.T.size();
    double nextTime = 0;
    for (int i = 0; i < 500000; i++)
    {
      double y = expDist.sample();
      process.trace = false;
      // TODO: average over Λ and compare against the invariant projection
      double dt = process.invΛ(y);
      if (dt > 10000)
      {
        int pointsSinceLastRejection = lastRejectedPoint == -1 ? 0 : (i - lastRejectedPoint);
        lastRejectedPoint = i;
        rejects++;
        out.println("seed " + seed
                    + ":"
                    + ansi().fgBrightRed()
                    + "rejecting dt="
                    + dt
                    + " for y="
                    + y
                    + "#"
                    + rejects
                    + " points since last reject="
                    + pointsSinceLastRejection
                    + ansi().fgDefault());
        continue;
      }
      process.trace = false;
      // Real dtReal = process.invΛReal(y);
      // if ( dtReal.fpValue() > 6669)
      // {
      // out.println( "clamping " + dtReal );
      // dtReal = new Real(dt);
      // }
      process.trace = false;

      // double dtRealFpValue = dtReal.fpValue();
      double q = process.Λ(n - 1, dt);
      nextTime = (process.T.getRightmostValue() + dt);
      double marginalΛ = process.invΛ(1);
      // out.println("marginalΛ=" + marginalΛ);

      TestCase.assertEquals("y != q", y, q, 1E-7);
      n++;
      process.appendTime(nextTime);
      double Edt = nextTime / n;
      // out.println("T=" + process.T.toIntVector());
      // out.println("Λ=" + process.Λ().slice(max(0, process.T.size() - 10),
      // process.T.size() - 1));
      if (i % 100 == 0)
      {
        String msg = "seed=" + seed
                     + " i="
                     + i
                     + " y="
                     + y
                     + " = q = "
                     + q
                     + " dt="
                     + dt
                     + " marginal="
                     + marginalΛ
                     + " Λmean="
                     + process.Λ().mean()
                     + " Λvar="
                     + process.Λ().variance()
                     + " nextTime="
                     + nextTime
                     + " Edt="
                     + Edt;
        out.println(msg);

      }

      // String msg = "i=" + i + " y=" + y + " = q = " + q + " dt=" + dt + " dtReal="
      // + dtReal + " dtRealFpValue=" + dtRealFpValue + " nextTime=" + nextTime;
      if (abs(y - q) > 1E-8)
      {
        out.println(seed + ":" + ansi().fgBrightRed() + " rejecting dt=" + dt + " for y=" + y + " q=" + q + "# " + rejects + ansi().fgDefault());
        continue;
      }

    }

    String fn = "simulated." + seed + ".mat";
    MatFile.write(fn, process.T.setName("T").createMiMatrix());
    out.println("write " + fn);

    return process.T;
  }

  public static void
         storeParameterEstimationResults(File testFile,
                                         Vector data,
                                         AbstractAutoExcitingProcess process)
  {
    Vector compensator = process.Λ().setName("comp");
    Vector intensity = process.λvector().setName("intensity");
    out.println("writing timestamp data, compensator and intensity to " + testFile.getAbsolutePath()
                + " E[data.dt]="
                + data.diff().mean()
                + " 1/k="
                + (1 / process.κ));
    try
    {
      MatFile.write(testFile, data.createMiMatrix(), compensator.createMiMatrix(), intensity.createMiMatrix());
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

  public static Vector
         loadTimes(String filename,
                   String symbol) throws IOException
  {

    DoubleColMatrix matrix = MatFile.loadMatrix(filename, symbol);
    Vector data = matrix.col(0).setName("data");

    return data;
  }

}

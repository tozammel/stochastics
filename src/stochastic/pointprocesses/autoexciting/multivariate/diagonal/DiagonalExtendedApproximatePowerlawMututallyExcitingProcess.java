package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.Math.abs;
import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;
import static java.lang.System.currentTimeMillis;
import static java.lang.System.out;
import static java.util.Arrays.stream;
import static java.util.stream.IntStream.rangeClosed;
import static org.apache.commons.lang.ArrayUtils.addAll;
import static org.fusesource.jansi.Ansi.ansi;

import java.util.concurrent.atomic.DoubleAdder;

import org.apache.commons.math3.distribution.ExponentialDistribution;
import org.apache.commons.math3.random.JDKRandomGenerator;

import fastmath.Vector;
import fastmath.matfile.MatFile;
import junit.framework.TestCase;
import stochastic.pointprocesses.autoexciting.multivariate.ExponentialMutuallyExcitingProcess;
import stochastic.pointprocesses.selfexciting.BoundedParameter;
import stochastic.pointprocesses.selfexciting.ExtendedApproximatePowerlawSelfExcitingProcess;
import stochastic.pointprocesses.selfexciting.Type;

/**
 * a multivariate version of
 * {@link ExtendedApproximatePowerlawSelfExcitingProcess} with null
 * cross-terms.. that is, the branching matrix is a diagonal vector.. so its a
 * diagonally covariance process
 */
public class DiagonalExtendedApproximatePowerlawMututallyExcitingProcess extends DiagonalExponentialMutuallyExcitingProcess
{

  public DiagonalExtendedApproximatePowerlawMututallyExcitingProcess(int dim)
  {
    this.dim = dim;
    this.dT = new Vector[dim];
    for (int i = 0; i < dim; i++)
    {
      dT[i] = new Vector(0).setName("dT" + i);
    }
    τ = new Vector(dim).setName("τ");
    ε = new Vector(dim).setName("ε");
    η = new Vector(dim).setName("η");
    b = new Vector(dim).setName("b");
  }

  public Vector η;

  public Vector b;

  public Vector ε;

  public Vector τ;

  /**
   * choose m such that m^M=1 minute, in milliseconds
   */
  public double base = exp(log(60000) / M);

  public Vector[] dT;

  /**
   * 
   * @param m
   * @return the m-th univariate process corresponding to the m-th dimension of
   *         this
   */
  public ExtendedApproximatePowerlawSelfExcitingProcess
         getProcess(int m)
  {
    ExtendedApproximatePowerlawSelfExcitingProcess process = new ExtendedApproximatePowerlawSelfExcitingProcess();
    Vector params = getParameters(m);
    out.println("got " + params + " for dim " + m);

    process.assignParameters(params.toDoubleArray());
    process.T = getTimes(m);
    return process;

  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return ExtendedApproximatePowerlawSelfExcitingProcess.Parameter.values();
  }

  /**
   * 
   * @param j
   *          index in [0,order()-1]
   * @param m
   *          from type in [0,dim-1]
   * @param n
   *          to type in [0,dim-1]
   * @return the j-th element of the Vector of parameters corresponding to the
   *         k-th type
   */
  @Override
  public double
         α(int j,
           int m,
           int n)
  {
    if (m != n)
    {
      return 0;
    }
    if (j == M)
    {
      return αS(m);
    }
    double τdiag = τ.get(m);
    double εdiag = ε.get(m);
    return pow(1 / (τdiag * pow(base, j)), 1 + εdiag);
  }

  @Override
  public double
         β(int j,
           int m,
           int n)
  {
    if (m != n)
    {
      return 1;
    }
    return j < M ? (τ.get(m) * pow(base, -j)) : βS(m);

  }

  public double
         αS(int m)
  {
    return b.get(m);
  }

  public final double
         βS(int m)
  {
    return 1 / η.get(m);
  }

  @Override
  public Type
         getType()
  {
    return Type.MultivariateDiagonalExtendedApproximatePowerlaw;
  }

  public Vector
         dT(int m)
  {
    return (dT[m] != null) ? dT[m] : (dT[m] = getTimes(m).diff());
  }

  public void
         appendTime(int m,
                    double nextTime)
  {
    double dt = nextTime - (T.isEmpty() ? 0 : T.getRightmostValue());
    assert dt >= 0 : "dt cannot be negative, dt=" + dt + " where nextTime=" + nextTime + " and max(T)=" + T.getRightmostValue();
    if (trace)
    {
      out.println("appendTime(m=" + m + ", nextTime=" + nextTime);
    }
    T = T.copyAndAppend(nextTime);
    K = K.copyAndAppend(m);
    dT[m] = dT[m].copyAndAppend(dt);
    if (A.length < T.size())
    {
      expandA();
    }
    // TODO: updated cachedSubTimes, upperEntries and lowerEntries instead of
    // rebuilding it each call
    cachedSubTimes = null;
    upperEntries = null;
    lowerEntries = null;
  }

  public void
         expandA()
  {
    // if (trace)
    {
      out.println("Expanding A to size " + (int) (T.size() * 1.2));
    }
    double[][][][] newA = new double[(int) (T.size() * 1.2)][order()][dim()][dim()];

    for (int i = 0; i < A.length; i++)
    {
      double[][][] bMatrix = A[i];
      newA[i] = new double[order()][dim()][dim()];
      System.arraycopy(bMatrix, 0, newA[i], 0, order());
    }
    A = newA;
  }

  /**
   * @return an array whose elements correspond to this{@link #statisticNames}
   */
  public Object[]
         evaluateParameterStatistics(double[] point)
  {
    ExponentialMutuallyExcitingProcess process = newProcess(point);
    double ksStatistic = process.getΛKolmogorovSmirnovStatistic();

    DoubleAdder meanCompMean = new DoubleAdder();
    DoubleAdder meanCompVar = new DoubleAdder();

    rangeClosed(0, dim() - 1).forEach(m -> {
      meanCompMean.add(process.Λ(m).mean());
      meanCompVar.add(process.Λ(m).variance());
    });
    double compMean = meanCompMean.doubleValue() / dim();
    double compVar = meanCompVar.doubleValue() / dim();

    // out.println(compensated.autocor(30));

    Object[] statisticsVector = new Object[]
    { process.logLik(),
      ksStatistic,
      compMean,
      compVar,
      process.getΛmomentMeasure(),
      process.getLjungBoxMeasure(),
      process.getΛmomentLjungBoxMeasure(),
      process.meanRecurrenceTimeVector().toString() };

    return addAll(stream(getParameterFields()).map(param -> {
      Vector value = process.getVectorField(param);
      return value;
    }).toArray(), statisticsVector);
  }

  public ExponentialMutuallyExcitingProcess
         newProcess(double[] point)
  {
    ExponentialMutuallyExcitingProcess process = (ExponentialMutuallyExcitingProcess) this.clone();
    process.assignParameters(point);
    return process;
  }

  public final Vector
         simulate(int seed,
                  double stoppingTime)
  {
    int lastRejectedPoint = -1;
    int rejects = 0;
    ExponentialDistribution expDist = new ExponentialDistribution(new JDKRandomGenerator(seed), 1);
    out.println("simulating " + ansi().fgBrightYellow()
                + this
                + ansi().fgDefault()
                + " from "
                + T.size()
                + " points with seed="
                + seed
                + " meanRecurrenceTimes="
                + meanRecurrenceTimeVector());
    int n = T.size();
    double nextTime = 0;
    int sampleCount = 130000;
    double startTime = currentTimeMillis();
    setAsize(sampleCount);
    for (int i = 0; nextTime < stoppingTime && i < sampleCount; i++)
    {
      for (int m = 0; m < dim(); i++)
      {
        Vector mtimes = getTimes(m);
        double y = expDist.sample();
        // process.trace = false;
        // TODO: average over Λ and compare against the invariant projection
        double dt = invΛ(m, y);
        if (dt > 10000 || dt < 0.001)
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
        // process.trace = false;
        // Real dtReal = process.invΛReal(y);
        // if ( dtReal.fpValue() > 6669)
        // {
        // out.println( "clamping " + dtReal );
        // dtReal = new Real(dt);
        // }
        // process.trace = false;

        // double dtRealFpValue = dtReal.fpValue();
        out.println("dt=" + dt + " for y=" + y);
        double q = Λ(m, n - 1, dt);
        nextTime = (!mtimes.isEmpty() ? mtimes.getRightmostValue() : 0) + dt;
        // double marginalΛ = process.invΛ(m, 0.46);
        // out.println("marginalΛ=" + marginalΛ);

        TestCase.assertEquals("y != q", y, q, 1E-7);
        n++;
        appendTime(m, nextTime);
        double Edt = nextTime / n;
        // out.println("T=" + process.T.toIntVector());
        // out.println("Λ=" + process.Λ().slice(max(0, process.T.size() - 10),
        // process.T.size() - 1));
        if (i % 1000 == 1)
        {
          String msg = "seed=" + seed + " m=" + m + " i=" + i + " y=" + y + " = q = " + q + " dt=" + dt
          // + " marginal="
          // + marginalΛ
                       + " Λmean="
                       + Λ(m).mean()
                       + " Λvar="
                       + Λ(m).variance()
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
    }
    double duration = startTime - currentTimeMillis();

    String fn = "simulated." + seed + ".mat";
    MatFile.write(fn, T.setName("T").createMiMatrix());
    out.println("write " + fn);
    double seconds = duration / 1000;
    double pointsPerSecond = sampleCount / seconds;
    out.println("simulation rate: " + pointsPerSecond + " points/second");
    // process.printA();

    return T;
  }

  @Override
  public double
         f(int i,
           double t)
  {
    return f(i, i, t);
  }

  @Override
  public double
         F(int i,
           double t)
  {
    return F(i, i, t);
  }

}

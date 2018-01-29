
package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.product;
import static fastmath.Functions.sum;
import static fastmath.Functions.uniformRandom;
import static java.lang.Math.exp;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;
import static java.lang.String.format;
import static java.lang.System.currentTimeMillis;
import static java.lang.System.err;
import static java.lang.System.out;
import static java.util.Arrays.asList;
import static java.util.Arrays.stream;
import static java.util.stream.Collectors.toList;
import static java.util.stream.IntStream.rangeClosed;
import static java.util.stream.Stream.concat;
import static org.apache.commons.lang.ArrayUtils.addAll;
import static org.fusesource.jansi.Ansi.ansi;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.concurrent.atomic.DoubleAdder;
import java.util.function.IntConsumer;
import java.util.function.IntToDoubleFunction;
import java.util.function.Supplier;

import org.apache.commons.math3.analysis.UnivariateFunction;
import org.apache.commons.math3.analysis.solvers.BrentSolver;
import org.apache.commons.math3.distribution.ExponentialDistribution;
import org.apache.commons.math3.optim.MaxEval;
import org.apache.commons.math3.optim.PointValuePair;
import org.apache.commons.math3.optim.SimpleBounds;
import org.apache.commons.math3.optim.nonlinear.scalar.GoalType;
import org.apache.commons.math3.optim.nonlinear.scalar.MultivariateOptimizer;
import org.apache.commons.math3.optim.nonlinear.scalar.ObjectiveFunction;
import org.apache.commons.math3.optim.nonlinear.scalar.noderiv.BOBYQAOptimizer;
import org.apache.commons.math3.random.RandomVectorGenerator;
import org.fusesource.jansi.Ansi.Color;

import fastmath.DoubleColMatrix;
import fastmath.EigenDecomposition;
import fastmath.Pair;
import fastmath.Vector;
import fastmath.exceptions.FastMathException;
import fastmath.optim.ExtendedBOBYQAOptimizer;
import fastmath.optim.ObjectiveFunctionSupplier;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import fastmath.optim.PointValuePairComparator;
import fastmath.optim.SolutionValidator;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory;
import stochastic.pointprocesses.finance.TradingFiltration;

public abstract class ExponentialMutuallyExcitingProcess extends MutuallyExcitingProcess
{

  public abstract int
         order();

  public ExponentialMutuallyExcitingProcess()
  {

  }

  @Override
  public double
         Φδ(double t,
            double y)
  {
    int tk = T.size() - 1;
    throw new UnsupportedOperationException("TODO");
  }

  public double
         Φ(int m,
           double dt,
           double y,
           int tk)
  {
    double τ = τ(m, dt, y);
    out.println("τ=" + τ);
    return τ + sum(l -> sum(i -> Φ(m, i, l) * sum(k -> σ(m, i, l, k, dt, dt) - σ(m, i, l, k, dt, lastT(m)), 0, tk), 0, dim() - 1), 0, order() - 1);
  }

  /**
   * 
   * @param m
   * @param dt
   * @param y
   * @return -y * this{@link #v(int)}(m)*{@link #η(int, double)}(m,dt)
   */
  public double
         τ(int m,
           double dt,
           double y)
  {
    double v = v(m);
    double η = η(m, dt);
    out.println("v=" + v + " η=" + η);
    return -y * v * η;
  }

  /**
   * 
   * @param m
   *          dimension/index of the process, an integer in [0,dim)
   * 
   * @return ∏(∏(β(m,n,j),j=1..P),n=1..M)
   */
  public double
         v(int m)
  {
    return product((IntToDoubleFunction) j -> product((IntToDoubleFunction) n -> β(m, n, j), 0, dim() - 1), 0, order() - 1);
  }

  public double
         Φ(int m,
           int i,
           int l)
  {
    return product((IntToDoubleFunction) j -> product((IntToDoubleFunction) n -> n == i && j == l ? α(m, n, j) : β(m, n, j), 0, dim() - 1), 0, order() - 1);
  }

  public double
         σ(int m,
           int i,
           int l,
           int k,
           double ds,
           double dt)
  {
    assert m < dim() : "m=" + m + " >= dim";
    double Tm = lastT(m);

    return exp(sum(j -> sum(n -> β(m, n, j) * ((n == i && j == l) ? (ds + T(n, k)) : (dt + lastT(n))), 0, dim() - 1), 0, order() - 1));
  }

  /**
   * get time of i-th point of the m-th proces
   * 
   * @param m
   *          ordinal, integer in [0,dim)
   * @param i
   *          time index, starts at 0
   * @return
   */
  public double
         T(int m,
           int i)
  {
    if (i < 0)
    {
      return 0;
    }
    assert i >= 0 : "i cannot be negative, was " + i;
    assert m < dim() : "m=" + m + " >= dim";
    Vector Tm = getTimeSubsets().left[m];
    assert i < Tm.size() : format("m=%s i=%s Tm.size=%s\n", m, i, Tm.size());
    return Tm.get(i);
  }

  public double
         η(int m,
           double dt)
  {
    double Tm = lastT(m);

    double vol = sum(j -> sum(n -> β(m, n, j), 0, dim() - 1), 0, order() - 1);

    double measure = (dt + Tm) * vol;
    out.println("vol=" + vol + " dt=" + dt + " Tm=" + Tm + " measure=" + measure);
    return exp(measure);
  }

  public Double
         lastT(int m)
  {
    assert m < dim() : "m=" + m + " >= dim";

    return getTimeSubsets().right[m].lastKey();
  }

  public double
         γ(int k,
           int m,
           int n)
  {
    return γ(k, m, n,1);
  }

  public double
         γ(int k,
           int m,
           int n,
           int p)
  {
    IntToDoubleFunction a = j -> j == k ? α(j, m, n) : pow(β(j, m, n), p);

    return product(a, 0, order() - 1);
  }

  @Override
  public double
         Φδ(double t,
            double y,
            int tk)
  {
    return sum(m -> Φ(m, t, y, tk) / Φdt(t, tk), 0, dim() - 1);
  }

  public double
         Φdt(double t,
             int tk)
  {
    throw new UnsupportedOperationException("TODO");
  }

  private Entry<Double, Integer>[][][] lowerEntries;

  private Entry<Double, Integer>[][][] upperEntries;

  private final ObjectiveFunctionSupplier objectiveFunctionSupplier = () -> new ObjectiveFunction(copy());

  private double[][][][] A;

  /**
   * the log-likelihood, without the additive constant T so its not exactly the
   * true LL but the result is the same
   * 
   */
  public final double
         logLik()
  {
    double ll = sum(m -> {
      Vector λvector = λvector(m).slice(1, N(m) - 1);

      Vector lslice = λvector.log();
      Vector comp = Λ(m);
      double compsum = comp.sum();

      return lslice.sum() - compsum;
    }, 0, dim() - 1) + (T.getRightmostValue() - T.getLeftmostValue());
    if (llcnt++ % 10 == 0)
    {
      out.println(Thread.currentThread().getName() + " #" + llcnt + " " + this + " = " + " ll=" + String.format("%30.30f", ll));
    }
    return ll;
    // double tn = T.getRightmostValue();
    // double ll = tn - T.getLeftmostValue() - totalΛ();
    //
    // double S[][] = new double[order()][dim()];
    // for (int type = 0; type < dim(); type++)
    // {
    // final int n = N(type);
    //
    // Vector compensator = Λ(type);
    // for (int tk = 1; tk < n; tk++)
    // {
    // double t = T.get(tk);
    // double dt = t - T.get(tk - 1);
    // double λ = evolveλ(type, dt, S);
    //
    // if (λ > 0)
    // {
    // ll += log(λ);
    // }
    //
    // ll -= compensator.get(tk - 1);
    // }
    //
    // if (Double.isNaN(ll))
    //
    // {
    // if (verbose)
    // {
    // out.println(Thread.currentThread().getName() + " NaN for LL ");
    // }
    // ll = Double.NEGATIVE_INFINITY;
    // }
    // }
    // out.println(Thread.currentThread().getName() + " ll=" + ll);
    // return ll;

  }

  protected boolean verbose = false;

  public ParallelMultistartMultivariateOptimizer
         estimateParameters(int numStarts,
                            IntConsumer progressNotifier)
  {
    int maxIters = Integer.MAX_VALUE;

    MaxEval maxEval = new MaxEval(maxIters);
    SimpleBounds simpleBounds = getParameterBounds();

    SolutionValidator validator = point -> {
      ExponentialMutuallyExcitingProcess process = newProcess(point.getPoint());
      out.println(Thread.currentThread().getName() + " validating " + process + " which has a LL score of " + process.logLik());

      for (int i = 0; i < process.dim(); i++)
      {
        double mean = process.Λ(i).mean();
        out.println(Thread.currentThread().getName() + " process mean dim " + i + " is " + mean);
        if (mean < 0)
        {
          return false;
        }
      }
      return true;
    };

    Supplier<MultivariateOptimizer> optimizerSupplier = () -> {
      ExtendedBOBYQAOptimizer optimizer = new ExtendedBOBYQAOptimizer(getParamCount() * dim() * 2 + 1, 10, 1E-5);
      // optimizer.
      return optimizer;
    };

    ParallelMultistartMultivariateOptimizer multiopt = new ParallelMultistartMultivariateOptimizer(optimizerSupplier,
                                                                                                   numStarts,
                                                                                                   getRandomVectorGenerator(simpleBounds));

    PointValuePairComparator momentMatchingAutocorrelationComparator = (a,
                                                                        b) -> {
      ExponentialMutuallyExcitingProcess processA = newProcess(a.getPoint());
      ExponentialMutuallyExcitingProcess processB = newProcess(b.getPoint());
      double mma = processA.getΛmomentLjungBoxMeasure();
      double mmb = processB.getΛmomentLjungBoxMeasure();
      return Double.compare(mma, mmb);
    };

    double startTime = currentTimeMillis();

    PointValuePair optimum = multiopt.optimize(progressNotifier,
                                               GoalType.MAXIMIZE,
                                               momentMatchingAutocorrelationComparator,
                                               validator,
                                               maxEval,
                                               objectiveFunctionSupplier,
                                               simpleBounds);
    double stopTime = currentTimeMillis();
    double secondsElapsed = (stopTime - startTime) / 1000;
    double evaluationsPerSecond = multiopt.getEvaluations() / secondsElapsed;
    double minutesElapsed = secondsElapsed / 60;

    assignParameters(optimum.getKey());

    out.format("estimation completed in %f minutes at %f evals/sec\n", minutesElapsed, evaluationsPerSecond);

    // plot("λ(t)", this::λ, T.fmin(), T.fmax(), 5000 );

    return multiopt;
  }

  public double
         getΛmomentMeasure()
  {
    return sum(m -> {
      Vector comp = Λ(m);
      Vector moments = comp.normalizedMoments(2);
      Vector normalizedSampleMoments = (moments.copy().subtract(1)).abs();
      return normalizedSampleMoments.sum();
    }, 0, dim() - 1) / dim();
  }

  @Override
  public double
         getΛmomentLjungBoxMeasure()
  {
    throw new UnsupportedOperationException("TODO");
  }

  public ExponentialMutuallyExcitingProcess
         newProcess(double[] point)
  {
    ExponentialMutuallyExcitingProcess process = (ExponentialMutuallyExcitingProcess) this.clone();
    process.assignParameters(point);
    return process;
  }

  /**
   * 
   * @return Λ(0,t[n])
   */
  public abstract double
         totalΛ();

  /**
   * 
   * @param m
   *          ordinal ranging from 0 to this{@link #dim()}-1
   * @param tk
   * @return ∫λ(t)dt where t ranges from T[tk] to T[tk+1]
   */
  public double
         Λ(int m,
           int tk)
  {
    assert 0 <= m && m < dim();
    return Λ(m).get(tk);
  }

  public double
         Asum(int j,
              int m,
              int n,
              int i)
  {
    assert i >= 0;
    if (i == 0)
    {
      return 0;
    }
    double Tmi = T(m, i);
    int l = Nopen(n, Tmi) - 1;
    return sum(k -> exp(-β(j, m, n) * (Tmi - T(n, k))), 0, l);
  }

  public double
         AsumToo(int j,
                 int m,
                 int n,
                 int i)
  {
    assert i >= 0;
    if (i == 0)
    {
      return 0;
    }
    double TmiPrev = T(m, i - 1);
    double Tmi = T(m, i);
    return exp(-β(j, m, n) * (Tmi - TmiPrev)) * Asum(j, m, n, i - 1) + sum(k -> exp(-β(j, m, n) * (Tmi - T(n, k))), Nopen(n, TmiPrev), Nopen(n, Tmi) - 1);

  }

  public void
         setAsize(int sampleCount)
  {
    A = new double[order()][dim()][dim()][sampleCount];
  }

  public double
         A(int j,
           int m,
           int n,
           int i)
  {
    assert j < order();
    assert 0 <= n && n < dim();
    assert i < N(m);
    assert 0 <= m && m < dim() : format("type=%d tk=%d j=%d dim=%d order=%d\n", m, n, j, dim(), order());

    if (A == null)
    {
      A = new double[order()][dim()][dim()][T.size()];
    }
    if (i == 0)
    {
      A[j][m][n][i] = 0;
      return 0;
    }
    double val = A[j][m][n][i];
    if (val == 0)
    {
      double Tmi = T(m, i);
      double Tmi1 = T(m, i - 1);

      double intersection = sum(k -> exp(-β(j, m, n) * (Tmi - T(n, k))), Nopen(n, Tmi1), Nopen(n, Tmi) - 1);
      val = intersection + (exp(-β(j, m, n) * (Tmi - Tmi1)) * A[j][m][n][i - 1]);
      A[j][m][n][i] = val;
    }
    return val;
  }

  /**
   * counting function for the number of events of a specified type and occuring
   * *strictly before* a specified time
   * 
   * @param base
   *          of event, integer in [0,dim)
   * @param t
   * 
   * @return number of events of type m before time t
   */
  public int
         Nopen(int type,
               double t)
  {
    Entry<Double, Integer> entry = getTimeSubsets().right[type].lowerEntry(t);
    return entry == null ? 0 : (entry.getValue() + 1);
  }

  /**
   * counting function for the number of events of a specified type and occuring
   * at or before a specified time
   * 
   * @param base
   *          of event, integer in [0,dim)
   * @param t
   * 
   * @return number of events of type m before time t
   */
  public int
         Nclosed(int type,
                 double t)
  {
    Entry<Double, Integer> entry = getTimeSubsets().right[type].floorEntry(t);
    return entry == null ? 0 : (entry.getValue() + 1);
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
    { process.logLik(), ksStatistic, compMean, compVar, process.getΛmomentMeasure(), process.getLjungBoxMeasure(), process.getΛmomentLjungBoxMeasure() };

    return addAll(stream(getParameterFields()).map(param -> {
      Vector value = process.getVectorField(param);
      return value;
    }).toArray(), statisticsVector);
  }

  public Vector
         getTimes(int type)
  {
    return getTimeSubsets().left[type];
  }

  /**
   * Given two Vectors (of times and types), calculate indices and partition
   * subsets of different types
   *
   * 
   * @return Pair<Vector times[dim],Map<time,type>[dim]>
   */
  @SuppressWarnings("unchecked")
  public Pair<Vector[], TreeMap<Double, Integer>[]>
         getTimeSubsets()
  {
    assert T.size() == K.size();
    if (cachedSubTimes != null)
    {
      return cachedSubTimes;
    }
    final ArrayList<Double>[] timesSub = new ArrayList[dim()];
    final Vector[] timeVectors = new Vector[dim()];
    TreeMap<Double, Integer>[] timeIndices = new TreeMap[dim()];

    for (int i = 0; i < dim(); i++)
    {
      timesSub[i] = new ArrayList<Double>();
      timeIndices[i] = new TreeMap<Double, Integer>();
    }
    for (int i = 0; i < T.size(); i++)
    {
      int k = K.get(i);
      assert k >= 0;
      assert k < dim() : format("k=%d dim=%d", k, dim());
      timesSub[k].add(T.get(i));
    }
    for (int i = 0; i < dim(); i++)
    {
      ArrayList<Double> subTimes = timesSub[i];
      TreeMap<Double, Integer> subTimeIndices = timeIndices[i];
      for (int j = 0; j < subTimes.size(); j++)
      {
        subTimeIndices.put(subTimes.get(j), j);
      }
      timeVectors[i] = new Vector(timesSub[i]).setName("T" + i);
    }
    cachedSubTimes = new Pair<Vector[], TreeMap<Double, Integer>[]>(timeVectors, timeIndices);

    return cachedSubTimes;
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
  protected abstract double
            α(int j,
              int m,
              int n);

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
  protected abstract double
            β(int j,
              int m,
              int n);

  /**
   * Calculate sum(α(j,m,n)/β(j,m,n),j=1..order)
   * 
   * @return branching matrix of dimsion this{@link #dim} x this{@link #dim}
   */
  public DoubleColMatrix
         calculateBranchingMatrix()
  {
    DoubleColMatrix αβ = new DoubleColMatrix(dim(), dim());
    for (int j = 0; j < order(); j++)
    {
      for (int m = 0; m < dim(); m++)
      {
        for (int n = 0; n < dim(); n++)
        {
          αβ.add(n, n, α(j, m, n) / β(j, m, n));
        }
      }
    }
    return αβ;
  }

  /**
   * @return false if any of the absolute values of the eigenvalues of this
   *         {@link #calculateBranchingMatrix()} are >=1 or if the eigenvalue
   *         decomposition cannot be calculated
   */
  public boolean
         isStationary()
  {
    EigenDecomposition eig;
    try
    {
      eig = calculateBranchingMatrix().eig();
    }
    catch (FastMathException e)
    {
      e.printStackTrace(err);
      return false;
    }
    for (int i = 0; i < dim(); i++)
    {
      double d = sqrt(pow(eig.getRealEigenvalues().get(i), 2) + pow(eig.getImaginaryEigenvalues().get(i), 2));
      if (d >= 1)
      {
        return false;
      }
    }
    return true;
  }

  public Vector
         calculateIntensitySlow(Pair<Vector[], TreeMap<Double, Integer>[]> timesSubPair,
                                int m)
  {
    final Vector[] timesSub = timesSubPair.left;

    final Vector mtimes = timesSub[m];
    final int Nm = mtimes.size();
    Vector intensity = new Vector(Nm);
    for (int i = 0; i < Nm; i++)
    {
      double lambda = 0;
      final double mtime = mtimes.get(i);

      for (int n = 0; n < dim(); n++)
      {
        final Vector ntimes = timesSub[n];
        final int Nn = ntimes.size();
        final double z = Z(m, n);
        for (int j = 0; j < order(); j++)
        {
          final double αjmn = α(j, m, n);
          final double βjmn = β(j, m, n);
          double ntime;
          for (int k = 0; k < Nn && (ntime = ntimes.get(k)) < mtime; k++)
          {
            lambda += (αjmn / z) * exp(-βjmn * (mtime - ntime));
          }
        }
      }

      intensity.set(i, lambda);
    }
    return intensity;
  }

  public Vector
         calculateIntensityFast(Pair<Vector[], TreeMap<Double, Integer>[]> timesSubPair,
                                int m)
  {
    final Vector[] timesSub = timesSubPair.left;

    final Vector mtimes = timesSub[m];
    final int Nm = mtimes.size();
    Vector intensity = new Vector(Nm);
    for (int i = 0; i < Nm; i++)
    {
      double lambda = 0;
      final double mtime = mtimes.get(i);

      if (i == 0)
      {
        for (int n = 0; n < dim(); n++)
        {
          final Vector ntimes = timesSub[n];
          final int Nn = ntimes.size();
          final double z = Z(m, n);
          for (int j = 0; j < order(); j++)
          {
            final double αjmn = α(j, m, n);
            final double βjmn = β(j, m, n);
            double ntime;
            for (int k = 0; k < Nn && (ntime = ntimes.get(k)) < mtime; k++)
            {
              lambda += (αjmn / z) * exp(-βjmn * (mtime - ntime));
            }
          }
        }
      }
      else
      {
        for (int n = 0; n < dim(); n++)
        {
          final Vector ntimes = timesSub[n];
          final int Nn = ntimes.size();
          final double z = Z(m, n);
          for (int j = 0; j < order(); j++)
          {
            final double αjmn = α(j, m, n);
            final double βjmn = β(j, m, n);
            double ntime;
            lambda += (αjmn / z) * exp(-βjmn * (mtime - T(m, i - 1))) * A(j, m, n, i - 1);
            for (int k = Nopen(n, mtimes.get(i - 1)); k < Nn && (ntime = ntimes.get(k)) < mtime; k++)
            {
              lambda += (αjmn / z) * exp(-βjmn * (mtime - ntime));
            }
          }
        }
      }

      intensity.set(i, lambda);
    }
    return intensity;
  }

  public final Vector
         λvector(int m)
  {
    return calculateIntensityFast(getTimeSubsets(), m);

  }

  public final Vector
         λvectorSlow(int m)
  {
    return calculateIntensitySlow(getTimeSubsets(), m);

  }

  protected abstract double
            evolveλ(int type,
                    double dt,
                    double[][] S);

  @SuppressWarnings("unchecked")
  private Entry<Double, Integer>
          getUpperEntry(TreeMap<Double, Integer>[] subTimeIndex,
                        final double upperTime,
                        int m,
                        int n,
                        int i)
  {
    Entry<Double, Integer> upperEntry = upperEntries == null ? null : upperEntries[m][n][i];
    if (upperEntry == null)
    {
      upperEntry = subTimeIndex[n].ceilingEntry(upperTime);
      if (upperEntries == null)
      {
        upperEntries = new Entry[dim()][dim()][T.size()];
      }
      upperEntries[m][n][i] = upperEntry;
    }
    return upperEntry;
  }

  @SuppressWarnings("unchecked")
  private Entry<Double, Integer>
          getLowerEntry(TreeMap<Double, Integer>[] subTimeIndex,
                        final double lowerTime,
                        int m,
                        int n,
                        int i)
  {
    Entry<Double, Integer> lowerEntry = lowerEntries == null ? null : lowerEntries[m][n][i];
    if (lowerEntry == null)
    {
      lowerEntry = subTimeIndex[n].ceilingEntry(lowerTime);
      if (lowerEntries == null)
      {
        lowerEntries = new Entry[dim()][dim()][T.size()];
      }
      lowerEntries[m][n][i] = lowerEntry;
    }
    return lowerEntry;
  }

  public Vector
         Λslow(int m)
  {
    final Vector mtimes = getTimes(m);
    final int N = mtimes.size();
    Vector compensator = new Vector(N - 1);
    for (int i = 1; i < N; i++)
    {
      double upperTime = mtimes.get(i);
      double lowerTime = mtimes.get(i - 1);
      double sum = 0;
      for (int n = 0; n < dim(); n++)
      {
        final Vector ntimes = getTimes(n);
        final int Nn = ntimes.size();
        final double Z = Z(m, n);

        for (int j = 0; j < order(); j++)
        {
          final double αjmn = α(j, m, n);
          final double βjmn = β(j, m, n);
          double ktime;
          int k = 0;

          for (k = 0; k < Nn && (ktime = ntimes.get(k)) < upperTime; k++)
          {
            sum += ((αjmn / βjmn) * (exp(-βjmn * (lowerTime - ktime)) - exp(-βjmn * (upperTime - ktime)))) / Z;
          }

        }
      }
      compensator.set(i - 1, sum);
    }
    return compensator;
  }

  public Vector
         Λ(int m)
  {
    Pair<Vector[], TreeMap<Double, Integer>[]> timesSubPair = getTimeSubsets();
    final Vector[] timesSub = timesSubPair.left;
    final TreeMap<Double, Integer>[] subTimeIndex = timesSubPair.right;
    final Vector mtimes = timesSub[m];
    final int N = mtimes.size();
    Vector compensator = new Vector(N - 1);
    double A[][][] = new double[order()][dim()][dim()];

    for (int i = 1; i < N; i++)
    {
      double upperTime = mtimes.get(i);
      double lowerTime = mtimes.get(i - 1);
      double lowerTimeBeforeLast = i > 2 ? mtimes.get(i - 2) : Double.NEGATIVE_INFINITY;

      double sum = 0;
      for (int n = 0; n < dim(); n++)
      {
        final Vector ntimes = timesSub[n];
        Entry<Double, Integer> lowerEntryBeforeLast = Double.isInfinite(lowerTimeBeforeLast) ? null
                                                                                             : getLowerEntry(subTimeIndex, lowerTimeBeforeLast, m, n, i - 1);
        Entry<Double, Integer> lowerEntry = getLowerEntry(subTimeIndex, lowerTime, m, n, i);
        Entry<Double, Integer> upperEntry = getUpperEntry(subTimeIndex, upperTime, m, n, i);
        int lowerkBeforeLast = lowerEntryBeforeLast != null ? lowerEntryBeforeLast.getValue() : 0;
        int lowerk = lowerEntry != null ? lowerEntry.getValue() : 0;
        int upperk = upperEntry != null ? upperEntry.getValue() : ntimes.size();

        for (int j = 0; j < order(); j++)
        {
          final double αjmn = α(j, m, n);
          final double βjmn = β(j, m, n);
          double ktime;
          int k;
          double subsum = exp(-βjmn * (lowerTime - lowerTimeBeforeLast)) * A[j][m][n];
          for (k = lowerkBeforeLast; k < lowerk; k++)
          {
            ktime = ntimes.get(k);
            if (ktime < lowerTime && ktime >= lowerTimeBeforeLast)
            {
              subsum += exp(-βjmn * (lowerTime - ktime));
            }
          }
          A[j][m][n] = subsum;

          double innerSum = subsum * (1 - exp(-βjmn * (upperTime - lowerTime)));
          for (k = lowerk; k < upperk; k++)
          {
            ktime = ntimes.get(k);
            if (ktime >= lowerTime && ktime < upperTime)
            {
              innerSum += 1 - exp(-βjmn * (upperTime - ktime));
            }
          }

          sum += (αjmn / βjmn) * innerSum / Z(m, n);

        }
      }
      compensator.set(i - 1, sum);
    }
    return compensator;

  }

  private ExponentialDistribution expDist = new ExponentialDistribution(1);

  private int predictionIntegrationLimit = 25;

  public int
         dim()
  {
    return dim;
  }

  private Pair<Vector[], TreeMap<Double, Integer>[]> cachedSubTimes;

  /**
   *
   * @param timesSubPair
   * @param m
   *          dim
   * @param eta
   *          i.i.d. exponential random variable with mean 1
   * @return
   */
  public double
         predict(Pair<Vector[], TreeMap<Double, Integer>[]> timesSubPair,
                 final int m)
  {
    final Vector[] timesSub = timesSubPair.left;
    final TreeMap<Double, Integer>[] subTimeIndex = timesSubPair.right;
    final Vector mtimes = timesSub[m].extend(1);
    final int N = mtimes.size();
    final double lastTime = mtimes.get(mtimes.size() - 2);

    BrentSolver solver = new BrentSolver(pow(10, -15));
    Vector inverses = new Vector(10000);
    for (int l = 0; l < inverses.size(); l++)
    {
      final double eta = expDist.sample();
      UnivariateFunction integrand = getPredictiveDensity(m, timesSub, subTimeIndex, mtimes, N, eta);
      double nextTime = solver.solve(100000, integrand, lastTime - 0.0001, lastTime + 100);
      inverses.set(l, nextTime);
    }
    return inverses.mean();
  }

  public UnivariateFunction
         getPredictiveDensity(final int m,
                              final Vector[] timesSub,
                              final TreeMap<Double, Integer>[] subTimeIndex,
                              final Vector mtimes,
                              final int N,
                              final double eta)
  {
    return new UnivariateFunction()
    {
      @Override
      public double
             value(double t)
      {
        final double A[][][] = new double[order()][dim()][dim()];
        mtimes.set(N - 1, t);
        final int dummy = N - 1;

        double sum = -eta;
        for (int i = 1; i < N; i++)
        {
          double upperTime = mtimes.get(i);
          double lowerTime = mtimes.get(i - 1);
          double lowerTimeBeforeLast = i > 2 ? mtimes.get(i - 2) : Double.NEGATIVE_INFINITY;
          // assert upperTime >= lowerTime;

          sum = 0;
          for (int n = 0; n < dim(); n++)
          {
            final Vector ntimes = timesSub[n];
            Entry<Double, Integer> lowerEntryBeforeLast =
                                                        Double.isInfinite(lowerTimeBeforeLast) ? null
                                                                                               : getLowerEntry(subTimeIndex, lowerTimeBeforeLast, m, n, i - 1);
            Entry<Double, Integer> lowerEntry = getLowerEntry(subTimeIndex, lowerTime, m, n, i);
            Entry<Double, Integer> upperEntry = getUpperEntry(subTimeIndex, upperTime, n, m, i);
            int lowerkBeforeLast = lowerEntryBeforeLast != null ? lowerEntryBeforeLast.getValue() : 0;
            int lowerk = lowerEntry != null ? lowerEntry.getValue() : 0;
            int upperk = upperEntry != null ? upperEntry.getValue() : mtimes.size();

            for (int j = 0; j < order(); j++)
            {
              final double αjmn = α(j, m, n);
              final double βjmn = β(j, m, n);
              double ktime;
              int k;
              double subsum = exp(-βjmn * (lowerTime - lowerTimeBeforeLast)) * A[j][m][n];
              for (k = lowerkBeforeLast; k < lowerk; k++)
              {
                ktime = ntimes.get(k);
                if (ktime < lowerTime && ktime >= lowerTimeBeforeLast)
                {
                  subsum += exp(-βjmn * (lowerTime - ktime));
                }
              }
              A[j][m][n] = subsum;

              double innerSum = subsum * (1 - exp(-βjmn * (upperTime - lowerTime)));
              for (k = lowerk; k < upperk; k++)
              {
                ktime = ntimes.get(k);
                if (ktime >= lowerTime && ktime < upperTime)
                {
                  innerSum += 1 - exp(-βjmn * (upperTime - ktime));
                }
              }

              sum += (αjmn / βjmn) * innerSum;

            }
          }
        }

        System.out.println("t=" + t + " eta=" + eta + " sum=" + sum);

        return sum;
      }
    };
  }

  public int
         getPredictionIntegrationLimit()
  {
    return predictionIntegrationLimit;
  }

  public void
         setPredictionIntegrationLimit(int predictionIntegrationLimit)
  {
    this.predictionIntegrationLimit = predictionIntegrationLimit;
  }

  protected RandomVectorGenerator
            getRandomVectorGenerator(SimpleBounds bounds)
  {
    return () -> {
      try
      {
        double[] point = rangeClosed(0,
                                     bounds.getLower().length - 1).mapToDouble(dim -> uniformRandom(new Pair<>(bounds.getLower()[dim], bounds.getUpper()[dim])))
                                                                  .toArray();
        if (trace)
        {
          out.println(Thread.currentThread().getName() + " starting from " + Arrays.toString(point));
        }
        return point;
      }
      catch (Exception e)
      {
        e.printStackTrace(System.err);
        return null;
      }
    };
  }

  boolean trace = false;

  public static String[] statisticNames =
  { "Log-Lik", "1-KS(Λ,exp)", "mean(Λ)", "var(Λ)", "MM(Λ)", "(LjungBox(Λ,10)-8)^2", "E[dt]" };

  /**
   * 
   * @return a list formed by concatenating the names of the parameters enumerated
   *         by this{@link #getBoundedParameters()} and the names of the
   *         statistics enumerated by this{@link #statisticNames}
   */
  public String[]
         getColumnHeaders()
  {
    return concat(stream(getBoundedParameters()).map(param -> param.getName()), asList(statisticNames).stream()).collect(toList()).toArray(new String[0]);
  }

  public void
         storeParameters(File modelFile) throws IOException
  {
    FileOutputStream fileOutputStream = new FileOutputStream(modelFile, false);
    DataOutputStream dos = new DataOutputStream(fileOutputStream);
    Vector params = getParameters();
    for (int i = 0; i < getParamCount(); i++)
    {
      dos.writeDouble(params.get(i));
    }
    dos.close();
    fileOutputStream.close();
  }

  /**
   * 
   * @param type
   *          type of process to spawn
   * @param filtration
   * @return
   */
  public static ExponentialMutuallyExcitingProcess
         spawnNewProcess(AutoExcitingProcessFactory.Type type,
                         TradingFiltration filtration)
  {
    assert filtration.times != null : "tradingProcess.times is null";
    assert filtration.types != null : "tradingProcess.types is null";
    assert filtration.markedPoints != null : "tradingProcess.markedPoints is null";

    if (type == AutoExcitingProcessFactory.Type.MultivariateExtendedApproximatePowerlaw)
    {
      ExtendedApproximatePowerlawMututallyExcitingProcess process = new ExtendedApproximatePowerlawMututallyExcitingProcess(2);
      process.T = filtration.times;
      process.K = filtration.types;
      process.X = filtration.markedPoints;
      return process;
    }
    else
    {
      throw new UnsupportedOperationException("TODO: " + type);
    }
  }

  /**
   * 
   * @param m
   * @return number of time points in the m-th dimension
   */
  public int
         N(int m)
  {
    return getTimes(m).size();
  }

}

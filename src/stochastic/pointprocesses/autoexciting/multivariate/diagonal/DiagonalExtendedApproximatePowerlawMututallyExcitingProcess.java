package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;
import static java.lang.String.format;
import static java.util.Arrays.stream;
import static java.util.stream.IntStream.rangeClosed;
import static org.apache.commons.lang.ArrayUtils.addAll;

import java.util.concurrent.atomic.DoubleAdder;

import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.multivariate.ExponentialMutuallyExcitingProcess;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawSelfExcitingProcess;

/**
 * a multivariate version of
 * {@link ExtendedApproximatePowerlawSelfExcitingProcess} with null
 * cross-terms.. that is, the branching matrix is a diagonal vector
 */
public class DiagonalExtendedApproximatePowerlawMututallyExcitingProcess extends DiagonalExponentialMutuallyExcitingProcess
{

  public DiagonalExtendedApproximatePowerlawMututallyExcitingProcess(int dim)
  {
    this.dim = dim;
    τ = new Vector(dim).setName("τ");
    ε = new Vector(dim).setName("ε");
    η = new Vector(dim).setName("η");
    b = new Vector(dim).setName("b");
  }

  public String
         toString()
  {
    return format("ExtendedApproximatePowerlawMututallyExcitingProcess[%s,%s,%s,%s]",
                  τ.toString().trim(),
                  ε.toString().trim(),
                  η.toString().trim(),
                  b.toString().trim());
  }

  public Vector η;

  public Vector b;

  public Vector ε;

  public Vector τ;

  /**
   * choose m such that m^M=1 minute, in milliseconds
   */
  public double base = exp(log(60000) / M);

  public Vector dT;

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
         dT()
  {
    return (dT != null) ? dT : (dT = T.diff());
  }

  public void
         appendTime(int type,
                    double time)
  {
    throw new UnsupportedOperationException("TODO");
  }

  /**
   * @return an array whose elements correspond to this{@link #statisticNames}
   */
  public Object[]
         evaluateParameterStatistics(double[] point)
  {
    DiagonalExponentialMutuallyExcitingProcess process = newProcess(point);
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

  public DiagonalExponentialMutuallyExcitingProcess
         newProcess(double[] point)
  {
    DiagonalExponentialMutuallyExcitingProcess process = (DiagonalExponentialMutuallyExcitingProcess) this.clone();
    process.assignParameters(point);
    return process;
  }

}

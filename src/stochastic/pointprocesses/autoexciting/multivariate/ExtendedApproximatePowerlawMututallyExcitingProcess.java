package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.sum;
import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;
import static java.lang.String.format;
import static java.lang.System.out;

import java.io.File;
import java.io.IOException;

import org.apache.commons.math3.distribution.ExponentialDistribution;
import org.apache.commons.math3.stat.inference.KolmogorovSmirnovTest;

import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.ExponentialAutoExcitingProcess;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawAutoExcitingProcess;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;

/**
 * a multivariate version of
 * {@link ExtendedApproximatePowerlawAutoExcitingProcess} with null
 * cross-terms.. that is, the branching matrix is a diagonal vector
 */
public class ExtendedApproximatePowerlawMututallyExcitingProcess extends DiagonalExponentialMututallyExcitingProcess
{

  public ExtendedApproximatePowerlawMututallyExcitingProcess(int dim)
  {
    this.dim = dim;
    τ = new Vector(dim).setName("τ");
    ε = new Vector(dim).setName("ε");
    η = new Vector(dim).setName("η");
    κ = new Vector(dim).setName("κ");
    b = new Vector(dim).setName("b");
  }

  public String
         toString()
  {
    return format("ExtendedApproximatePowerlawMututallyExcitingProcess[%s,%s,%s,%s,%s]",
                  τ.toString().trim(),
                  ε.toString().trim(),
                  η.toString().trim(),
                  κ.toString().trim(),
                  b.toString().trim());
  }

  public Vector κ;

  public Vector η;

  public Vector b;

  public Vector ε;

  public Vector τ;

  @Override
  public final double
         value(double[] point)
  {
    assignParameters(point);

    double score = Double.NaN;

    score = logLik();

    if (verbose)
    {
      out.println(Thread.currentThread().getName() + " score{" + getParamString() + "}=" + score);
    }

    return score;

  }

  public int M = 15;

  /**
   * choose m such that m^M=1 minute, in milliseconds
   */
  public double m = exp(log(60000) / M);

  public Vector dT;

  @Override
  public int
         order()
  {
    return M + 1;
  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return ExtendedApproximatePowerlawAutoExcitingProcess.Parameter.values();
  }

  @Override
  public double
         mean()
  {
    throw new UnsupportedOperationException("TODO");
  }

  public double
         getΛKolmogorovSmirnovStatistic()
  {
    Vector sortedCompensator = new Vector(Λ().doubleStream().sorted()).reverse();
    KolmogorovSmirnovTest ksTest = new KolmogorovSmirnovTest();
    double ksStatistic = ksTest.kolmogorovSmirnovStatistic(new ExponentialDistribution(1), sortedCompensator.toDoubleArray());
    return 1 - ksStatistic;
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
  protected double
            α(int j,
              int m,
              int n)
  {
    assert j < dim() : format("i=%d j=%d k=%d order=%d dim=%d\n", m, j, n, order(), dim());

    if (j != n)
    {
      return 0;
    }
    if (m == M)
    {
      return αS(j);
    }
    double τj = τ.get(j);
    double εj = ε.get(j);
    return pow(1 / (τj * pow(m, m)), 1 + εj);
  }

  @Override
  protected double
            β(int j,
              int m,
              int n)
  {
    if (j != n)
    {
      return 1;
    }
    return m < M ? 1 / (τ.get(j) * pow(m, m)) : βS(j);

  }

  public double
         αS(int j)
  {
    return b.get(j);
  }

  public double
         βS(int j)
  {
    return 1 / τ.get(j);
  }

  @Override
  public Type
         getType()
  {
    return Type.MultivariateExtendedApproximatePowerlaw;
  }

  public String
         getαβString()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("{Z=" + Z());
    for (int i = 0; i < order(); i++)
    {
      for (int j = 0; j < dim(); j++)
      {
        for (int k = 0; k < dim(); k++)
        {
          sb.append(format(", alpha[%d,%d,%d]=%s, beta[%d,%d,%d]=%s", i + 1, j + 1, k + 1, α(i, j, k), i + 1, j + 1, k + 1, β(i, j, k)));
        }
      }
    }
    sb.append("}");
    return sb.toString();
  }

  public Vector
         dT()
  {
    return (dT != null) ? dT : (dT = T.diff());
  }

  /**
   * functions which takes its minimum when the mean and the variance of the
   * compensator is closer to 1
   * 
   * @return measure which is greater the closer the first two moments of the
   *         compensator are to unity
   */
  public double
         getΛmomentMeasure()
  {
    Vector dT = Λ();
    Vector moments = dT().normalizedMoments(2);
    Vector normalizedSampleMoments = (moments.copy().subtract(1)).abs();
    return normalizedSampleMoments.sum();
  }

  /**
   * functions which takes its minimum when the mean and the variance of the
   * compensator is closer to 1
   * 
   * @return this{@link #getΛmomentMeasure()} * log( 1 +
   *         this{@link #getLjungBoxMeasure()} )
   */
  public double
         getΛmomentLjungBoxMeasure()
  {
    return getΛmomentMeasure() * log(1 + getLjungBoxMeasure());
  }

  /**
   * return a function of the Ljung-Box statistic which measures the amount of
   * autocorrelation remaining in the compensator up to lags of
   * this{@link #LJUNG_BOX_ORDER}
   * 
   * @return (Λ().getLjungBoxStatistic( this{@link #LJUNG_BOX_ORDER} ) - (
   *         this{@link #LJUNG_BOX_ORDER} - 2 ))^2
   */
  public double
         getLjungBoxMeasure()
  {
    return pow(Λ().getLjungBoxStatistic(ExponentialAutoExcitingProcess.LJUNG_BOX_ORDER) - (ExponentialAutoExcitingProcess.LJUNG_BOX_ORDER - 2), 2);
  }

  @Override
  public double
         getBranchingRatio()
  {
    return 1;
  }

  @Override
  public void
         loadParameters(File modelFile) throws IOException
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         f(double t)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         Z()
  {
    return sum(j -> sum(m -> sum(n -> {
      double a = α(j, m, n);
      double b = β(j, m, n);
      return a / b;
    }, 0, dim() - 1), 0, dim() - 1), 0, order() - 1);
  }

  @Override
  public double
         F(double t)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         getRootMeanSquaredPredictionError()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         getMeanSquaredPredictionError()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public Vector
         λvector()
  {
    throw new UnsupportedOperationException("TODO");
  }

}

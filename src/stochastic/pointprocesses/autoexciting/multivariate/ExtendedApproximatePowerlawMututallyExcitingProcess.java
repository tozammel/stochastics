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

import fastmath.DoubleColMatrix;
import fastmath.DoubleMatrix;
import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.ExponentialSelfExcitingProcess;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawSelfExcitingProcess;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;

/**
 * a multivariate version of
 * {@link ExtendedApproximatePowerlawSelfExcitingProcess} with null
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
  public double base = exp(log(60000) / M);

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
    return ExtendedApproximatePowerlawSelfExcitingProcess.Parameter.values();
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
  protected double
            β(int j,
              int m,
              int n)
  {
    if (m != n)
    {
      return 1;
    }
    return j < M ? 1 / (τ.get(m) * pow(base, j)) : βS(m);

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
    return Type.MultivariateExtendedApproximatePowerlaw;
  }

  public String
         getαβString()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("{");
    for (int j = 0; j < order(); j++)
    {
      for (int m = 0; m < dim(); m++)
      {
        for (int n = 0; n < dim(); n++)
        {
          sb.append(format(", alpha[%d,%d,%d]=%s, beta[%d,%d,%d]=%s", j + 1, m + 1, n + 1, α(j, m, n), j + 1, m + 1, n + 1, β(j, m, n)));
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
    double x = 0;
    for (int m = 0; m < dim(); m++)
    {
      Vector dT = Λ(m);
      Vector moments = dT.normalizedMoments(2);
      Vector normalizedSampleMoments = (moments.copy().subtract(1)).abs();
      x += normalizedSampleMoments.sum();
    }
    return x / dim();
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
    double x = 0;
    for (int type = 0; type < dim(); type++)
    {
      x += pow(Λ(type).getLjungBoxStatistic(ExponentialSelfExcitingProcess.LJUNG_BOX_ORDER) - (ExponentialSelfExcitingProcess.LJUNG_BOX_ORDER - 2), 2);
    }
    return x / dim();
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
         f(int m,
           int n,
           double t)
  {
    return sum(j -> α(j, m, n) * exp(-β(j, m, n) * t), 0, order() - 1) / Z(m, n);
  }

  /**
   * @return 1+(∑_m∑_j(α[j,m,n]/β[j,m,n])*exp(-β[j,m,n]*t))/Z(type) <br>
   *         m=0..dim-1 j=0..order-1
   */
  @Override
  public double
         F(int m,
           int n,
           double t)
  {
    return 1 - sum(j -> (α(j, m, n) / β(j, m, n)) * exp(-β(j, m, n) * t), 0, order() - 1) / Z(m, n);
  }

  @Override
  public double
         Z(int m,
           int n)
  {
    return sum(j -> {
      double a = α(j, m, m);
      double b = β(j, m, m);
      return a / b;
    }, 0, order() - 1);
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

  public DoubleMatrix
         getαMatrix(int j)
  {
    DoubleColMatrix alpha = new DoubleColMatrix(dim, dim);
    for (int m = 0; m < dim(); m++)
    {
      for (int n = 0; n < dim(); n++)
      {
        alpha.set(m, n, α(j, m, n));
      }
    }
    return alpha.setName("α[" + j + "]");
  }

  public DoubleMatrix
         getβMatrix(int j)
  {
    DoubleColMatrix β = new DoubleColMatrix(dim, dim);
    for (int m = 0; m < dim(); m++)
    {
      for (int n = 0; n < dim(); n++)
      {
        β.set(m, n, β(j, m, n));
      }
    }
    return β.setName("β[" + j + "]");
  }

  public DoubleMatrix
         getαβMatrix(int j)
  {
    DoubleColMatrix αβ = new DoubleColMatrix(dim, dim);
    for (int m = 0; m < dim(); m++)
    {
      for (int n = 0; n < dim(); n++)
      {
        αβ.set(m, n, α(j, m, n) / β(j, m, n));
      }
    }
    return αβ.setName("(α/β)[" + j + "]");
  }

  @Override
  public double
         meanRecurrenceTime()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         totalΛ()
  {
    return sum(k -> Λ(k).sum(), 0, dim() - 1);
  }

  /**
   * the conditional intensity of the m-th dimension of the process at time t
   * 
   * @param m
   * @param d
   * @return 
   */
  public double
         λ(int m,
           double d)
  {
    
    throw new UnsupportedOperationException("TODO");
  }

}

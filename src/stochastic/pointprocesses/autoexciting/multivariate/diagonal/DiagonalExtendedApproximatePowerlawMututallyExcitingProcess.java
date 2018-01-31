package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;
import static java.lang.String.format;

import fastmath.DoubleColMatrix;
import fastmath.DoubleMatrix;
import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawSelfExcitingProcess;

/**
 * a multivariate version of
 * {@link ExtendedApproximatePowerlawSelfExcitingProcess} with null
 * cross-terms.. that is, the branching matrix is a diagonal vector
 */
public class DiagonalExtendedApproximatePowerlawMututallyExcitingProcess extends DiagonalExponentialMututallyExcitingProcess
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

  public void
         appendTime(int type,
                    double time)
  {
    throw new UnsupportedOperationException("TODO");
  }

}

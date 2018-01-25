package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.sum;
import static java.lang.Math.abs;
import static java.lang.Math.exp;
import static java.lang.String.format;
import static java.lang.System.out;

import fastmath.Vector;

public abstract class DiagonalExponentialMututallyExcitingProcess extends ExponentialMutuallyExcitingProcess
{
  @Override
  public double
         Z(int m,
           int n)
  {
    return sum(j -> sum(k -> α(j, m, k) / β(j, m, k), 0, dim() - 1), 0, order() - 1);
  }

  /**
   * 
   * @param dt
   * @param s
   * @return
   */
  @Override
  protected double
            evolveλ(int m,
                    double dt,
                    double[][] S)
  {
    assert m < dim() : format("type=%d dt=%f order=%d dim=%d\n", m, dt, order(), dim());

    double λ = 0;
    for (int j = 0; j < order(); j++)
    {
      for (int n = 0; n < dim(); n++)
      {
        S[j][n] = exp(-β(j, m, n) * dt) * (1 + S[j][n]);
        λ += α(j, m, n) * S[j][n] / Z(m, n);
      }
    }
    return λ;
  }

  // @Override
  // public double
  // totalΛ()
  // {
  // double tn = T.getRightmostValue();
  //
  // return (sum(i -> sum(j -> (α(i, j, j) / β(i, j, j)) * (1 - exp(-β(i, j, j) *
  // (tn - T.get(i)))), 0, dim() - 1), 0, T.size() - 1)) / Z();
  // }

  @Override
  public double
         logLikelihood(Vector t)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         invΛ(int tk,
              double y)
  {
    double dt = 0;

    double δ = 0;
    double lastTime = T.get(tk);
    double nextTime = lastTime;

    for (int i = 0; i <= 1000; i++)
    {
      δ = Φδ(dt = (nextTime - lastTime), y, tk);

      if (trace)
      {
        out.println("double dt[" + i + "]=" + dt + " δ=" + δ);
      }
      nextTime = nextTime + δ;
      if (abs(δ) < 1E-10 || !Double.isFinite(δ))
      {
        break;
      }

    }
    return dt;
  }


}

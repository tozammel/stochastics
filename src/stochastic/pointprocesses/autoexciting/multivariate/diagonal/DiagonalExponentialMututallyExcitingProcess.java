package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.Math.abs;
import static java.lang.System.out;

import stochastic.pointprocesses.autoexciting.multivariate.ExponentialMutuallyExcitingProcess;

public abstract class DiagonalExponentialMututallyExcitingProcess extends ExponentialMutuallyExcitingProcess
{


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

package stochastic.pointprocesses.autoexciting.multivariate;

import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.BoundedParameter;

public class ExtendedMututallyExcitingExponentialPowerlawApproximationProcess extends ExponentialMutuallyExcitingProcess
{



  @Override
  protected double
            α(int j,
              int m,
              int n)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  protected double
            β(int j,
              int m,
              int n)
  {
    throw new UnsupportedOperationException("TODO");
  }



  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    throw new UnsupportedOperationException("TODO");
  }


  @Override
  public double
         invΛ(int tk,
              double y)
  {
    throw new UnsupportedOperationException("TODO");
  }


  @Override
  public Type
         getType()
  {
    throw new UnsupportedOperationException("TODO");
  }

}

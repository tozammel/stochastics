package stochastic.pointprocesses.autoexciting.multivariate;

import java.io.File;
import java.io.IOException;

import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.BoundedParameter;

public class ExtendedExponentialMututallyExcitingProcess extends ExponentialMutuallyExcitingProcess
{



  @Override
  public double
         getΛmomentLjungBoxMeasure()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         totalΛ()
  {
    throw new UnsupportedOperationException("TODO");
  }

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
  protected double
            evolveλ(int type,
                    double dt,
                    double[][] S)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         mean()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         getLjungBoxMeasure()
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         getΛKolmogorovSmirnovStatistic()
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
         meanRecurrenceTime(int m)
  {
    throw new UnsupportedOperationException("TODO");
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
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         F(int m,
           int n,
           double t)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public double
         Z(int m,
           int n)
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
  public double
         getBranchingRatio()
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

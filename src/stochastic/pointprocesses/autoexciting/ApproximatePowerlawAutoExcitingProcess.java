package stochastic.pointprocesses.autoexciting;

import static fastmath.Functions.sum;
import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;

import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;

public class ApproximatePowerlawAutoExcitingProcess extends ExponentialSelfExcitingProcess
{

  public ApproximatePowerlawAutoExcitingProcess(double ε, double τ)
  {
    super();
    this.ε = ε;
    this.τ = τ;
  }

  protected static enum Parameter implements BoundedParameter
  {

    ε(0, 0.5), τ(0.1, 3);

    private double min;
    private double max;

    Parameter(double min, double max)
    {
      this.min = min;
      this.max = max;
    }

    @Override
    public String
           getName()
    {
      return name();
    }

    @Override
    public double
           getMin()
    {
      return min;
    }

    @Override
    public double
           getMax()
    {
      return max;
    }

    @Override
    public int
           getOrdinal()
    {
      return ordinal();
    }

  }

  public double τ;

  public double ε = 0;

  @Override
  public double
         α(int i)
  {
    return pow(τ * pow(m, i), -(1 + ε));
  }


  @Override
  public double
         β(int i)
  {
    return τ * pow(m, -i);
  }

  final public int M = 15;

  /**
   * choose m such that m^M=1 minute, in milliseconds
   */
  public double m = exp(log(60000) / M);

  public ApproximatePowerlawAutoExcitingProcess()
  {
    super();
  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return Parameter.values();
  }

  @Override
  public int
         order()
  {
    return M;
  }

  @Override
  public double
         Z()
  {
    return sum(j -> α(j) / β(j), 0, order() - 1);
  }

  @Override
  public Type
         getType()
  {
    return Type.ExtendedApproximatePowerlaw;
  }

  @Override
  public Vector
         λvector(int type)
  {
    if (type == 0)
    {
      return λvector();
    }
    else
    {
      throw new IllegalArgumentException("there is only one dimension, zero, since this is a univariate process");
    }
  }

}
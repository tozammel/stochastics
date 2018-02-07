package stochastic.pointprocesses.selfexciting;

public class UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess extends ExtendedApproximatePowerlawSelfExcitingProcess
{

  public static enum Parameter implements BoundedParameter
  {
    η(0.1, 10), b(0, 5);
  
    Parameter(double min, double max)
    {
      this.min = min;
      this.max = max;
    }
  
    private double max;
  
    private double min;
  
    @Override
    public double
           getMax()
    {
      return max;
    }
  
    @Override
    public double
           getMin()
    {
      return min;
    }
  
    @Override
    public String
           getName()
    {
      return name();
    }
  
    @Override
    public int
           getOrdinal()
    {
      return ordinal();
    }
  
  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return Parameter.values();
  }

  
  

}

package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.String.format;

import org.apache.commons.math3.optim.SimpleBounds;

import fastmath.Vector;
import stochastic.pointprocesses.selfexciting.BoundedParameter;

public abstract class MutuallyExcitingProcess extends AbstractMutuallyExcitingProcess
{

  public int dim;

  public MutuallyExcitingProcess()
  {
    super();
  }

  public abstract double
         λ(int m,
           double t);

  public SimpleBounds
         getParameterBounds()
  {
    BoundedParameter[] bounds = getBoundedParameters();
    final int paramCount = bounds.length;
    // double[] lowerBounds = range(0, paramCount * dim).mapToDouble(i -> bounds[i %
    // bounds.length].getMin()).toArray();
    // double[] upperBounds = range(0, paramCount * dim).mapToDouble(i -> bounds[i %
    // bounds.length].getMax()).toArray();
    Vector lowerBounds = new Vector(paramCount * (dim * dim));
    Vector upperBounds = new Vector(paramCount * (dim * dim));
    for (int i = 0; i < bounds.length; i++)
    {
      lowerBounds.slice(i * (dim * dim), (i + 1) * (dim * dim)).assign(bounds[i].getMin());
      upperBounds.slice(i * (dim * dim), (i + 1) * (dim * dim)).assign(bounds[i].getMax());
    }
    return new SimpleBounds(lowerBounds.toDoubleArray(), upperBounds.toDoubleArray());
  }

  @Override
  public Object
         clone()
  {
    assert T != null : "T is null";
    assert K != null : "K is null";
    // assert X != null : "X is null";

    try
    {
      MutuallyExcitingProcess spawn = getClass().getDeclaredConstructor(int.class).newInstance(dim);
      spawn.assignParameters(getParameters().toDoubleArray());
      spawn.T = T;
      spawn.X = X;
      spawn.K = K;
      return spawn;
    }
    catch (Exception e)
    {
      if (e instanceof RuntimeException)
      {
        throw (RuntimeException) e;
      }
      throw new RuntimeException(e.getMessage(), e);
    }

  }

  public abstract String
         getParamString();

  public abstract int
         order();

  public abstract double
         totalΛ();

  public String
         toString()
  {
    return format("%s%s", getClass().getSimpleName(), getParamString());
  }

  public abstract double
         f(int i,
           double t);

  public abstract double
         F(int i,
           double t);

}
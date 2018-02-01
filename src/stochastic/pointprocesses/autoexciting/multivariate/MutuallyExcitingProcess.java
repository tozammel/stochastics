package stochastic.pointprocesses.autoexciting.multivariate;

import static java.util.Arrays.asList;
import static java.util.stream.Collectors.joining;
import static java.util.stream.IntStream.range;

import java.lang.reflect.Field;

import org.apache.commons.math3.optim.SimpleBounds;

import fastmath.IntVector;
import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.BoundedParameter;

public abstract class MutuallyExcitingProcess extends AbstractMutuallyExcitingProcess
{

  protected int dim;

  /**
   * integer-array indicating which dimension to which each point in
   * this{@link #T} corresponds
   */
  public IntVector K;

  public MutuallyExcitingProcess()
  {
    super();
  }

  public SimpleBounds
         getParameterBounds()
  {
    BoundedParameter[] bounds = getBoundedParameters();
    final int paramCount = bounds.length;
    double[] lowerBounds = range(0, paramCount * dim).mapToDouble(i -> bounds[i % bounds.length].getMin()).toArray();
    double[] upperBounds = range(0, paramCount * dim).mapToDouble(i -> bounds[i % bounds.length].getMax()).toArray();
    return new SimpleBounds(lowerBounds, upperBounds);
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

  public abstract int
         order();

  public abstract double
         totalΛ();

}
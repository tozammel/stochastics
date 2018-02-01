package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.Math.abs;
import static java.lang.System.out;
import static java.util.Arrays.asList;
import static java.util.stream.Collectors.joining;

import java.lang.reflect.Field;

import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.multivariate.ExponentialMutuallyExcitingProcess;

public abstract class DiagonalExponentialMututallyExcitingProcess extends ExponentialMutuallyExcitingProcess
{

  @Override
  public Vector
         getParameters()
  {
    Vector params = new Vector(getParamCount() * dim);
    for (int i = 0; i < getParamCount(); i++)
    {
      Vector fieldArray = getVectorField(i);
      if (fieldArray == null)
      {
        throw new IllegalArgumentException("Vector field '" + getParameterFields()[i].getName() + "' not found in " + getClass().getSimpleName());
      }
      for (int j = 0; j < dim; j++)
      {
        int offset = getBoundedParameters()[i].getOrdinal() + (j * getParamCount());
        params.set(offset, fieldArray.get(j));
      }
    }
    return params;
  }

  /**
   * Uses this{@link #getParameterFields()} to assign values from an array to the
   * specified Java fields, there should dim*this{@link #getParamCount()}
   * elements, arranged in order [α1,β1,ε1,α.,β.,ε.,αD,βD,εD] where
   * D=this{@link #dim()} and for instance getBoundedParms() has 3 elements called
   * [α,β,ε]
   * 
   * @param array
   *          of values ordered according to this{@link #getBoundedParameters()}
   */
  @Override
  public void
         assignParameters(double[] point)
  {
    BoundedParameter[] params = getBoundedParameters();
    assert point.length == params.length * dim : "need " + params.length * dim + " params, not " + point.length;

    for (int i = 0; i < params.length; i++)
    {
      Vector fieldArray = getVectorField(i);
      for (int j = 0; j < dim; j++)
      {
        {
          int offset = params[i].getOrdinal() + (j * getParamCount());
          fieldArray.set(j, point[offset]);
        }
      }
    }
  }

  /**
   * 
   * @param field
   * @return a Vector of dimension this{@link #dim()}, one is constructed if it
   *         does not already exist
   */
  public final Vector
         getVectorField(Field field)
  {
    try
    {
      Vector vector = (Vector) field.get(this);
      if (vector == null)
      {
        vector = new Vector(dim).setName(field.getName());
        field.set(this, vector);
      }
      return vector;
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
  }

  /**
   * 
   * @param i
   *          index of the parameter to return
   * 
   * @return the {@link Vector} corresponding to the i-th parameter as determined
   *         by this{@link #getParameterFields()}
   */
  public final Vector
         getVectorField(int i)
  {
    return getVectorField(getParameterFields()[i]);
  }

  /**
   * 
   * @param field
   * @param j
   * @return the n-th element of the {@link Vector} referenced by field
   */
  public double
         getFieldValue(Field field,
                       int j)
  {
    return getVectorField(field).get(j);
  }

  public final String
         getParamString()
  {
    return "{" + asList(getParameterFields()).stream().map(param -> getVectorField(param).toString()).collect(joining(","))
           + ",Edt="
           + meanRecurrenceTimeVector()
           + "}";

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

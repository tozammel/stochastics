package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.seq;
import static java.lang.Math.sqrt;
import static java.lang.System.out;
import static java.util.Arrays.stream;
import static java.util.stream.IntStream.range;
import static util.Console.println;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.function.IntConsumer;
import java.util.function.IntToDoubleFunction;

import org.apache.commons.math3.analysis.MultivariateFunction;
import org.apache.commons.math3.optim.PointValuePair;
import org.apache.commons.math3.optim.SimpleBounds;

import dnl.utils.text.table.TextTable;
import fastmath.DoubleMatrix;
import fastmath.Vector;
import fastmath.optim.ParallelMultistartMultivariateOptimizer;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.BoundedParameter;

public abstract class AbstractMutuallyExcitingProcess implements MultivariateFunction
{

  protected static int llcnt = 0;

  public Vector T;

  public boolean verbose = false;

  /**
   * constant deterministic intensity
   */
  public double κ = 0;

  /*
   * The first column of this matrix is identical with T, the remaining columns,
   * if any, are the marks associated with the timestamps in column 0
   */
  public DoubleMatrix X;

  @Override
  public Object
         clone()
  {
    try
    {
      AbstractMutuallyExcitingProcess spawn = getClass().getDeclaredConstructor().newInstance();
      spawn.assignParameters(getParameters().toDoubleArray());
      spawn.T = T;
      spawn.X = X;
      spawn.llcnt = llcnt;
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

  @SuppressWarnings("unchecked")
  public <E extends AbstractMutuallyExcitingProcess>
         E
         copy()
  {
    return (E) clone();
  }

  protected Field[] parameterFields = null;

  public SimpleBounds
         getParameterBounds()
  {
    BoundedParameter[] bounds = getBoundedParameters();
    final int paramCount = bounds.length;
    double[] lowerBounds = range(0, paramCount).mapToDouble(i -> bounds[i].getMin()).toArray();
    double[] upperBounds = range(0, paramCount).mapToDouble(i -> bounds[i].getMax()).toArray();
    return new SimpleBounds(lowerBounds, upperBounds);
  }

  public final Field
         getField(String name)
  {
    Class<? extends Object> oClass = getClass();
    NoSuchFieldException nsfe = null;
    try
    {
      Field field = null;
      while (field == null && oClass != null)
      {
        try
        {
          field = oClass.getDeclaredField(name);
        }
        catch (NoSuchFieldException e)
        {
          oClass = oClass.getSuperclass();
          nsfe = e;
        }
      }
      if (field == null)
      {
        NoSuchElementException ne = new NoSuchElementException(nsfe.getMessage());
        ne.initCause(nsfe);
        throw ne;
      }
      field.setAccessible(true);
      return field;
    }
    catch (SecurityException e)
    {
      throw new RuntimeException(oClass.getName() + ": " + e.getMessage(), e);
    }
  }

  public AbstractMutuallyExcitingProcess()
  {
    super();
  }

  public abstract Vector
         getParameters();

  public abstract Object[]
         evaluateParameterStatistics(double[] point);

  public abstract double
         getΛmomentMeasure();

  public abstract double
         getΛmomentLjungBoxMeasure();

  public abstract double
         getLjungBoxMeasure();

  public abstract double
         getΛKolmogorovSmirnovStatistic();

  public abstract AbstractMutuallyExcitingProcess
         newProcess(double[] point);

  public abstract Field[]
         getParameterFields();

  /**
   * Uses this{@link #getParameterFields()} to assign values from an array to the
   * specified Java fields
   * 
   * @param array
   *          of values ordered according to this{@link #getBoundedParameters()}
   */
  public void
         assignParameters(double[] point)
  {
    if (verbose)
    {
      out.println("assigning parameters " + Arrays.toString(point));
    }
    BoundedParameter[] params = getBoundedParameters();
    Field[] fields = getParameterFields();
    assert fields.length == params.length;
    assert point.length == params.length;

    for (int i = 0; i < fields.length; i++)
    {
      try
      {
        fields[i].setDouble(this, point[params[i].getOrdinal()]);
      }
      catch (IllegalArgumentException | IllegalAccessException e)
      {
        throw new RuntimeException(e.getMessage(), e);
      }
    }
    if (verbose)
    {
      out.println("assigned " + getParameters());
    }
  }

  public abstract BoundedParameter[]
         getBoundedParameters();

  public int
         getParamCount()
  {
    return getBoundedParameters().length;
  }

  public abstract double
         meanRecurrenceTime(int m);

  public abstract int
         dim();

  public Vector
         meanRecurrenceTimeVector()
  {
    return new Vector(seq(this::meanRecurrenceTime, 0, dim() - 1));
  }

  public double

         getFieldValue(Field param)
  {
    try
    {
      return param.getDouble(this);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
  }

  public abstract double
         logLik();

  public abstract ParallelMultistartMultivariateOptimizer
         estimateParameters(int numStarts,
                            IntConsumer progressNotifier,
                            String filename,
                            int section);

  public abstract String[]
         getColumnHeaders();

  public abstract void
         loadParameters(File modelFile) throws IOException;

  public abstract void
         storeParameters(File modelFile) throws IOException;

  /**
   * kernel function
   * 
   * 
   * @return
   */
  public abstract double
         f(int m,
           int n,
           double t);

  /**
   * integrated kernel function, regarded as a cumulative distribution function
   * when this{@link #ρ()}=1, it gives the probability that an event happens
   * before time t
   * 
   * @param type
   *          TODO
   * @param t
   * 
   * @return ∫ν(s)ds(0,t) integral of this{@link #f(int, double)} over s=0..t
   */
  public abstract double
         F(int m,
           int n,
           double t);

  /**
   * normalization factor which ensures the integral of
   * this{@link #f(int, double)} over [0,∞] is equal to this#ρ()
   * 
   * @param n
   *          TODO
   * 
   * @return
   */
  public abstract double
         Z(int m,
           int n);

  /**
   * @see this{@link #getFieldValue(Field)} and this{@link #getField(String)}
   * @param paramName
   * @return
   */
  public double
         getFieldValue(String paramName)
  {
    return getFieldValue(getField(paramName));
  }

  public BoundedParameter
         getBoundedParameter(String name)
  {
    for (BoundedParameter param : getBoundedParameters())
    {
      if (param.getName().equals(name))
      {
        return param;
      }
    }
    return null;
  }

  /**
   * Calls {@link Field#setDouble(Object, double)} on
   * this{@link #getField(String)}
   * 
   * @param paramName
   * @return
   */
  public void
         setFieldValue(String paramName,
                       double value)
  {
    try
    {
      getField(paramName).setDouble(this, value);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
  }

  public Object[][]
         evaluateStatisticsForEachLocalOptima(PointValuePair[] optima,
                                              String[] columnHeaders)
  {
    Object[][] data = new Object[optima.length][columnHeaders.length];

    for (int i = 0; i < optima.length; i++)
    {
      double[] point = optima[i].getPoint();
      Object[] row = evaluateParameterStatistics(point);

      for (int j = 0; j < columnHeaders.length; j++)
      {
        data[i][j] = row[j];
      }
    }
    return data;
  }

  protected final int forecastStartIndex = 6;

  /**
   * @see this{@link #forecastStartIndex}
   * 
   * @return
   */
  public Vector
         getInnovationSequence(int m)
  {
    int n = T.size() - 1;
    return new Vector(seq((IntToDoubleFunction) tk -> invΛ(m, tk, 1) - (T.get(tk + 1) - T.get(tk)), 0, n)).slice(forecastStartIndex, n);
  }

  public abstract double
         invΛ(int m,
              int tk,
              double y);

  public final double
         getMeanPredictionError(int m)
  {
    int n = T.size() - 1;
    return getInnovationSequence(m).mean();
  }

  /**
   * 
   * @return {@link Math#sqrt(double)}(this{@link #getMeanSquaredPredictionError()}
   */
  public double
         getRootMeanSquaredPredictionError(int m)
  {
    return sqrt(getMeanSquaredPredictionError(m));
  }

  public double
         getMeanSquaredPredictionError(int m)
  {
    return getInnovationSequence(m).pow(2).mean();
  }

  public TextTable
         printResults(ParallelMultistartMultivariateOptimizer multiopt)
  {

    BoundedParameter[] params = getBoundedParameters();

    println("parameter estimates for " + toString());

    PointValuePair[] optima = multiopt.getOptima().toArray(new PointValuePair[0]);

    return printResults(optima);
  }

  public TextTable
         printResults(PointValuePair[] optima)
  {
    String[] columnHeaders = getColumnHeaders();

    Object[][] data = evaluateStatisticsForEachLocalOptima(optima, columnHeaders);

    TextTable tt = new TextTable(columnHeaders, data);

    tt.setAddRowNumbering(true);
    tt.printTable();

    return tt;
  }

  public abstract Vector
         λvector(int type);

  public abstract double
         getBranchingRatio();

  public abstract Type
         getType();

  public abstract double
         φδ(int m,
            double t,
            double y,
            int tk);

  public abstract double
         φδ(int m,
            double t,
            double y);

  public abstract Vector
         Λ(int m);

}

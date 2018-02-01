package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.Math.exp;
import static java.lang.Math.log;
import static java.lang.Math.pow;
import static java.lang.System.out;
import static java.util.Arrays.stream;
import static java.util.stream.IntStream.rangeClosed;
import static org.apache.commons.lang.ArrayUtils.addAll;

import java.util.concurrent.atomic.DoubleAdder;

import fastmath.DoubleColMatrix;
import fastmath.Vector;
import stochastic.pointprocesses.autoexciting.AutoExcitingProcessFactory.Type;
import stochastic.pointprocesses.autoexciting.BoundedParameter;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawSelfExcitingProcess;

public class ExtendedMututallyExcitingExponentialPowerlawApproximationProcess extends ExponentialMutuallyExcitingProcess
{

  private DoubleColMatrix τ;

  private DoubleColMatrix ε;

  private DoubleColMatrix η;

  private DoubleColMatrix b;

  /**
   * choose m such that m^M=1 minute, in units of milliseconds
   */
  public double base = exp(log(60000) / M);

  public ExtendedMututallyExcitingExponentialPowerlawApproximationProcess(int dim)
  {
    this.dim = dim;
    τ = new DoubleColMatrix(dim, dim).setName("τ");
    ε = new DoubleColMatrix(dim, dim).setName("ε");
    η = new DoubleColMatrix(dim, dim).setName("η");
    b = new DoubleColMatrix(dim, dim).setName("b");
  }

  @Override
  protected double
            α(int j,
              int m,
              int n)
  {
    if (j == M)
    {
      return αS(m, n);
    }
    return pow(1 / (τ.get(m, n) * pow(base, j)), 1 + ε.get(m, n));
  }

  private double
          αS(int m,
             int n)
  {
    return b.get(m, n);
  }

  @Override
  protected double
            β(int j,
              int m,
              int n)
  {
    if (j == M)
    {
      return βS(m, n);
    }
    return j < M ? (τ.get(m, n) * pow(base, -j)) : βS(m, n);
  }

  private double
          βS(int m,
             int n)
  {
    return 1 / η.get(m, n);
  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return ExtendedApproximatePowerlawSelfExcitingProcess.Parameter.values();
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
    return Type.MultivariateFullExtendedApproximatePowerlaw;
  }

  @Override
  public Vector
         getParameters()
  {
    Vector params = new Vector(getParamCount() * (dim * dim));
    for (int i = 0; i < getParamCount(); i++)
    {
      DoubleColMatrix fieldArray = getMatrixField(i);
      if (fieldArray == null)
      {
        throw new IllegalArgumentException("Matrix field '" + getParameterFields()[i].getName() + "' not found in " + getClass().getSimpleName());
      }
      params.slice(i * getParamCount(), (i + 1) * getParamCount()).assign(fieldArray.asVector());
    }
    //out.println("returning " + params.size() );
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
    
    int parameterDim = getParamCount() * (dim * dim);
    Vector params = new Vector(parameterDim);
    assert point.length == parameterDim : "need " + parameterDim + " params, not " + point.length;

    for (int i = 0; i < getParamCount(); i++)
    {
      DoubleColMatrix fieldArray = getMatrixField(i);
      fieldArray.asVector().assign(params.slice(i * (dim * dim), (i + 1) * (dim * dim)));
    }
  }

  /**
   * @return an array whose elements correspond to this{@link #statisticNames}
   */
  public Object[]
         evaluateParameterStatistics(double[] point)
  {
    ExponentialMutuallyExcitingProcess process = newProcess(point);
    double ksStatistic = process.getΛKolmogorovSmirnovStatistic();

    DoubleAdder meanCompMean = new DoubleAdder();
    DoubleAdder meanCompVar = new DoubleAdder();

    rangeClosed(0, dim() - 1).forEach(m -> {
      meanCompMean.add(process.Λ(m).mean());
      meanCompVar.add(process.Λ(m).variance());
    });
    double compMean = meanCompMean.doubleValue() / dim();
    double compVar = meanCompVar.doubleValue() / dim();

    // out.println(compensated.autocor(30));

    Object[] statisticsVector = new Object[]
    { process.logLik(),
      ksStatistic,
      compMean,
      compVar,
      process.getΛmomentMeasure(),
      process.getLjungBoxMeasure(),
      process.getΛmomentLjungBoxMeasure(),
      process.meanRecurrenceTimeVector().toString() };

    return addAll(stream(getParameterFields()).map(param -> {
      DoubleColMatrix value = process.getMatrixField(param);
      return value;
    }).toArray(), statisticsVector);
  }

  @Override
  public String
         getParamString()
  {
    StringBuilder sb = new StringBuilder();
    rangeClosed(0, getParamCount()).forEachOrdered(k -> sb.append(getMatrixField(k).toString()));
    return sb.toString();
  }

}

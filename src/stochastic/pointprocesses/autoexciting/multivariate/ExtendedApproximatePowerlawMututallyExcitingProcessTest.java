package stochastic.pointprocesses.autoexciting.multivariate;

import static fastmath.Functions.sum;
import static java.lang.Math.pow;
import static java.lang.Math.random;
import static java.lang.System.out;
import static org.fusesource.jansi.Ansi.ansi;
import static util.Plotter.addSeriesToChart;
import static util.Plotter.chart;
import static util.Plotter.display;

import java.util.Arrays;
import java.util.TreeMap;

import org.apache.commons.math3.analysis.integration.SimpsonIntegrator;
import org.knowm.xchart.XYChart;

import fastmath.IntVector;
import fastmath.Pair;
import fastmath.Vector;
import junit.framework.TestCase;
import util.Plotter;

public class ExtendedApproximatePowerlawMututallyExcitingProcessTest extends TestCase
{

  public static ExtendedApproximatePowerlawMututallyExcitingProcess
         constructLongerProcess()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();
    process.ε.assign(0.02, 0.04);
    process.T = new Vector(new double[]
    { 25, 92, 93, 104, 112, 166, 167, 175, 176, 189, 227, 229 });
    process.K = new IntVector(new int[]
    { 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1 });
    return process;
  }

  public static ExtendedApproximatePowerlawMututallyExcitingProcess
         constructProcess()
  {
    final ExtendedApproximatePowerlawMututallyExcitingProcess process = new ExtendedApproximatePowerlawMututallyExcitingProcess(2);

    process.assignParameters(new double[]
    { 1, 0, 3, 1.78, 1, 0.01, 2.99, 1.75 });

    process.T = new Vector(3);
    process.T.set(0, 0);
    process.T.set(1, 19);
    process.T.set(2, 27);
    process.K = new IntVector(3);
    process.K.set(0, 0);
    process.K.set(1, 1);
    process.K.set(2, 0);

    return process;
  }

  public void
         testA()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    for (int m = 0; m < process.dim(); m++)
    {
      for (int n = 0; n < process.dim(); n++)
      {
        for (int tk = 0; tk < process.N(m); tk++)
        {
          for (int j = 0; j < process.order(); j++)
          {
            double a = process.Asum(j, m, n, tk);
            double b = process.A(j, m, n, tk);
            double d = process.B(j, m, n, tk);
            // out.println("a=" + a + " b=" + b + " c=" + c + " d=" + d);
            assertEquals(String.format("j=%s m=%s n=%s tk=%s Asum=%s != A=%s", j, m, n, tk, a, b), a, b, 1E-8);
            assertEquals(a, 1 + d, 1E-8);
          }
        }
      }
    }

  }

  public void
         testIntensity() throws InterruptedException
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();

    Vector trueIntensity0 = new Vector(new double[]
    { .1945892322, .1955665183, .3172551798, .1965982732, .318279369 });
    Vector trueIntensity1 = new Vector(new double[]
    { .2065355127, .2221480142, .2087731581, .3374144892, .2141883713, .2114497082, .2973930688 });
    Vector intensity = process.λvectorSlow(0);
    Vector intensity1 = process.λvectorSlow(1);
    out.println(ansi().fgBrightGreen() + "process="
                + process
                + "\nparams="
                + process.getParamString()
                + "\nαβstring="
                + process.getαβString()
                + "\nT[0]="
                + process.getTimes(0)
                + "\nT[1]="
                + process.getTimes(1)
                + "\nintensity0="
                + intensity
                + "\nintensity1="
                + intensity1
                + ansi().fgDefault());

    //assertTrue("should equal " + trueIntensity0, trueIntensity0.equals(intensity, pow(10, -9)));
    //a//ssertTrue("should equal " + trueIntensity1, trueIntensity1.equals(intensity1, pow(10, -9)));

     XYChart chart = chart("t (ms)", "λ0", t -> process.λ(0, t), 0, 300, t -> t);
     Pair<double[], double[]> sample = Plotter.sampleFunction(t -> process.λ(1,
     t), 10000, 0, 300, t -> t);
     chart.addSeries("λ1", sample.left, sample.right);
     display(chart);
     double cnt = 1;
     while (cnt > 0)
     {
     Thread.sleep(1000);
     }

    double λt1 = process.λ(0, process.T(0, 1));
    out.println("λt1=" + λt1);

    double λ0 = process.λ(0, 116);
    // double λ0r = process.λrecursive(0, 116);
    // out.println( "λ0=" + λ0 + "\nλ0r=" + λ0r);
    assertEquals(0.006488609684355583, λ0, pow(10, -11));

    double λ1 = process.λ(1, 116);
    assertEquals(0.05166212018884022, λ1, pow(10, -10));

  }

  public void
         testCompensator()
  {
    Vector correctComp0 = new Vector(new double[]
    { .6367558268, .155201254, 1.197807576, .156229219 });
    Vector correctComp1 = new Vector(new double[]
    { .4998888423, .8070096157, .165624490, 1.059560873, .805224444, .278509920 });

    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    Vector comp0 = process.Λ(0);
    Vector comp1 = process.Λ(1);
    out.println("process " + process + "\ncomp0=" + comp0);
    out.println("comp1=" + comp1);

    Vector comp0slow = process.Λslow(0);
    Vector comp1slow = process.Λslow(1);
    out.println("comp0slow=" + comp0slow);
    out.println("comp1slow=" + comp1slow);

    out.println("correctcomp0=" + correctComp0);
    out.println("correctcomp1=" + correctComp1);

    assertEquals(comp0slow.sum(), comp0.sum(), pow(10, -12));
    assertEquals(comp1slow.sum(), comp1.sum(), pow(10, -12));

    assertTrue(correctComp0.equals(comp0, pow(10, -7)));
    assertTrue(correctComp1.equals(comp1, pow(10, -7)));

  }

  public void
         testGetAndAssignParameters()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = new ExtendedApproximatePowerlawMututallyExcitingProcess(2);
    int paramCount = process.getParamCount() * process.dim;
    Vector randomParams = new Vector(paramCount);
    for (int i = 0; i < randomParams.size(); i++)
    {
      randomParams.set(i, random());
    }
    process.assignParameters(randomParams.toDoubleArray());
    Vector gotParams = process.getParameters();
    assertEquals(randomParams, gotParams);
    // out.println( "paramCount=" + paramCount );
  }

  public void
         testInvLambda()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    // process.ε = 0.05;

    // process.T = process.T.subtract(process.T.get(0));
    process.trace = false;

    // process.printResults( process.estimateParameters(25) );

    // out.println( " Λ=" + process.Λ() );
    // for (int tk = 0; tk < 10; tk++)
    // {
    // out.println("A[" + tk + "]=" + Arrays.toString(process.A[tk]));
    // }
    out.println("estimated " + ansi().fgBrightYellow() + process + ansi().fgDefault() + " from " + process.T.size() + " points");
    out.println(process.getαβString());
    process.trace = false;
    for (int k = 0; k < process.dim(); k++)
    {
      double Λmean = process.Λ(k).mean();
      process.trace = false;
      double Λvar = process.Λ(k).variance();
      out.println("k=" + k + " Λmean=" + ansi().fgBrightRed() + Λmean + ansi().fgDefault() + " Λvar=" + ansi().fgBrightRed() + Λvar + ansi().fgDefault());
    }

    out.println(ansi().fgBrightGreen() + process.T.toString() + ansi().fgDefault());
    process.dT = null;
    out.println(ansi().fgBrightGreen() + process.dT().toString() + ansi().fgDefault());

  }

  public void
         testLikelihood()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();

    double ll = process.logLik();
    out.println(ansi().fgBrightCyan() + "ll for " + process + " is " + ll + ansi().fgDefault());
    assertTrue(Double.isFinite(ll));
  }

  public void
         testSubTimes()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();
    process.T = new Vector(new double[]
    { 25, 91, 93, 112, 166, 167, 175, 176, 189, 227 });
    process.K = new IntVector(new int[]
    { 0, 0, 1, 0, 1, 1, 0, 0, 1, 1 });
    Pair<Vector[], TreeMap<Double, Integer>[]> sliced = process.getTimeSubsets();

    TreeMap<Double, Integer>[] timeIndices = sliced.right;
    out.println("sliced left= " + Arrays.toString(sliced.left) + " right=" + Arrays.toString(timeIndices));

  }

  public void
         testTotalΛ()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();

    // SimpsonIntegrator integrator = new SimpsonIntegrator();
    // out.println("integrating total compensator");
    double total = sum(m -> {
      // Vector mtimes = process.getTimes(m);
      return process.Λ(m).sum();
      // return integrator.integrate(10000000, t -> process.λ(m, t),
      // mtimes.getLeftmostValue(), mtimes.getRightmostValue());
    }, 0, process.dim() - 1);
    out.println("total is " + total);
    double tl = process.totalΛ();
    out.println("totalΛ=" + tl);
    assertTrue(Double.isFinite(tl));
  }

  public void
         testf()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    out.println("testing f for " + process);
    double val0 = process.f(0, 0, 6.5);
    double val1 = process.f(1, 1, 6.5);
    /**
     * see MultivariateInverseCompensator.mw
     */
    assertEquals(0.021354862160664107589, val0, pow(10, -10));
    assertEquals(0.022194945435683109689, val1, pow(10, -10));
  }

  public void
         testF()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    out.println("testing F for " + process);
    double val0 = process.F(0, 0, 6.5);
    double val1 = process.F(1, 1, 6.5);
    /**
     * see MultivariateInverseCompensator.mw
     */
    assertEquals(0.44789085456473543591, val0, pow(10, -10));
    assertEquals(0.47192399850061964076, val1, pow(10, -10));

    val0 = process.F(0, 0, 650000);
    val1 = process.F(1, 1, 650000);
    /**
     * see MultivariateInverseCompensator.mw
     */
    assertEquals(0.99999999999312388979, val0, pow(10, -10));
    assertEquals(0.99999999999396731432, val1, pow(10, -10));
  }

  public void
         testZ()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    double z0 = process.Z(0, 0);
    out.println("z0=" + z0);
    assertEquals(20.34, z0);

    double z1 = process.Z(1, 1);
    out.println("z1=" + z1);
    assertEquals(19.488945713548063, z1);

  }

  public void
         testλVector()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    Vector lv0 = process.λvector(0);
    out.println("lv0=" + lv0);
    Vector lv1 = process.λvector(1);
    out.println("lv1=" + lv1);
    // assertTrue(Double.isFinite(ll));
  }

  public void
         testΦ()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    out.println("params = " + process.getαβString());
    double x = process.Φ(0, 0.25, 1, process.N(0) - 1);
    assertTrue(Double.isFinite(x));
    out.println("x=" + x);
  }

}

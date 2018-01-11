package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.Math.pow;
import static java.lang.Math.random;
import static java.lang.System.out;
import static org.fusesource.jansi.Ansi.ansi;

import java.util.Arrays;
import java.util.TreeMap;

import fastmath.IntVector;
import fastmath.Pair;
import fastmath.Vector;
import junit.framework.TestCase;

public class ExtendedApproximatePowerlawMututallyExcitingProcessTest extends TestCase
{

  public static ExtendedApproximatePowerlawMututallyExcitingProcess
         constructLongerProcess()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();
    process.ε.assign(0.02, 0.04);
    process.T = new Vector(new double[]
    { 25, 92, 93, 112, 166, 167, 175, 176, 189, 227 });
    process.K = new IntVector(new int[]
    { 0, 0, 0, 1, 1, 1, 0, 0, 1, 1 });
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
         testCalcCompensator()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructLongerProcess();
    Vector comp0 = process.Λ(0);
    Vector comp1 = process.Λ(1);
    out.println("comp0=" + comp0);
    out.println("comp1=" + comp1);

    Vector comp0slow = process.Λslow(0);
    Vector comp1slow = process.Λslow(1);
    out.println("comp0slow=" + comp0slow);
    out.println("comp1slow=" + comp1slow);

    assertEquals(comp0slow.sum(), comp0.sum(), pow(10, -12));
    assertEquals(comp1slow.sum(), comp1.sum(), pow(10, -12));


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
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    double ll = process.logLik();
    out.println("ll=" + ll);
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
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    double tl = process.totalΛ();
    out.println("totalΛ=" + tl);
    assertTrue(Double.isFinite(tl));
  }

  public void
         testZ()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = constructProcess();

    double z = process.Z();
    out.println("z=" + z);
    assertTrue(Double.isFinite(z));
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

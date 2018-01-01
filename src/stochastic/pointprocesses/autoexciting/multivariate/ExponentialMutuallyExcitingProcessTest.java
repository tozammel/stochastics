package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import fastmath.DoubleMatrix;
import fastmath.Vector;
import junit.framework.TestCase;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawAutoExcitingProcess;
import stochastic.pointprocesses.autoexciting.ExtendedExponentialPowerlawAutoExcitingProcessTest;

public class ExponentialMutuallyExcitingProcessTest extends TestCase
{
  public void
         testA()
  {
    ExtendedApproximatePowerlawAutoExcitingProcess uniprocess = ExtendedExponentialPowerlawAutoExcitingProcessTest.constructProcess();

    ExtendedApproximatePowerlawMututallyExcitingProcess process = ExtendedApproximatePowerlawMututallyExcitingProcessTest.constructLongerProcess();
    process.ε.set(new double[]
    { 0.0, 0.02 });
    out.println(process.getαβString());
    out.println();

    out.println(uniprocess.getαVector().toString());
    out.println(uniprocess.getβVector().toString());
    Vector αβvector = uniprocess.getαβVector();
    out.println(αβvector.toString());

    uniprocess.ε = 0.02;
    out.println();

    out.println(uniprocess.getαVector().toString());
    out.println(uniprocess.getβVector().toString());
    out.println(αβvector.toString());

    for (int j = 0; j < process.order(); j++)
    {
      out.println();

      out.println(process.getαMatrix(j).toString());
      out.println(process.getβMatrix(j).toString());
      DoubleMatrix αβmatrix = process.getαβMatrix(j);
      out.println(αβmatrix.toString());

    }

//    for (int j = 0; j < process.order(); j++)
//    {
//      out.println();
//
//      for (int m = 0; m < process.dim(); m++)
//      {
//        out.println();
//
//        for (int n = 0; n < process.dim(); n++)
//        {
//          int Nm = process.N(m, Double.POSITIVE_INFINITY);
//          out.println();
//          for (int i = 0; i < Nm; i++)
//          {
//            double a = process.Asum(j, m, n, i);
//            // double atoo = process.A(j, m, n, i);
//
//            // out.format("A(j=%d,m=%d,n=%d,i=%d)=%s\n\n", j, m, n, i, a);
//          }
//        }
//      }
  //  }

  }
}

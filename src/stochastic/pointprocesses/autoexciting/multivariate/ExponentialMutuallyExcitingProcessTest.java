package stochastic.pointprocesses.autoexciting.multivariate;

import static java.awt.EventQueue.getMostRecentEventTime;
import static java.lang.System.out;

import java.util.Arrays;

import fastmath.DoubleMatrix;
import fastmath.Vector;
import junit.framework.TestCase;
import stochastic.pointprocesses.autoexciting.ExtendedApproximatePowerlawAutoExcitingProcess;
import stochastic.pointprocesses.autoexciting.ExtendedExponentialPowerlawAutoExcitingProcessTest;

public class ExponentialMutuallyExcitingProcessTest extends TestCase
{
  
  public void testN()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = ExtendedApproximatePowerlawMututallyExcitingProcessTest.constructLongerProcess();
   
    assertEquals( 0, process.Nopen(0, 24) );
    assertEquals( 1, process.Nopen(0, 26) );
    assertEquals( 1, process.Nopen(0, 91) );
    assertEquals( 2, process.Nopen(0, 91.01) );
    assertEquals( 0, process.Nopen(1, 91) );
    assertEquals( 3, process.Nopen(1, 168) );
  }
  
  public void
         testA()
  {
    ExtendedApproximatePowerlawAutoExcitingProcess uniprocess = ExtendedExponentialPowerlawAutoExcitingProcessTest.constructProcess();

    ExtendedApproximatePowerlawMututallyExcitingProcess process = ExtendedApproximatePowerlawMututallyExcitingProcessTest.constructLongerProcess();
    process.ε.set(new double[]
    { 0.0, 0.02 });

    out.println(uniprocess);
    out.println(uniprocess.getαVector().toString());
    out.println(uniprocess.getβVector().toString());
    out.println(uniprocess.getαβVector());

    uniprocess.ε = 0.02;
    out.println();

    out.println(uniprocess);
    out.println(uniprocess.getαVector().toString());
    out.println(uniprocess.getβVector().toString());
    out.println(uniprocess.getαβVector());
    out.println();

    for (Vector typeTimes : process.getSubTimes().left)
    {
      out.println(typeTimes);

    }

    for (int j = 0; j < process.order(); j++)
    {
      out.println();

      out.println(process.getαMatrix(j).toString());
      out.println(process.getβMatrix(j).toString());
      DoubleMatrix αβmatrix = process.getαβMatrix(j);
      out.println(αβmatrix.toString());

      for (int m = 0; m < process.dim; m++)
      {
        int i = process.N(m) - 1;
        Vector row = new Vector(process.dim).setName("A[" + j + "," + m + ",n," + i + "]=");
        for (int n = 0; n < process.dim; n++)
        {
          row.set(n, process.Asum(j, m, n, i));
        }
        out.println(row);
      }
    }

  }

}

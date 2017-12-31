package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import junit.framework.TestCase;

public class ExponentialMutuallyExcitingProcessTest extends TestCase
{
  public void
         testA()
  {
    ExtendedApproximatePowerlawMututallyExcitingProcess process = ExtendedApproximatePowerlawMututallyExcitingProcessTest.constructLongerProcess();
    int j = 0;

    out.println(process.getαβString());
    out.println();
    
    for (int m = 0; m < process.dim(); m++)
    {
      for (int n = 0; n < process.dim(); n++)
      {
        int Nm = process.N(m, Double.POSITIVE_INFINITY);
        out.println();
        for (int i = 0; i < Nm; i++)
        {
          double a = process.Asum(j, m, n, i);
          // double atoo = process.A(j, m, n, i);

          out.format("A(j=%d,m=%d,n=%d,i=%d)=%s\n\n", j, m, n, i, a);
        }
      }
    }

  }
}

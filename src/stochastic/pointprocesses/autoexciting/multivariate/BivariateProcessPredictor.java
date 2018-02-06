package stochastic.pointprocesses.autoexciting.multivariate;

import java.io.File;
import java.io.IOException;

import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;

public class BivariateProcessPredictor
{

  public static void
         main(String[] args) throws IOException
  {
    UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess process = new UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(2);
    process.loadParameters(new File( "SPY.mat.meapl.0.model"));
  }

}

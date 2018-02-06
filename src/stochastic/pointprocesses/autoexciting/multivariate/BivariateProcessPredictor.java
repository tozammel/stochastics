package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import java.io.File;
import java.io.IOException;

import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;

public class BivariateProcessPredictor
{

  public static void
         main(String[] args) throws IOException
  {
    File modelFile = new File( "/home/stephen/git/fastmath/SPY.mat.meapl.0.model");
    UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess process = new UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(2);
    process.loadParameters(modelFile);
    out.println("Loaded " + process + " from " + modelFile.getAbsolutePath() );
  }

}

package stochastic.pointprocesses.selfexciting;

import stochastic.pointprocesses.autoexciting.multivariate.ExtendedMutuallyExcitingExponentialPowerlawApproximationProcess;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;

public enum Type
{
  ApproximatePowerlaw, ExtendedApproximatePowerlaw, MultivariateDiagonalExtendedApproximatePowerlaw, UnitRandomWalkExtendedApproximatePowerlaw, UnitRandomWalkMultivariateDiagonalExtendedApproximatePowerlaw, MultivariateFullExtendedApproximatePowerlaw;

  public String
         getFilenameExtension()
  {
    switch (this)
    {
    case ApproximatePowerlaw:
      return "apl";
    case ExtendedApproximatePowerlaw:
      return "eapl";
    case UnitRandomWalkExtendedApproximatePowerlaw:
      return "urweapl";
    case MultivariateDiagonalExtendedApproximatePowerlaw:
      return "meapl";
    case MultivariateFullExtendedApproximatePowerlaw:
      return "mfeapl";
    case UnitRandomWalkMultivariateDiagonalExtendedApproximatePowerlaw:
      return "urwmeapl";
    default:
      throw new UnsupportedOperationException("TODO: " + this);
    }
  }

  public <O>
         O
         instantiate()
  {
    return instantiate(1);
  }

  @SuppressWarnings("unchecked")
  public <O>
         O
         instantiate(int dim)
  {
    switch (this)
    {
    case ApproximatePowerlaw:
      return (O) new ApproximatePowerlawSelfExcitingProcess();
    case ExtendedApproximatePowerlaw:
      return (O) new ExtendedApproximatePowerlawSelfExcitingProcess();
    case UnitRandomWalkExtendedApproximatePowerlaw:
      return (O) new UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess();
    case MultivariateDiagonalExtendedApproximatePowerlaw:
      return (O) new ExtendedMutuallyExcitingExponentialPowerlawApproximationProcess(dim);
    case MultivariateFullExtendedApproximatePowerlaw:
      return (O) new ExtendedMutuallyExcitingExponentialPowerlawApproximationProcess(dim);
    case UnitRandomWalkMultivariateDiagonalExtendedApproximatePowerlaw:
      return (O) new UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(dim);
    default:
      throw new UnsupportedOperationException("TODO: " + this);
    }
  }
}
package stochastic.pointprocesses.selfexciting;

public enum Type
{
  ApproximatePowerlaw, ExtendedApproximatePowerlaw, MultivariateDiagonalExtendedApproximatePowerlaw, MultivariateFullExtendedApproximatePowerlaw;

  public String
         getFilenameExtension()
  {
    switch (this)
    {
    case ApproximatePowerlaw:
      return "apl";
    case ExtendedApproximatePowerlaw:
      return "eapl";
    case MultivariateDiagonalExtendedApproximatePowerlaw:
      return "meapl";
    case MultivariateFullExtendedApproximatePowerlaw:
      return "mfeapl";
    default:
      throw new UnsupportedOperationException("TODO: " + this);
    }
  }

  public AbstractSelfExcitingProcess
         instantiate()
  {
    return SelfExcitingProcessFactory.spawnNewProcess(this);
  }
}
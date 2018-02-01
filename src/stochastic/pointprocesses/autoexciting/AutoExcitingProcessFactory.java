package stochastic.pointprocesses.autoexciting;

public class AutoExcitingProcessFactory
{
  public static enum Type
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
      return spawnNewProcess(this);
    }
  };

  public static AbstractSelfExcitingProcess
         spawnNewProcess(Type type)
  {
    switch (type)
    {
    case ApproximatePowerlaw:
      return new ApproximatePowerlawSelfExcitingProcess();
    case ExtendedApproximatePowerlaw:
      return new ExtendedApproximatePowerlawSelfExcitingProcess();
    default:
      throw new UnsupportedOperationException("TODO: " + type);
    }
  }
}

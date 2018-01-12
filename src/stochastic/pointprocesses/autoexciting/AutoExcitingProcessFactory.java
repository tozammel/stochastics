package stochastic.pointprocesses.autoexciting;

import stochastic.pointprocesses.autoexciting.multivariate.ExtendedApproximatePowerlawMututallyExcitingProcess;

public class AutoExcitingProcessFactory
{
  public static enum Type
  {
    ApproximatePowerlaw, ExtendedApproximatePowerlaw, MultivariateExtendedApproximatePowerlaw;

    public String
           getFilenameExtension()
    {
      switch (this)
      {
      case ApproximatePowerlaw:
        return "apl";
      case ExtendedApproximatePowerlaw:
        return "eapl";

      case MultivariateExtendedApproximatePowerlaw:
        return "meapl";
      default:
        throw new UnsupportedOperationException("TODO: " + this);
      }
    }

    public AbstractSelfExcitingProcess
           instantiate(int dim)
    {
      return spawnNewProcess(this, dim);
    }
  };

  public static AbstractSelfExcitingProcess
         spawnNewProcess(Type type,
                         int dim)
  {
    switch (dim)
    {
    case 1:
      switch (type)
      {
      case ApproximatePowerlaw:
        return new ApproximatePowerlawAutoExcitingProcess();
      case ExtendedApproximatePowerlaw:
        return new ExtendedApproximatePowerlawAutoExcitingProcess();
      default:
        throw new UnsupportedOperationException("TODO: " + type);
      }
    default:
      switch (type)
      {
      case MultivariateExtendedApproximatePowerlaw:
        return new ExtendedApproximatePowerlawMututallyExcitingProcess(dim);
      default:
        throw new UnsupportedOperationException("TODO: " + type);
      }
    }
  }
}

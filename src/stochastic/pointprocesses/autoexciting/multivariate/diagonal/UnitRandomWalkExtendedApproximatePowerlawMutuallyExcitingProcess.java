package stochastic.pointprocesses.autoexciting.multivariate.diagonal;

import static java.lang.System.out;

import fastmath.Vector;
import stochastic.pointprocesses.selfexciting.BoundedParameter;
import stochastic.pointprocesses.selfexciting.Type;
import stochastic.pointprocesses.selfexciting.UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess;

/**
 * Special case of
 * {@link DiagonalExtendedApproximatePowerlawMututallyExcitingProcess} where
 * τ[1..m]=[1..1] and ε=[0......0]
 *
 */
public class UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess extends DiagonalExtendedApproximatePowerlawMututallyExcitingProcess
{

  @Override
  public Type
         getType()
  {
    return Type.UnitRandomWalkExtendedApproximatePowerlaw;
  }

  /**
   * 
   * @param m
   * @return the m-th univariate process corresponding to the m-th dimension of
   *         this
   */
  public UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess
         getProcess(int m)
  {
    UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess process = new UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess();
    Vector params = getParameters(m);
    out.println("got " + params + " for dim " + m);

    process.assignParameters(params.toDoubleArray());
    process.T = getTimes(m);
    return process;

  }

  @Override
  public BoundedParameter[]
         getBoundedParameters()
  {
    return UnitRandomWalkExtendedApproximatePowerlawSelfExcitingProcess.Parameter.values();
  }

  public UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(int dim)
  {
    super(dim);
    for (int i = 0; i < dim; i++)
    {
      τ.set(i, 1);
      ε.set(i, 0);
    }
  }

}

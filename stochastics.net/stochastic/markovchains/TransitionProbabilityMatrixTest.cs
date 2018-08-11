using Sharpen;

namespace stochastic.markovchains
{
	public class TransitionProbabilityMatrixTest
	{
		/// <exception cref="System.Exception"/>
		[NUnit.Framework.SetUp]
		public virtual void setUp()
		{
		}

		[NUnit.Framework.Test]
		public virtual void test()
		{
			stochastic.markovchains.TransitionProbabilityMatrix tpm = new stochastic.markovchains.TransitionProbabilityMatrix
				();
			tpm.add(0, 0, 0.1);
			tpm.add(2, 3, 1.4);
			tpm.add(1, 1, 0.5);
			tpm.add(4, 2, 0.7);
			tpm.add(3, 2, 0.6);
			tpm.add(3, 4, 0.55);
			tpm.normalize();
			tpm.rowSum().forEach(null);
		}
	}
}

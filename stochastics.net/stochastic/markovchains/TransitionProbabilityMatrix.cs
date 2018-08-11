using Sharpen;

namespace stochastic.markovchains
{
	public class TransitionProbabilityMatrix : fastmath.SquareDoubleColMatrix
	{
		public override double add(int i, int j, double x)
		{
			int r = System.Math.max(i, j);
			int prevr = numRows;
			if (r >= prevr)
			{
				resize(r + 1, r + 1);
			}
			return base.add(i, j, x);
		}

		public TransitionProbabilityMatrix()
		{
		}

		public TransitionProbabilityMatrix(fastmath.AbstractMatrix x)
			: base(x)
		{
		}

		public TransitionProbabilityMatrix(java.nio.ByteBuffer buffer, int baseOffset, int
			 dim)
			: base(buffer, baseOffset, dim)
		{
		}

		public TransitionProbabilityMatrix(java.nio.ByteBuffer buffer, int dim)
			: base(buffer, dim)
		{
		}

		public TransitionProbabilityMatrix(double[][] arr)
			: base(arr)
		{
		}

		public TransitionProbabilityMatrix(string name)
			: base(0, name)
		{
		}

		public TransitionProbabilityMatrix(int dim, string name)
			: base(dim, name)
		{
		}

		public TransitionProbabilityMatrix(int dim)
			: base(dim)
		{
		}

		public TransitionProbabilityMatrix(System.Collections.Generic.IList<fastmath.Pair
			<double, double>> twoColMatrix)
			: base(twoColMatrix)
		{
		}

		public TransitionProbabilityMatrix(java.nio.ByteBuffer buffer, int baseOffset, int
			 numRows, int numCols)
			: base(buffer, baseOffset, numRows, numCols)
		{
		}

		public override M copy(bool reuseBuffer)
		{
			return reuseBuffer ? new stochastic.markovchains.TransitionProbabilityMatrix(buffer
				, getBaseOffset(), numRows, numCols) : new stochastic.markovchains.TransitionProbabilityMatrix
				(this);
		}

		/// <summary>
		/// Normalize the matrix so the row sums are equal to 1 (conservation of
		/// probability)
		/// </summary>
		/// <returns>this</returns>
		public virtual fastmath.Vector normalize()
		{
			fastmath.Vector rowSums = new fastmath.Vector(getRowCount());
			rows().forEach(null);
			return rowSums;
		}
	}
}

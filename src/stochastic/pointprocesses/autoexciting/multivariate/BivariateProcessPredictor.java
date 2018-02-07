package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import fastmath.DoubleMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import stochastic.pointprocesses.finance.Side;
import stochastic.pointprocesses.finance.TradingFiltration;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.selfexciting.ExtendedApproximatePowerlawSelfExcitingProcess;

public class BivariateProcessPredictor
{

  public static void
         main(String[] args) throws IOException
  {
    File modelFile = new File("/home/stephen/fastmath/SPY.mat.meapl.0.model");
    ExtendedMutuallyExcitingExponentialPowerlawApproximationProcess tradeProcess = new ExtendedMutuallyExcitingExponentialPowerlawApproximationProcess(2);
    
    tradeProcess.loadParameters(modelFile);
    out.println("Loaded " + tradeProcess + " from " + modelFile.getAbsolutePath());
    TradingFiltration filtration = new TradingFiltration(MatFile.loadMatrix("/home/stephen/fastmath/SPY.mat", "SPY"));
    ArrayList<TradingFiltration> slices = sliceFiltration(filtration);
    TradingFiltration firstSlice = slices.get(0);

    tradeProcess.K = firstSlice.types;
    tradeProcess.T = firstSlice.times;
    tradeProcess.X = firstSlice.markedPoints;
    double ll = tradeProcess.logLik();
//    Vector innov = tradeProcess.getInnovationSequence(0);
    out.println("ll=" + ll);
    Vector buyTimes = tradeProcess.getTimes(Side.Buy.ordinal());
    Vector sellTimes = tradeProcess.getTimes(Side.Sell.ordinal());
    assert (firstSlice.buyTimes.size() == buyTimes.size());
    assert (firstSlice.sellTimes.size() == sellTimes.size());

    ExtendedApproximatePowerlawSelfExcitingProcess buyProcess = tradeProcess.getProcess(Side.Buy.ordinal());
    ExtendedApproximatePowerlawSelfExcitingProcess sellProcess = tradeProcess.getProcess(Side.Sell.ordinal());
    
    out.println( "tradeProcess=" + tradeProcess );
    out.println( "buyProcess=" + buyProcess );
    out.println( "sellProcess=" + sellProcess );
    
    double mean = tradeProcess.Λ(0).mean();
    out.println("mean0=" + mean);


  //  MatFile.write("innov.mat", innov.createMiMatrix());
  }

  public static ArrayList<TradingFiltration>
         sliceFiltration(TradingFiltration tradingProcess) throws IOException
  {
    Vector times = tradingProcess.times;

    int n = (int) (TradingProcess.tradingDuration / MutuallyExcitingProcessEstimator.W);

    ArrayList<TradingFiltration> slices = new ArrayList<TradingFiltration>();

    for (int section = 0; section < n; section++)
    {
      int firstRow = section == 0 ? 0 : tradingProcess.tradeIndexes[section - 1];
      int lastRow = tradingProcess.tradeIndexes[section];
      DoubleMatrix markedPointSlice = tradingProcess.markedPoints.sliceRows(firstRow, lastRow);
      TradingFiltration slice = new TradingFiltration(markedPointSlice, tradingProcess.types.slice(firstRow, lastRow));
      // slice.tradeIndexes = TradingStrategy.getIndices(times);

      slices.add(slice);
    }

    return slices;
  }
}

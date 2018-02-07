package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import fastmath.DoubleMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;
import stochastic.pointprocesses.finance.Side;
import stochastic.pointprocesses.finance.TradingFiltration;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.selfexciting.ExtendedApproximatePowerlawSelfExcitingProcess;

public class BivariateProcessPredictor
{

  public static void
         main(String[] args) throws IOException,
                             InterruptedException
  {
    File modelFile = new File("/home/stephen/fm/SPY.mat.urweapl.0.model");
    UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess tradeProcess = new UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess(2);

    tradeProcess.loadParameters(modelFile);
    out.println("Loaded " + tradeProcess + " from " + modelFile.getAbsolutePath());
    TradingFiltration filtration = new TradingFiltration(MatFile.loadMatrix("/home/stephen/fastmath/SPY.mat", "SPY"));
    ArrayList<TradingFiltration> slices = sliceFiltration(filtration);
    TradingFiltration firstSlice = slices.get(0);

    tradeProcess.K = firstSlice.types;
    tradeProcess.T = firstSlice.times;
    tradeProcess.X = firstSlice.markedPoints;
    double ll = tradeProcess.logLik();
    // Vector innov = tradeProcess.getInnovationSequence(0);
    out.println("ll=" + ll);
    Vector buyTimes = tradeProcess.getTimes(Side.Buy.ordinal());
    Vector sellTimes = tradeProcess.getTimes(Side.Sell.ordinal());
    assert (firstSlice.buyTimes.size() == buyTimes.size());
    assert (firstSlice.sellTimes.size() == sellTimes.size());

    ExtendedApproximatePowerlawSelfExcitingProcess buyProcess = tradeProcess.getProcess(Side.Buy.ordinal());
    ExtendedApproximatePowerlawSelfExcitingProcess sellProcess = tradeProcess.getProcess(Side.Sell.ordinal());

    out.println("tradeProcess=" + tradeProcess);
    out.println("buyProcess=" + buyProcess);
    out.println("sellProcess=" + sellProcess);

    // Vector buyInnov = buyProcess.getInnovationSequence().setName("innovbuy");
    // Vector sellInnov = sellProcess.getInnovationSequence().setName("innovsell");

    double buyΛMean = buyProcess.Λ().mean();
    double buyΛVar = buyProcess.Λ().variance();
    double sellΛMean = sellProcess.Λ().variance();
    double sellΛVar = sellProcess.Λ().variance();
    out.println("buyΛmean=" + buyΛMean + " buyΛvar=" + buyΛVar);
    out.println("sellΛ=" + sellΛMean + " sellΛvar=" + sellΛVar);

    // XYChart chart = Plotter.chart("invΛ", "a", y -> buyProcess.invΛ(0, y), 0, 10,
    // t -> t);
    // display(chart);
    //
    // while (chart != null)
    // {
    // Thread.sleep(1000);
    // }

    // MatFile.write("innov.mat", buyInnov.createMiMatrix(),
    // sellInnov.createMiMatrix());
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

package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import fastmath.DoubleMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;
import stochastic.pointprocesses.finance.Side;
import stochastic.pointprocesses.finance.TradingFiltration;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.selfexciting.ExtendedApproximatePowerlawSelfExcitingProcess;
import util.DateUtils;

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

    double buyΛMean = buyProcess.Λ().mean();
    double buyΛVar = buyProcess.Λ().variance();
    double sellΛMean = sellProcess.Λ().mean();
    double sellΛVar = sellProcess.Λ().variance();
    out.println("buyΛmean=" + buyΛMean + " buyΛvar=" + buyΛVar);
    out.println("sellΛ=" + sellΛMean + " sellΛvar=" + sellΛVar);

    out.println("buyTimes=" + buyTimes);
    out.println("sellTimes=" + sellTimes);

    for (double instant = tradeProcess.T.getLeftmostValue(); instant < tradeProcess.T.getRightmostValue(); instant += 1000)
    {
      buyProcess.T = buyTimes;
      sellProcess.T = sellTimes;
      int nBuys = buyProcess.N(instant);
      int nSells = sellProcess.N(instant);
      buyProcess.T = buyTimes.slice(0, nBuys);
      sellProcess.T = sellTimes.slice(0, nSells);

      out.println("instant=" + String.format("%20.20f", instant) + " nBuys=" + nBuys + " nSells=" + nSells);
      buyProcess.verbose = true;
      sellProcess.verbose = true;

      double predictedMeanBuyingDuration = predictProcess(buyProcess);
      double predictedMeanSellingDuration = predictProcess(sellProcess);
      double projectedBuyOverSellRatio = 1 / (predictedMeanBuyingDuration / predictedMeanSellingDuration);
      out.println("instant=" + instant + " projectedBuyOverSellRatio=" + projectedBuyOverSellRatio);
    }

    // Vector buyInnov = buyProcess.getInnovationSequence().setName("innovbuy");
    // Vector sellInnov = sellProcess.getInnovationSequence().setName("innovsell");

    double predictedMeanBuyingDuration = predictProcess(buyProcess);
    double predictedMeanSellingDuration = predictProcess(sellProcess);
    double projectedBuyOverSellRatio = 1 / (predictedMeanBuyingDuration / predictedMeanSellingDuration);
    out.println("predictedMeanBuyingDuration=" + predictedMeanBuyingDuration
                + " predictedMeanSellingDuration="
                + predictedMeanSellingDuration
                + "\nprojectedBuyOverSellRatio="
                + projectedBuyOverSellRatio);

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

  public static double
         predictProcess(ExtendedApproximatePowerlawSelfExcitingProcess buyProcess)
  {
    double lastTBefore = buyProcess.T.getRightmostValue();
    Vector predicted = buyProcess.predict(lastTBefore + DateUtils.convertTimeUnits(30, TimeUnit.MINUTES, TimeUnit.MILLISECONDS));
    double lastTafter = buyProcess.T.getRightmostValue();
    double simDuration = lastTafter - lastTBefore;
    out.println("predicted " + predicted.size() + "\nsimLength=" + simDuration);
    double meanPredictedDuration = predicted.diff().mean();
    return meanPredictedDuration;
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

package stochastic.pointprocesses.autoexciting.multivariate;

import static java.lang.System.out;
import static java.util.stream.IntStream.rangeClosed;
import static org.fusesource.jansi.Ansi.ansi;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.fusesource.jansi.Ansi.Color;

import fastmath.DoubleColMatrix;
import fastmath.DoubleMatrix;
import fastmath.Vector;
import fastmath.matfile.MatFile;
import stochastic.pointprocesses.autoexciting.multivariate.diagonal.UnitRandomWalkExtendedApproximatePowerlawMutuallyExcitingProcess;
import stochastic.pointprocesses.finance.Side;
import stochastic.pointprocesses.finance.TradingFiltration;
import stochastic.pointprocesses.finance.TradingProcess;
import stochastic.pointprocesses.selfexciting.ExtendedApproximatePowerlawSelfExcitingProcess;
import util.DateUtils;
import util.DoublePair;

public class BivariateProcessPredictor
{

  public static void
         main(String[] args) throws IOException,
                             InterruptedException,
                             ExecutionException
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

    TreeMap<Double, DoublePair> predictions = new TreeMap<Double, DoublePair>();

    double W = tradeProcess.T.getRightmostValue() - tradeProcess.T.getLeftmostValue();
    int n = 100;
    double dt = W / n;
    out.println("dt=" + DateUtils.convertTimeUnits(dt, TimeUnit.MILLISECONDS, TimeUnit.SECONDS) + " seconds");
    AtomicInteger calculatedCounter = new AtomicInteger();
    rangeClosed(1, n).parallel().forEach(i -> {
      try
      {
        predictProcess(tradeProcess.T.getLeftmostValue() + dt * i, buyTimes, sellTimes, buyProcess.copy(), sellProcess.copy(), predictions);
        int finished = calculatedCounter.incrementAndGet();
        out.println("#" + finished + "/" + n);
      }
      catch (InterruptedException | ExecutionException e)
      {
        e.printStackTrace(System.err);
        if (e instanceof RuntimeException)
        {
          throw (RuntimeException) e;
        }
        throw new RuntimeException(e.getMessage(), e);

      }
    });

    DoubleColMatrix predictedPoints = new DoubleColMatrix(predictions.size(), 3);
    AtomicInteger rowCounter = new AtomicInteger();
    predictions.entrySet().stream().forEachOrdered(entry -> {
      int row = rowCounter.getAndIncrement();
      predictedPoints.set(row, 0, entry.getKey());
      predictedPoints.set(row, 1, entry.getValue().left);
      predictedPoints.set(row, 2, entry.getValue().right);
    });

    out.println("predictions=" + predictions);
    // Vector buyInnov = buyProcess.getInnovationSequence().setName("innovbuy");
    // Vector sellInnov = sellProcess.getInnovationSequence().setName("innovsell");

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

  public static void

         predictProcess(double instant,
                        Vector buyTimes,
                        Vector sellTimes,
                        ExtendedApproximatePowerlawSelfExcitingProcess buyProcess,
                        ExtendedApproximatePowerlawSelfExcitingProcess sellProcess,
                        TreeMap<Double, DoublePair> predictions) throws InterruptedException,
                                                                 ExecutionException
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

    ForkJoinPool pool = new ForkJoinPool(2);

    double predictedMeanBuyingDuration = predictProcess(buyProcess.copy());
    out.println(Thread.currentThread().getName() + " predictedMeanBuyingDuration@" + instant + "=" + predictedMeanBuyingDuration);
    double predictedMeanSellingDuration = predictProcess(sellProcess.copy());
    out.println(Thread.currentThread().getName() + " predictedMeanSellingDuration@" + instant + "=" + predictedMeanSellingDuration);
    double projectedBuyOverSellRatio = 1 / (predictedMeanBuyingDuration / predictedMeanSellingDuration);
    out.println(ansi().fg(Color.GREEN) + Thread.currentThread().getName()
                + " instant="
                + instant
                + " predictedMeanBuyingDuration="
                + predictedMeanBuyingDuration
                + " predictedMeanSellingDuration="
                + predictedMeanSellingDuration
                + "\nprojectedBuyOverSellRatio="
                + projectedBuyOverSellRatio
                + ansi().fgDefault());
    predictions.put(instant, new DoublePair(predictedMeanBuyingDuration, predictedMeanSellingDuration));
  }

  public static double
         predictProcess(ExtendedApproximatePowerlawSelfExcitingProcess buyProcess)
  {
    double lastTBefore = buyProcess.T.getRightmostValue();
    Vector predicted = buyProcess.predict(lastTBefore + DateUtils.convertTimeUnits(30, TimeUnit.MINUTES, TimeUnit.MILLISECONDS));
    double lastTafter = buyProcess.T.getRightmostValue();
    double simDurationInMinutes = DateUtils.convertTimeUnits(lastTafter - lastTBefore, TimeUnit.MILLISECONDS, TimeUnit.MINUTES);
    out.println(Thread.currentThread().getName() + " predicted " + predicted.size() + " points spanning " + simDurationInMinutes + " minutes");
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

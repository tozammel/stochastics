package stochastic.pointprocesses.finance;

import static java.lang.String.format;
import static java.lang.System.out;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;
import java.io.BufferedWriter;
import java.io.File;

import fastmath.Vector;
import util.AutoHashMap;

public class StockScreener
{

  public static void
         main(String[] args) throws FileNotFoundException,
                             IOException
  {

    Stream<Path> files = Files.find(Paths.get("/data"),
                                    20,
                                    (path,
                                     basicFileAttributes) -> {
                                      // out.println( "wtf " + path.toAbsolutePath() );
                                      boolean wtf = path.toAbsolutePath().toString().endsWith("mpp");
                                      return wtf || basicFileAttributes.isDirectory();
                                    });
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File("ranges.txt")));
    // BufferedWriter writer = new BufferedWriter(new FileWriter(new
    // File("ranges.txt")));
    AutoHashMap<String, BufferedWriter> symbolWriters = new AutoHashMap<>(symbol -> {
      try
      {
        File filename = new File("ranges-" + symbol + ".csv");
        out.println("Creating " + filename);
        out.println("filename=" + filename.getAbsolutePath());
        return new BufferedWriter(new FileWriter(filename));
      }
      catch (IOException e2)
      {
        throw new RuntimeException(e2.getMessage(), e2);
      }
    });
    // files.forEach(path->out.println(path));
    files.parallel().forEach(path -> {
      TradingProcess file;
      String wtf = path.toString();
      try
      {
        File fuck = new File(wtf);
        if (fuck.isDirectory())
        {
          return;
        }
        file = TradingProcess.loadMppFile(wtf);
      }
      catch (FileNotFoundException e)
      {
        throw new RuntimeException(e.getMessage(), e);

      }
      catch (IOException e)
      {
        throw new RuntimeException(e.getMessage(), e);
      }
      Vector prices = new Vector(file.tradeStream().mapToDouble(tick -> tick.getPrice()));
      try
      {
        file.close();
      }
      catch (IOException e1)
      {
        e1.printStackTrace(System.err);
        throw new RuntimeException(e1.getMessage(), e1);

      }
      double maxTradePrice = prices.fmax();
      double minTradePrice = prices.fmin();
      double range = ((maxTradePrice - minTradePrice) / (minTradePrice)) * 100;
      if (range > 3 && prices.size() > 35000)
      {
        out.println(wtf + "," + minTradePrice + "," + maxTradePrice + "," + prices.size() + "," + range);
        String line = wtf + "," + minTradePrice + "," + maxTradePrice + "," + prices.size() + "," + range + "\n";
        try
        {
          writer.write(line);
          BufferedWriter handle = symbolWriters.getOrCreate(file.symbol);
          handle.write(line);
          handle.flush();
        }
        catch (IOException e)
        {
          throw new RuntimeException(e.getMessage(), e);

        }
      }

    });
    writer.close();
    symbolWriters.values().forEach(handle -> {
      try
      {
        handle.close();
      }
      catch (IOException e)
      {

        throw new RuntimeException(e.getMessage(), e);
      }
    });
    out.println("wrote " + "ranges.txt");
  }

}

<TeXmacs|1.99.5>

<style|generic>

<\body>
  \;

  I've implemented the majority of the \ strategy described in
  https://arxiv.org/pdf/1106.5040.pdf \POptimal high frequency trading with
  limit and market orders\Q . The only remaining piece is to implement the
  verification step to validate that the computed optimal controls are
  actually optimal, and to implement unit tests for various inventory jump
  scenarios. The strategy requires high-frequency market data, and lots of
  it, many months at least.\ 

  From the quote/tick data, a Markov chain transition probability matrix is
  estimated which determines the movements of the jump of the spread level.
  For instance, if the stock is currently at a spread of 2 pennies, there
  could be a 40% chance of it going back to 1 penny and a 55% chance of it
  jumping to 3 pennies, and a 5% chance of it jumping to 4 pennies. The
  spread-transition matrix need not be symmetric, and it usually is not.
  Also, for each hour of the day, the spread jump rate is calculated. This
  allows the probabilities of a particular level of spread being reached,
  given knowledge of the current level, to be calculated by combining the
  information from the spread transition probability matrix and the spread
  jump rates. For each trade that occurs, and for each possible level of the
  spread, the cumulative volume is tracked and compared against the number of
  shares at the best bid and offer to determine whether the trade simply
  matched the prevailing price, or caused the price to be \Pimproved\Q and
  thus having the order jump in front of the orders already in the queue.

  The idea is that, the current level of the spread determines to some extent
  the probability that future orders to be placed by counterparties will be
  at a matching or improving price. This allows the algorithm to optimally
  determine when it needs to offer a price-improvement for a faster
  execution, or when it can afford to be patient and match the best bid or
  offer at the market, given the current displayed depth of the queue.

  <big-table|<image|ass.png|800px|479px||>|>

  \;

  The strategy also allows for the various fees and rebates to be input as
  parameters. The optimizer takes all of the calibrated data and the
  parameters, and calculates the optimal controls to apply at any given point
  during the trading day given any given level of inventory. The goal of the
  strategy is to be inventory-neutral, ending the day flat holding no
  inventory over night. It is also assumed to start the day at zero
  inventory, but this is not strictly necessary. The inventory level jumps at
  random times based on the demands of the customer, trader, whoever. The
  algorithm uses its knowledge of the spread transition probabilities,
  activity levels of the hour of the day, and the relative abundance of
  improving vs matching orders to optimally manage its inventory levels by
  actively placing market or limit orders as appropriate. The limit orders
  are moved when best bid or ask moves, and so, might be implemented more
  effecienctly if pegged-orders are available.\ 

  The assumptions for this strategy to generative positive returns are that:

  <\itemize>
    <item>the activity levels of a stock are roughly constant and do not vary
    too much, relative to its average, from day to do. Note: if it is known
    that some stock is going to have a greater activity level on a particular
    day, a multiplier can be used to scale the averaged historic activity
    levels.\ 

    <item>the spread transition probability matrixes, averaged over the
    calibration period, are roughly equivalent to the spread transition
    probability matrix on any particular day

    <item>the machine is able to send and receive messages from the exchange
    at sufficiently fast rate as to match the discretization level of the
    computed optimal controls. For technical/logical reasons, the minimum
    resolution of the computed solution is a function of the activity level,
    and this is intuitive, because for a stock that doesn't trade actively, a
    resolution of dt=5 seconds could be sufficient, however for a very active
    stock, the resolution might need to be as small as dt=15 milliseconds for
    instance

    \;
  </itemize>

  The benefits of precomputing the optimal controls before the begining of
  the trading day, is that the computational resources demanded to actually
  operate the strategy in real-time are very low since the computationally
  demanding part, the calibration and optimization, is done ahead-of-time.
  The strategy is implemented in Java with a library I developed (which I
  named fastmath) which uses memory mapped files using Java JNI to load the
  matrices/vectors into memory in an an effecient format.

  \;

  \UStephen

  \;

  stephencrowley214@gmail.com

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|table>
      <tuple|normal||<pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>
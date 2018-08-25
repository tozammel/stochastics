<TeXmacs|1.99.3>

<style|generic>

<\body>
  <\hide-preamble>
    \;

    <assign||<\macro>
      <\inactive*>
        \;
      </inactive*>
    </macro>>
  </hide-preamble>

  <doc-data|<doc-title|Optimal high frequency trading with limit and market
  orders>|<doc-author|<author-data|<author-name|Fabien Guilbaud and
  <with|font-size|0.84|>Huyên Pham>>>>

  <abstract-data|<\abstract>
    We propose a framework for studying optimal market making policies in a
    limit order book (LOB). The bid-ask spread of the LOB is modelled by a
    Markov chain with finite values, multiple of the tick size, and
    subordinated by the Poisson process of the tick-time clock. We consider a
    small agent who continuously submits limit buy/sell orders at best
    bid/ask quotes, and may also set limit orders at best bid (resp. ask)
    plus (resp. minus) a tick for getting the execution order priority, which
    is a crucial issue in high frequency trading. By trading with limit
    orders, the agent faces an execution risk since her orders are executed
    only when they meet counterpart market orders, which are modelled by Cox
    processes with intensities depending on the spread and on her limit
    prices. By holding non-zero positions on the risky asset, the agent is
    also subject to the inventory risk related to price volatility. Then the
    agent can also choose to trade with market orders, and therefore get
    immediate execution, but at a least favorable price because she has to
    cross the bid-ask spread.

    The objective of the market maker is to maximize her expected utility
    from revenue over a short term horizon by a tradeoff between limit and
    market orders, while controlling her inventory position. This is
    formulated as a mixed regime switching regular/impulse control problem
    that we characterize in terms of quasi-variational system by dynamic
    programming methods. In the case of a mean-variance criterion with
    martingale reference price or when the asset price follows a Levy process
    and with exponential utility criterion, the dynamic programming system
    can be reduced to a system of simple equations involving only the
    inventory and spread variables.

    Calibration procedures are derived for estimating the transition matrix
    and intensity parameters for the spread and for Cox processes modelling
    the execution of limit orders. Several computational tests are performed
    both on simulated and real data, and illustrate the impact and profit
    when considering execution priority in limit orders and market orders.
  </abstract>>

  <no-indent><with|font-series|bold|Keywords:> Market making, limit order
  book, inventory risk, point process, stochastic control.

  The outline of this paper is as follows. In section 2, we detail the model,
  and comment its features. We also provide direct calibration methods for
  all quantities involved in our model. We formulate in Section 3 the optimal
  market making control problem and derive the associated
  Hamilton-Jacobi-Bellman quasi variational inequality (HJBQVI) from dynamic
  programming principle. We show how one can reduce the number of state
  variables to the inventory and spread for the resolution to this QVI in two
  standard cases. In the last section 4, we provide some numerical results
  and empirical performance analysis.

  <section|A market-making model>

  <subsection|Mid price and spread process>

  \ It is assumed that all random variables and stochastic processes are
  defined on the stochastic basis <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-F\>,\<bbb-P\>|)>>
  consisting of the probability space <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>
  equipped with its natural filtration <verbatim|><math|\<bbb-F\>=>
  <math|<around|(|\<cal-F\><rsub|t>|)><rsub|t\<geq\>0>> satisfying the usual
  conditions. The mid-price of the stock is an exogenous Markov process
  <math|P>, with infinitesimal generator <math|\<cal-P\>> and state space
  <math|\<bbb-P\>>. For example, <math|P> is a Lévy process (e.g. an
  arithmetic Brownian motion), or an exponential of Lévy process (e.g.
  geometric Brownian motion). In the limit order book (LOB) for this stock,
  we consider a stochastic bid-ask spread resulting from the behaviour of
  market participants, taking discrete values, which are finite multiple of
  the tick size <math|\<delta\>> <math|\<gtr\>> <math|0>, and jumping at
  random times. This is modelled as follows: we first consider the tick-time
  'clock' associated to a Poisson process
  <math|<around|(|N<rsub|t>|)><rsub|t>> with deterministic intensity
  <math|\<lambda\><around|(|t|)>>, and representing the random times where
  the buy and sell orders of participants in the market affect the bid-ask
  spread. We next define a <em|discrete-time stationary Markov chain>
  <math|<around|(|<wide|S|^><rsub|n>|)><rsub|n\<in\>\<bbb-N\>>\<in\>\<bbb-S\>>
  valued in the finite state space

  <\equation>
    \<bbb-S\>=<around*|{|\<delta\>\<bbb-I\><rsub|m>:\<bbb-I\><rsub|m>=<around|{|1,\<ldots\>,m|}>|}>\<forall\>m\<geqslant\>1
  </equation>

  with the random spread in tick time represented by the probability
  transition matrix <math|<around*|{|<around|(|\<rho\><rsub|i*j>|)>:1\<leq\>i,j\<leq\>M|}><rsub|>>
  where<math|\<rho\><rsub|i*j>> has elements defined by

  <\equation>
    \<rho\><rsub|i j>=<choice|<tformat|<table|<row|<cell|i\<neq\>j>|<cell|\<bbb-P\><around|[|<wide|S|^><rsub|n+1>=j*\<delta\>\|<wide|S|^><rsub|n>=i*\<delta\>|]>>>|<row|<cell|i=j>|<cell|0>>>>>
  </equation>

  independently of <math|N>. The spread process
  <math|<around|(|S<rsub|t>|)><rsub|t>> in calendar time is then defined as
  the time-change of <math|<wide|S|^>> by <math|N>, that is

  <\eqnarray>
    <tformat|<table|<row|<cell|S<rsub|t>=<wide|S|^><rsub|N<rsub|t>>\<forall\>t\<geq\>0>|<cell|>|<cell|<eq-number><label|dynS>>>>>
  </eqnarray>

  Hence, <math|<around|(|S<rsub|t>|)><rsub|t>> is a continuous time
  heterogeneous Markov chain independent of P with intensity matrix
  <math|R<around|(|t|)>> <math|=> <math|<around|(|r<rsub|i*j><around|(|t|)>|)><rsub|1\<leq\>i,j\<leq\>m>>,
  where

  <\equation>
    r<rsub|i*j><around|(|t|)>=<choice|<tformat|<table|<row|<cell|i\<neq\>j>|<cell|\<lambda\><around|(|t|)>\<rho\><rsub|i*j>>>|<row|<cell|i=j>|<cell|-<big|sum><rsub|j\<neq\>i>\<lambda\><around|(|t|)>\<rho\><rsub|i*j>>>>>>
  </equation>

  The best-bid and best-ask prices are then defined by

  <\equation>
    P<rsub|t><rsup|b>=P<rsub|t>-<frac|S<rsub|t>|2>
  </equation>

  \ <math|>and

  <\equation>
    P<rsup|a><rsub|t>=P<rsub|t>+<frac|S<rsub|t>|2>
  </equation>

  respectively.

  <subsection|Trading strategies in the limit order book>

  We consider an agent (market maker), who trades the stock using either
  limit orders or market orders. She may submit limit buy (resp. sell) orders
  specifying the quantity and the price she is willing to pay (resp. receive)
  per share, but will be executed only when an incoming sell (resp. buy)
  market order is matching her limit order. Otherwise, she can post market
  buy (resp. sell) orders for an immediate execution, but, in this case
  obtain the opposite best quote, i.e. trades at the best-ask (resp. best
  bid) price, which is less favorable.

  <subsubsection|Limit Order Strategies>

  The agent may submit at any time limit buy/sell orders at the current best
  bid/ask prices (and then has to wait an incoming counterpart market order
  matching her limit), but also control her own bid and ask price quotes by
  placing buy (resp. sell) orders at a marginal higher (resp. lower) price
  than the current best bid (resp. ask), i.e. at
  <math|P<rsub|t><rsup|b<rsub|+>>> <math|\<assign\>>
  <math|P<rsub|t><rsup|b>+\<delta\>> (resp. <math|P<rsub|t><rsup|a<rsub|->>>
  <math|\<assign\>> <math|P<rsub|t><rsup|a>-\<delta\>>). Such an alternative
  choice is used in practice by a market maker to capture market orders flow
  of undecided traders at the best quotes, hence to get priority in the order
  execution w.r.t. limit order at current best/ask quotes, and can be taken
  into account in our modelling with discrete spread of tick size
  <math|\<delta\>>.

  There is then a tradeoff between a larger performance for a quote at the
  current best bid (resp. ask) price, and a smaller performance for a quote
  at a higher bid price, but with faster execution. The submission and
  cancellation of limit orders are for free, as they provide liquidity to the
  market, and are thus stimulated. Actually, market makers receive some fixed
  rebate once their limit orders are executed. The agent is assumed to be
  small in the sense that she does not influence the bid-ask spread. The
  limit order strategies are then modelled by a continuous time predictable
  control process:

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|{|\<alpha\><rsub|t><rsup|m*a*k*e>=<around|(|Q<rsub|t><rsup|b>,Q<rsub|t><rsup|a>,L<rsub|t><rsup|b>,L<rsub|t><rsup|a>|)>\<forall\>t\<geqslant\>0:L=<around|(|L<rsup|b>,L<rsup|a>|)>\<in\><around|[|0,<wide|\<ell\>|\<bar\>>|]><rsup|2>\<forall\><wide|\<ell\>|\<bar\>>\<gtr\>0|}>
    \ >|<cell|>|<cell|>>>>
  </eqnarray*>

  represents the size of the limit buy/sell order, and <math|Q> <math|=>
  <math|<around|(|Q<rsup|b>,Q<rsup|a>|)>> represent the possible choices of
  the bid/ask quotes either at best or at marginally improved prices, and
  valued in , with <math|\<cal-Q\><rsup|b>> <math|=>
  <math|<around|{|B*b,B*b<rsub|+>|}>>, <math|>
  <math|><math|\<cal-Q\><rsup|a>=<around|{|B*a,B*a<rsub|->|}>>:

  <\itemize>
    <item><math|B*b>: best-bid quote, and <math|B*b<rsub|+>>: bid quote at
    best price plus the tick

    <item><math|B*a>: best-ask quote, and <math|B*a<rsub|->>: ask quote at
    best price minus the tick
  </itemize>

  Notice that when the spread is equal to one tick <math|\<delta\>>, a bid
  quote at best price plus the tick is actually equal to the best ask, and
  will then be considered as a buy market order. Similarly, an ask quote at
  best price minus the tick becomes a best bid, and is then viewed as a sell
  market order. In other words, the limit orders <math|Q<rsub|t>> <math|=>
  <math|<around|(|Q<rsub|t><rsup|b>,Q<rsub|t><rsup|a>|)>> take values in
  <math|\<cal-Q\><around|(|S<rsub|t<rsup|->>|)>>, where
  <math|\<cal-Q\><around|(|s|)>> <math|=>
  <math|<choice|<tformat|<table|<row|<cell|<around|{|B*b|}>\<times\><around|{|B*a|}>>|<cell|s=\<delta\>>>|<row|<cell|\<cal-Q\><rsup|b>\<times\>\<cal-Q\><rsup|a>>|<cell|s\<gtr\>\<delta\>>>>>>>.\ 

  Let <math|\<cal-Q\><rsub|i><rsup|b>> <math|=><choice|<tformat|<table|<row|<cell|<math|B
  b>>|<cell|i=0>>|<row|<cell|<math|\<cal-Q\><rsup|b>>>|<cell|i\<gtr\>1>>>>>
  and <math|\<cal-Q\><rsub|i><rsup|a>> <math|=><choice|<tformat|<table|<row|<cell|<math|B
  a>>|<cell|i=0>>|<row|<cell|<math|\<cal-Q\><rsup|a>>>|<cell|i\<gtr\>1>>>>>,
  then denote at any time <math|t> by <math|\<pi\><rsup|b><around|(|Q<rsub|t><rsup|b>,P<rsub|t>,S<rsub|t>|)>>
  and <math|\<pi\><rsup|a><around|(|Q<rsub|t><rsup|a>,P<rsub|t>,S<rsub|t>|)>>
  the bid and ask prices of the market maker, where the functions
  <math|\<pi\><rsup|b>> (resp. <math|\<pi\><rsup|a>>) are defined on
  <math|\<cal-Q\><rsup|b>\<times\>P\<times\>S> (resp.
  <math|\<cal-Q\><rsup|a>\<times\>P\<times\>S>) by:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<pi\><rsup|b><around|(|q<rsup|b>,p,s|)>>|<cell|=>|<cell|<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|p-<frac|s|2>,>|<cell|<text|for
    >q<rsup|b><space|0.27em>=<space|0.27em>B*b>>|<row|<cell|p-<frac|s|2>+\<delta\>>|<cell|<text|for
    >q<rsup|b><space|0.27em>=<space|0.27em>B*b<rsub|+>.>>>>>|\<nobracket\>><eq-number>>>|<row|<cell|\<pi\><rsup|a><around|(|q<rsup|a>,p,s|)>>|<cell|=>|<cell|<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|p+<frac|s|2>,>|<cell|<text|for
    >q<rsup|a><space|0.27em>=<space|0.27em>B*a>>|<row|<cell|p+<frac|s|2>-\<delta\>>|<cell|<text|for
    >q<rsup|a><space|0.27em>=<space|0.27em>B*a<rsub|->.>>>>>|\<nobracket\>><eq-number>>>>>
  </eqnarray*>

  Let <math|\<pi\><rsup|b><rsub|i><around|(|q<rsup|b>,p|)>=\<pi\><rsup|b><around|(|q<rsup|b>,p,s|)>><math|>
  and <math|\<pi\><rsup|a><rsub|i><around|(|q<rsup|a>,p|)>=\<pi\><rsup|a><around|(|q<rsup|a>,p,s|)>>
  where <math|s=i*\<delta\>\<forall\>i\<in\>1<rsub|m>> . One can take into
  account <em|proportional rebates> received by the market makers, by
  considering;\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<pi\><rsup|b><around*|(|q<rsup|b>,p,s|)>=<around*|(|p-<frac|s|2>+\<delta\>\<chi\><around*|{|q<rsup|b>=B<rsub|b<rsub|+>>|}>|)><around*|(|1-\<rho\>|)>>>|<row|<cell|\<pi\><rsup|a><around*|(|q<rsup|a>,p,s|)>=<around*|(|p+<frac|s|2>-\<delta\>\<chi\><around*|{|q<rsup|a>=B<rsub|a<rsub|->>|}>|)><around*|(|1+\<rho\>|)>>>>>>for
    some \<rho\>\<in\><around*|[|0,1|)>
  </equation>

  \;

  or <em|per share rebates> with

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<pi\><rsup|b><around*|(|q<rsup|b>,p,s|)>=<around*|(|p-<frac|s|2>+\<delta\>\<chi\><around*|{|q<rsup|b>=B<rsub|b<rsub|+>>|}>-\<rho\>|)>>>|<row|<cell|\<pi\><rsup|a><around*|(|q<rsup|a>,p,s|)>=<around*|(|p+<frac|s|2>-\<delta\>\<chi\><around*|{|q<rsup|a>=B<rsub|a<rsub|->>|}>+\<rho\>|)>>>>>>for
    some \<rho\>\<in\><around*|[|0,1|)>
  </equation>

  The limit orders of the agent are executed when they meet incoming
  counterpart market orders. Let us then consider the arrivals of market buy
  and market sell orders, which completely match the limit sell and limit buy
  orders of the small agent, and modelled by independent Cox processes
  <math|N<rsup|a>> and <math|N<rsup|b>>. The intensity rate of
  <math|N<rsub|t><rsup|a>> is given by <math|\<lambda\><rsup|a><around|(|Q<rsub|t><rsup|a>,S<rsub|t>|)>>
  where <math|\<lambda\><rsup|a>> is a deterministic function of the limit
  quote sell order, and of the spread, satisfying
  <math|\<lambda\><rsup|a>*<around|(|B*a,s|)>> <math|\<less\>>
  <math|\<lambda\><rsup|a>*<around|(|B*a<rsub|->,s|)>>. This natural
  condition conveys the price/priority in the order execution in the sense
  that an agent quoting a limit sell order at ask price
  <math|P<rsup|a<rsub|->>> will be executed before traders at the higher ask
  price <math|P<rsup|a>>, and hence receive more often market buy orders.
  Typically, one would also expect that <math|\<lambda\><rsup|a>> is
  nonincreasing w.r.t. the spread, which means that the larger is the spread,
  the less often the market buy orders arrive. Likewise, we assume that the
  intensity rate of <math|N<rsub|t><rsup|b>> is given by
  <math|\<lambda\><rsup|b><around|(|Q<rsub|t><rsup|b>,S<rsub|t>|)>> where
  <math|\<lambda\><rsup|b>> is a deterministic function of the spread, and
  <math|\<lambda\><rsup|b>*<around|(|B*b,s|)>> <math|\<less\>>
  <math|\<lambda\><rsup|b>*<around|(|B*b<rsub|+>,s|)>>. We shall denote by
  <math|\<lambda\><rsup|a><rsub|i><around|(|q<rsup|a>|)>> <math|=>
  <math|\<lambda\><rsup|a><around|(|q<rsup|a>,s|)>>,
  <math|\<lambda\><rsup|b><rsub|i><around|(|q<rsup|b>|)>> <math|=>
  <math|\<lambda\><rsup|b><around|(|q<rsup|b>,s|)>> where
  <math|<around*|{|s=i*\<delta\>:i\<in\>\<bbb-I\><rsub|m>|}>>.

  For a limit order strategy <math|\<alpha\><rsup|m*a*k*e>> <math|=>
  <math|<around|(|Q<rsup|b>,Q<rsup|a>,L<rsup|b>,L<rsup|a>|)>>, the cash
  holdings <math|X> and the number of shares <math|Y> hold by the agent (also
  called inventory) follow the dynamics

  <\eqnarray>
    <tformat|<table|<row|<cell|d*Y<rsub|t>>|<cell|=>|<cell|L<rsub|t><rsup|b>*d*N<rsub|t><rsup|b>-L<rsub|t><rsup|a>*d*N<rsub|t><rsup|a>,<label|dynY>>>|<row|<cell|d*X<rsub|t>>|<cell|=>|<cell|-\<pi\><rsup|b><around|(|Q<rsub|t><rsup|b>,P<rsub|t<rsup|->>,S<rsub|t<rsup|->>|)>*L<rsub|t><rsup|b>*d*N<rsub|t><rsup|b>+\<pi\><rsup|a><around|(|Q<rsub|t><rsup|a>,P<rsub|t<rsup|->>,S<rsub|t<rsup|->>|)>*L<rsub|t><rsup|a>*d*N<rsub|t><rsup|a>.<label|dynX>>>>>
  </eqnarray>

  <\subsubsection>
    <vspace|2mm><with|font-shape|italic|Market order strategies.>
  </subsubsection>

  \ In addition to market making strategies, the investor may place market
  orders for an immediate execution reducing her inventory. The submissions
  of market orders, in contrast to limit orders, take liquidity in the
  market, and are usually subject to fees. We model market order strategies
  by an impulse control:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><rsup|t*a*k*e>>|<cell|=>|<cell|<around|(|\<tau\><rsub|n>,\<zeta\><rsub|n>|)><rsub|n\<geq\>0>,>>>>
  </eqnarray*>

  where <math|<around|(|\<tau\><rsub|n>|)>> is an increasing sequence of
  stopping times representing the market order decision times of the
  investor, and <math|\<zeta\><rsub|n>>, <math|n> <math|\<geq\>> <math|1>,
  are <math|\<cal-F\><rsub|\<tau\><rsub|n>>>-measurable random variables
  valued in <math|[-<wide|e|\<bar\>>,<wide|e|\<bar\>>]>,
  <math|<wide|e|\<bar\>>> <math|\<gtr\>> <math|0>, and giving the number of
  stocks purchased at the best-ask price if <math|\<zeta\><rsub|n>>
  <math|\<geq\>> <math|0>, or selled at the best-bid price if
  <math|\<zeta\><rsub|n>> <math|\<less\>> <math|0> at these times. Again, we
  assumed that the agent is small so that her total market order will be
  executed immediately at the best bid or best ask price. In other words, we
  only consider a linear market impact, which does not depend on the order
  size. When posting a <em|market order strategy>, the cash holdings and the
  inventory jump at times <math|\<tau\><rsub|n>> by:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Y<rsub|\<tau\><rsub|n>>>|<cell|=Y<rsub|\<tau\><rsup|-><rsub|n>>+\<zeta\><rsub|n>>>|<row|<cell|X<rsub|\<tau\><rsub|n>>>|<cell|=X<rsub|\<tau\><rsub|n>><rsup|->-c<around|(|\<zeta\><rsub|n>,P<rsub|\<tau\><rsub|n>>,S<rsub|\<tau\><rsub|n>>|)>>>>>><label|sautY><label|sautX>
  </equation>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|c<around|(|e,p,s|)>>|<cell|=>|<cell|e*p+<around|\||e|\|><frac|s|2>+\<varepsilon\><eq-number>>>>>
  </eqnarray*>

  represents the (algebraic) cost function indicating the amount to be paid
  immediately when passing a market order of size <math|e>, given the mid
  price <math|p>, a spread <math|s>, and a fixed fee <math|\<varepsilon\>>
  <math|\<gtr\>> <math|0>. We shall denote by
  <math|c<rsub|i><around|(|e,p|)>> <math|=> <math|c<around|(|e,p,s|)>> for
  <math|s> <math|=> <math|i*\<delta\>>, <math|i> <math|\<in\>>
  <math|1<rsub|m>>. One can also include <em|proportional fees>
  <math|\<rho\>> <math|\<in\>> <math|<around|[|0,1|)>> paid at each market
  order trading by considering a cost function in the form:

  <\equation>
    c<around|(|e,p,s|)>=<around|(|e+\<varepsilon\><around|\||e|\|>|)>*p+<around|(|<around|\||e|\|>+\<rho\>*e|)>*<frac|s|2>+\<varepsilon\>
  </equation>

  \ or <em|fixed fees per share> with

  <\equation>
    c<around|(|e,p,s|)>=e*p+<around|\||e|\|>*<around|(|<frac|s|2>+\<rho\>|)>+\<varepsilon\>
  </equation>

  \ In the sequel, we shall denote by <math|\<cal-A\>> the set of all
  limit/market order trading strategies <math|\<alpha\>> <math|=>
  <math|<around|(|\<alpha\><rsup|m*a*k*e>,\<alpha\><rsup|t*a*k*e>|)>>.

  <subsection|Parameters estimation>

  In most order-driven markets, available data are made up of
  <with|font-shape|italic|Level 1 data> that contain transaction prices and
  quantities at best quotes, and of <with|font-shape|italic|Level 2 data>
  containing the volume updates for the liquidity offered at the <math|L>
  first order book slices (<math|L> usually ranges from 5 to 10). In this
  section, we propose some direct methods for estimating the intensity of the
  spread Markov chain, and of the execution point processes, based only on
  the observation of <with|font-shape|italic|Level 1 data>. This has the
  advantage of low computational cost, since we do not have to deal with the
  whole volume of <with|font-shape|italic|Level 2 data>. Yet, we mention some
  recent work on parameters estimation from the whole order book data
  <cite|constotal10>, but involving heavier computations based on integral
  transforms.

  <subsubsection|Estimation of spread parameters><with|font-series|bold|font-shape|italic|.>\ 

  Presuming that the spread <math|S> is observable, the jump times of the
  spread process are defined:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<theta\><rsub|0><space|0.27em>=<space|0.27em>0,<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>\<theta\><rsub|n+1>>|<cell|=>|<cell|inf
    <around*|{|t\<gtr\>\<theta\><rsub|n><space|0.17em>:<space|0.17em>S<rsub|t>\<neq\>S<rsub|t->|}><space|0.17em><space|0.17em>,<space|0.17em>\<forall\>n\<geq\>1.>>>>
  </eqnarray*>

  From these observable quantities, one can reconstruct the processes:

  <\eqnarray*>
    <tformat|<table|<row|<cell|N<rsub|t>>|<cell|=>|<cell|#<around*|{|\<theta\><rsub|j>\<gtr\>0<space|0.17em>:<space|0.17em>\<theta\><rsub|j>\<leq\>t|}><space|0.17em><space|0.17em>,<space|0.17em>t\<geq\>0,>>|<row|<cell|<wide|S|^><rsub|n>>|<cell|=>|<cell|S<rsub|\<theta\><rsub|n>><space|0.17em><space|0.17em>,<space|0.17em><space|0.27em>n\<geq\>0.>>>>
  </eqnarray*>

  Then, our goal is to estimate the deterministic intensity of the Poisson
  process <math|<around|(|N<rsub|t>|)><rsub|t>>, and the transition matrix of
  the Markov chain <math|<around|(|<wide|S|^><rsub|n>|)><rsub|n>> from a path
  realization with high frequency data xzof the tick-time clock and spread in
  tick time over a finite trading time horizon <math|T>, typically of one
  day. From the observations of <math|K> samples of
  <math|<wide|S|^><rsub|n>>, <math|n> <math|=> <math|1,\<ldots\>,K>, and
  since the Markov chain <math|<around|(|<wide|S|^><rsub|n>|)>> is
  stationary, we have a consistent estimator , when
  <math|K\<rightarrow\>\<infty\>>, for the transition probability

  <\equation>
    \<rho\><rsub|i*j>=P<around|[|<wide|S|^><rsub|n+1>=j*\<delta\>\|<wide|S|^><rsub|n>=i*\<delta\>|]>=<frac|P<around|[|<around|(|<wide|S|^><rsub|n+1>,<wide|S|^><rsub|n>|)>=<around|(|j*\<delta\>,i*\<delta\>|)>|]>|P<around|[|<wide|S|^><rsub|n>=i*\<delta\>|]>>
  </equation>

  given by

  <\eqnarray>
    <tformat|<table|<row|<cell|>|<cell|>|<cell|<wide|\<rho\>|^><rsub|i*j>=<frac|<big|sum><rsub|n=1><rsup|K>\<chi\><around|{|<around|(|<wide|S|^><rsub|n+1>,<wide|S|^><rsub|n>|)>=<around|(|j*\<delta\>,i*\<delta\>|)>|}>|<big|sum><rsub|n=1><rsup|K>\<chi\><around|{|<wide|S|^><rsub|n>=i*\<delta\>|}>><eq-number><label|estimrho>>>>>
  </eqnarray>

  For the estimation of the deterministic intensity function
  <math|\<lambda\><around|(|t|)>> of the (non)homogeneous Poisson process
  <math|<around|(|N<rsub|t>|)>>, we shall assume in a first approximation a
  simple natural parametric form. For example, we may assume that
  <math|\<lambda\>> is constant over a trading day, and more realistically
  for taking into account intra-day seasonality effects, we consider that the
  tick time clock intensity jumps e.g. every hour of a trading day. We then
  assume that <math|\<lambda\>> is in the form:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<lambda\><around|(|t|)>>|<cell|=>|<cell|<big|sum>\<lambda\><rsub|k>*<rsub|<around|{|t<rsub|k>\<leq\>t\<less\>t<rsub|k+1>|}>>>>>>
  </eqnarray*>

  where <math|<around|(|t<rsub|k>|)><rsub|k>> is a fixed and known increasing
  finite sequence of <math|\<bbb-R\><rsub|+>> with <math|t<rsub|0>=0>, and
  <math|<around|(|\<lambda\><rsub|k>|)><rsub|k>> is an unknown finite
  sequence of <math|<around|(|0,\<infty\>|)>>. In other words, the intensity
  is constant equal to <math|\<lambda\><rsub|k>> over each period
  <math|<around|[|t<rsub|k>,t<rsub|k+1>|]>>, and by assuming that the
  interval length <math|t<rsub|k+1>-t<rsub|k>> is large w.r.t. the intensity
  <math|\<lambda\><rsub|k>> (which is the case for high frequency data), we
  have a consistent estimator of <math|\<lambda\><rsub|k>>, for all <math|k>,
  and then of <math|\<lambda\><around|(|t|)>> given by:

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|\<lambda\>|^><rsub|k>>|<cell|=>|<cell|<frac|N<rsub|t<rsub|k+1>>-N<rsub|t<rsub|k>>|t<rsub|k+1>-t<rsub|k>>.<eq-number><label|estimlambda>>>>>
  </eqnarray>

  We performed these two estimation procedures <cite|estimrho> and
  <reff|estimlambda> on SOGN.PA stock on April 18, 2011 between 9:30 and
  16:30 in Paris local time. We used tick-by-tick level 1 data provided by
  Quanthouse, and fed via a OneTick Timeseries database.

  In table <reference|transitionmatrix>, we display the estimated transition
  matrix: first row and column indicate the spread value <math|s=i*\<delta\>>
  and the the cell <math|i*j> shows <math|<wide|\<rho\>|^><rsub|i*j>>. For
  this stock and at this date, the tick size was <math|\<delta\>=0.005>
  euros, and we restricted our analysis to the first <math|6> values of the
  spread <math|<around|(|m=6|)>> due to the small number of data outside this
  range.

  <\big-table>
    <\with|font-size|0.71>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|5|5|cell-halign|l>|<cwith|1|-1|6|6|cell-halign|l>|<cwith|1|-1|7|7|cell-halign|l>|<cwith|1|-1|7|7|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|7|7|1|-1|cell-bborder|1ln>|<table|<row|<cell|spread>|<cell|0.005>|<cell|0.01>|<cell|0.015>|<cell|0.02>|<cell|0.025>|<cell|0.03>>|<row|<cell|0.005>|<cell|0>|<cell|0.410>|<cell|0.220>|<cell|0.160>|<cell|0.142>|<cell|0.065>>|<row|<cell|0.01>|<cell|0.201>|<cell|0>|<cell|0.435>|<cell|0.192>|<cell|0.103>|<cell|0.067>>|<row|<cell|0.015>|<cell|0.113>|<cell|0.221>|<cell|0>|<cell|0.4582>|<cell|0.147>|<cell|0.059>>|<row|<cell|0.02>|<cell|0.070>|<cell|0.085>|<cell|0.275>|<cell|0>|<cell|0.465>|<cell|0.102>>|<row|<cell|0.025>|<cell|0.068>|<cell|0.049>|<cell|0.073>|<cell|0.363>|<cell|0>|<cell|0.446>>|<row|<cell|0.03>|<cell|0.077>|<cell|0.057>|<cell|0.059>|<cell|0.112>|<cell|0.692>|<cell|0>>>>>

      <label|transitionmatrix>
    </with>
  </big-table|Estimation of the transition matrix
  <math|<around|(|\<rho\><rsub|i*j>|)>> for the underlying spread of the
  stock SOGN.PA on April 18, 2011. >

  In table <reference|clockintensity>, we display the estimate for the tick
  time clock intensity <math|\<lambda\><around|(|t|)>> by assuming that it is
  piecewise constant and jumps only at 10:30, 11:30, ..., 16:30 in Paris
  local time. In figure <reference|clockintensityplot>, we plot the tick time
  clock intensity by using an affine interpolation, and observed a typical
  U-pattern. Hence, a further step for the estimation of the intensity could
  be to specify a parametric form for the intensity function fitting <math|U>
  pattern, e.g. parabolic functions in time, and then use a maximum
  likelihood method for estimating the parameters.

  <\big-table>
    <\with|font-size|0.71>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|l>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|l>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|7|7|cell-halign|l>|<cwith|1|-1|7|7|cell-rborder|1ln>|<cwith|1|-1|8|8|cell-halign|l>|<cwith|1|-1|8|8|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<table|<row|<cell|Time>|<cell|10:30>|<cell|11:30>|<cell|12:30>|<cell|13:30>|<cell|14:30>|<cell|15:30>|<cell|16:30>>|<row|<cell|Clock
      Intensity <math|\<lambda\><around|(|t|)>>>|<cell|1.654>|<cell|0.799>|<cell|0.516>|<cell|0.377>|<cell|0.632>|<cell|1.305>|<cell|2.113>>>>>

      <label|clockintensity>
    </with>
  </big-table|Estimation of the tick time clock (hourly basis) for the stock
  SOGN.PA on April 18, 2011. Tick time clock intensity
  <math|\<lambda\><around|(|t|)>> is expressed in second<rsup|<math|-1>>.>

  <big-figure|<with|par-mode|center|<label|clockintensityplot>>|Plot of tick
  time clock intensity estimate for the stock SOGN.PA on April 18, 2011
  expressed in second<rsup|<math|-1>> (affine interpolation). >

  <subsubsection|<with|font-series|bold|font-shape|italic|Estimation of
  execution parameters: make or take.>>

  \ When performing a limit order strategy <math|\<alpha\><rsup|m*a*k*e>>,
  \ suppose that the market maker permanently monitors the execution point
  processes <math|N<rsup|a>> and <math|N<rsup|b>>, representing the number of
  arrivals of <em|market buy orders> matching the <em|limit orders for quote
  ask> <math|Q<rsup|a>> and <em|market sell orders> matching the limit orders
  for quote bid <math|Q<rsup|b>>. It is also assumde that there is no latency
  so that the observation of the execution processes is not noisy. Therefore,
  observable variables include the quintuplet:

  <\equation>
    <around|(|N<rsup|a><rsub|t>,N<rsup|b><rsub|t>,Q<rsup|a><rsub|t>,Q<rsup|b><rsub|t>,S<rsub|t>|)>\<in\>\<bbb-R\><rsup|+>\<times\>\<bbb-R\><rsup|+>\<times\>\<cal-Q\><rsup|a>\<times\>\<cal-Q\><rsup|b>\<times\>\<bbb-S\><space|0.17em>,<space|0.17em>t\<in\><around|[|0,T|]>
  </equation>

  Moreover, since <math|N<rsup|a>> and <math|N<rsup|b>> are assumed to be
  independent, and both sides of the order book can be estimated using the
  same procedure, we shall focus on the estimation for the intensity function\ 

  <\equation>
    \<lambda\><rsup|b><around|(|q<rsup|b>,s|)\<forall\>>q<rsup|b>\<in\>\<cal-Q\><rsup|b>,s\<in\>\<bbb-S\>=\<delta\>1<rsub|m>
  </equation>

  \ of the Cox process <math|N<rsup|b>>. The estimation procedure for
  <math|\<lambda\><rsup|b><around|(|q<rsup|b>,s|)>> basically matchs the
  intuition that one must count the number of executions at bid when the
  system was in the state <math|<around|(|q<rsup|b>,s|)>> and normalize this
  quantity by the time spent in the state <math|<around|(|q<rsup|b>,s|)>>.
  This is justified mathematically as follows. For any
  <math|<around|(|q<rsup|b>,s=i*\<delta\>|)>> <math|\<in\>>
  <math|\<cal-Q\><rsup|b>\<times\>S>, let us define the point process

  <\eqnarray*>
    <tformat|<table|<row|<cell|>|<cell|>|<cell|N<rsub|t><rsup|b,q<rsup|b>,i>=<big|int><rsub|0><rsup|t>1<rsub|<around|{|Q<rsub|u><rsup|b>=q,S<rsub|u->=i*\<delta\>|}>>*d*N<rsub|u><rsup|b>\<forall\>t\<geq\>0<eq-number>>>>>
  </eqnarray*>

  which counts the number of jumps of <math|N<rsup|b>> when
  <math|<around|(|Q<rsup|b>,S|)>> was in state
  <math|<around|(|q<rsup|b>,s=i*\<delta\>|)>>. Then, for any nonnegative
  predictable process <math|<around|(|H<rsub|t>|)>>, we have

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<b-E\><around*|[|<big|int><rsub|0><rsup|\<infty\>>H<rsub|t>*d*N<rsub|t><rsup|b,q<rsup|b>,i>|]>>|<cell|=\<b-E\><around*|[|<big|int><rsub|0><rsup|\<infty\>>H<rsub|t>*\<chi\><around|{|Q<rsub|t><rsup|b>=q<rsup|b>,S<rsub|t->=i*\<delta\>|}>*d*N<rsub|t><rsup|b>|]>>>|<row|<cell|>|<cell|=\<b-E\><around*|[|<big|int><rsub|0><rsup|\<infty\>>H<rsub|t>*\<chi\><around|{|Q<rsub|t><rsup|b>=q<rsup|b>,S<rsub|t->=i*\<delta\>|}>*\<lambda\><rsup|b><around|(|Q<rsub|t><rsup|b>,S<rsub|t>|)>*d*t|]>>>|<row|<cell|>|<cell|=\<b-E\><around*|[|<big|int><rsub|0><rsup|\<infty\>>H<rsub|t>*\<chi\><around|{|Q<rsub|t><rsup|b>=q<rsup|b>,S<rsub|t->=i*\<delta\>|}>*\<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>*d*t|]>>>>>>
  </equation>

  where we used in the second equality the fact that
  <math|\<lambda\><rsup|b><around|(|Q<rsub|t><rsup|b>,S<rsub|t>|)>> is the
  intensity of <math|N<rsup|b>>. The relation (<reference|intensNb>) means
  that the point process <math|N<rsup|b,q<rsup|b>,i>> admits for intensity
  <math|\<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>*1<rsub|<around|{|Q<rsub|t><rsup|b>=q<rsup|b>,S<rsub|t->=i*\<delta\>|}>>>.
  By defining

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-T\><rsup|b,q<rsup|b>,i><rsub|t>=<big|int><rsub|0><rsup|t>\<chi\><around|{|Q<rsub|u><rsup|b>=q,S<rsub|u->=i*\<delta\>|}>*d*u>|<cell|>|<cell|>>>>
  </eqnarray*>

  as the time that <math|<around|(|Q<rsup|b>,S|)>> spent in the state
  <math|<around|(|q<rsup|b>,s=i*\<delta\>|)>>, this means equivalently that
  the process <math|M<rsub|t><rsup|b,q<rsup|b>,i>> <math|=>
  <math|N<rsup|b,q<rsup|b>,i><rsub|A<rsub|t><rsup|b,q<rsup|b>,i>>>, where
  <math|A<rsub|t><rsup|b,q<rsup|b>,i>=inf
  <around|{|u\<geq\>0:\<cal-T\><rsub|u><rsup|b,q<rsup|b>,i>\<geq\>t|}>> is
  the càd-làg inverse of <math|\<cal-T\><rsup|b,q<rsup|b>,i>>, a Poisson
  process with intensity <math|\<lambda\><rsub|i><around|(|q<rsup|b>|)>>. By
  assuming that <math|\<cal-T\><rsup|b,q<rsup|b>,i><rsub|T>> is large w.r.t.
  <math|\<lambda\><rsub|i><around|(|q<rsup|b>|)>>, which is the case when
  <math|<around|(|<wide|S|^><rsub|n>|)>> is irreducible (hence recurrent),
  and for high-frequency data over <math|<around|[|0,T|]>>, we have a
  consistent estimator of <math|\<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>>
  given by:

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|\<lambda\>|^><rsub|i><rsup|b><around|(|q<rsup|b>|)>=<frac|N<rsub|T><rsup|b,q<rsup|b>,i>|\<cal-T\><rsub|T><rsup|b,q<rsup|b>,i>>>|<cell|>|<cell|.<eq-number><label|consistentestimatorbid>>>>>
  </eqnarray>

  Similarly, we have a consistent estimator for
  <math|\<lambda\><rsub|i><rsup|a><around|(|q<rsup|a>|)>> given by:

  <\eqnarray>
    <tformat|<table|<row|<cell|>|<cell|<wide|\<lambda\>|^><rsub|i><rsup|a><around|(|q<rsup|a>|)>=<frac|N<rsub|T><rsup|a,q<rsup|a>,i>|\<cal-T\><rsub|T><rsup|a,q<rsup|a>,i>>>|<cell|<eq-number><label|consistentestimatorask>>>>>
  </eqnarray>

  where <math|N<rsub|T><rsup|a,q<rsup|a>,i>> counts the number of executions
  at ask quote <math|q<rsup|a>> and for a spread <math|i*\<delta\>>, and
  <math|\<cal-T\><rsub|T><rsup|a,q<rsup|a>,i>> is the time that
  <math|<around|(|Q<rsup|a>,S|)>> spent in the state
  <math|<around|(|q<rsup|a>,s=i*\<delta\>|)>> over <math|<around|[|0,T|]>>.

  Let us now illustrate this estimation procedure on real data, with the same
  market data as above, i.e. tick-by-tick level 1 for SOGN.PA on April 18,
  2011, provided by Quanthouse via OneTick timeseries database. Actually,
  since we did not perform the strategy on this real-world order book, we
  could not observe the real execution processes <math|N<rsup|b>> and
  <math|N<rsup|a>>. We built thus simple proxies
  <math|<wide|N|~><rsup|b,q<rsup|b>,i>> and
  <math|<wide|N|~><rsup|a,q<rsup|a>,i>>, for <math|q<rsup|b>> <math|=>
  <math|B*b,B*b<rsub|+>>, <math|q<rsup|a>> <math|=> <math|B*a,B*a<rsub|->>,
  <math|i> <math|=> <math|1,\<ldots\>,m>, based on the following rules. Let
  us also assume that in addition to <math|<around|(|S<rsub|\<theta\><rsub|n>>|)><rsub|n>>,
  we observe at jump times <math|\<theta\><rsub|n>> of the spread, the
  volumes <math|<around|(|V<rsup|a><rsub|\<theta\><rsub|n>>,V<rsup|b><rsub|\<theta\><rsub|n>>|)>>
  offered at the best ask and best bid price in the LOB together with the
  cumulated market order quantities <math|\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|a>>
  and <math|\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|b>> arriving between
  two consecutive jump times <math|\<theta\><rsub|n>> and
  <math|\<theta\><rsub|n+1>> of the spread, respectively at best ask price
  and best bid price. We finally fix an arbitrarily typical volume
  <math|V<rsub|0>>, e.g. <math|V<rsub|0>> <math|=> <math|100> of our limit
  orders, and define the proxys <math|<wide|N|~><rsup|b,q<rsup|b>,i>> and
  <math|<wide|N|~><rsup|a,q<rsup|a>,i>> at times <math|\<theta\><rsub|n>> by:

  <\eqnarray*>
    <tformat|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<wide|N|~><rsup|b,B*b<rsub|+>,i><rsub|\<theta\><rsub|n+1>>>|<cell|=<wide|N|~><rsup|b,B*b<rsub|+>,i><rsub|\<theta\><rsub|n>>+1<rsub|<around*|{|V<rsub|0>\<less\>\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|a>,S<rsub|\<theta\><rsub|n>>=i*\<delta\>|}>>>|<cell|<wide|N|~><rsup|b,B*b<rsub|+>,i><rsub|0>=0>>|<row|<cell|<wide|N|~><rsup|b,B*b,i><rsub|\<theta\><rsub|n+1>>>|<cell|=<wide|N|~><rsup|b,B*b<rsub|+>,i><rsub|\<theta\><rsub|n>>+1<rsub|<around*|{|V<rsub|0>+V<rsup|b><rsub|\<theta\><rsub|n>>\<less\>\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|a>,S<rsub|\<theta\><rsub|n>>=i*\<delta\>|}>><space|0.17em>>|<cell|<wide|N|~><rsup|b,B*b,i><rsub|0>=0>>|<row|<cell|<wide|N|~><rsup|a,A*a<rsub|->,i><rsub|\<theta\><rsub|n+1>>>|<cell|=<wide|N|~><rsup|a,A*a<rsub|->,i><rsub|\<theta\><rsub|n>>+1<rsub|<around*|{|V<rsub|0>\<less\>\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|b>,S<rsub|\<theta\><rsub|n>>=i*\<delta\>|}>>>|<cell|<wide|N|~><rsup|a,A*a<rsub|->,i><rsub|0>=0>>|<row|<cell|<wide|N|~><rsup|a,A*a,i><rsub|\<theta\><rsub|n+1>>>|<cell|=<wide|N|~><rsup|b,A*a,i><rsub|\<theta\><rsub|n>>+1<rsub|<around*|{|V<rsub|0>+V<rsup|a><rsub|\<theta\><rsub|n>>\<less\>\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|b>,S<rsub|\<theta\><rsub|n>>=i*\<delta\>|}>><space|0.17em><space|0.17em>>|<cell|<wide|N|~><rsup|a,A*a,i><rsub|0>=0>>>>
  </eqnarray*>

  together with a proxy for the time spent in spread <math|i*\<delta\>>:

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<cal-T\>|~><rsub|\<theta\><rsub|n+1>><rsup|i>>|<cell|=>|<cell|<wide|\<cal-T\>|~><rsub|\<theta\><rsub|n>><rsup|i>+<around|(|\<theta\><rsub|n+1>-\<theta\><rsub|n>|)>*1<rsub|<around|{|S<rsub|\<theta\><rsub|n>>=i*\<delta\>|}>>,<space|0.27em><space|0.27em><space|0.27em><wide|\<cal-T\>|~><rsub|0><rsup|i>=0.>>>>
  </eqnarray*>

  The interpretation of these proxies is the following: we consider the case
  where the (small) market maker instantaneously updates her quote
  <math|Q<rsup|b>> (resp. <math|Q<rsup|a>>) and volume
  <math|L<rsup|b>\<leq\>V<rsub|0>> (resp. <math|L<rsup|a>\<leq\>V<rsub|0>>)
  only when the spread changes exogenously, i.e. at dates
  <math|<around|(|\<theta\><rsub|n>|)>>, so that the spread remains constant
  between her updates, not considering her own quotes. If she chooses to
  improve best price i.e <math|Q<rsub|\<theta\><rsub|n>><rsup|b>=B*b<rsub|+>>
  (resp. <math|Q<rsub|\<theta\><rsub|n>><rsup|a>=B*a<rsub|->>) she will be in
  top priority in the LOB and therefore captures all incoming market order
  flow to sell (resp. buy). Therefore, an unfavourable way for
  (under)-estimating her number of executions is to increment
  <math|<wide|N|~><rsup|b>> (resp. <math|<wide|N|~><rsup|a>>) only when total
  traded volume at bid <math|\<xi\><rsub|\<theta\><rsub|n+1>><rsup|a>> (resp.
  total volume traded at ask <math|\<xi\><rsub|\<theta\><rsub|n+1>><rsup|b>>)
  was greater than <math|V<rsub|0>>. If the market maker chooses to add
  liquidity to the best prices i.e. <math|Q<rsub|\<theta\><rsub|n>><rsup|b>=B*b>
  (resp. <math|Q<rsub|\<theta\><rsub|n>><rsup|a>=B*a>), she will be ranked
  behind <math|V<rsup|b><rsub|\<theta\><rsub|n>>> (resp.
  <math|V<rsup|a><rsub|\<theta\><rsub|n>>>) in LOB priority queue. Therefore,
  we increment <math|<wide|N|~><rsup|b>> (resp. <math|<wide|N|~><rsup|a>>)
  only when the total traded volume at bid
  <math|\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|b>> (resp. total volume
  traded at ask <math|\<vartheta\><rsub|\<theta\><rsub|n+1>><rsup|a>>) was
  greater than <math|V<rsub|0>+V<rsup|b><rsub|\<theta\><rsub|n>>> (resp.
  <math|V<rsub|0>+V<rsup|a><rsub|\<theta\><rsub|n>>>). We then provide a
  proxy estimate for <math|\<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>>,
  <math|\<lambda\><rsub|i><rsup|a><around|(|q<rsup|a>|)>> by:

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|\<lambda\>|~><rsub|i><rsup|b><around|(|q<rsup|b>|)><space|0.27em>=<space|0.27em><frac|<wide|N|~><rsup|b,q<rsup|b>,i><rsub|\<theta\><rsub|n>>|<wide|\<cal-T\>|~><rsub|\<theta\><rsub|n>><rsup|i>>>|<cell|>|<cell|<eq-number><label|estimproxy>>>|<row|<cell|<wide|\<lambda\>|~><rsub|i><rsup|a><around|(|q<rsup|a>|)><space|0.27em>=<space|0.27em><frac|<wide|N|~><rsup|a,q<rsup|a>,i><rsub|\<theta\><rsub|n>>|<wide|\<cal-T\>|~><rsub|\<theta\><rsub|n>><rsup|i>>>|<cell|>|<cell|>>>>
  </eqnarray>

  We performed the estimation procedure <reff|estimproxy>. In table
  <reference|execintensities> we computed
  <math|<wide|\<lambda\>|~><rsub|i><rsup|a><around|(|q<rsup|a>|)>> and
  <math|<wide|\<lambda\>|~><rsub|i><rsup|b><around|(|q<rsup|b>|)>> for
  <math|i> <math|=> <math|1,\<ldots\>,6>, and limit order quotes
  <math|q<rsup|b>> <math|=> <math|B*b<rsub|+>,B*b>, <math|q<rsup|a>> <math|=>
  <math|B*a,B*a<rsub|->>. Due to the lack of data, estimate for large values
  of the spread are less robust. In this table, each row corresponds to a
  choice of the spread and each column to a choice of the quotes.

  <\big-table>
    <\with|font-size|0.71>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|5|5|cell-halign|l>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|7|7|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|Ba>|<cell|Ba->|<cell|Bb>|<cell|Bb+>>|<row|<cell|0.005>|<cell|0.0539>|<cell|0.1485>|<cell|0.0718>|<cell|0.1763>>|<row|<cell|0.010>|<cell|0.0465>|<cell|0.0979>|<cell|0.0520>|<cell|0.1144>>|<row|<cell|0.015>|<cell|0.0401>|<cell|0.0846>|<cell|0.0419>|<cell|0.0915>>|<row|<cell|0.020>|<cell|0.0360>|<cell|0.0856>|<cell|0.0409>|<cell|0.0896>>|<row|<cell|0.025>|<cell|0.0435>|<cell|0.1009>|<cell|0.0452>|<cell|0.0930>>|<row|<cell|0.030>|<cell|0.0554>|<cell|0.1202>|<cell|0.0614>|<cell|0.1255>>>>>

      <label|execintensities>
    </with>
  </big-table|Estimate of execution intensities
  <math|<wide|\<lambda\>|~><rsub|i><rsup|a><around|(|q<rsup|a>|)>> and
  <math|<wide|\<lambda\>|~><rsub|i><rsup|b><around|(|q<rsup|b>|)>>, expressed
  in <math|s<rsup|-1>> for SOGN.PA on April 18, 2011, between 9:30 and 16:30
  Paris local time. Each row corresponds to a spread value as a multiple of
  <math|\<delta\>=0.005>. Each column corresponds to a limit order quote.>

  In figure <reference|execintensitiesplot> we plotted this estimated
  intensity as a function of the spread, i.e. <math|s> <math|=>
  <math|i*\<delta\>> <math|\<rightarrow\>>
  <math|<wide|\<lambda\>|~><rsup|b><rsub|i><around|(|q<rsup|b>|)>>,
  <math|<wide|\<lambda\>|~><rsup|a><rsub|i><around|(|q<rsup|a>|)>> for
  <math|q<rsup|b>> <math|\<in\>> <math|<Qc><rsup|b>>, and <math|q<rsup|a>>
  <math|\<in\>> <math|<Qc><rsup|a>>. As one would expect,
  <math|<around|(|<wide|\<lambda\>|~><rsup|a><rsub|i><around|(|.|)>,<wide|\<lambda\>|~><rsup|b><rsub|i><around|(|.|)>|)>>
  are decreasing functions of <math|i> for the small values of <math|i> which
  matches the intuition that the higher are the (indirect) costs, the smaller
  is market order flow. Surprisingly, for large values of <math|i> this
  function becomes increasing, which can be due either to an estimation
  error, caused by the lack of data for this spread range, or a \Pgaming"
  effect, in other word liquidity providers increasing their spread when
  large or autocorrelated market orders come in.

  <big-figure|<with|par-mode|center|<image|execIntensities.pdf|0.9tex-text-width|||><label|execintensitiesplot>>|Plot
  of execution intensities estimate as a function of the spread for the stock
  SOGN.PA on the 18/04/2011, expressed in <math|s<rsup|-1>> (affine
  interpolation).>

  <section|Optimal limit/market order strategies>

  <subsection|Control problem formulation>

  Our market model in the previous section is completely determined by the
  state variables <math|<around|(|X,Y,P,S|)>> controlled by the limit/marker
  order trading strategies <math|\<alpha\>> <math|\<in\>> <math|\<cal-A\>>.

  The objective of the market maker is the following. She wants to maximize
  over a finite horizon <math|T> the profit from her transactions in the LOB,
  while keeping under control her inventory (usually starting from zero), and
  getting rid of her inventory at the terminal date:

  <\equation>
    <text|maximize >\<b-E\><around*|[|U<around|(|X<rsub|T>|)>-\<gamma\>*<big|int><rsub|0><rsup|T>g<around|(|Y<rsub|t>|)>*d*t|]>
  </equation>

  over all limit/market order trading strategies <math|\<alpha\>> <math|=>
  <math|<around|(|\<alpha\><rsup|m*a*k*e>,\<alpha\><rsup|t*a*k*e>|)>> in
  <math|\<cal-A\>> such that <math|Y<rsub|T>> <math|=> <math|0>. Here
  <math|U> is an increasing reward function, <math|\<gamma\>> is a
  nonnegative constant, and <math|g> is a nonnegative convex function, so
  that the last integral term <math|<big|int><rsub|0><rsup|T>g<around|(|Y<rsub|t>|)>*d*t>
  penalizes the variations of the inventory. Typical frameworks include the
  two following cases:

  <vspace|1mm><math|\<bullet\>> Mean-quadratic criterion:
  <math|U<around|(|x|)>> <math|=> <math|x>, <math|\<gamma\>> <math|\<gtr\>>
  <math|0>, <math|g<around|(|y|)>> <math|=> <math|y<rsup|2>>.

  <vspace|1mm><math|\<bullet\>> Exponential utility maximization:
  <math|U<around|(|x|)>> <math|=> <math|-exp (-\<eta\>*x)>, <math|\<gamma\>>
  <math|=> <math|0>.

  <vspace|1mm>Let us first remove mathematically the terminal constraint on
  the inventory: <math|Y<rsub|T>> <math|=> <math|0>, by introducing the
  liquidation function <math|L<around|(|x,y,p,s|)>> defined on
  <math|\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>> by:

  <\eqnarray*>
    <tformat|<table|<row|<cell|L<around|(|x,y,p,s|)>>|<cell|=>|<cell|x-c(-y,p,s)<space|0.27em>=<space|0.27em>x+y*p-<around|\||y|\|><frac|s|2>-\<varepsilon\>.>>>>
  </eqnarray*>

  This represents the value that an investor would obtained by liquidating
  immediately by a market order her inventory position <math|y> in stock,
  given a cash holdings <math|x>, a mid-price <math|p> and a spread <math|s>.
  Then, problem \ is formulated equivalently as

  <\equation>
    <text|maximize >\<b-E\><around*|[|U<around|(|L<around|(|X<rsub|T>,Y<rsub|T>,P<rsub|T>,S<rsub|T>|)>|)>-\<gamma\>*<big|int><rsub|0><rsup|T>g<around|(|Y<rsub|t>|)>*d*t|]><label|criterion2>
  </equation>

  over all limit/market order trading strategies <math|\<alpha\>> <math|=>
  <math|<around|(|\<alpha\><rsup|m*a*k*e>,\<alpha\><rsup|t*a*k*e>|)>> in
  <math|\<cal-A\>>. Indeed, the maximal value of problem
  (<reference|criterion>) is clearly smaller than the one of problem
  (<reference|criterion2>) since for any <math|><math|\<alpha\>\<in\>\<cal-A\>>
  s.t. <math|Y<rsub|T>> <math|=> <math|0>, we have
  <math|L<around|(|X<rsub|T>,Y<rsub|T>,P<rsub|T>,S<rsub|T>|)>> <math|=>
  <math|X<rsub|T>>. Conversely, given an arbitrary <math|\<alpha\>>
  <math|\<in\>> <math|\<cal-A\>>, let us consider the control
  <math|<wide|\<alpha\>|~>> <math|\<in\>> <math|\<cal-A\>>, coinciding with
  <math|\<alpha\>> up to time <math|T>, and to which one add at the terminal
  date <math|T> the market order consisting in liquidating all the inventory
  <math|Y<rsub|T>>. The associated state process
  <math|<around|(|<wide|X|~>,<wide|Y|~>,P,S|)>> satisfies:
  <math|<wide|X|~><rsub|t>> <math|=> <math|X<rsub|t>>,
  <math|<wide|Y|~><rsub|t>> <math|=> <math|Y<rsub|t>> for <math|t>
  <math|\<less\>> <math|T>, and <math|<wide|X|~><rsub|T>> <math|=>
  <math|L<around|(|X<rsub|T>,Y<rsub|T>,P<rsub|T>,S<rsub|T>|)>>,
  <math|<wide|Y|~><rsub|T>> <math|=> <math|0>. This shows that the maximal
  value of problem (<reference|criterion2>) is smaller and then equal to the
  maximal value of problem (<reference|criterion>).

  We then define the value function for problem (<reference|criterion2>) or
  (<reference|criterion>)

  <\eqnarray>
    <tformat|<table|<row|<cell|v<around|(|t,z,s|)>>|<cell|=>|<cell|sup<rsub|\<alpha\>\<in\>\<cal-A\>>\<Epsilon\><rsub|t,z,s><around*|[|U<around|(|L<around|(|Z<rsub|T>,S<rsub|T>|)>|)>-\<gamma\>*<big|int><rsub|t><rsup|T>g<around|(|Y<rsub|u>|)>*d*u|]><eq-number><label|defvalue>>>>>
  </eqnarray>

  for <math|t> <math|\<in\>> <math|<around|[|0,T|]>>, <math|z> <math|=>
  <math|<around|(|x,y,p|)>> <math|\<in\>>
  <math|\<bbb-R\><rsup|2>\<times\>\<bbb-P\>>, <math|s>
  <math|\<in\>\<bbb-S\>>. Here, given <math|\<alpha\>>
  <math|\<in\>\<cal-A\>>, <math|\<Epsilon\><rsub|t,z,s>> denotes the
  expectation operator under which the process <math|<around|(|Z,S|)>>
  <math|=> <math|<around|(|X,Y,P,S|)>> solution to
  (<reference|dynS>)-(<reference|dynY>)-(<reference|dynX)>)-(<reference|sautY>)-<reference|sautX>(),
  with initial state <math|<around|(|Z<rsub|t<rsup|->>,S<rsub|t<rsup|->>|)>>
  <math|=> <math|<around|(|z,s|)>>, is taken. Problem (<reference|defvalue>)
  is a mixed regular/impulse control problem in a regime switching
  jump-diffusion model, that we shall study by dynamic programming methods.
  Since the spread takes finite values in <math|\<bbb-S\>> <math|=>
  <math|\<delta\>1<rsub|m>>, it will be convenient to denote for <math|i>
  <math|\<in\>> <math|1<rsub|m>>, by <math|v<rsub|i><around|(|t,z|)>>
  <math|=> <math|v*<around|(|t,z,i*\<delta\>|)>>. By misuse of notation, we
  shall often identify the value function with the
  <math|\<bbb-R\><rsup|m>>-valued function <math|v> <math|=>
  <math|<around|(|v<rsub|i>|)><rsub|i\<in\>1<rsub|m>>> defined on
  <math|<around|[|0,T|]>\<times\>\<bbb-R\><rsup|2>\<times\>\<bbb-P\>>.

  <subsection|Dynamic programming equation>

  For any <math|q> <math|=> <math|<around|(|q<rsup|b>,q<rsup|a>|)>>
  <math|\<in\>> <math|\<cal-Q\>>, <math|\<ell\>> <math|=>
  <math|<around|(|\<ell\><rsup|b>,\<ell\><rsup|a>|)>> <math|\<in\>>
  <math|<around|[|0,<wide|\<ell\>|\<bar\>>|]><rsup|2>>, we consider the
  second-order nonlocal operator:

  <\eqnarray>
    <tformat|<table|<row|<cell|\<cal-L\><rsup|q,\<ell\>>\<varphi\><around|(|t,x,y,p,s|)>>|<cell|=>|<cell|\<cal-L\>\<varphi\><around|(|t,x,y,p,s|)>+R<around|(|t|)>*\<varphi\><around|(|t,x,y,p,s|)>>>|<row|<cell|>|<cell|>|<cell|<space|0.27em>+<space|0.27em>\<lambda\><rsup|b><around|(|q<rsup|b>,s|)>*<around*|[|\<varphi\><around|(|t,\<Gamma\><rsup|b><around|(|x,y,p,s,q<rsup|b>,\<ell\><rsup|b>|)>,p,s|)>-\<varphi\><around|(|t,x,y,p,s|)>|]>>>|<row|<cell|>|<cell|>|<cell|<space|0.27em>+<space|0.27em>\<lambda\><rsup|a><around|(|q<rsup|a>,s|)>*<around*|[|\<varphi\><around|(|t,\<Gamma\><rsup|a><around|(|x,y,p,s,q<rsup|a>,\<ell\><rsup|a>|)>,p,s|)>-\<varphi\><around|(|t,x,y,p,s|)>|]>,<eq-number><label|defLc>>>>>
  </eqnarray>

  for <math|<around|(|t,x,y,p,s|)>> <math|\<in\>>
  <math|<around|[|0,T|]>\<times\>\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>>,
  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<around|(|t|)>*\<varphi\><around|(|t,x,y,p,s|)>>|<cell|=>|<cell|<big|sum><rsub|j=1><rsup|m>r<rsub|i*j><around|(|t|)>*<around*|[|\<varphi\>*<around|(|t,x,y,p,j*\<delta\>|)>-\<varphi\>*<around|(|t,x,y,p,i*\<delta\>|)>|]>,<space|0.27em><space|0.27em><space|0.27em><text|for
    >s=i*\<delta\>,<space|0.27em>i\<in\>1<rsub|m>,>>>>
  </eqnarray*>

  and <math|\<Gamma\><rsup|b>> (resp. <math|\<Gamma\><rsup|a>>) is defined
  from <math|\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>\<times\>\<cal-Q\><rsup|b>\<times\>\<bbb-R\><rsub|+>>
  (resp. <math|\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>\<times\>\<bbb-Q\><rsup|a>\<times\>\<bbb-R\><rsub|+>>
  into <math|\<bbb-R\><rsup|2>>) by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Gamma\><rsup|b><around|(|x,y,p,s,q<rsup|b>,\<ell\><rsup|b>|)>>|<cell|=>|<cell|<around|(|x-\<pi\><rsup|b><around|(|q<rsup|b>,p,s|)>*\<ell\><rsup|b>,y+\<ell\><rsup|b>|)>>>|<row|<cell|\<Gamma\><rsup|a><around|(|x,y,p,s,q<rsup|a>,\<ell\><rsup|a>|)>>|<cell|=>|<cell|<around|(|x+\<pi\><rsup|a><around|(|q<rsup|a>,p,s|)>*\<ell\><rsup|a>,y-\<ell\><rsup|a>|)>.>>>>
  </eqnarray*>

  The first term of <math|\<cal-L\><rsup|q,\<ell\>>> in (<reference|defLc>)
  correspond to the infinitesimal generator of the diffusion mid-price
  process <math|P>, the second one is the generator of the continuous-time
  spread Markov chain <math|S>, and the two last terms correspond to the
  nonlocal operator induced by the jumps of the cash process <math|X> and
  inventory process <math|Y> when applying an instantaneous limit order
  control <math|<around|(|Q<rsub|t>,L<rsub|t>|)>> <math|=>
  <math|<around|(|q,\<ell\>|)>>.

  Let us also consider the impulse operator associated to market order
  control, and defined by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-M\>\<varphi\><around|(|t,x,y,p,s|)>>|<cell|=>|<cell|sup<rsub|e\<in\>[-<wide|e|\<bar\>>,<wide|e|\<bar\>>]>
    \<varphi\><around|(|t,\<Gamma\><rsup|t*a*k*e><around|(|x,y,p,s,e|)>,p,s|)>,>>>>
  </eqnarray*>

  where <math|\<Gamma\><rsup|t*a*k*e>> is the impulse transaction function
  defined from <math|\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>\<times\>\<bbb-R\>>
  into <math|\<bbb-R\><rsup|2>> by:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Gamma\><rsup|t*a*k*e><around|(|x,y,p,s,e|)>>|<cell|=>|<cell|<around*|(|x-c<around|(|e,p,s|)>,y+e|)>,>>>>
  </eqnarray*>

  The dynamic programming equation (DPE) associated to the control problem
  (<reference|defvalue>) is the quasi-variational inequality (QVI):

  <\eqnarray>
    <tformat|<table|<row|<cell|min <around*|[|-<Dt|v>-sup<rsub|<around|(|q,\<ell\>|)>\<in\><Qc><around|(|s|)>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]><rsup|2>>\<cal-L\><rsup|q,\<ell\>>v<space|0.27em>+<space|0.27em>\<gamma\>*g<space|0.27em>,<space|0.27em>v-\<cal-M\>v|]>>|<cell|=>|<cell|0,<text|on
    ><around|[|0,T|)>\<times\><R><rsup|2>\<times\><P>\<times\><S><eq-number><label|dynv>>>>>
  </eqnarray>

  together with the terminal condition:

  <\eqnarray>
    <tformat|<table|<row|<cell|v<around|(|T,x,y,p,s|)>>|<cell|=>|<cell|U<around|(|L<around|(|x,y,p,s|)>|)>,<space|0.27em>\<forall\><around|(|x,y,p|)>\<in\>\<bbb-R\><rsup|2>\<times\>\<bbb-P\>\<times\>\<bbb-S\>.<eq-number><label|termv>>>>>
  </eqnarray>

  This is also written explicitly in terms of system of QVIs for the
  functions <math|v<rsub|i>>, <math|i> <math|\<in\>> <math|<I><rsub|m>>:

  <\eqnarray*>
    <tformat|<table|<row|<cell|min <around*|[|-<Dt|v<rsub|i>>-<Pc>v<rsub|i>-<big|sum><rsub|j=1><rsup|m>r<rsub|i*j><around|(|t|)>*<around|[|v<rsub|j><around|(|t,x,y,p|)>-v<rsub|i><around|(|t,x,y,p|)>|]>|\<nobracket\>>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>sup<rsub|<around|(|q<rsup|b>,\<ell\><rsup|b>|)>\<in\><Qc><rsub|i><rsup|b>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>*<around|[|v<rsub|i>*<around|(|t,x-\<pi\><rsub|i><rsup|b><around|(|q<rsup|b>,p|)>*\<ell\><rsup|b>,y+\<ell\><rsup|b>,p|)>-v<rsub|i><around|(|t,x,y,p|)>|]>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>sup<rsub|<around|(|q<rsup|a>,\<ell\><rsup|a>|)>\<in\><Qc><rsub|i><rsup|a>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|a><around|(|q<rsup|a>|)>*<around|[|v<rsub|i>*<around|(|t,x+\<pi\><rsub|i><rsup|a><around|(|q<rsup|a>,p|)>*\<ell\><rsup|a>,y-\<ell\><rsup|a>,p|)>-v<rsub|i><around|(|t,x,y,p|)>|]><space|0.27em>+\<gamma\>*g<around|(|y|)><space|0.27em>;>|<cell|>|<cell|>>|<row|<cell|<around*|\<nobracket\>|v<rsub|i><around|(|t,x,y,p|)>-sup<rsub|e\<in\>[-<wide|e|\<bar\>>,<wide|e|\<bar\>>]>
    v<rsub|i>*<around|(|t,x-c<rsub|i><around|(|e,p|)>,y+e,p|)>|]>>|<cell|=>|<cell|0,>>>>
  </eqnarray*>

  for <math|<around|(|t,x,y,p|)>> <math|\<in\>>
  <math|<around|[|0,T|)>\<times\><R><rsup|2>\<times\><P>>, together with the
  terminal condition:

  <\eqnarray*>
    <tformat|<table|<row|<cell|v<rsub|i><around|(|T,x,y,p|)>>|<cell|=>|<cell|U<around|(|L<rsub|i><around|(|x,y,p|)>|)>,<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>\<forall\><around|(|x,y,p|)>\<in\><R><rsup|2>\<times\><P>,>>>>
  </eqnarray*>

  where we set <math|L<rsub|i><around|(|x,y,p|)>> <math|=>
  <math|L*<around|(|x,y,p,i*\<delta\>|)>>.

  By methods of dynamic programming, one can show by standard arguments that
  the value function <math|v> is the unique viscosity solution to the QVI
  <reff|dynv>-<reff|termv> under suitable growth conditions depending on the
  utility function <math|U> and penalty function <math|g>. We next focus on
  some particular cases of interest for reducing remarkably the number of
  states variables in the dynamic programming equation DPE.

  <subsection|Two special cases>

  <with|font-series|bold|1. Mean criterion with penalty on inventory>

  <vspace|1mm><no-indent>We first consider the case as in <cite|stosag09>
  where:

  <\eqnarray>
    <tformat|<table|<row|<cell|U<around|(|x|)><space|0.27em>=<space|0.27em>x,<space|0.27em><space|0.27em>x\<in\>\<bbb-R\>,>|<cell|<text|and
    ><space|0.27em><space|0.27em><space|0.27em><around|(|P<rsub|t>|)><rsub|t><space|0.27em><text|is
    a martingale>.<eq-number><label|casemar>>>>>
  </eqnarray>

  The martingale assumption of the stock price under the historical measure
  under which the market maker performs her criterion, reflects the idea that
  she has no information on the future direction of the stock price.
  Moreover, by starting typically from zero endowment in stock, and by
  introducing a penalty function on inventory, the market maker wants to keep
  an inventory that fluctuates around zero.

  In this case, and exploiting similarly as in <cite|baylud11> the martingale
  property that <math|<Pc>p> <math|=> <math|0>, we see that the solution
  <math|v> <math|=> <math|<around|(|v<rsub|i>|)><rsub|i\<in\><I><rsub|m>>> to
  the dynamic programming system <reff|dynv>-<reff|termv> is reduced into the
  form:

  <\eqnarray>
    <tformat|<table|<row|<cell|v<rsub|i><around|(|t,x,y,p|)>>|<cell|=>|<cell|x+y*p+\<phi\><rsub|i><around|(|t,y|)>,<eq-number><label|simpli>>>>>
  </eqnarray>

  where <math|\<phi\>> <math|=> <math|<around|(|\<phi\><rsub|i>|)><rsub|i\<in\><I><rsub|m>>>
  is solution the system of integro-differential equations (IDE):

  <\eqnarray*>
    <tformat|<table|<row|<cell|min <around*|[|-<Dt|\<phi\><rsub|i>>-<big|sum><rsub|j=1><rsup|m>r<rsub|i*j><around|(|t|)>*<around|[|\<phi\><rsub|j><around|(|t,y|)>-\<phi\><rsub|i><around|(|t,y|)>|]>|\<nobracket\>>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>sup<rsub|<around|(|q<rsup|b>,\<ell\><rsup|b>|)>\<in\>\<cal-Q\><rsub|i><rsup|b>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>*<around|[|\<phi\><rsub|i>*<around|(|t,y+\<ell\><rsup|b>|)>-\<phi\><rsub|i><around|(|t,y|)>+<around*|(|<frac|i*\<delta\>|2>-\<delta\>*1<rsub|q<rsup|b>=B*b<rsub|+>>|)>*\<ell\><rsup|b>|]>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>sup<rsub|<around|(|q<rsup|a>,\<ell\><rsup|a>|)>\<in\>\<cal-Q\><rsub|i><rsup|a>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|a><around|(|q<rsup|a>|)>*<around|[|\<phi\><rsub|i>*<around|(|t,y-\<ell\><rsup|a>|)>-\<phi\><rsub|i><around|(|t,y|)>+<around*|(|<frac|i*\<delta\>|2>-\<delta\>*1<rsub|q<rsup|a>=B*a<rsub|->>|)>*\<ell\><rsup|a>|]><space|0.27em>+\<gamma\>*g<around|(|y|)><space|0.27em>;>|<cell|>|<cell|>>|<row|<cell|<around*|\<nobracket\>|\<phi\><rsub|i><around|(|t,y|)>-sup<rsub|e\<in\>[-<wide|e|\<bar\>>,<wide|e|\<bar\>>]><around|[|\<phi\><rsub|i>*<around|(|t,y+e|)>-<frac|i*\<delta\>|2><around|\||e|\|>-\<varepsilon\>|]>|]>>|<cell|=>|<cell|0,>>>>
  </eqnarray*>

  together with the terminal condition:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<phi\><rsub|i><around|(|T,y|)>>|<cell|=>|<cell|-<around|\||y|\|><frac|i*\<delta\>|2>-\<varepsilon\>,>>>>
  </eqnarray*>

  These one-dimensional IDEs can be solved numerically by a standard
  finite-difference scheme by discretizing the time derivative of
  <math|\<phi\>>, and the grid space in <math|y>. The reduced form
  <reff|simpli> shows that the optimal market making strategies are price
  independent, and depend only on the level of inventory and of the spread,
  which is consistent with stylized features in the market. Actually, the
  IDEs for <math|<around|(|\<phi\><rsub|i>|)>> even show that optimal
  policies do not depend on the martingale modeling of the stock price.

  <vspace|2mm><no-indent><with|font-series|bold|2. Exponential utility
  criterion>

  <vspace|1mm><no-indent>We next consider as in <cite|avesto08> a risk averse
  market marker:

  <\eqnarray>
    <tformat|<table|<row|<cell|U<around|(|x|)>>|<cell|=>|<cell|-exp
    (-\<eta\>*x),<space|0.27em>x\<in\>\<bbb-R\>,<space|0.27em>\<eta\>\<gtr\>0,<space|0.27em><space|0.27em><space|0.27em>\<gamma\><space|0.27em>=<space|0.27em>0,<eq-number>>>>>
  </eqnarray>

  and assume that <math|P> follows a Bachelier model:

  <\eqnarray*>
    <tformat|<table|<row|<cell|d*P<rsub|t>>|<cell|=>|<cell|b*d*t+\<sigma\>*d*W<rsub|t>.>>>>
  </eqnarray*>

  Such price process may take negative values in theory, but at the
  short-time horizon where high-frequency trading take place, the evolution
  of an arithmetic Brownian motion looks very similar to a geometric Brownian
  motion as in the Black-Scholes model.

  In this case, we see, similarly as in <cite|gueferleh11>, that the solution
  <math|v> <math|=> <math|<around|(|v<rsub|i>|)><rsub|i\<in\><I><rsub|m>>> to
  the dynamic programming system <reff|dynv>-<reff|termv> is reduced into the
  form:

  <\eqnarray>
    <tformat|<table|<row|<cell|v<rsub|i><around|(|t,x,y,p|)>>|<cell|=>|<cell|U*<around|(|x+y*p|)>*\<varphi\><rsub|i><around|(|t,y|)>,<eq-number><label|simpliexp>>>>>
  </eqnarray>

  where <math|\<varphi\>> <math|=> <math|<around|(|\<varphi\><rsub|i>|)><rsub|i\<in\><I><rsub|m>>>
  is solution the system of one-dimensional integro-differential equations
  (IDE):

  <\eqnarray*>
    <tformat|<table|<row|<cell|max <around*|[|-<Dt|\<varphi\><rsub|i>>+<around|(|b*\<eta\>*y-<frac|1|2>*\<sigma\><rsup|2>*<around|(|\<eta\>*y|)><rsup|2>|)>*\<varphi\><rsub|i>-<big|sum><rsub|j=1><rsup|m>r<rsub|i*j><around|(|t|)>*<around|[|\<varphi\><rsub|j><around|(|t,y|)>-\<varphi\><rsub|i><around|(|t,y|)>|]>|\<nobracket\>>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>inf<rsub|<around|(|q<rsup|b>,\<ell\><rsup|b>|)>\<in\><Qc><rsub|i><rsup|b>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|b><around|(|q<rsup|b>|)>*<around|[|exp
    <around*|(|-\<eta\>*<around*|(|<frac|i*\<delta\>|2>-\<delta\>*1<rsub|q<rsup|b>=B*b<rsub|+>>|)>*\<ell\><rsup|b>|)>*\<varphi\><rsub|i>*<around|(|t,y+\<ell\><rsup|b>|)>-\<varphi\><rsub|i><around|(|t,y|)>|]>>|<cell|>|<cell|>>|<row|<cell|<space|0.27em><space|0.27em><space|0.27em><space|0.27em><space|0.27em>-<space|0.27em>inf<rsub|<around|(|q<rsup|a>,\<ell\><rsup|a>|)>\<in\><Qc><rsub|i><rsup|a>\<times\><around|[|0,<wide|\<ell\>|\<bar\>>|]>>
    \<lambda\><rsub|i><rsup|a><around|(|q<rsup|a>|)>*<around|[|exp
    <around*|(|-\<eta\>*<around*|(|<frac|i*\<delta\>|2>-\<delta\>*1<rsub|q<rsup|a>=B*a<rsub|->>|)>*\<ell\><rsup|a>|)>*\<varphi\><rsub|i>*<around|(|t,y-\<ell\><rsup|a>|)>-\<varphi\><rsub|i><around|(|t,y|)>|]>>|<cell|>|<cell|>>|<row|<cell|<around*|\<nobracket\>|\<varphi\><rsub|i><around|(|t,y|)>-inf<rsub|e\<in\>[-<wide|e|\<bar\>>,<wide|e|\<bar\>>]><around|[|exp
    <around*|(|\<eta\><around|\||e|\|><frac|i*\<delta\>|2>+\<eta\><eps>|)>*\<varphi\><rsub|i>*<around|(|t,y+e|)>|]>|]>>|<cell|=>|<cell|0,>>>>
  </eqnarray*>

  together with the terminal condition:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<varphi\><rsub|i><around|(|T,y|)>>|<cell|=>|<cell|exp
    <around|(|\<eta\><around|\||y|\|><frac|i*\<delta\>|2>|)>.>>>>
  </eqnarray*>

  Actually, we notice that the reduced form <reff|simpliexp> holds more
  generally when <math|P> is a Lévy process, by using the property that in
  the case: <math|<Pc>U*<around|(|x+y*p|)>> <math|=>
  <math|\<psi\><around|(|y|)>*U*<around|(|x+y*p|)>> for some function
  <math|\<psi\>> depending on the characteristics of the generator
  <math|<Pc>> of the Lévy process. As in the above mean-variance criterion
  case, the reduced form <reff|simpliexp> shows that the optimal market
  making strategies are price independent, and depend only on the level of
  inventory and of the spread. However, it depends on the model (typically
  the volatility) for the stock price.

  <section|Computational results>

  <reset-counter|equation><reset-counter|Assumption><reset-counter|Theorem><reset-counter|Proposition><reset-counter|Corollary><reset-counter|Lemma><reset-counter|Definition><reset-counter|Remark>

  In this section, we provide numerical results in the case of a mean
  criterion with penalty on inventory, that we will denote within this
  section by <math|\<alpha\><rsup|\<star\>>>. We used parameters shown in
  table <reff|Parameters> together with transition probabilities
  <math|<around|(|\<rho\><rsub|i*j>|)><rsub|1\<leq\>i,j\<leq\>M>> calibrated
  in table <reff|transitionmatrix> and execution intensities calibrated in
  table <reff|execintensities>, slightly modified to make the bid and ask
  sides symmetric.

  <\big-table>
    <tabular|<tformat|<cwith|1|6|1|1|cell-lborder|1ln>|<cwith|1|6|1|1|cell-halign|l>|<cwith|1|6|1|1|cell-rborder|1ln>|<cwith|1|6|2|2|cell-halign|l>|<cwith|1|6|2|2|cell-rborder|1ln>|<cwith|1|6|3|3|cell-halign|l>|<cwith|1|6|3|3|cell-rborder|1ln>|<cwith|1|6|1|3|cell-valign|c>|<cwith|1|1|1|3|cell-tborder|1ln>|<cwith|1|1|1|3|cell-bborder|1ln>|<cwith|6|6|1|3|cell-bborder|1ln>|<table|<row|<cell|Parameter>|<cell|Signification>|<cell|Value>>|<row|<cell|<math|\<delta\>>>|<cell|Tick
    size>|<cell|0.005>>|<row|<cell|<math|\<rho\>>>|<cell|Per share
    rebate>|<cell|0.0008>>|<row|<cell|<math|\<epsilon\>>>|<cell|Per share
    fee>|<cell|0.0012>>|<row|<cell|<math|\<epsilon\><rsub|0>>>|<cell|Fixed
    fee>|<cell|<math|10<rsup|-6>>>>|<row|<cell|<math|\<lambda\><around|(|t|)>>>|<cell|Tick
    time intensity>|<cell|<math|\<equiv\>1*s<rsup|-1>>>>>>>

    <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|5|5|1|-1|cell-bborder|1ln>|<table|<row|<cell|Parameter>|<cell|Signification>|<cell|Value>>|<row|<cell|<math|U<around|(|x|)>>>|<cell|Utility
    function>|<cell|<math|x>>>|<row|<cell|<math|\<gamma\>>>|<cell|Inventory
    penalization>|<cell|5>>|<row|<cell|<math|<wide|\<ell\>|\<bar\>>>>|<cell|Max.
    volume make>|<cell|100>>|<row|<cell|<math|<wide|e|\<bar\>>>>|<cell|Max.
    volume take>|<cell|100>>>>>

    <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|6|6|1|-1|cell-bborder|1ln>|<table|<row|<cell|Parameter>|<cell|Signification>|<cell|Value>>|<row|<cell|<math|T>>|<cell|Length
    in seconds>|<cell|300 s>>|<row|<cell|<math|y<rsub|m*i*n>>>|<cell|Lower
    bound shares>|<cell|-1000>>|<row|<cell|<math|y<rsub|m*a*x>>>|<cell|Upper
    bound shares>|<cell|1000>>|<row|<cell|<math|n>>|<cell|Number of time
    steps>|<cell|100>>|<row|<cell|<math|m>>|<cell|Number of
    spreads>|<cell|6>>>>>

    <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|7|7|1|-1|cell-bborder|1ln>|<table|<row|<cell|Parameter>|<cell|Signification>|<cell|Value>>|<row|<cell|<math|N<rsup|M*C>>>|<cell|Number
    of paths for MC simul.>|<cell|<math|10<rsup|5>>>>|<row|<cell|<math|\<Delta\>*t>>|<cell|Euler
    scheme time step>|<cell|0.3 s>>|<row|<cell|<math|<wide|\<ell\>|\<bar\>><rsub|0>>>|<cell|B/A
    qty for bench. strat.>|<cell|100>>|<row|<cell|<math|x<rsub|0>>>|<cell|Initial
    cash>|<cell|0>>|<row|<cell|<math|y<rsub|0>>>|<cell|Initial
    shares>|<cell|0>>|<row|<cell|<math|p<rsub|0>>>|<cell|Initial
    price>|<cell|45>>>>>

    <\with|font-size|0.71>
      <label|Parameters>
    </with>
  <|big-table>
    Parameters
  </big-table>

  <no-indent><with|font-series|bold|font-shape|italic|Shape of the optimal
  policy.> The reduced form <reff|simpli> shows that the optimal policy
  <math|\<alpha\><rsup|\<star\>>> does only depend on time <math|t>,
  inventory <math|y> and spread level <math|s>. One can represent
  <math|\<alpha\><rsup|\<star\>>> as a mapping
  <math|\<alpha\><rsup|\<star\>>:\<bbb-R\><rsup|+>\<times\>\<bbb-R\>\<times\>\<bbb-S\>\<rightarrow\>\<cal-A\>>
  with <math|\<alpha\><rsup|\<star\>>=<around|(|\<alpha\><rsup|\<star\>,m*a*k*e>,\<alpha\><rsup|\<star\>,t*a*k*e>|)>>
  thus it divides the space <math|\<bbb-R\><rsup|+>\<times\>\<bbb-R\>\<times\>\<bbb-S\>>
  in two zones <math|<with|math-font|cal|M>> and
  <math|<with|math-font|cal|T>> so that <math|\<alpha\><rsup|\<star\>><rsub|\<mid\><with|math-font|cal|M>>=<around|(|\<alpha\><rsup|\<star\>,m*a*k*e>,0|)>>
  and <math|\<alpha\><rsup|\<star\>><rsub|\<mid\><with|math-font|cal|T>>=<around|(|0,\<alpha\><rsup|\<star\>,t*a*k*e>|)>>.
  Therefore we plot the optimal policy in one plane, distinguishing the two
  zones by a color scale. For the zone <math|<with|math-font|cal|M>>, due to
  the complex nature of the control, which is made of four scalars, we only
  represent the prices regimes.

  <big-figure|<with|par-mode|center|<subfloat*|near date
  <math|0>|<image|preprintstylizedshapepolicyYS.pdf|0.5tex-text-width|||> >
  <subfloat*|near date <math|T>|<image|preprintstylizedShapePolicyYSMaturity.pdf|0.5tex-text-width|||>
  ><label|stylizedShapePolicyYS>>|Stylized shape of the optimal policy sliced
  in YS.>

  Moreover, when using constant tick time intensity
  <math|\<lambda\><around|(|t|)>\<equiv\>\<lambda\>> and in the case where
  <math|T\<gg\><frac|1|\<lambda\>>> we can observe on numerical results that
  the optimal policy is mainly time invariant near date <math|0>; on the
  contrary, close to the terminal date <math|T> the optimal policy has a
  transitory regime, in the sense that it critically depends on the time
  variable <math|t>. This matches the intuition that to ensure the terminal
  constraint <math|Y<rsub|T>=0>, the optimal policy tends to get rid of the
  inventory more aggressively when close to maturity. In figure
  <reference|stylizedShapePolicyYS>, we plotted a stylized view of the
  optimal policy, in the plane <math|<around|(|y,s|)>>, to illustrate this
  phenomenon.

  <vspace|2mm><no-indent><with|font-series|bold|font-shape|italic|Benchmarked
  empirical performance analysis.> We made a backtest of the optimal strategy
  <math|\<alpha\><rsup|\<star\>>>, on simulated data, and benchmarked the
  results with the three following strategies: <vspace|1mm>

  <math|\<bullet\>> Optimal strategy without market orders (WoMO), that we
  denote by <math|\<alpha\><rsup|w>>: this strategy is computed using the
  same IDEs, but in the case where the investor is not allowed to use market
  orders, which is equivalent to setting <math|<wide|e|\<bar\>>=0>.

  <vspace|1mm><math|\<bullet\>> Constant strategy, that we denote by
  <math|\<alpha\><rsup|c>>: this strategy is the symmetric best bid, best ask
  strategy with constant quantity <math|<wide|\<ell\>|\<bar\>><rsub|0>> on
  both sides, or more precisely <math|\<alpha\><rsup|c>\<assign\><around|(|\<alpha\><rsup|c,m*a*k*e>,0|)>>
  with <math|\<alpha\><rsub|t><rsup|c,m*a*k*e>\<equiv\><around|(|B*b,B*a,<wide|\<ell\>|\<bar\>><rsub|0>,<wide|\<ell\>|\<bar\>><rsub|0>|)>>.

  <vspace|1mm><math|\<bullet\>> Random strategy, that we denote by
  <math|\<alpha\><rsup|r>>: this strategy consists in choosing randomly the
  price of the limit orders and using constant quantities on both sides, or
  more precisely <math|\<alpha\><rsup|r>\<assign\><around|(|\<alpha\><rsup|r,m*a*k*e>,0|)>>
  with <math|\<alpha\><rsub|t><rsup|r,m*a*k*e>=<around|(|\<varsigma\><rsub|t><rsup|b>,\<varsigma\><rsub|t><rsup|a>,<wide|\<ell\>|\<bar\>><rsub|0>,<wide|\<ell\>|\<bar\>><rsub|0>|)>>
  where <math|<around|(|\<varsigma\><rsub|.><rsup|b>,\<varsigma\><rsub|.><rsup|a>|)>>
  is s.t. <math|\<forall\>t\<in\><around|[|0;T|]>> ,
  <math|<Pb><around|(|\<varsigma\><rsub|t><rsup|b>=B*b|)>=<Pb><around|(|\<varsigma\><rsub|t><rsup|b>=B*b<rsub|+>|)>=<Pb><around|(|\<varsigma\><rsub|t><rsup|a>=B*a|)>=<Pb><around|(|\<varsigma\><rsub|t><rsup|a>=B*a<rsub|->|)>=<frac|1|2>>.

  <vspace|1mm>Our backtest procedure is described as follows. For each
  strategy <math|\<alpha\>\<in\><around|{|\<alpha\><rsup|\<star\>>,\<alpha\><rsup|w>,\<alpha\><rsup|c>,\<alpha\><rsup|r>|}>>,
  we simulated <math|N<rsup|M*C>> paths of the tuple
  <math|<around|(|X<rsup|\<alpha\>>,Y<rsup|\<alpha\>>,P,S,N<rsup|a,\<alpha\>>,N<rsup|b,\<alpha\>>|)>>
  on <math|<around|[|0,T|]>>, according to eq.
  <reff|dynS>-<reff|dynY>-<reff|dynX>-<reff|sautY>-<reff|sautX>, using a
  standard Euler scheme with time-step <math|\<Delta\>*t>. Therefore we can
  compute the empirical mean (resp. empirical standard deviation), that we
  denote by <math|m<around|(|.|)>> (resp. <math|\<sigma\><around|(|.|)>>),
  for several quantities shown in table <reff|perfsynthesis>.

  <\big-table>
    <\with|font-size|0.71>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|l>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|l>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|4|4|1|-1|cell-bborder|1ln>|<cwith|6|6|1|-1|cell-bborder|1ln>|<cwith|8|8|1|-1|cell-bborder|1ln>|<cwith|10|10|1|-1|cell-bborder|1ln>|<cwith|12|12|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|>|<cell|optimal
      <math|\<alpha\><rsup|\<star\>>>>|<cell|WoMO
      <math|\<alpha\><rsup|w>>>|<cell|constant
      <math|\<alpha\><rsup|c>>>|<cell|random
      <math|\<alpha\><rsup|r>>>>|<row|<cell|Terminal
      wealth>|<cell|<math|m<around|(|X<rsub|T>|)>/\<sigma\><around|(|X<rsub|T>|)>>>|<cell|2.117>|<cell|1.999>|<cell|0.472>|<cell|0.376>>|<row|<cell|>|<cell|<math|m<around|(|X<rsub|T>|)>>>|<cell|26.759>|<cell|25.19>|<cell|24.314>|<cell|24.022>>|<row|<cell|>|<cell|<math|\<sigma\><around|(|X<rsub|T>|)>>>|<cell|12.634>|<cell|12.599>|<cell|51.482>|<cell|63.849>>|<row|<cell|Num.
      of exec. at bid>|<cell|<math|m<around|(|N<rsup|b><rsub|T>|)>>>|<cell|18.770>|<cell|18.766>|<cell|13.758>|<cell|21.545>>|<row|<cell|>|<cell|<math|\<sigma\><around|(|N<rsup|b><rsub|T>|)>>>|<cell|3.660>|<cell|3.581>|<cell|3.682>|<cell|4.591>>|<row|<cell|Num.
      of exec. at ask>|<cell|<math|m<around|(|N<rsup|a><rsub|T>|)>>>|<cell|18.770>|<cell|18.769>|<cell|13.76>|<cell|21.543>>|<row|<cell|>|<cell|<math|\<sigma\><around|(|N<rsup|a><rsub|T>|)>>>|<cell|3.666>|<cell|3.573>|<cell|3.692>|<cell|4.602>>|<row|<cell|Num.
      of exec. at market>|<cell|<math|m<around|(|N<rsup|m*a*r*k*e*t><rsub|T>|)>>>|<cell|6.336>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|>|<cell|<math|\<sigma\><around|(|N<rsup|m*a*r*k*e*t><rsub|T>|)>>>|<cell|2.457>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|Maximum
      Inventory>|<cell|<math|m<around|(|sup<rsub|s\<in\><around|[|0;T|]>><around|\||Y<rsub|s>|\|>|)>>>|<cell|241.019>|<cell|176.204>|<cell|607.913>|<cell|772.361>>|<row|<cell|>|<cell|<math|\<sigma\><around|(|sup<rsub|s\<in\><around|[|0;T|]>><around|\||Y<rsub|s>|\|>|)>>>|<cell|53.452>|<cell|23.675>|<cell|272.631>|<cell|337.403>>>>>

      <label|perfsynthesis>
    </with>
  </big-table|Performance analysis: synthesis of benchmarked backtest
  (<math|10<rsup|5>> simulations).>

  Optimal strategy <math|\<alpha\><rsup|\<star\>>> demonstrates significant
  improvement of the information ratio <math|<math-up|IR><around|(|X<rsub|T>|)>\<assign\>m<around|(|X<rsub|T>|)>/\<sigma\><around|(|X<rsub|T>|)>>
  compared to the benchmark, which is confirmed by the plot of the whole
  empirical distribution of <math|X<rsub|T>> (see figure <reff|empdistrib>).

  <big-figure|<with|par-mode|center|<image|u1306766176239.pdf|0.5tex-text-width|||><label|empdistrib>>|Empirical
  distribution of terminal wealth <math|X<rsub|T>> (spline interpolation).>

  Even if absolute values of <math|m<around|(|X<rsub|T>|)>> are not
  representative of what would be the real-world performance of such
  strategies, these results prove that the different layers of optimization
  are relevant. Indeed, one can compute the ratios
  <math|<around*|[|m<around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>-m<around|(|X<rsub|T><rsup|\<alpha\><rsup|c>>|)>|]>/\<sigma\><around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>=0.194>
  and <math|<around*|[|m<around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>-m<around|(|X<rsub|T><rsup|\<alpha\><rsup|w>>|)>|]>/\<sigma\><around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>=0.124>
  that can be interpreted as the performance gain, measured in number of
  standard deviations, of the optimal strategy
  <math|\<alpha\><rsup|\<star\>>> compared respectively to the constant
  strategy <math|\<alpha\><rsup|c>> and the WoMO strategy
  <math|\<alpha\><rsup|w>>. Another interesting statistics is the surplus
  profit per trade <math|<around*|[|m<around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>-m<around|(|X<rsub|T><rsup|\<alpha\><rsup|c>>|)>|]>/<around*|[|m<around|(|N<rsup|b,\<alpha\><rsup|\<star\>>><rsub|T>|)>+m<around|(|N<rsup|a,\<alpha\><rsup|\<star\>>><rsub|T>|)>+m<around|(|N<rsup|m*a*r*k*e*t,\<alpha\><rsup|\<star\>>><rsub|T>|)>|]>=0.056>
  euros per trade, recalling that the maximum volume we trade is
  <math|<wide|\<ell\>|\<bar\>>=<wide|e|\<bar\>>=100>. Note that for this last
  statistics, the profitable effects of the per share rebates <math|\<rho\>>
  are partially neutralized because the number of executions is comparable
  between <math|\<alpha\><rsup|\<star\>>> and <math|\<alpha\><rsup|c>>;
  therefore the surplus profit per trade is mainly due to the revenue
  obtained from <with|font-shape|italic|making the spread>. To give a
  comparison point, typical clearing fee per execution is <math|0.03> euros
  on multilateral trading facilities, therefore, in this backtest, the
  surplus profit per trade was roughly twice the clearing fees.

  We observe in the synthesis table that the number of executions at bid and
  ask are symmetric, which is also confirmed by the plots of their empirical
  distributions in figure <reff|empdisnumexec>. This is due to the symmetry
  in the execution intensities <math|\<lambda\><rsup|b>> and
  <math|\<lambda\><rsup|a>>, which is reflected by the symmetry around
  <math|y=0> in the optimal policy.

  <big-figure|<with|par-mode|center|<label|empdisnumexec>TODO: fix figure
  link>|Empirical distribution of the number of executions on both sides.>

  Moreover, notice that the maximum absolute inventory is efficiently kept
  close to zero in <math|\<alpha\><rsup|\<star\>>> and
  <math|\<alpha\><rsup|w>>, whereas in <math|\<alpha\><rsup|c>> and
  <math|\<alpha\><rsup|r>> it can reach much higher values. The maximum
  absolute inventory is higher in the case of <math|\<alpha\><rsup|\<star\>>>
  than in the case <math|\<alpha\><rsup|w>> due to the fact that
  <math|\<alpha\><rsup|\<star\>>> can unwind any position immediately by
  using market orders, and therefore one may post higher volume for limit
  orders between two trading at market, profiting from reduced execution
  risk.

  <vspace|2mm><no-indent><with|font-series|bold|font-shape|italic|Efficient
  frontier.> An important feature of our algorithm is that the market maker
  can choose the inventory penalization parameter <math|\<gamma\>>. To
  illustrate its influence, we varied the inventory penalization
  <math|\<gamma\>> from <math|50> to <math|6.10<rsup|-2>>, and then build the
  efficient frontier for both the optimal strategy
  <math|\<alpha\><rsup|\<star\>>> and for the WoMO strategy
  <math|\<alpha\><rsup|w>>. Numerical results are provided in table
  <reff|efficientfrontier> and a plot of this data is in figure
  <reff|efffront>.

  <\big-table>
    <\with|font-size|0.71>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|l>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|7|7|cell-halign|c>|<cwith|1|-1|7|7|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|15|15|1|-1|cell-bborder|1ln>|<table|<row|<cell|<math|\<gamma\>>>|<cell|<math|<with|math-display|true|\<sigma\><around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>>>>|<cell|<math|<with|math-display|true|m<around|(|X<rsub|T><rsup|\<alpha\><rsup|\<star\>>>|)>>>>|<cell|<math|<with|math-display|true|\<sigma\><around|(|X<rsub|T><rsup|\<alpha\><rsup|w>>|)>>>>|<cell|<math|<with|math-display|true|\<sigma\><around|(|X<rsub|T><rsup|\<alpha\><rsup|w>>|)>>>>|<cell|<math|<math-up|IR><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>>>|<cell|<math|<math-up|NIR><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>>>>|<row|<cell|50.000>|<cell|5.283>|<cell|12.448>|<cell|4.064>|<cell|9.165>|<cell|2.356>|<cell|-2.246>>|<row|<cell|25.000>|<cell|7.562>|<cell|18.421>|<cell|7.210>|<cell|16.466>|<cell|2.436>|<cell|-0.779>>|<row|<cell|12.500>|<cell|9.812>|<cell|22.984>|<cell|9.531>|<cell|20.971>|<cell|2.343>|<cell|-0.135>>|<row|<cell|6.250>|<cell|11.852>|<cell|25.932>|<cell|11.749>|<cell|24.232>|<cell|2.188>|<cell|0.136>>|<row|<cell|3.125>|<cell|14.546>|<cell|28.153>|<cell|14.485>|<cell|26.752>|<cell|1.935>|<cell|0.263>>|<row|<cell|1.563>|<cell|15.819>|<cell|28.901>|<cell|16.830>|<cell|28.234>|<cell|1.827>|<cell|0.289>>|<row|<cell|0.781>|<cell|19.088>|<cell|29.952>|<cell|19.593>|<cell|29.145>|<cell|1.569>|<cell|0.295>>|<row|<cell|0.391>|<cell|20.898>|<cell|30.372>|<cell|20.927>|<cell|29.728>|<cell|1.453>|<cell|0.289>>|<row|<cell|0.195>|<cell|23.342>|<cell|30.811>|<cell|23.247>|<cell|30.076>|<cell|1.320>|<cell|0.278>>|<row|<cell|0.098>|<cell|25.232>|<cell|30.901>|<cell|24.075>|<cell|30.236>|<cell|1.225>|<cell|0.261>>|<row|<cell|0.049>|<cell|26.495>|<cell|31.020>|<cell|24.668>|<cell|30.434>|<cell|1.171>|<cell|0.253>>|<row|<cell|0.024>|<cell|27.124>|<cell|30.901>|<cell|25.060>|<cell|30.393>|<cell|1.139>|<cell|0.242>>|<row|<cell|0.012>|<cell|27.697>|<cell|31.053>|<cell|25.246>|<cell|30.498>|<cell|1.121>|<cell|0.243>>|<row|<cell|0.006>|<cell|28.065>|<cell|30.998>|<cell|25.457>|<cell|30.434>|<cell|1.105>|<cell|0.238>>>>>

      <label|efficientfrontier>
    </with>
  </big-table|Efficient frontier data>

  We display both the \Pgross" information ratio
  <math|<math-up|IR><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>\<assign\>m<around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>/\<sigma\><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>>
  and the \Pnet" information ratio <math|<math-up|NIR><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>\<assign\><around*|(|m<around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>-m<around|(|X<rsup|\<alpha\><rsup|c>><rsub|T>|)>|)>/\<sigma\><around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>>
  to have more precise interpretation of the results. Indeed,
  <math|m<around|(|X<rsup|\<alpha\>><rsub|T>|)>> seems largely overestimated
  in this simulated data backtest compared to what would be real-world
  performance, for all <math|\<alpha\>\<in\><around|{|\<alpha\><rsup|\<star\>>,\<alpha\><rsup|w>,\<alpha\><rsup|c>,\<alpha\><rsup|r>|}>>.
  Then, to ease interpretation, we assume that <math|\<alpha\><rsup|c>> has
  zero mean performance in real-world conditions, and therefore offset the
  mean performance <math|m<around|(|X<rsup|\<alpha\><rsup|\<star\>>><rsub|T>|)>>
  by the constant <math|-m<around|(|X<rsup|\<alpha\><rsup|c>><rsub|T>|)>>
  when computing the NIR. This has simple visual interpretation as shown in
  figure <reff|efffront>.

  <big-figure|<with|par-mode|center|<image|efficientfrontier.pdf|0.7tex-text-width|||><label|efffront>>|Efficient
  frontier plot>

  Observe that highest (net) information ratio is reached for
  <math|\<gamma\>\<simeq\>0.8> for this set of parameters. At this point
  <math|\<gamma\>\<simeq\>0.8>, the annualized value of the NIR (obtained by
  simple extrapolation) is <math|47>, but this simulated data backtest must
  be completed by a backtest on real data. Qualitatively speaking, the effect
  of increasing the inventory penalization parameter <math|\<gamma\>> is to
  increase the zone <math|<with|math-font|cal|T>> where we trade at market.
  This induces smaller inventory risk, due to the fact that we unwind our
  position when reaching relatively small values for <math|<around|\||y|\|>>.
  This feature can be used to enforce a soft maximum inventory This feature
  can be used to enforce a soft maximum inventory constraint directly by
  choosing <math|\<gamma\>>.

  <\with|font-size|0.84>
    <\thebibliography|>
      <bibitem|avesto08>Avellaneda M. and S. Stoikov (2008): \PHigh frequency
      trading in a limit order book", <with|font-shape|italic|Quantitative
      Finance>, 8(3), 217-224.

      <bibitem|baylud11>Bayraktar E. and M. Ludkovski (2011): \PLiquidation
      in limit order books with controlled intensity", available at:
      arXiv:1105.0247

      <bibitem|carjam11>Cartea A. and S. Jaimungal (2011): \PModeling Asset
      Prices for Algorithmic and High Frequency Trading", preprint University
      of Toronto.

      <bibitem|constotal10>Cont R., Stoikov S. and R. Talreja (2010): \PA
      stochastic model for order book dynamics",
      <with|font-shape|italic|Operations research>, 58, 549-563.

      <bibitem|fregrabau08>Frey S. and Grammig (2008): \PLiquidity supply and
      adverse selection in a pure limit order book market"
      <with|font-shape|italic|High Frequency Financial Econometrics,
      Physica-Verlag HD>, 83-109, J. Bauwens L., Pohlmeier W. and D. Veredas
      (Eds.)

      <bibitem|LOBsurvey>Gould M.D., Porter M.A, Williams S., McDonald M.,
      Fenn D.J. and S.D. Howison (2010): \PThe limit order book: a survey",
      preprint.

      <bibitem|gri10>Grillet-Aubert L. (2010): \PNégociation d'actions: une
      revue de la littérature à l'usage des régulateurs de marché",
      <with|font-shape|italic|AMF>, available at:
      <hlink|http://www.amf-france.org/documents/general/9530_1.pdf|http://www.amf-france.org/documents/general/9530$\\_$1.pdf>.

      <bibitem|gueferleh11>Guéant O., Fernandez Tapia J. and C.-A. Lehalle
      (2011): \PDealing with inventory risk", preprint.

      <bibitem|henjonmen10>Hendershott T., Jones C.M. and A.J. Menkveld
      (2010): \PDoes algorithmic trading improve liquidity?",
      <with|font-shape|italic|Journal of Finance>, to appear.

      <bibitem|kuhstr10>Kühn C. and M. Stroh (2010): "Optimal portfolios of a
      small investor in a limit order market: a shadow price approach",
      <with|font-shape|italic|Mathematics and Financial Economics>, 3(2),
      45-72.

      <bibitem|men10>A.J. Menkveld (2011): "High frequency trading and the
      new-market makers", preprint.

      <bibitem|stosag09>Stoikov S. and M. Saglam (2009): \POption market
      making under inventory risk", <with|font-shape|italic|Review of
      Derivatives Research>, 12(1), 55-79.

      <bibitem|ver11>Veraart L.A.M. (2011): "Optimal Investment in the
      Foreign Exchange Market with Proportional Transaction Costs",
      <with|font-shape|italic|Quantitative Finance>, 11(4): 631-640. 2011.
    </thebibliography>
  </with>
</body>

<\initial>
  <\collection>
    <associate|page-type|letter>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Parameters|<tuple|4|13>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1|9>>
    <associate|auto-11|<tuple|1.3.2|9>>
    <associate|auto-12|<tuple|3|9>>
    <associate|auto-13|<tuple|2|10>>
    <associate|auto-14|<tuple|2|11>>
    <associate|auto-15|<tuple|2.1|13>>
    <associate|auto-16|<tuple|2.2|13>>
    <associate|auto-17|<tuple|2.3|13>>
    <associate|auto-18|<tuple|3|14>>
    <associate|auto-19|<tuple|4|14>>
    <associate|auto-2|<tuple|1.1|3>>
    <associate|auto-20|<tuple|3|15>>
    <associate|auto-21|<tuple|5|15>>
    <associate|auto-22|<tuple|4|15>>
    <associate|auto-23|<tuple|5|16>>
    <associate|auto-24|<tuple|6|?>>
    <associate|auto-25|<tuple|6|?>>
    <associate|auto-26|<tuple|6|?>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.2.1|3>>
    <associate|auto-5|<tuple|1.2.2|5>>
    <associate|auto-6|<tuple|1.3|6>>
    <associate|auto-7|<tuple|1.3.1|6>>
    <associate|auto-8|<tuple|1|7>>
    <associate|auto-9|<tuple|2|8>>
    <associate|bib-LOBsurvey|<tuple|LOBsurvey|16>>
    <associate|bib-avesto08|<tuple|avesto08|16>>
    <associate|bib-baylud11|<tuple|baylud11|16>>
    <associate|bib-carjam11|<tuple|carjam11|16>>
    <associate|bib-constotal10|<tuple|constotal10|16>>
    <associate|bib-fregrabau08|<tuple|fregrabau08|16>>
    <associate|bib-gri10|<tuple|gri10|16>>
    <associate|bib-gueferleh11|<tuple|gueferleh11|16>>
    <associate|bib-henjonmen10|<tuple|henjonmen10|16>>
    <associate|bib-kuhstr10|<tuple|kuhstr10|16>>
    <associate|bib-men10|<tuple|men10|16>>
    <associate|bib-stosag09|<tuple|stosag09|16>>
    <associate|bib-ver11|<tuple|ver11|16>>
    <associate|casemar|<tuple|31|11>>
    <associate|clockintensity|<tuple|2|6>>
    <associate|clockintensityplot|<tuple|1|7>>
    <associate|consistentestimatorask|<tuple|23|7>>
    <associate|consistentestimatorbid|<tuple|22|7>>
    <associate|criterion|<tuple|23|9>>
    <associate|criterion2|<tuple|26|9>>
    <associate|defLc|<tuple|28|10>>
    <associate|defvalue|<tuple|27|10>>
    <associate|dynS|<tuple|3|3>>
    <associate|dynX|<tuple|10|4>>
    <associate|dynY|<tuple|10|4>>
    <associate|dynv|<tuple|29|10>>
    <associate|efffront|<tuple|6|15>>
    <associate|efficientfrontier|<tuple|6|15>>
    <associate|empdisnumexec|<tuple|5|15>>
    <associate|empdistrib|<tuple|4|14>>
    <associate|estimlambda|<tuple|17|6>>
    <associate|estimproxy|<tuple|24|8>>
    <associate|estimrho|<tuple|16|6>>
    <associate|execintensities|<tuple|3|8>>
    <associate|execintensitiesplot|<tuple|2|9>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-2|<tuple|2|2>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-2|<tuple|2|2>>
    <associate|intensNb|<tuple|22|7>>
    <associate|perfsynthesis|<tuple|5|14>>
    <associate|sautX|<tuple|11|5>>
    <associate|sautY|<tuple|11|5>>
    <associate|simpli|<tuple|32|11>>
    <associate|simpliexp|<tuple|34|12>>
    <associate|stylizedShapePolicyYS|<tuple|3|13>>
    <associate|termv|<tuple|30|10>>
    <associate|transitionmatrix|<tuple|1|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      constotal10

      estimrho

      stosag09

      baylud11

      avesto08

      gueferleh11
    </associate>
    <\associate|figure>
      <tuple|normal|Plot of tick time clock intensity estimate for the stock
      SOGN.PA on April 18, 2011 expressed in
      second<rsup|<with|mode|<quote|math>|-1>> (affine interpolation).
      |<pageref|auto-10>>

      <tuple|normal|Plot of execution intensities estimate as a function of
      the spread for the stock SOGN.PA on the 18/04/2011, expressed in
      <with|mode|<quote|math>|s<rsup|-1>> (affine
      interpolation).|<pageref|auto-13>>

      <tuple|normal|Stylized shape of the optimal policy sliced in
      YS.|<pageref|auto-20>>

      <tuple|normal|Empirical distribution of terminal wealth
      <with|mode|<quote|math>|X<rsub|T>> (spline
      interpolation).|<pageref|auto-22>>

      <tuple|normal|Empirical distribution of the number of executions on
      both sides.|<pageref|auto-23>>

      <tuple|normal|Efficient frontier plot|<pageref|auto-25>>
    </associate>
    <\associate|table>
      <tuple|normal|Estimation of the transition matrix
      <with|mode|<quote|math>|<around|(|\<rho\><rsub|i*j>|)>> for the
      underlying spread of the stock SOGN.PA on April 18, 2011.
      |<pageref|auto-8>>

      <tuple|normal|Estimation of the tick time clock (hourly basis) for the
      stock SOGN.PA on April 18, 2011. Tick time clock intensity
      <with|mode|<quote|math>|\<lambda\><around|(|t|)>> is expressed in
      second<rsup|<with|mode|<quote|math>|-1>>.|<pageref|auto-9>>

      <tuple|normal|Estimate of execution intensities
      <with|mode|<quote|math>|<wide|\<lambda\>|~><rsub|i><rsup|a><around|(|q<rsup|a>|)>>
      and <with|mode|<quote|math>|<wide|\<lambda\>|~><rsub|i><rsup|b><around|(|q<rsup|b>|)>>,
      expressed in <with|mode|<quote|math>|s<rsup|-1>> for SOGN.PA on April
      18, 2011, between 9:30 and 16:30 Paris local time. Each row corresponds
      to a spread value as a multiple of <with|mode|<quote|math>|\<delta\>=0.005>.
      Each column corresponds to a limit order quote.|<pageref|auto-12>>

      <\tuple|normal>
        Parameters
      </tuple|<pageref|auto-19>>

      <tuple|normal|Performance analysis: synthesis of benchmarked backtest
      (<with|mode|<quote|math>|10<rsup|5>> simulations).|<pageref|auto-21>>

      <tuple|normal|Efficient frontier data|<pageref|auto-24>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>A
      market-making model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Mid price and spread process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Trading strategies in the
      limit order book <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Limit Order Strategies
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc><vspace|2mm><with|font-shape|<quote|italic>|Market
      order strategies.> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Parameters estimation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.3.1<space|2spc>Estimation of spread
      parameters <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.3.2<space|2spc><with|font-series|<quote|bold>|font-shape|<quote|italic>|Estimation
      of execution parameters: make or take.>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Optimal
      limit/market order strategies> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Control problem formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Dynamic programming equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Two special cases
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Computational
      results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
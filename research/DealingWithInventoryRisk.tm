<TeXmacs|1.99.2>

<style|<tuple|article|std-latex>>

<\body>
  <\hide-preamble>
    <new-theorem|Theorem|Theorem>

    <new-theorem|Proposition|Proposition>

    <new-theorem|Lemma|Lemma>
  </hide-preamble>

  <doc-data|<doc-title|Dealing with the Inventory Risk>|<doc-subtitle|A
  solution to the market making problem>|<doc-date|This draft: July
  2012>|<doc-author|<author-data|<author-name|Olivier
  Guéant>|<author-email|olivier.gueant@ann.jussieu.fr>|<author-affiliation|Université
  Paris-Diderot, UFR de Mathématiques, Laboratoire Jacques-Louis Lions. 175,
  rue du Chevaleret, 75013 Paris, France.>>>|<doc-author|<author-data|<author-name|Charles-Albert
  Lehalle>>>|<doc-author|<author-data|<author-name|Joaquin
  Fernandez-Tapia>|<author-affiliation|Université Pierre et Marie Curie,
  LPMA. 4 place Jussieu, 75005 Paris, France.>>>|<doc-author|<author-data|<author-name|Charles-Albert
  Lehalle>|<author-email|clehalle@cheuvreux.com>|<author-affiliation|Head of
  Quantitative Research, Crédit Agricole Cheuvreux. 9, Quai du Président Paul
  Doumer, 92400 Courbevoie, France.>>>|<doc-note|This research has been
  conducted within the Research Initiative ``Microstructure des Marchés
  Financiers'' under the aegis of the Europlace Institute of Finance.>>

  <abstract-data|<abstract-keywords|Stochastic optimal control|High-frequency
  Market Making|Avellaneda-Stoikov problem>|<\abstract>
    Market makers continuously set bid and ask quotes for the stocks they
    have under consideration. Hence they face a complex optimization problem
    in which their return, based on the bid-ask spread they quote and the
    frequency at which they indeed provide liquidity, is challenged by the
    price risk they bear due to their inventory. In this paper, we consider a
    stochastic control problem similar to the one introduced by Ho and Stoll
    <cite|ho1981optimal> and formalized mathematically by Avellaneda and
    Stoikov <cite|avellaneda2008high>. The market is modeled using a
    reference price <math|S<rsub|t>> following a Brownian motion with
    standard deviation <math|\<sigma\>>, arrival rates of buy or sell
    liquidity-consuming orders depend on the distance to the reference price
    <math|S<rsub|t>> and a market maker maximizes the expected utility of its
    P&L over a finite time horizon. We show that the Hamilton-Jacobi-Bellman
    equations associated to the stochastic optimal control problem can be
    transformed into a system of linear ordinary differential equations and
    we solve the market making problem under inventory constraints. We also
    shed light on the asymptotic behavior of the optimal quotes and propose
    closed-form approximations based on a spectral characterization of the
    optimal quotes.<next-line>
  </abstract>>

  <section|Introduction>

  From a quantitative viewpoint, market microstructure is a sequence of
  auction games between market participants. It implements the balance
  between supply and demand, forming an equilibrium traded price to be used
  as reference for valuation. The rule of each auction game (fixing auction,
  continuous auction, ...) is fixed by the firm operating each trading venue.
  Nevertheless, most of all trading mechanisms on electronic markets rely on
  market participants sending orders to a \Pqueuing system\Q where their open
  interests are consolidated as \Pliquidity provision\Q or form transactions
  <cite|amihud1980deallership>. The efficiency of such a process relies on an
  adequate timing between buyers and sellers, to avoid too many
  non-informative oscillations of the transaction price (for more details and
  modeling, see for example <cite|citeulike:7621540>).<next-line>

  In practice, it is possible to provide liquidity to an impatient buyer
  (respectively seller) and maintain an inventory until the arrival of the
  next impatient seller (respectively buyer). Market participants focused on
  this kind of liquidity-providing activity are called \Pmarket makers\Q. On
  one hand they are buying at the bid price and selling at the ask price they
  choose, making money out of this \Pbid-ask spread\Q. On the other hand,
  their inventory is exposed to price fluctuations mainly driven by the
  volatility of the market (see <cite|amihud1986asset|benston1974determinants|cohen1981transaction|garman1976market|ho1984dealer|o1986microeconomics>).<next-line>

  The recent evolution of both technology and market regulation reshaped the
  nature of the interactions between market participants during continuous
  electronic auctions, one consequence being the emergence of
  \Phigh-frequency market makers\Q who are said to be part of 70% of the
  electronic trades in the US (40% in the EU and 35% in Japan) and have a
  massively passive (<em|i.e.> liquidity-providing) behavior \U a typical
  balance between passive and aggressive orders for such market participants
  being around 80% of passive interactions (see
  <cite|citeulike:8423311>).<next-line>

  From a mathematical modeling point of view, the market making problem
  corresponds to the choice of optimal quotes (<em|i.e.> the bid and ask
  prices) that such agents provide to other market participants, taking into
  account their inventory limits and their risk constraints often represented
  by a utility function (see <cite|cohen1979market|hendershott2009price|ho1983dynamics|madhavan1993analysis|mildenstein1983optimal|roll1984simple>).<next-line>

  Avellaneda and Stoikov proposed, in a widely cited paper
  <cite|avellaneda2008high>, an innovative framework for \Pmarket making in
  an order book\Q. In their approach, rooted to an old paper by Ho and Stoll
  <cite|ho1981optimal>, the market is modeled using a reference price or
  <em|fair price> <math|S<rsub|t>> following a Brownian motion with standard
  deviation <math|\<sigma\>>, and the arrival of a buy or sell
  liquidity-consuming order at a distance <math|\<delta\>> from the reference
  price <math|S<rsub|t>> is described by a point process with intensity
  <math|A*exp (-k*\<delta\>)>, <math|A> and <math|k> being two positive
  constants which characterize statistically the liquidity of the
  stock.<next-line>

  We consider the same model as in <cite|avellaneda2008high> \U adding
  inventory limits \U and we show, using a new change of variables, that the
  Hamilton-Jacobi-Bellman equations associated to the problem boil down to a
  system of linear ordinary differential equations. This new change of
  variables (i) simplifies the computation of a solution since numerical
  approximation of partial differential equations is now unnecessary, and
  (ii) allows to study the asymptotic behavior of the optimal quotes. In
  addition to these two contributions, we use results from spectral analysis
  to provide an approximation of the optimal quotes in closed-form. Finally,
  we provide in the case of our model with inventory limits a verification
  theorem that was absent from the original paper (the admissibility of the
  quotes obtained in the original Avellaneda-Stoikov model appears in fact to
  be an open problem!).<next-line>

  Since Avellaneda and Stoikov seminal paper, other authors have considered
  related market making models. Cartea, Jaimungal and Ricci
  <cite|cartea2011buy> consider a more sophisticated model inspired from the
  Avellaneda-Stoikov one<footnote|The objective function is different.>,
  including richer dynamics of market orders, impact on the limit order book,
  adverse selection effects and predictable <math|\<alpha\>>. They obtained
  closed-form approximations of the optimal quotes using a first-order Taylor
  expansion. Cartea and Jaimungal <cite|cartea2012risk> recently used a
  similar model to introduce risk measures for high-frequency trading.
  Earlier, they used a model inspired from Avellaneda-Stoikov
  <cite|cartea2010modeling> in which the mid-price is modeled by a Hidden
  Markov Model. Guilbaud and Pham <cite|guilbaud2011optimal> also used a
  model inspired from the Avellaneda-Stoikov framework but including market
  orders and limit orders at best (and next to best) bid and ask together
  with stochastic spreads. Very recently, Guilbaud and Pham
  <cite|guilbaud2012optimal> used another model inspired from the
  Avellanada-Stoikov one in a pro-rata microstructure.<next-line>

  It is also noteworthy that the model we use to find the orders a market
  maker should optimally send to the market has been used in a totally
  different domain of algorithmic trading: optimal execution. Bayraktar and
  Ludkovski <cite|bayraktar2011liquidation> and Guéant, Lehalle,
  Fernandez-Tapia <cite|GLFT> used indeed a similar model to optimally
  liquidate a portfolio.<next-line>

  This paper starts in section 2 with the description of the model. Section 3
  is dedicated to the introduction of our change of variables and solves the
  control problem in the presence of inventory limits. Section 4 focuses on
  the asymptotic behavior of the optimal quotes and characterizes the
  asymptotic value using an eigenvalue problem that allows to propose a
  rather good approximation in closed-form. Section 5 generalizes the model
  in two different directions: (i) the introduction of a drift in the price
  dynamics and (ii) the introduction of market impact that may also be
  regarded as adverse selection. Section 6 carries out the comparative
  statics. Section 7 provides backtests of the model. Adaptations of our
  results are in use at Cheuvreux.

  <section|Setup of the model>

  Let us fix a probability space <math|<around|(|\<Omega\>,<with|math-font|cal|F>,<with|math-font|Bbb|P>|)>>
  equipped with a filtration <math|<around|(|<with|math-font|cal|F><rsub|t>|)><rsub|t\<geq\>0>>
  satisfying the usual conditions. We assume that all random variables and
  stochastic processes are defined on <math|<around|(|\<Omega\>,<with|math-font|cal|F>,<around|(|<with|math-font|cal|F><rsub|t>|)><rsub|t\<geq\>0>,<with|math-font|Bbb|P>|)>>.<next-line>

  We consider a high-frequency market maker operating on a single
  stock<footnote|We suppose that this high-frequency market maker does not
  ``make'' the price in the sense that he has no market power. In other
  words, we assume that the size of his orders is small enough to consider
  price dynamics exogenous. Market impact will be introduced in section 5.>.
  We suppose that the mid-price of this stock or more generally a reference
  price<footnote|This reference price for the stock can be thought of as a
  smoothed mid-price for instance.> of the stock moves as an arithmetic
  Brownian motion<footnote|Since we will only consider short horizon
  problems, this assumption is almost equivalent to the usual Black-Scholes
  one.>:

  <\equation>
    d*S<rsub|t>=\<sigma\>*d*W<rsub|t>
  </equation>

  The market maker under consideration will continuously propose bid and ask
  prices denoted respectively <math|S<rsup|b><rsub|t>> and
  <math|S<rsup|a><rsub|t>> and will hence buy and sell shares according to
  the rate of arrival of market orders at the quoted prices. His inventory
  <math|q>, that is the (signed) quantity of shares he holds, is given by

  <\equation>
    q<rsub|t>=N<rsup|b><rsub|t>-N<rsup|a><rsub|t>
  </equation>

  where <math|N<rsup|b>> and <math|N<rsup|a>> are the point processes
  (independent of <math|<around|(|W<rsub|t>|)><rsub|t>>) giving the number of
  shares the market maker respectively bought and sold (we assume that
  transactions are of constant size, scaled<footnote|The only important
  hypothesis is the constant size of orders since we can easily replace
  <math|1> by any positive size <math|\<Delta\>>.> to <math|1>). Arrival
  rates obviously depend on the prices <math|S<rsup|b><rsub|t>> and
  <math|S<rsup|a><rsub|t>> quoted by the market maker and we assume, in
  accordance with the model proposed by Avellaneda and Stoikov
  <cite|avellaneda2008high>, that intensities <math|\<lambda\><rsup|b>> and
  <math|\<lambda\><rsup|a>> associated respectively to <math|N<rsup|b>> and
  <math|N<rsup|a>> depend on the difference between the quoted prices and the
  reference price (<em|i.e.> <math|\<delta\><rsub|t><rsup|b>=S<rsub|t>-S<rsup|b><rsub|t>>
  and <math|\<delta\><rsub|t><rsup|a>=S<rsup|a><rsub|t>-S<rsub|t>>) and are
  of the following form<footnote|Some authors also used a linear form for the
  intensity functions -- see <cite|ho1981optimal> for instance.>:

  <\equation>
    \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>=A*e<rsup|-k*\<delta\><rsup|b>>=A*exp
    (-k*<around|(|s-s<rsup|b>|)>)
  </equation>

  <\equation>
    \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>=A*e<rsup|-k*\<delta\><rsup|a>>=A*exp
    (-k*<around|(|s<rsup|a>-s|)>)
  </equation>

  where <math|A> and <math|k> are positive constants that characterize the
  liquidity of the stock. In particular, this specification means \U for
  positive <math|\<delta\><rsup|b>> and <math|\<delta\><rsup|a>> \U that the
  closer to the reference price an order is posted, the faster it will be
  executed.<next-line>

  As a consequence of his trades, the market maker has an amount of cash
  evolving according to the following dynamics:

  <\equation*>
    d*X<rsub|t>=<around|(|S<rsub|t>+\<delta\><rsup|a><rsub|t>|)>*d*N<rsup|a><rsub|t>-<around|(|S<rsub|t>-\<delta\><rsup|b><rsub|t>|)>*d*N<rsup|b><rsub|t>
  </equation*>

  To this original setting introduced by Avellaneda and Stoikov (itself
  following partially Ho and Stoll <cite|ho1981optimal>), we add a bound
  <math|Q> to the inventory that a market maker is authorized to have. In
  other words, we assume that a market maker with inventory <math|Q>
  (<math|Q\<gtr\>0> depending in practice on risk limits) will never set a
  bid quote and symmetrically that a market maker with inventory <math|-Q>,
  that is a short position of <math|Q> shares in the stock under
  consideration, will never set an ask quote. This realistic restriction may
  be read as a risk limit and allows to solve rigorously the
  problem.<next-line>

  Now, coming to the objective function, the market maker has a time horizon
  <math|T> and his goal is to optimize the expected utility of his P&L at
  time <math|T>. In line with <cite|avellaneda2008high>, we will focus on
  CARA utility functions and we suppose that the market maker optimizes:

  <\equation*>
    sup<rsub|<around|(|\<delta\><rsub|t><rsup|a>|)><rsub|t>,<around|(|\<delta\><rsub|t><rsup|b>|)><rsub|t>\<in\><with|math-font|cal|A>>
    <with|math-font|Bbb|E><around*|[|-exp
    <around*|(|-\<gamma\>*<around|(|X<rsub|T>+q<rsub|T>*S<rsub|T>|)>|)>|]>
  </equation*>

  where <math|<with|math-font|cal|A>> is the set of predictable processes
  bounded from below, <math|\<gamma\>> is the absolute risk aversion
  coefficient characterizing the market maker, <math|X<rsub|T>> is the amount
  of cash at time <math|T> and <math|q<rsub|T>*S<rsub|T>> is the evaluation
  of the (signed) remaining quantity of shares in the inventory at time
  <math|T> (liquidation at the reference price <math|S<rsub|T>><footnote|Our
  results would be <em|mutatis mutandis> the same if we added a penalization
  term <math|-b<around|(|<around|\||q<rsub|T>|\|>|)>> for the shares
  remaining at time <math|T>. The rationale underlying this point is that
  price risk prevents the trader from having important exposure to the stock.
  Hence, <math|q<rsub|t>> should naturally mean-revert around <math|0>.>).

  <vspace|0.5cm><section|Characterization of the optimal quotes>

  The optimization problem set up in the preceding section can be solved
  using the classical tools of stochastic optimal control. The first step of
  our reasoning is therefore to introduce the Hamilton-Jacobi-Bellman (HJB)
  equation associated to the problem. More exactly, we introduce a system of
  Hamilton-Jacobi-Bellman partial differential equations which consists of
  the following equations indexed by <math|q\<in\>{-Q,\<ldots\>,Q}> for
  <math|<around|(|t,s,x|)>\<in\><around|[|0,T|]>\<times\><with|math-font|Bbb|R><rsup|2>>:<next-line>

  <no-indent>For <math|<around|\||q|\|>\<less\>Q>:

  <\equation*>
    \<partial\><rsub|t>*u<around|(|t,x,q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|a>> \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>*<around*|[|u*<around|(|t,x+s+\<delta\><rsup|a>,q-1,s|)>-u<around|(|t,x,q,s|)>|]>=0
  </equation*>

  For <math|q=Q>:

  <\equation*>
    \<partial\><rsub|t>*u<around|(|t,x,Q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|t,x,Q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|a>> \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>*<around*|[|u*<around|(|t,x+s+\<delta\><rsup|a>,Q-1,s|)>-u<around|(|t,x,Q,s|)>|]>=0
  </equation*>

  For <math|q=-Q>:

  <\equation*>
    \<partial\><rsub|t>*u*<around|(|t,x,-Q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u*<around|(|t,x,-Q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,-Q+1,s|)>-u*<around|(|t,x,-Q,s|)>|]>=0
  </equation*>

  with the final condition:

  <\equation*>
    \<forall\>q\<in\>{-Q,\<ldots\>,Q},<space|2em>u<around|(|T,x,q,s|)>=-exp
    <around*|(|-\<gamma\>*<around|(|x+q*s|)>|)>
  </equation*>

  To solve these equations we will use a change of variables based on two
  different ideas. First, the choice of a CARA utility function allows to
  factor out the Mark-to-Market value of the portfolio (<math|x+q*s>). Then,
  the exponential decay for the intensity functions <math|\<lambda\><rsup|b>>
  and <math|\<lambda\><rsup|a>> allows to reduce the Hamilton-Jacobi-Bellman
  (HJB) equations associated to our control problem to a linear system of
  ordinary differential equations:<next-line>

  <\Proposition>
    [Change of variables for (HJB)] Let us consider a family
    <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> of positive
    functions solution of:

    <\equation*>
      \<forall\>q\<in\>{-Q+1,\<ldots\>,Q-1},<space|1em><wide|v|\<dot\>><rsub|q><around|(|t|)>=\<alpha\>*q<rsup|2>*v<rsub|q><around|(|t|)>-\<eta\>*<around*|(|v<rsub|q-1><around|(|t|)>+v<rsub|q+1><around|(|t|)>|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|Q><around|(|t|)>=\<alpha\>*Q<rsup|2>*v<rsub|Q><around|(|t|)>-\<eta\>*v<rsub|Q-1><around|(|t|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|-Q><around|(|t|)>=\<alpha\>*Q<rsup|2>*v<rsub|-Q><around|(|t|)>-\<eta\>*v<rsub|-Q+1><around|(|t|)>
    </equation*>

    with <math|\<forall\>q\<in\>{-Q,\<ldots\>,Q},v<rsub|q><around|(|T|)>=1>,
    where <math|\<alpha\>=<frac|k|2>*\<gamma\>*\<sigma\><rsup|2>> and
    <math|\<eta\>=A*<around|(|1+<frac|\<gamma\>|k>|)><rsup|-<around|(|1+<frac|k|\<gamma\>>|)>>>.<next-line>Then,
    <math|u<around|(|t,x,q,s|)>=-exp (-\<gamma\>*<around|(|x+q*s|)>)v<rsub|q><around|(|t|)><rsup|-<frac|\<gamma\>|k>>>
    is solution of (HJB).<next-line>
  </Proposition>

  Then, the following proposition proves that there exists such a family of
  positive functions:

  <\Proposition>
    [Solution of the ordinary differential equations] Let us introduce the
    matrix <math|M> defined by:

    <\equation*>
      M=<matrix|<tformat|<table|<row|<cell|\<alpha\>*Q<rsup|2>>|<cell|-\<eta\>>|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|-\<eta\>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>>|<cell|-\<eta\>>|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>|<cell|-\<eta\>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>>|<cell|-\<eta\>>>|<row|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>|<cell|-\<eta\>>|<cell|\<alpha\>*Q<rsup|2>>>>>>
    </equation*>

    where <math|\<alpha\>=<frac|k|2>*\<gamma\>*\<sigma\><rsup|2>> and
    <math|\<eta\>=A*<around|(|1+<frac|\<gamma\>|k>|)><rsup|-<around|(|1+<frac|k|\<gamma\>>|)>>>.<next-line>

    Let us define

    <\equation*>
      v<around|(|t|)>=<around|(|v<rsub|-Q><around|(|t|)>,v<rsub|-Q+1><around|(|t|)>,\<ldots\>,v<rsub|0><around|(|t|)>,\<ldots\>,v<rsub|Q-1><around|(|t|)>,v<rsub|Q><around|(|t|)>|)><rprime|'>
    </equation*>

    <\equation*>
      =exp (-M*<around|(|T-t|)>)\<times\><around|(|1,\<ldots\>,1|)><rprime|'>
    </equation*>

    Then, <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> is a
    family of positive functions solution of the equations of Proposition
    1.<next-line>
  </Proposition>

  Using the above change of variables and a verification approach, we are now
  able to solve the stochastic control problem, that is to find the value
  function of the problem and the optimal quotes:

  <\Theorem>
    [Solution of the control problem] Let consider
    <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> as in
    Proposition 2.<next-line>

    Then <math|u<around|(|t,x,q,s|)>=-exp
    (-\<gamma\>*<around|(|x+q*s|)>)v<rsub|q><around|(|t|)><rsup|-<frac|\<gamma\>|k>>>
    is the value function of the control problem.<next-line>

    Moreover, the optimal quotes are given by:

    <\equation*>
      s-s<rsup|b\<ast\>><around|(|t,q,s|)>=\<delta\><rsup|b\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q+1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>,<space|1em>q\<neq\>Q
    </equation*>

    <\equation*>
      s<rsup|a\<ast\>><around|(|t,q,s|)>-s=\<delta\><rsup|a\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q-1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>,<space|1em>q\<neq\>-Q
    </equation*>

    and the resulting bid-ask spread quoted by the market maker is given by:

    <\equation*>
      \<psi\><rsup|\<ast\>><around|(|t,q|)>=-<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q+1><around|(|t|)>*v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)><rsup|2>>|)>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>,<space|1em><around|\||q|\|>\<neq\>Q
    </equation*>
  </Theorem>

  <vspace|0.5cm>

  <section|Asymptotic behavior and approximation of the optimal quotes>

  To exemplify our findings and in order to motivate the asymptotic
  approximations we shall provide, we plotted on Figure <reference|ex1> and
  Figure <reference|ex1b> the behavior with time and inventory of the optimal
  quotes. The resulting bid-ask spread quoted by the market maker is plotted
  on Figure <reference|ex2>.<next-line>

  We clearly see that the optimal quotes are almost independent of <math|t>,
  as soon as <math|t> is far from the terminal time <math|T>. This
  observation is at odds with the approximations proposed

  <\footnote>
    In <cite|avellaneda2008high>, the approximations obtained by the authors
    using an expansion in <math|q> leads to the following expressions:

    <\equation*>
      \<delta\><rsup|b\<ast\>><rsub|t>\<simeq\><frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1+2*q|2>*\<gamma\>*\<sigma\><rsup|2>*<around|(|T-t|)>
    </equation*>

    <\equation*>
      \<delta\><rsup|a\<ast\>><rsub|t>\<simeq\><frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1-2*q|2>*\<gamma\>*\<sigma\><rsup|2>*<around|(|T-t|)>
    </equation*>

    One can easily show, using the results of Theorem 1, that these
    approximations are nothing but the Taylor expansions of the optimal
    quotes for <math|t> close to <math|T>.
  </footnote>

  \ in Avellaneda and Stoikov <cite|avellaneda2008high> using an expansion in
  <math|q>. It motivates however the study of the asymptotic behavior of the
  quotes.<next-line>

  <big-figure|<center> <image|agn_b.eps|0.85tex-text-width|||><label|ex1>|Behavior
  of the optimal bid quotes with time and inventory.
  <math|\<sigma\>=0.3<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  <vfill>

  <big-figure|<center> <image|agn_a.eps|0.85tex-text-width|||><label|ex1b>|Behavior
  of the optimal ask quotes with time and inventory.
  <math|\<sigma\>=0.3<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  <vspace|2cm>

  <big-figure|<center><image|agn_spread.eps|0.85tex-text-width|||><label|ex2>|Behavior
  of the resulting bid-ask spread with time and inventory.
  <math|\<sigma\>=0.3<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  <vfill>

  <\Theorem>
    [Asymptotics for the optimal quotes] The optimal quotes have asymptotic
    limits

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|b\<ast\>><around|(|0,q|)>=\<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>
    </equation*>

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|a\<ast\>><around|(|0,q|)>=\<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>
    </equation*>

    that can be expressed as:

    <\equation*>
      \<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q+1>>|)>*<space|1em>\<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q-1>>|)>
    </equation*>

    where <math|f<rsup|0>\<in\><with|math-font|Bbb|R><rsup|2*Q+1>> is an
    eigenvector corresponding to the smallest eigenvalue of the matrix
    <math|M> introduced in Proposition 2 and characterized (up to a
    multiplicative constant) by:

    <\equation*>
      f<rsup|0>\<in\><below|<math-up|argmin>|f\<in\><with|math-font|Bbb|R><rsup|2*Q+1>,<around|\<\|\|\>|f|\<\|\|\>><rsub|2>=1><big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2>*f<rsub|q><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|f<rsub|q+1>-f<rsub|q>|)><rsup|2>+\<eta\>*f<rsub|Q><rsup|2>+\<eta\>*f<rsub|-Q><rsup|2>
    </equation*>

    The resulting bid-ask spread quoted by the market maker is
    asymptotically:

    <\equation*>
      \<psi\><rsup|\<ast\>><rsub|\<infty\>><around|(|q|)>=-<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q+1>*f<rsup|0><rsub|q-1>|f<rsup|0><rsub|q><rsup|2>>|)>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>
  </Theorem>

  The above result, along with the example of Figure <reference|ex1>, Figure
  <reference|ex1b> and Figure <reference|ex2>, encourages to approximate the
  optimal quotes and the resulting bid-ask spread by their asymptotic value.
  These asymptotic values depend on <math|f<rsup|0>> and we shall provide a
  closed-form approximation for <math|f<rsup|0>>.<next-line>

  The above characterization of <math|f<rsup|0>> corresponds to an eigenvalue
  problem in <math|<with|math-font|Bbb|R><rsup|2*Q+1>> and we propose to
  replace it by a similar eigenvalue problem in
  <math|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>> for which a closed-form
  solution can be computed. More precisely we replace the criterion

  <\equation*>
    f<rsup|0>\<in\><below|<math-up|argmin>|f\<in\><with|math-font|Bbb|R><rsup|2*Q+1>,<around|\<\|\|\>|f|\<\|\|\>><rsub|2>=1><big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2>*f<rsub|q><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|f<rsub|q+1>-f<rsub|q>|)><rsup|2>+\<eta\>*f<rsub|Q><rsup|2>+\<eta\>*f<rsub|-Q><rsup|2>
  </equation*>

  by the following criterion for <math|<wide|f|~><rsup|0>\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>:

  <\equation*>
    <wide|f|~><rsup|0>\<in\><below|<math-up|argmin>|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>=1><big|int><rsub|-\<infty\>><rsup|+\<infty\>><around*|(|\<alpha\>*x<rsup|2>*<wide|f|~><around|(|x|)><rsup|2>+\<eta\>*<wide|f|~><rprime|'><around|(|x|)><rsup|2>|)>*d*x
  </equation*>

  The introduction of this new criterion is rooted to the following
  proposition that states (up to its sign) the expression for
  <math|<wide|f|~><rsup|0>> in closed form:

  <\Proposition>
    Let us consider

    <\equation*>
      <wide|f|~><rsup|0>\<in\><below|<math-up|argmin>|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>=1><big|int><rsub|<with|math-font|Bbb|R>><around*|(|\<alpha\>*x<rsup|2>*<wide|f|~><around|(|x|)><rsup|2>+\<eta\>*<wide|f|~><rprime|'><around|(|x|)><rsup|2>|)>*d*x
    </equation*>

    Then:

    <\equation*>
      <wide|f|~><rsup|0><around|(|x|)>=\<pm\><frac|1|\<pi\><rsup|<frac|1|4>>><around*|(|<frac|\<alpha\>|\<eta\>>|)><rsup|<frac|1|8>>*exp
      <around*|(|-<frac|1|2>*<sqrt|<frac|\<alpha\>|\<eta\>>>*x<rsup|2>|)>
    </equation*>
  </Proposition>

  From the above proposition, we expect <math|f<rsub|q><rsup|0>> to behave,
  up to a multiplicative constant, as <math|exp
  <around*|(|-<frac|1|2>*<sqrt|<frac|\<alpha\>|\<eta\>>>*q<rsup|2>|)>>. This
  heuristic viewpoint induces an approximation of the optimal quotes and the
  resulting optimal bid-ask-spread:

  <eqnarray*|<tformat|<table|<row|<cell|\<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>>|<cell|\<simeq\>>|<cell|<frac|1|\<gamma\>>*ln
  <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|2*k>*<sqrt|<frac|\<alpha\>|\<eta\>>>*<around|(|2*q+1|)>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<frac|1|\<gamma\>>*ln
  <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|2*q+1|2>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>>>|<row|<cell|\<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>>|<cell|\<simeq\>>|<cell|<frac|1|\<gamma\>>*ln
  <around*|(|1+<frac|\<gamma\>|k>|)>-<frac|1|2*k>*<sqrt|<frac|\<alpha\>|\<eta\>>>*<around|(|2*q-1|)>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<frac|1|\<gamma\>>*ln
  <around*|(|1+<frac|\<gamma\>|k>|)>-<frac|2*q-1|2>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>>>>>>

  <\equation*>
    \<psi\><rsup|\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|2|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <big-figure|<center> <image|new_asymptotic_b2.eps|0.45tex-text-width|||>
  <space|0.1cm><image|new_asymptotic_b.eps|0.45tex-text-width|||><label|ap>
  |Asymptotic behavior of optimal bid quote (bold line). Approximation
  (dotted line). Left: <math|\<sigma\>=0.4<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>. Right: <math|\<sigma\>=1.0<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.2<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  <big-figure|<center> <image|new_asymptotic_a2.eps|0.45tex-text-width|||>
  <space|0.1cm><image|new_asymptotic_a.eps|0.45tex-text-width|||><label|ap2>
  |Asymptotic behavior of optimal ask quote (bold line). Approximation
  (dotted line). Left: <math|\<sigma\>=0.4<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>. Right: <math|\<sigma\>=1.0<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.2<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  We exhibit on Figure <reference|ap> and Figure 5 the values of the optimal
  quotes, along with their associated approximations. Empirically, these
  approximations for the quotes are satisfactory in most cases and are always
  very good for small values of the inventory <math|q>. In fact, even though
  <math|f<rsup|0>> appears to be well approximated by the gaussian
  approximation, we cannot expect a very good fit for the quotes when
  <math|q> is large because we are approximating expressions that depend on
  ratios of the form <math|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q+1>>> or
  <math|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q-1>>>.<next-line>

  <section|Extensions of the model>

  <subsection|The case of a trend in the price dynamics>

  So far, the reference price was supposed to be a Brownian motion. In what
  follows we extend the model to the case of a trend in the price dynamics:

  <\equation*>
    d*S<rsub|t>=\<mu\>*d*t+\<sigma\>*d*W<rsub|t>
  </equation*>

  In that case we have the following proposition (the proof is not repeated):

  <\Proposition>
    [Solution with a drift] Let us consider a family of functions
    <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> solution of
    the linear system of ODEs that follows:

    <\equation*>
      \<forall\>q\<in\>{-Q+1,\<ldots\>,Q-1},<wide|v|\<dot\>><rsub|q><around|(|t|)>=<around|(|\<alpha\>*q<rsup|2>-\<beta\>*q|)>*v<rsub|q><around|(|t|)>-\<eta\>*<around*|(|v<rsub|q-1><around|(|t|)>+v<rsub|q+1><around|(|t|)>|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|Q><around|(|t|)>=<around|(|\<alpha\>*Q<rsup|2>-\<beta\>*Q|)>*v<rsub|Q><around|(|t|)>-\<eta\>*v<rsub|Q-1><around|(|t|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|-Q><around|(|t|)>=<around|(|\<alpha\>*Q<rsup|2>+\<beta\>*Q|)>*v<rsub|-Q><around|(|t|)>-\<eta\>*v<rsub|-Q+1><around|(|t|)>
    </equation*>

    with <math|\<forall\>q\<in\>{-Q,\<ldots\>,Q},v<rsub|q><around|(|T|)>=1>,
    where <math|\<alpha\>=<frac|k|2>*\<gamma\>*\<sigma\><rsup|2>>,
    <math|\<beta\>=k*\<mu\>> and <math|\<eta\>=A*<around|(|1+<frac|\<gamma\>|k>|)><rsup|-<around|(|1+<frac|k|\<gamma\>>|)>>>.<next-line>

    Then, <math|u<around|(|t,x,q,s|)>=-exp
    (-\<gamma\>*<around|(|x+q*s|)>)v<rsub|q><around|(|t|)><rsup|-<frac|\<gamma\>|k>>>
    is the value function of the control problem.<next-line>

    The optimal quotes are given by:

    <\equation*>
      s-s<rsup|b\<ast\>><around|(|t,q,s|)>=\<delta\><rsup|b\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q+1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    <\equation*>
      s<rsup|a\<ast\>><around|(|t,q,s|)>-s=\<delta\><rsup|a\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q-1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    and the resulting bid-ask spread of the market maker is :

    <\equation*>
      \<psi\><rsup|\<ast\>><around|(|t,q|)>=-<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q+1><around|(|t|)>*v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)><rsup|2>>|)>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    Moreover,

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|b\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q+1>>|)>
    </equation*>

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|a\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q-1>>|)>
    </equation*>

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<psi\><rsup|\<ast\>><around|(|0,q|)>=-<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q+1>*f<rsup|0><rsub|q-1>|f<rsup|0><rsub|q><rsup|2>>|)>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    where <math|f<rsup|0>> is an eigenvector corresponding to the smallest
    eigenvalue of:

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<alpha\>*Q<rsup|2>-\<beta\>*Q>|<cell|-\<eta\>>|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|-\<eta\>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>-\<beta\>*<around|(|Q-1|)>>|<cell|-\<eta\>>|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>|<cell|-\<eta\>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>-\<beta\>*<around|(|Q-1|)>>|<cell|-\<eta\>>>|<row|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>|<cell|-\<eta\>>|<cell|\<alpha\>*Q<rsup|2>-\<beta\>*Q>>>>>
    </equation*>
  </Proposition>

  In addition to this theoretical result, we can consider an approximation
  similar to the approximation used for the initial model with no drift. We
  then obtain the following approximations for the optimal quotes and the
  bid-ask spread:

  <\equation*>
    \<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<around*|[|-<frac|\<mu\>|\<gamma\>*\<sigma\><rsup|2>>+<frac|2*q+1|2>|]>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <\equation*>
    \<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<around*|[|<frac|\<mu\>|\<gamma\>*\<sigma\><rsup|2>>-<frac|2*q-1|2>|]>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <\equation*>
    \<psi\><rsup|\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|2|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <subsection|The case of market impact>

  Another extension of the model consists in introducing market impact. The
  simplest way to proceed is to consider the following dynamics for the
  price:

  <\equation*>
    d*S<rsub|t>=\<sigma\>*d*W<rsub|t>+\<xi\>*d*N<rsup|a><rsub|t>-\<xi\>*d*N<rsup|b><rsub|t>,<space|2em>\<xi\>\<gtr\>0
  </equation*>

  When a limit order on the bid side is filled, the reference price
  decreases. On the contrary, when a limit order on the ask side is filled,
  the reference price increases. This is in line with the classical modeling
  of market impact for market orders, <math|\<xi\>> being a constant since
  the limit orders posted by the market maker are all supposed to be of the
  same size.<next-line>Adverse selection is another way to interpret the
  interaction we consider between the price process and the point processes
  modeling execution: trades on the bid side are often followed by a price
  decrease and, conversely, trades on the ask side are often followed by a
  price increase.<next-line>

  In this modified framework, the problem can be solved using a change of
  variables that is slightly more involved than the one presented above but
  the method is exactly the same and we have the following proposition (the
  proof is not repeated):

  <\Proposition>
    [Solution with market impact] Let us consider a family of functions
    <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> solution of
    the linear system of ODEs that follows:

    <\equation*>
      \<forall\>q\<in\>{-Q+1,\<ldots\>,Q-1},<wide|v|\<dot\>><rsub|q><around|(|t|)>=\<alpha\>*q<rsup|2>*v<rsub|q><around|(|t|)>-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>*<around*|(|v<rsub|q-1><around|(|t|)>+v<rsub|q+1><around|(|t|)>|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|Q><around|(|t|)>=\<alpha\>*Q<rsup|2>*v<rsub|Q><around|(|t|)>-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>*v<rsub|Q-1><around|(|t|)>
    </equation*>

    <\equation*>
      <wide|v|\<dot\>><rsub|-Q><around|(|t|)>=\<alpha\>*Q<rsup|2>*v<rsub|-Q><around|(|t|)>-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>*v<rsub|-Q+1><around|(|t|)>
    </equation*>

    with <math|\<forall\>q\<in\>{-Q,\<ldots\>,Q},v<rsub|q><around|(|T|)>=exp
    (-<frac|1|2>*k*\<xi\>*q<rsup|2>)>, where
    <math|\<alpha\>=<frac|k|2>*\<gamma\>*\<sigma\><rsup|2>> and
    <math|\<eta\>=A*<around|(|1+<frac|\<gamma\>|k>|)><rsup|-<around|(|1+<frac|k|\<gamma\>>|)>>>.<next-line>

    Then, <math|u<around|(|t,x,q,s|)>=-exp
    (-\<gamma\>*<around|(|x+q*s+<frac|1|2>*\<xi\>*q<rsup|2>|)>)v<rsub|q><around|(|t|)><rsup|-<frac|\<gamma\>|k>>>
    is the value function of the control problem.<next-line>

    The optimal quotes are given by:

    <\equation*>
      s-s<rsup|b\<ast\>><around|(|t,q,s|)>=\<delta\><rsup|b\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q+1><around|(|t|)>>|)>+<frac|\<xi\>|2>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    <\equation*>
      s<rsup|a\<ast\>><around|(|t,q,s|)>-s=\<delta\><rsup|a\<ast\>><around|(|t,q|)>=<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q-1><around|(|t|)>>|)>+<frac|\<xi\>|2>+<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    and the resulting bid-ask spread of the market maker is :

    <\equation*>
      \<psi\><rsup|\<ast\>><around|(|t,q|)>=-<frac|1|k>*ln
      <around*|(|<frac|v<rsub|q+1><around|(|t|)>*v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)><rsup|2>>|)>+\<xi\>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    Moreover,

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|b\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|\<xi\>|2>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q+1>>|)>
    </equation*>

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|a\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|\<xi\>|2>+<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q-1>>|)>
    </equation*>

    <\equation*>
      lim<rsub|T\<to\>+\<infty\>> \<psi\><rsup|\<ast\>><around|(|0,q|)>=-<frac|1|k>*ln
      <around*|(|<frac|f<rsup|0><rsub|q+1>*f<rsup|0><rsub|q-1>|f<rsup|0><rsub|q><rsup|2>>|)>+\<xi\>+<frac|2|\<gamma\>>*ln
      <around*|(|1+<frac|\<gamma\>|k>|)>
    </equation*>

    where <math|f<rsup|0>> is an eigenvector corresponding to the smallest
    eigenvalue of:

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<alpha\>*Q<rsup|2>>|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>>|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|0>|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>|<cell|\<alpha\>*<around|(|Q-1|)><rsup|2>>|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>>|<row|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|0>|<cell|-\<eta\>*e<rsup|-<frac|k|2>*\<xi\>>>|<cell|\<alpha\>*Q<rsup|2>>>>>>
    </equation*>
  </Proposition>

  In addition to this theoretical result, we can consider an approximation
  similar to the approximation used for the initial model. We then obtain the
  following approximations for the optimal quotes and the bid-ask spread:

  <\equation*>
    \<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|\<xi\>|2>+<frac|2*q+1|2>*e<rsup|<frac|k|4>*\<xi\>>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <\equation*>
    \<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|\<xi\>|2>-<frac|2*q-1|2>*e<rsup|<frac|k|4>*\<xi\>>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <\equation*>
    \<psi\><rsup|\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|2|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+\<xi\>+e<rsup|<frac|k|4>*\<xi\>>*<sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <section|Comparative statics>

  We argued in section 4 that the value of the optimal quotes was almost
  independent of <math|t> for <math|t> sufficiently far from the terminal
  time <math|T> and we characterized, using spectral arguments, the
  asymptotic value of the optimal quotes. In order to obtain closed-form
  formulae, we also provided approximations for the asymptotic value of the
  optimal quotes. Although these closed-form formulae are only
  approximations, they provide a rather good intuition about the influence of
  the different parameters on the optimal quotes.

  <subsection|Dependence on <math|\<sigma\><rsup|2>>>

  The dependence of optimal quotes on <math|\<sigma\><rsup|2>> depends on the
  sign of the inventory. More precisely, we observe numerically, in
  accordance with the approximations, that:

  <\equation*>
    <around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<less\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<gtr\>0,>|<cell|<text|if
    >q\<less\>0>>|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<gtr\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<gtr\>0,>|<cell|<text|if
    >q=0>>|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<gtr\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*\<sigma\><rsup|2>>\<less\>0,>|<cell|<text|if
    >q\<gtr\>0>>>>>|\<nobracket\>>
  </equation*>

  For the bid-ask spread, we obtain:

  <\equation*>
    <frac|\<partial\>*\<psi\><rsup|\<ast\>><rsub|\<infty\>>|\<partial\>*\<sigma\><rsup|2>>\<gtr\>0
  </equation*>

  The rationale behind this is that an increase in <math|\<sigma\><rsup|2>>
  increases inventory risk. Hence, to reduce this risk, a market maker that
  has a long position will try to reduce his exposure and hence ask less for
  his stocks (to get rid of some of them) and accept to buy at a lower price
  (to avoid buying new stocks). Similarly, a market maker with a short
  position tries to buy stocks, and hence increases its bid quote, while
  avoiding short selling new stocks, and he increases its ask quote to that
  purpose. Overall, due to the increase in price risk, the bid-ask spread
  widens as it is well instanced in the case of a market maker with a flat
  position (this one wants indeed to earn more per trade to compensate the
  increase in inventory risk).

  <subsection|Dependence on <math|\<mu\>>>

  The dependence of optimal quotes on the drift <math|\<mu\>> is
  straightforward and corresponds to the intuition. If the agent expect the
  price to increase (resp. decrease) he will post orders with higher (resp.
  lower) prices. Hence we have:

  <\equation*>
    <frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*\<mu\>>\<less\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*\<mu\>>\<gtr\>0
  </equation*>

  <subsection|Dependence on <math|A>>

  Because of the form of the system of equations that defines <math|v>, the
  dependence on <math|A> must be the exact opposite of the dependence on
  <math|\<sigma\><rsup|2>>:

  <\equation*>
    <around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*A>\<gtr\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*A>\<less\>0,>|<cell|<text|if
    <math|q\<less\>0>;>>>|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*A>\<less\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*A>\<less\>0,>|<cell|<text|if
    >q=0>>|<row|<cell|<frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|b\<ast\>>|\<partial\>*A>\<less\>0,<space|1em><frac|\<partial\>*\<delta\><rsub|\<infty\>><rsup|a\<ast\>>|\<partial\>*A>\<gtr\>0,>|<cell|<text|if
    >q\<gtr\>0>>>>>|\<nobracket\>>
  </equation*>

  For the bid-ask spread, we obtain:

  <\equation*>
    <frac|\<partial\>*\<psi\><rsup|\<ast\>><rsub|\<infty\>>|\<partial\>*A>\<less\>0
  </equation*>

  The rationale behind these results is that an increase in <math|A> reduces
  the inventory risk. An increase in <math|A> indeed increases the frequency
  of trades and hence reduces the risk of being stuck with a large inventory
  (in absolute value). For this reason, an increase in <math|A> should have
  the same effect as a decrease in <math|\<sigma\><rsup|2>>.

  <subsection|Dependence on <math|\<gamma\>>>

  Using the closed-form approximations, we see that the dependence on
  <math|\<gamma\>> is ambiguous. The market maker faces indeed two different
  risks that contribute to inventory risk: (i) trades occur at random times
  and (ii) the reference price is stochastic. But if risk aversion increases,
  the market maker will mitigate the two risks: (i) he may set his quotes
  closer to one another to reduce the randomness in execution and (ii) he may
  widen his spread to reduce price risk. The tension between these two roles
  played by <math|\<gamma\>> explains the different behaviors we may observe,
  as on Figure <reference|imggamma1> and Figure <reference|imggamma2> for the
  bid-ask spread resulting from the asymptotic optimal quotes:

  <big-figure|<center> <image|greeks_gamma_spread.eps|0.85tex-text-width|||><label|imggamma1>|Bid-ask
  spread resulting from the asymptotic optimal quotes for different
  inventories and different values for the risk aversion parameter
  <math|\<gamma\>>. <math|\<sigma\>=0.3<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.3<space|1em><math-up|Tick><rsup|-1>>, <math|T=600*<space|1em>s>.>

  <big-figure|<center> <image|greeks_gamma_spread2.eps|0.85tex-text-width|||><label|imggamma2>|Bid-ask
  spread resulting from the asymptotic optimal quotes for different
  inventories and different values for the risk aversion parameter
  <math|\<gamma\>>. <math|\<sigma\>=0.6<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|k=0.9<space|1em><math-up|Tick><rsup|-1>>, <math|T=600*<space|1em>s>.>

  <subsection|Dependence on <math|k>>

  From the closed-form approximations, we expect
  <math|\<delta\><rsub|\<infty\>><rsup|b\<ast\>>> to be decreasing in
  <math|k> for <math|q> greater than some negative threshold. Below this
  threshold, we expect it to be increasing. Similarly we expect
  <math|\<delta\><rsub|\<infty\>><rsup|a\<ast\>>> to be decreasing in
  <math|k> for <math|q> smaller than some positive threshold. Above this
  threshold we expect it to be increasing.<next-line>

  Eventually, as far as the bid-ask spread is concerned, the closed-form
  approximations indicate that the resulting bid-ask spread should be a
  decreasing function of <math|k>.

  <\equation*>
    <frac|\<partial\>*\<psi\><rsup|\<ast\>><rsub|\<infty\>>|\<partial\>*k>\<less\>0
  </equation*>

  In fact several effects are in interaction. On one hand, there is a
  \Pno-volatility\Q effect that is completely orthogonal to any reasoning on
  the inventory risk: when <math|k> increases, in a situation where
  <math|\<delta\><rsup|b>> and <math|\<delta\><rsup|a>> are positive, trades
  occur closer to the reference price <math|S<rsub|t>>. For this reason, and
  in absence of inventory risk, the optimal bid-ask spread has to shrink.
  However, an increase in <math|k> also affects the inventory risk since it
  decreases the probability to be executed (for
  <math|\<delta\><rsup|b>,\<delta\><rsup|a>\<gtr\>0>). Hence, an increase in
  <math|k> is also, in some aspects, similar to a decrease in <math|A>. These
  two effects explain the expected behavior.<next-line>

  <big-figure|<center> <image|greeks_k_b.eps|0.85tex-text-width|||><label|imgk>|Asymptotic
  optimal bid quotes for different inventories and different values of
  <math|k>. <math|\<sigma\>=0.3<space|1em><math-up|Tick>\<cdot\><math-up|s><rsup|-1/2>>,
  <math|A=0.9<space|1em><math-up|s><rsup|-1>>,
  <math|\<gamma\>=0.01<space|1em><math-up|Tick><rsup|-1>>,
  <math|T=600*<space|1em>s>.>

  Numerically, we observed that the \Pno-volatility\Q effect dominated for
  the values of the inventory under consideration (see Figure
  <reference|imgk> for the case of the bid quote<footnote|The case of the ask
  quote is obviously similar.>).

  <subsection|Dependence on the market impact <math|\<xi\>>>

  The market impact introduced in 5.2 has two effects on the optimal quotes.
  In the absence of price risk, given the functional form of the execution
  intensities, the direct effect of <math|\<xi\>> is approximately to add
  <math|<frac|\<xi\>|2>> the each optimal quote: the market maker
  approximately maintains his profit per round trip on the market but the
  probability of occurrence of a trade is reduced. This adverse selection
  effect has a side-effect linked to inventory risk: since adverse selection
  gives the market maker an incentive to post orders deeper in the book, it
  increases the risk of being stuck with a large inventory for a market maker
  holding such an inventory. As a consequence, for a trader holding a
  positive (resp. negative) inventory, there is a second effect inciting to
  buy and sell at lower (resp. higher) prices. These two effects are clearly
  highlighted by the closed-form approximations exhibited in the previous
  section:

  <\equation*>
    \<delta\><rsup|b\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<wide*|<frac|\<xi\>|2>|\<wide-underbrace\>><rsub|a*d*v*e*r*s*e*<space|0.27em>s*e*l*e*c*t*i*o*n>+<frac|2*q+1|2><wide*|e<rsup|<frac|k|4>*\<xi\>>|\<wide-underbrace\>><rsub|s*i*d*e-e*f*f*e*c*t><sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <\equation*>
    \<delta\><rsup|a\<ast\>><rsub|\<infty\>><around|(|q|)>\<simeq\><frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<wide*|<frac|\<xi\>|2>|\<wide-underbrace\>><rsub|a*d*v*e*r*s*e*<space|0.27em>s*e*l*e*c*t*i*o*n>-<frac|2*q-1|2><wide*|e<rsup|<frac|k|4>*\<xi\>>|\<wide-underbrace\>><rsub|s*i*d*e-e*f*f*e*c*t><sqrt|<frac|\<sigma\><rsup|2>*\<gamma\>|2*k*A>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|1+<frac|k|\<gamma\>>>>
  </equation*>

  <section|Backtests>

  Before using the above model on historical data, we need to discuss some
  features of the model that need to be adapted before any backtest is
  possible.<next-line>

  First of all, the model is continuous in both time and space while the real
  control problem is intrinsically discrete in space, because of the tick
  size, and in time, because orders have a certain priority and changing
  position too often reduces the actual chance to be reached by a market
  order. Hence, the model has to be reinterpreted in a discrete way. In terms
  of prices, quotes must not be between two ticks and we decided to round the
  optimal quotes to the nearest tick. In terms of time, an order of size
  ATS<footnote|ATS is the average trade size.> is sent to the market and is
  not canceled nor modified for a given period of time <math|\<Delta\>*t>,
  unless a trade occurs and, though perhaps partially, fills the order. Now,
  when a trade occurs and changes the inventory or when an order stayed in
  the order book for longer than <math|\<Delta\>*t>, then the optimal quote
  is updated and, if necessary, a new order is inserted.<next-line>

  Concerning the parameters, <math|\<sigma\>>, <math|A> and <math|k> can be
  calibrated on trade-by-trade limit order book data while <math|\<gamma\>>
  has to be chosen. However, it is well known by practitioners that <math|A>
  and <math|k> have to depend at least on the actual market bid-ask spread.
  Since we do not explicitly take into account the underlying market, there
  is no market bid-ask spread in the model. For the backtest example we
  present below, <math|A> and <math|k> have been chosen independent of the
  spread but, in practice, the value of <math|A> and <math|k> are function of
  the market bid-ask spread. As far as <math|\<gamma\>> is concerned, we
  decided in our backtests to assign <math|\<gamma\>> an arbitrary value for
  which the inventory stayed between -10 and 10 during the day we considered
  (the unit being the ATS).<next-line>

  Turning to the backtests, they were carried out with trade-by-trade data
  and we assumed that our orders were entirely filled when a trade occurred
  at or above the ask price quoted by the agent. Our goal here is just to
  exemplify the use of the model<footnote|We, voluntarily, do not give full
  details about the algorithm based on the model.> and we considered the case
  of the French stock France Telecom on March <math|15<rsup|t*h>>
  2012.<next-line>

  We first plot the price of the stock France Telecom on March
  <math|15<rsup|t*h>> 2012 on Figure <reference|price>, the evolution of the
  inventory<footnote|The ATS is <math|1105> for the day we considered.> on
  Figure <reference|inventory> and the associated P&L (the stocks in the
  portfolio are evaluated at mid-price) on Figure <reference|pnl>.
  <vspace|0.8cm>

  <big-figure|<center> <image|pri.eps|0.85tex-text-width|||><label|price>|Price
  of the stock France Telecom on 15/03/2012, from 10:00 to 16:00.>

  <vspace|0.5cm>

  <big-figure|<center> <image|inv.eps|0.85tex-text-width|||><label|inventory>|Inventory
  (in ATS) when the strategy is used on France Telecom (15/03/2012) from
  10:00 to 16:00.>

  <vspace|0.8cm>

  <big-figure|<center> <image|pnl.eps|0.85tex-text-width|||><label|pnl>|P&L
  when the strategy is used on France Telecom (15/03/2012) from 10:00 to
  16:00.>

  This P&L can be compared to the P&L of a naive trader (Figure
  <reference|nai>) who only posts orders at the first limit of the book on
  each side, whenever he is asked to post orders \U that is when one of his
  orders has been executed or after a period of time <math|\<Delta\>*t> with
  no execution.

  <big-figure|<center> <image|nai.eps|0.85tex-text-width|||><label|nai>|P&L
  of a naive market maker on France Telecom (15/03/2012) from 10:00 to
  16:00.>

  Now, to better understand the details of the strategy, we focused on a
  subperiod of 1 hour and we plotted the state of the market along with the
  quotes of the market maker (Figure <reference|execution>). Trades
  occurrences involving the market maker are signalled by a dot.

  <big-figure|<center> <image|quo.eps|0.85tex-text-width|||><label|execution>|Details
  for the quotes and trades when the strategy is used on France Telecom
  (15/03/2012). Thin lines represent the market while bold lines represent
  the quotes of the market maker. Dotted lines are associated to the bid side
  while plain lines are associated to the ask side. Black points represent
  trades in which the market maker is involved.>

  <section*|Conclusion>

  In this paper we present a model for the optimal quotes of a market maker.
  Starting from a model in line with Avellaneda and Stoikov
  <cite|avellaneda2008high> and rooted to Ho and Stoll <cite|ho1981optimal>,
  we introduce a change of variables that allows to transform the HJB
  equation into a system of linear ordinary differential equations. This
  transformation allows to find the optimal quotes and to characterize their
  asymptotic behavior. Closed-form approximations are also obtained using
  spectral analysis.<next-line>

  The change of variables introduced in this paper can also be used to solve
  the initial equations of Avellaneda and Stoikov <cite|avellaneda2008high>
  and we provide a complete mathematical proof in <cite|gueant2012PDE>.
  However, in the absence of inventory limits, no proof of optimality is
  available for the quotes claimed to be optimal in <cite|avellaneda2008high>
  and their admissibility appears to be an open problem.<next-line>

  An important topic for future research consists in generalizing the model
  to any intensity function. This is particularly important because the
  exponential form of the intensity is only suited to liquid stocks with a
  small bid-ask spread. Another important topic consists in introducing
  \Ppassive market impact\Q (<em|i.e.> the perturbations of the price
  formation process by liquidity provision). This is a real modeling
  challenge since no quantitative model for this type of impact has been
  proposed in the literature.

  <\acknowledgements>
    \ The authors wish to acknowledge the helpful conversations with Yves
    Achdou (Université Paris-Diderot), Vincent Fardeau (London School of
    Economics), Thierry Foucault (HEC), Jean-Michel Lasry (Université
    Paris-Dauphine), Antoine Lemenant (Université Paris-Diderot),
    Pierre-Louis Lions (Collège de France), Albert Menkveld (VU University
    Amsterdam), Vincent Millot (Université Paris-Diderot) and Nizar Touzi
    (Ecole Polytechnique). The authors also would like to thank two anonymous
    referees for their suggestions.
  </acknowledgements>

  <\thebibliography|>
    <bibitem|amihud1980deallership>Amihud, Y., Mendelson, H.: Dealership
    Market. Market-Making with Inventory. <newblock>Journal of Financial
    Economics <with|font-series|bold|8>, 31\U53 (1980)

    <bibitem|amihud1986asset>Amihud, Y., Mendelson, H.: Asset pricing and the
    bid-ask spread. <newblock>Journal of Financial Economics
    <with|font-series|bold|17>(2), 223\U249 (1986)

    <bibitem|avellaneda2008high>Avellaneda, M., Stoikov, S.: High-frequency
    trading in a limit order book. <newblock>Quantitative Finance
    <with|font-series|bold|8>(3), 217\U224 (2008).

    <bibitem|bayraktar2011liquidation>Bayraktar, E., Ludkovski, M.:
    Liquidation in limit order books with controlled intensity.
    <newblock>Arxiv preprint arXiv:1105.0247 (2011)

    <bibitem|benston1974determinants>Benston<nbsp>Robert, L., George, J.:
    Determinants of bid-asked spreads in the over-the-counter market.
    <newblock>Journal of Financial Economics <with|font-series|bold|1>(4),
    353\U364 (1974)

    <bibitem|cartea2010modeling>Á.<nbsp>Cartea and S.<nbsp>Jaimungal.
    <newblock>Modeling asset prices for algorithmic and high frequency
    trading. <newblock>2010.

    <bibitem|cartea2012risk>Á.<nbsp>Cartea and S.<nbsp>Jaimungal.
    <newblock>Risk measures and fine tuning of high frequency trading
    strategies. <newblock>2012.

    <bibitem|cartea2011buy>Cartea, Á., Jaimungal, S., Ricci, J.: Buy low sell
    high: A high frequency trading perspective (2011)

    <bibitem|cohen1979market>Cohen, K.J., Maier, S.F., Schwartz, R.A.,
    Whitcomb, D.K.: Market makers and the market spread: A review of recent
    literature. <newblock>Journal of Financial and Quantitative Analysis
    <with|font-series|bold|14>(04), 813\U835 (1979)

    <bibitem|cohen1981transaction>Cohen, K.J., Maier, S.F., Schwartz, R.A.,
    Whitcomb, D.K.: Transaction Costs, Order Placement Strategy, and
    Existence of the Bid-Ask Spread. <newblock>The Journal of Political
    Economy <with|font-series|bold|89>(2), 287\U305 (1981).

    <bibitem|garman1976market>Garman, M.B.: Market microstructure.
    <newblock>Journal of Financial Economics <with|font-series|bold|3>(3),
    257\U275 (1976)

    <bibitem|GLFT>Guéant, O., Lehalle, C.A., Fernandez-Tapia, J.: Optimal
    Execution with Limit Orders. <newblock>Working paper (2011)

    <bibitem|gueant2012PDE>Guéant, O., Lehalle, C.A.: Existence and
    Uniqueness for the Avellaneda-Stoikov PDE. <newblock>Working paper (2012)

    <bibitem|guilbaud2011optimal>Guilbaud, F., Pham, H.: Optimal high
    frequency trading with limit and market orders (2011)

    <bibitem|guilbaud2012optimal>F.<nbsp>Guilbaud and H.<nbsp>Pham.
    <newblock>Optimal high frequency trading in a pro-rata microstructure
    with predictive information. <newblock><with|font-shape|italic|Arxiv
    preprint arXiv:1205.3051>, 2012.

    <bibitem|hendershott2009price>Hendershott, T., Menkveld, A.: Price
    pressures. <newblock>Manuscript, VU University Amsterdam (2009)

    <bibitem|ho1981optimal>Ho, T., Stoll, H.R.: Optimal dealer pricing under
    transactions and return uncertainty. <newblock>Journal of Financial
    Economics <with|font-series|bold|9>(1), 47\U73 (1981).

    <bibitem|ho1984dealer>Ho, T.S.Y., Macris, R.G.: Dealer bid-ask quotes and
    transaction prices: An empirical study of some AMEX options.
    <newblock>Journal of Finance pp. 23\U45 (1984)

    <bibitem|ho1983dynamics>Ho, T.S.Y., Stoll, H.R.: The dynamics of dealer
    markets under competition. <newblock>Journal of Finance
    <with|font-series|bold|38>(4), 1053\U1074 (1983)

    <bibitem|citeulike:7621540>Lehalle, C.A., Guéant, O., Razafinimanana, J.:
    High Frequency Simulations of an Order Book: a Two-Scales Approach.
    <newblock>In: F.<nbsp>Abergel, B.K. Chakrabarti, A.<nbsp>Chakraborti,
    M.<nbsp>Mitra (eds.) Econophysics of Order-Driven Markets, New Economic
    Windows. Springer (2010)

    <bibitem|madhavan1993analysis>Madhavan, A., Smidt, S.: An analysis of
    changes in specialist inventories and quotations. <newblock>The Journal
    of Finance <with|font-series|bold|48>(5), 1595\U1628 (1993)

    <bibitem|citeulike:8423311>Menkveld, A.J.: High Frequency Trading and The
    New-Market Makers. <newblock>Social Science Research Network Working
    Paper Series (2010).

    <bibitem|mildenstein1983optimal>Mildenstein, E., Schleef, H.: The optimal
    pricing policy of a monopolistic marketmaker in the equity market.
    <newblock>Journal of Finance pp. 218\U231 (1983)

    <bibitem|o1986microeconomics>O'Hara, M., Oldfield, G.S.: The
    microeconomics of market making. <newblock>Journal of Financial and
    Quantitative Analysis <with|font-series|bold|21>(04), 361\U376 (1986)

    <bibitem|roll1984simple>Roll, R.: A simple implicit measure of the
    effective bid-ask spread in an efficient market. <newblock>Journal of
    Finance <with|font-series|bold|39>(4), 1127\U1139 (1984)
  </thebibliography>

  <section*|Appendix: Proofs of the results>

  <no-indent><with|font-series|bold|Proof of Proposition 1, Proposition 2 and
  Theorem 1:><next-line>

  Let us consider a family <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>>
  of positive functions solution of the system of ODEs introduced in
  Proposition 1 and let us define <math|u<around|(|t,x,q,s|)>=-exp
  <around*|(|-\<gamma\>*<around|(|x+q*s|)>|)>*v<rsub|q><around|(|t|)><rsup|-<frac|\<gamma\>|k>>>.<next-line>

  Then:

  <\equation*>
    \<partial\><rsub|t>*u+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u=-<frac|\<gamma\>|k>*<frac|<wide|v|\<dot\>><rsub|q><around|(|t|)>|v<rsub|q><around|(|t|)>>*u+<frac|\<gamma\><rsup|2>*\<sigma\><rsup|2>|2>*q<rsup|2>*u
  </equation*>

  Now, concerning the hamiltonian parts, we have for the bid part
  (<math|q\<neq\>Q>):

  <\equation*>
    sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    <around*|\<nobracket\>|=sup<rsub|\<delta\><rsup|b>>
    A*e<rsup|-k*\<delta\><rsup|b>>*u<around|(|t,x,q,s|)><around*|[|exp|(>-\<gamma\>*\<delta\><rsup|b>)<around*|(|<frac|v<rsub|q+1><around|(|t|)>|v<rsub|q><around|(|t|)>>|)><rsup|-<frac|\<gamma\>|k>>-1|]>
  </equation*>

  The first order condition of this problem corresponds to a maximum (because
  <math|u> is negative) and writes:

  <\equation*>
    <around|(|k+\<gamma\>|)>*exp (-\<gamma\>*\<delta\><rsup|b\<ast\>>)<around*|(|<frac|v<rsub|q+1><around|(|t|)>|v<rsub|q><around|(|t|)>>|)><rsup|-<frac|\<gamma\>|k>>=k
  </equation*>

  Hence:

  <\equation*>
    \<delta\><rsup|b\<ast\>>=<frac|1|k>*ln
    <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q+1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>
  </equation*>

  and

  <\equation*>
    sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k+\<gamma\>>*A*exp (-k*\<delta\><rsup|b\<ast\>>)u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>*A|k+\<gamma\>>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|-<frac|k|\<gamma\>>>*<frac|v<rsub|q+1><around|(|t|)>|v<rsub|q><around|(|t|)>>*u<around|(|t,x,q,s|)>
  </equation*>

  Similarly, the maximizer for the ask part (for <math|q\<neq\>-Q>) is:

  <\equation*>
    \<delta\><rsup|a\<ast\>>=<frac|1|k>*ln
    <around*|(|<frac|v<rsub|q><around|(|t|)>|v<rsub|q-1><around|(|t|)>>|)>+<frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>
  </equation*>

  and

  <\equation*>
    sup<rsub|\<delta\><rsup|a>> \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>*<around*|[|u*<around|(|t,x+s+\<delta\><rsup|a>,q-1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k+\<gamma\>>*A*exp (-k*\<delta\><rsup|a\<ast\>>)u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>*A|k+\<gamma\>>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|-<frac|k|\<gamma\>>>*<frac|v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)>>*u<around|(|t,x,q,s|)>
  </equation*>

  Hence, putting the terms altogether we get for
  <math|<around|\||q|\|>\<less\>Q>:

  <\equation*>
    \<partial\><rsub|t>*u<around|(|t,x,q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|a>> \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>*<around*|[|u*<around|(|t,x+s+\<delta\><rsup|a>,q-1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|<wide|v|\<dot\>><rsub|q><around|(|t|)>|v<rsub|q><around|(|t|)>>*u+<frac|\<gamma\><rsup|2>*\<sigma\><rsup|2>|2>*q<rsup|2>*u-<frac|\<gamma\>*A|k+\<gamma\>>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|<frac|k|\<gamma\>>>*<around*|[|<frac|v<rsub|q+1><around|(|t|)>|v<rsub|q><around|(|t|)>>+<frac|v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)>>|]>*u
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|u|v<rsub|q><around|(|t|)>>*<around*|[|<wide|v|\<dot\>><rsub|q><around|(|t|)>-<frac|k*\<gamma\>*\<sigma\><rsup|2>|2>*q<rsup|2>*v<rsub|q><around|(|t|)>+A*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|-<around*|(|1+<frac|k|\<gamma\>>|)>>*<around|(|v<rsub|q+1><around|(|t|)>+v<rsub|q-1><around|(|t|)>|)>|]>=0
  </equation*>

  For <math|q=-Q> we have:

  <\equation*>
    \<partial\><rsub|t>*u<around|(|t,x,q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|b>> \<lambda\><rsup|b><around|(|\<delta\><rsup|b>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|b>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|<wide|v|\<dot\>><rsub|q><around|(|t|)>|v<rsub|q><around|(|t|)>>*u+<frac|\<gamma\><rsup|2>*\<sigma\><rsup|2>|2>*q<rsup|2>*u-<frac|\<gamma\>*A|k+\<gamma\>>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|<frac|k|\<gamma\>>>*<frac|v<rsub|q+1><around|(|t|)>|v<rsub|q><around|(|t|)>>*u
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|u|v<rsub|q><around|(|t|)>>*<around*|[|<wide|v|\<dot\>><rsub|q><around|(|t|)>-<frac|k*\<gamma\>*\<sigma\><rsup|2>|2>*q<rsup|2>*v<rsub|q><around|(|t|)>+A*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|-<around*|(|1+<frac|k|\<gamma\>>|)>>*v<rsub|q+1><around|(|t|)>|]>=0
  </equation*>

  Similarly, for <math|q=Q> we have:

  <\equation*>
    \<partial\><rsub|t>*u<around|(|t,x,q,s|)>+<frac|1|2>*\<sigma\><rsup|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +sup<rsub|\<delta\><rsup|a>> \<lambda\><rsup|a><around|(|\<delta\><rsup|a>|)>*<around*|[|u*<around|(|t,x-s+\<delta\><rsup|a>,q+1,s|)>-u<around|(|t,x,q,s|)>|]>
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|<wide|v|\<dot\>><rsub|q><around|(|t|)>|v<rsub|q><around|(|t|)>>*u+<frac|\<gamma\><rsup|2>*\<sigma\><rsup|2>|2>*q<rsup|2>*u-<frac|\<gamma\>*A|k+\<gamma\>>*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|<frac|k|\<gamma\>>>*<frac|v<rsub|q-1><around|(|t|)>|v<rsub|q><around|(|t|)>>*u
  </equation*>

  <\equation*>
    =-<frac|\<gamma\>|k>*<frac|u|v<rsub|q><around|(|t|)>>*<around*|[|<wide|v|\<dot\>><rsub|q><around|(|t|)>-<frac|k*\<gamma\>*\<sigma\><rsup|2>|2>*q<rsup|2>*v<rsub|q><around|(|t|)>+A*<around*|(|1+<frac|\<gamma\>|k>|)><rsup|-<around*|(|1+<frac|k|\<gamma\>>|)>>*v<rsub|q-1><around|(|t|)>|]>=0
  </equation*>

  Now, noticing that the terminal condition for <math|v<rsub|q>> is
  consistent with the terminal condition for <math|u>, we get that <math|u>
  verifies (HJB) and this proves Proposition 1.<next-line>

  The positivity of the functions <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>>
  was essential in the definition of <math|u>. Hence we need to prove that
  the solution to the above linear system of ordinary differential equations,
  namely <math|v<around|(|t|)>=exp (-M*<around|(|T-t|)>)\<times\><around|(|1,\<ldots\>,1|)><rprime|'>>
  (where <math|M> is given in Proposition 2), defines a family
  <math|<around|(|v<rsub|q>|)><rsub|<around|\||q|\|>\<le\>Q>> of positive
  functions.<next-line>

  In fact, we are going to prove that:

  <\equation*>
    \<forall\>t\<in\><around|[|0,T|]>,\<forall\>q\<in\>{-Q,\<ldots\>,Q},<space|1em>v<rsub|q><around|(|t|)>\<ge\>e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t|)>>
  </equation*>

  If this was not true then there would exist <math|\<epsilon\>\<gtr\>0> such
  that:

  <\equation*>
    min<rsub|t\<in\><around|[|0,T|]>,<around|\||q|\|>\<le\>Q>
    e<rsup|-2*\<eta\>*<around|(|T-t|)>>*<around*|(|v<rsub|q><around|(|t|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t|)>>|)>+\<epsilon\>*<around|(|T-t|)>\<less\>0
  </equation*>

  But this minimum is achieved at some point
  <math|<around|(|t<rsup|\<ast\>>,q<rsup|\<ast\>>|)>> with
  <math|t<rsup|\<ast\>>\<less\>T> and hence:

  <\equation*>
    <frac|d|d*t>*<around*|\<nobracket\>|e<rsup|-2*\<eta\>*<around|(|T-t|)>>*<around*|(|v<rsub|q<rsup|\<ast\>>><around|(|t|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t|)>>|)>|\|><rsub|t=t<rsup|\<ast\>>>\<ge\>\<epsilon\>
  </equation*>

  This gives:

  <\equation*>
    2*\<eta\>*e<rsup|-2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>*<around*|(|v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>|)>
  </equation*>

  <\equation*>
    +e<rsup|-2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>*<around*|(|v<rprime|'><rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>|)>\<ge\>\<epsilon\>
  </equation*>

  Hence:

  <\equation*>
    2*\<eta\>*v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>+v<rprime|'><rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>-<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  Now, if <math|<around|\||q<rsup|\<ast\>>|\|>\<less\>Q>, this gives:

  <\equation*>
    \<alpha\>*q<rsup|\<ast\>><rsup|2>*v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>-\<eta\>*<around|(|v<rsub|q<rsup|\<ast\>>+1><around|(|t<rsup|\<ast\>>|)>-2*v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>+v<rsub|q<rsup|\<ast\>>-1><around|(|t<rsup|\<ast\>>|)>|)>
  </equation*>

  <\equation*>
    -<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  Thus:

  <\equation*>
    \<alpha\>*q<rsup|\<ast\>><rsup|2>*<around*|(|v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>|)>-\<eta\>*<around|(|v<rsub|q<rsup|\<ast\>>+1><around|(|t<rsup|\<ast\>>|)>-2*v<rsub|q<rsup|\<ast\>>><around|(|t<rsup|\<ast\>>|)>+v<rsub|q<rsup|\<ast\>>-1><around|(|t<rsup|\<ast\>>|)>|)>
  </equation*>

  <\equation*>
    -<around|(|\<eta\>+\<alpha\>*<around|(|Q<rsup|2>-q<rsup|\<ast\>><rsup|2>|)>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  All the terms on the left hand side are nonpositive by definition of
  <math|<around|(|t<rsup|\<ast\>>,q<rsup|\<ast\>>|)>> and this gives a
  contradiction.<next-line>

  If <math|q<rsup|\<ast\>>=Q>, we have:

  <\equation*>
    <around|(|\<alpha\>*Q<rsup|2>+\<eta\>|)>*v<rsub|Q><around|(|t<rsup|\<ast\>>|)>-\<eta\>*<around|(|v<rsub|Q-1><around|(|t<rsup|\<ast\>>|)>-v<rsub|Q><around|(|t<rsup|\<ast\>>|)>|)>
  </equation*>

  <\equation*>
    -<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  Thus:

  <\equation*>
    -\<eta\>*<around|(|v<rsub|Q-1><around|(|t<rsup|\<ast\>>|)>-v<rsub|Q><around|(|t<rsup|\<ast\>>|)>|)>+<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*<around*|(|v<rsub|Q><around|(|t<rsup|\<ast\>>|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>|)>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  All the terms on the left hand side are nonpositive by definition of
  <math|<around|(|t<rsup|\<ast\>>,q<rsup|\<ast\>>|)>=<around|(|t<rsup|\<ast\>>,Q|)>>
  and this gives a contradiction.<next-line>

  Similarly, if <math|q<rsup|\<ast\>>=-Q>, we have:

  <\equation*>
    <around|(|\<alpha\>*Q<rsup|2>+\<eta\>|)>*v<rsub|-Q><around|(|t<rsup|\<ast\>>|)>-\<eta\>*<around|(|v<rsub|-Q+1><around|(|t<rsup|\<ast\>>|)>-v<rsub|Q><around|(|t<rsup|\<ast\>>|)>|)>
  </equation*>

  <\equation*>
    -<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  <\equation*>
    -\<eta\>*<around|(|v<rsub|-Q+1><around|(|t<rsup|\<ast\>>|)>-v<rsub|-Q><around|(|t<rsup|\<ast\>>|)>|)>+<around|(|\<eta\>+\<alpha\>*Q<rsup|2>|)>*<around*|(|v<rsub|-Q><around|(|t<rsup|\<ast\>>|)>-e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t<rsup|\<ast\>>|)>>|)>\<ge\>\<epsilon\>*e<rsup|2*\<eta\>*<around|(|T-t<rsup|\<ast\>>|)>>
  </equation*>

  All the terms on the left hand side are nonpositive by definition of
  <math|<around|(|t<rsup|\<ast\>>,q<rsup|\<ast\>>|)>=<around|(|t<rsup|\<ast\>>,-Q|)>>
  and this gives a contradiction.<next-line>

  As a consequence, <math|v<rsub|q><around|(|t|)>\<ge\>e<rsup|-<around|(|\<alpha\>*Q<rsup|2>-\<eta\>|)>*<around|(|T-t|)>>\<gtr\>0>
  and this completes the proof of Proposition 2.<next-line>

  Combining the above results, we see that <math|u>, as defined in Theorem 1,
  is a solution of (HJB). Then, we are going to use a verification argument
  to prove that <math|u> is the value function of the optimal control problem
  under consideration and prove subsequently that the optimal controls are as
  given in Theorem 1.<next-line>

  Let us consider processes <math|<around|(|\<nu\><rsup|b>|)>> and
  <math|<around|(|\<nu\><rsup|a>|)>\<in\><with|math-font|cal|A>>. Let
  <math|t\<in\><around|[|0,T|)>> and let us consider the following processes
  for <math|\<tau\>\<in\><around|[|t,T|]>>:

  <\equation*>
    d*S<rsup|t,s><rsub|\<tau\>>=\<sigma\>*d*W<rsub|\<tau\>>,<space|2em>S<rsup|t,s><rsub|t>=s
  </equation*>

  <\equation*>
    d*X<rsup|t,x,\<nu\>><rsub|\<tau\>>=<around|(|S<rsub|\<tau\>>+\<nu\><rsup|a><rsub|\<tau\>>|)>*d*N<rsup|a><rsub|\<tau\>>-<around|(|S<rsub|\<tau\>>-\<nu\><rsup|b><rsub|\<tau\>>|)>*d*N<rsup|b><rsub|\<tau\>>,<space|2em>X<rsup|t,x,\<nu\>><rsub|t>=x
  </equation*>

  <\equation*>
    d*q<rsup|t,q,\<nu\>><rsub|\<tau\>>=d*N<rsup|b><rsub|\<tau\>>-d*N<rsup|a><rsub|\<tau\>>,<space|2em>q<rsup|t,q,\<nu\>><rsub|t>=q
  </equation*>

  where the point process <math|N<rsup|b>> has intensity
  <math|<around|(|\<lambda\><rsup|b><rsub|\<tau\>>|)><rsub|\<tau\>>> with
  <math|\<lambda\><rsup|b><rsub|\<tau\>>=A*e<rsup|-k*\<nu\><rsup|b><rsub|\<tau\>>>*1<rsub|q<rsub|\<tau\>->\<less\>Q>>
  and where the point process <math|N<rsup|a>> has intensity
  <math|<around|(|\<lambda\><rsup|a><rsub|\<tau\>>|)><rsub|\<tau\>>> with
  <math|\<lambda\><rsup|a><rsub|\<tau\>>=A*e<rsup|-k*\<nu\><rsup|a><rsub|\<tau\>>>*1<rsub|q<rsub|\<tau\>->\<gtr\>-Q>>
  <footnote|These intensities are bounded since <math|\<nu\><rsup|b>> and
  <math|\<nu\><rsup|a>> are bounded from below.>.<next-line>

  Now, since <math|u> is smooth, let us write Itô's formula for <math|u>,
  between <math|t> and <math|t<rsub|n>> where <math|t<rsub|n>=T\<wedge\>inf
  <around|{|\<tau\>\<gtr\>t,<around|\||S<rsub|\<tau\>>-s|\|>\<ge\>n<with|math-font-family|rm|<space|0.27em>
  or<space|0.27em> ><around|\||N<rsup|a><rsub|\<tau\>>-N<rsup|a><rsub|t>|\|>\<ge\>n<with|math-font-family|rm|<space|0.27em>
  or<space|0.27em> ><around|\||N<rsup|b><rsub|\<tau\>>-N<rsup|b><rsub|t>|\|>\<ge\>n|}>>
  (<math|n\<in\><with|math-font|Bbb|N>>):

  <\equation*>
    u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>=u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|\<partial\><rsub|\<tau\>>*u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>+<frac|\<sigma\><rsup|2>|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*d*\<tau\>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->+S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|a><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->-1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*\<lambda\><rsup|a><rsub|\<tau\>>*d*\<tau\>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->-S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|b><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->+1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*\<lambda\><rsup|b><rsub|\<tau\>>*d*\<tau\>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>>\<sigma\>*\<partial\><rsub|s>*u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>*d*W<rsub|\<tau\>>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->+S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|a><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->-1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*d*M<rsup|a><rsub|\<tau\>>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->-S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|b><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->+1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*d*M<rsup|b><rsub|\<tau\>>
  </equation*>

  where <math|M<rsup|b>> and <math|M<rsup|a>> are the compensated processes
  associated respectively to <math|N<rsup|b>> and <math|N<rsup|a>> for the
  intensity processes <math|<around|(|\<lambda\><rsup|b><rsub|\<tau\>>|)><rsub|\<tau\>>>
  and <math|<around|(|\<lambda\><rsup|a><rsub|\<tau\>>|)><rsub|\<tau\>>>.<next-line>

  Now, because each <math|v<rsub|q>> is continuous and positive on a compact
  set, it has a positive lower bound and <math|v<rsub|q<rsub|\<tau\>>><around|(|\<tau\>|)><rsup|-<frac|\<gamma\>|k>>>
  is bounded along the trajectory, independently of the trajectory. Also,
  because <math|\<nu\><rsup|b>> and <math|\<nu\><rsup|a>> are bounded from
  below, and because of the definition of <math|t<rsub|n>>, all the terms in
  the above stochastic integrals are bounded and, local martingales being in
  fact martingales, we have:

  <\equation*>
    <with|math-font|Bbb|E><around*|[|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>|]>=u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    +<with|math-font|Bbb|E><around*|[|<big|int><rsub|t><rsup|t<rsub|n>><around*|(|\<partial\><rsub|\<tau\>>*u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>+<frac|\<sigma\><rsup|2>|2>*\<partial\><rsup|2><rsub|s*s>*u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*d*\<tau\>|\<nobracket\>>
  </equation*>

  <\equation*>
    +<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->+S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|a><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->-1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*\<lambda\><rsup|a><rsub|\<tau\>>*d*\<tau\>
  </equation*>

  <\equation*>
    <around*|\<nobracket\>|+<big|int><rsub|t><rsup|t<rsub|n>><around*|(|u*<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->-S<rsup|t,s><rsub|\<tau\>>+\<nu\><rsup|b><rsub|\<tau\>>,q<rsup|t,q,\<nu\>><rsub|\<tau\>->+1,S<rsup|t,s><rsub|\<tau\>>|)>-u<around|(|\<tau\>,X<rsup|t,x,\<nu\>><rsub|\<tau\>->,q<rsup|t,q,\<nu\>><rsub|\<tau\>->,S<rsup|t,s><rsub|\<tau\>>|)>|)>*\<lambda\><rsup|b><rsub|\<tau\>>*d*\<tau\>|]>
  </equation*>

  Using the fact that <math|u> solves (HJB), we then have that

  <\equation*>
    <with|math-font|Bbb|E><around*|[|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>|]>\<le\>u<around|(|t,x,q,s|)>
  </equation*>

  with equality when the controls are taken equal the maximizers of the
  hamiltonians (these controls being in <math|<with|math-font|cal|A>> because
  <math|v> is bounded and has a positive lower bounded).<next-line>

  Now, if we prove that

  <\equation*>
    lim<rsub|n\<to\>\<infty\>> <with|math-font|Bbb|E><around*|[|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>|]>=<with|math-font|Bbb|E><around*|[|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T>,q<rsup|t,q,\<nu\>><rsub|T>,S<rsup|t,s><rsub|T>|)>|]>
  </equation*>

  we will have that for all controls in <math|<with|math-font|cal|A>>:

  <\equation*>
    <with|math-font|Bbb|E><around*|[|-exp
    <around*|(|-\<gamma\>*<around|(|X<rsup|t,x,\<nu\>><rsub|T>+q<rsup|t,q,\<nu\>><rsub|T>*S<rsup|t,s><rsub|T>|)>|)>|]>=<with|math-font|Bbb|E><around*|[|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T>,q<rsup|t,q,\<nu\>><rsub|T>,S<rsup|t,s><rsub|T>|)>|]>\<le\>u<around|(|t,x,q,s|)>
  </equation*>

  with equality for <math|\<nu\><rsup|b><rsub|t>=\<delta\><rsup|b\<ast\>><around|(|t,q<rsub|t->|)>>
  and <math|\<nu\><rsup|a><rsub|t>=\<delta\><rsup|a\<ast\>><around|(|t,q<rsub|t->|)>>.
  Hence:

  <\equation*>
    sup<rsub|<around|(|\<nu\><rsub|t><rsup|a>|)><rsub|t>,<around|(|\<nu\><rsub|t><rsup|b>|)><rsub|t>\<in\><with|math-font|cal|A>>
    <with|math-font|Bbb|E><around*|[|-exp
    <around*|(|-\<gamma\>*<around|(|X<rsup|t,x,\<nu\>><rsub|T>+q<rsup|t,q,\<nu\>><rsub|T>*S<rsup|t,s><rsub|T>|)>|)>|]>=u<around|(|t,x,q,s|)>
  </equation*>

  <\equation*>
    =<with|math-font|Bbb|E><around*|[|-exp
    <around*|(|-\<gamma\>*<around|(|X<rsup|t,x,\<delta\><rsup|\<ast\>>><rsub|T>+q<rsup|t,q,\<delta\><rsup|\<ast\>>><rsub|T>*S<rsup|t,s><rsub|T>|)>|)>|]>
  </equation*>

  and this will give the result.<next-line>

  It remains to prove that

  <\equation*>
    lim<rsub|n\<to\>\<infty\>> <with|math-font|Bbb|E><around*|[|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>|]>=<with|math-font|Bbb|E><around*|[|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T>,q<rsup|t,q,\<nu\>><rsub|T>,S<rsup|t,s><rsub|T>|)>|]>
  </equation*>

  First, we have, almost surely, that <math|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>>
  tends towards <math|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T->,q<rsup|t,q,\<nu\>><rsub|T->,S<rsup|t,s><rsub|T>|)>>.
  Then, in order to prove that the sequence is uniformly integrable we will
  bound it in <math|L<rsup|2>>. However, because of the uniform lower bound
  on <math|v> already used early, it is sufficient to bound <math|exp
  (-\<gamma\>*<around|(|X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->+q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->*S<rsup|t,s><rsub|t<rsub|n>>|)>)>
  in <math|L<rsup|2>>.<next-line>

  But,

  <\equation*>
    X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->+q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->*S<rsup|t,s><rsub|t<rsub|n>>=<big|int><rsub|t><rsup|t<rsub|n>>\<nu\><rsup|a><rsub|\<tau\>>*d*N<rsup|a><rsub|\<tau\>>+<big|int><rsub|t><rsup|t<rsub|n>>\<nu\><rsup|b><rsub|\<tau\>>*d*N<rsup|b><rsub|\<tau\>>+\<sigma\>*<big|int><rsub|t><rsup|t<rsub|n>>q<rsup|t,q,\<nu\>><rsub|\<tau\>>*d*W<rsub|\<tau\>>
  </equation*>

  <\equation*>
    \<ge\>-<around|\<\|\|\>|\<nu\><rsup|a><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|a><rsub|T>-<around|\<\|\|\>|\<nu\><rsup|b><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|b><rsub|T>+\<sigma\>*<big|int><rsub|t><rsup|t<rsub|n>>q<rsup|t,q,\<nu\>><rsub|\<tau\>>*d*W<rsub|\<tau\>>
  </equation*>

  Hence

  <eqnarray*|<tformat|<table|<row|<cell|>|<cell|>|<cell|<around*|\<nobracket\>|<with|math-font|Bbb|E><around*|[|exp|(>-2*\<gamma\>*<around|(|X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->+q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->*S<rsup|t,s><rsub|t<rsub|n>>|)>)|]>>>|<row|<cell|>|<cell|\<le\>>|<cell|<with|math-font|Bbb|E><around*|[|exp
  <around*|(|2*\<gamma\><around|\<\|\|\>|\<nu\><rsup|a><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|a><rsub|T>|)>*exp
  <around*|(|2*\<gamma\><around|\<\|\|\>|\<nu\><rsup|a><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|b><rsub|T>|)>*exp
  <around*|(|-2*\<gamma\>*\<sigma\>*<big|int><rsub|t><rsup|t<rsub|n>>q<rsup|t,q,\<nu\>><rsub|\<tau\>>*d*W<rsub|\<tau\>>|)>|]>>>|<row|<cell|>|<cell|\<le\>>|<cell|<with|math-font|Bbb|E><around*|[|exp
  <around*|(|6*\<gamma\><around|\<\|\|\>|\<nu\><rsup|a><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|a><rsub|T>|)>|]><rsup|<frac|1|3>><with|math-font|Bbb|E><around*|[|exp
  <around*|(|6*\<gamma\><around|\<\|\|\>|\<nu\><rsup|b><rsub|->|\<\|\|\>><rsub|\<infty\>>*N<rsup|b><rsub|T>|)>|]><rsup|<frac|1|3>>>>|<row|<cell|>|<cell|>|<cell|\<times\><with|math-font|Bbb|E><around*|[|exp
  <around*|(|-6*\<gamma\>*\<sigma\>*<big|int><rsub|t><rsup|t<rsub|n>>q<rsup|t,q,\<nu\>><rsub|\<tau\>>*d*W<rsub|\<tau\>>|)>|]><rsup|<frac|1|3>>>>|<row|<cell|>|<cell|>|<cell|>>>>>

  Now, since the intensity of each point process is bounded, the point
  processes have a Laplace transform and the first two terms of the product
  are finite (and independent of <math|n>). Concerning the third term,
  because <math|<around|\||q<rsup|t,q,\<nu\>><rsub|\<tau\>>|\|>> is bounded
  by <math|Q>, we know (for instance applying Girsanov's theorem) that:

  <\equation*>
    <with|math-font|Bbb|E><around*|[|exp <around*|(|-6*\<gamma\>*\<sigma\>*<big|int><rsub|t><rsup|t<rsub|n>>q<rsup|t,q,\<nu\>><rsub|\<tau\>>*d*W<rsub|\<tau\>>|)>|]><rsup|<frac|1|3>>\<le\><with|math-font|Bbb|E><around*|[|exp
    <around*|(|3*\<gamma\><rsup|2>*\<sigma\><rsup|2>*<around|(|t<rsub|n>-t|)>*Q<rsup|2>|)>|]><rsup|<frac|1|3>>
  </equation*>

  <\equation*>
    \<le\>exp <around*|(|\<gamma\><rsup|2>*\<sigma\><rsup|2>*Q<rsup|2>*T|)>
  </equation*>

  Hence, the sequence is bounded in <math|L<rsup|2>>, then uniformly
  integrable and we have:

  <\equation*>
    lim<rsub|n\<to\>\<infty\>> <with|math-font|Bbb|E><around*|[|u<around|(|t<rsub|n>,X<rsup|t,x,\<nu\>><rsub|t<rsub|n>->,q<rsup|t,q,\<nu\>><rsub|t<rsub|n>->,S<rsup|t,s><rsub|t<rsub|n>>|)>|]>=<with|math-font|Bbb|E><around*|[|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T->,q<rsup|t,q,\<nu\>><rsub|T->,S<rsup|t,s><rsub|T>|)>|]>
  </equation*>

  <\equation*>
    =<with|math-font|Bbb|E><around*|[|u<around|(|T,X<rsup|t,x,\<nu\>><rsub|T>,q<rsup|t,q,\<nu\>><rsub|T>,S<rsup|t,s><rsub|T>|)>|]>
  </equation*>

  We have proved that <math|u> is the value function and that
  <math|\<delta\><rsup|b\<ast\>>> and <math|\<delta\><rsup|a\<ast\>>> are
  optimal controls.<next-line><math|\<Box\>>

  <no-indent><with|font-series|bold|Proof of Theorem 2:><next-line>

  Let us first consider the matrix <math|M+2*\<eta\>*I>. This matrix is a
  symmetric matrix and it is therefore diagonalizable. Its smallest
  eigenvalue <math|\<lambda\>> is characterized by:

  <\equation*>
    \<lambda\>=<below|inf|x\<in\><with|math-font|Bbb|R><rsup|2*Q+1>\<setminus\><around|{|0|}>><frac|x<rprime|'>*<around|(|M+2*\<eta\>*I|)>*x|x<rprime|'>*x>
  </equation*>

  and the associated eigenvectors <math|x\<ne\>0> are characterized by:

  <\equation*>
    \<lambda\>=<frac|x<rprime|'>*<around|(|M+2*\<eta\>*I|)>*x|x<rprime|'>*x>
  </equation*>

  It is straightforward to see that:

  <\equation*>
    x<rprime|'>*<around|(|M+2*\<eta\>*I|)>*x=<big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2>*x<rsub|q><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|x<rsub|q+1>-x<rsub|q>|)><rsup|2>+\<eta\>*x<rsub|Q><rsup|2>+\<eta\>*x<rsub|-Q><rsup|2>
  </equation*>

  Hence, if <math|x> is an eigenvector of <math|M+2*\<eta\>*I> associated to
  <math|\<lambda\>>:

  <\equation*>
    \<lambda\>\<le\><frac|<around|\||x|\|><rprime|'>*<around|(|M+2*\<eta\>*I|)><around|\||x|\|>|<around|\||x|\|><rprime|'><around|\||x|\|>>
  </equation*>

  <\equation*>
    =<frac|1|<around|\||x|\|><rprime|'><around|\||x|\|>>*<around*|[|<big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2><around|\||x<rsub|q>|\|><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|<around|\||x<rsub|q+1>|\|>-<around|\||x<rsub|q>|\|>|)><rsup|2>+\<eta\><around|\||x<rsub|Q>|\|><rsup|2>+\<eta\><around|\||x<rsub|-Q>|\|><rsup|2>|]>
  </equation*>

  <\equation*>
    \<le\><frac|1|<around|\||x|\|><rprime|'><around|\||x|\|>>*<around*|[|<big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2><around|\||x<rsub|q>|\|><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|x<rsub|q+1>-x<rsub|q>|)><rsup|2>+\<eta\><around|\||x<rsub|Q>|\|><rsup|2>+\<eta\><around|\||x<rsub|-Q>|\|><rsup|2>|]>=\<lambda\>
  </equation*>

  This proves that <math|<around|\||x|\|>> is also an eigenvector and that
  necessarily <math|x<rsub|q+1>> and <math|x<rsub|q>> are of the same sign
  (<em|i.e.> <math|x<rsub|q>*x<rsub|q+1>\<ge\>0>).<next-line>

  Now, let <math|x\<ge\>0> be an eigenvector of <math|M+2*\<eta\>*I>
  associated to <math|\<lambda\>>.<next-line>

  If for some <math|q> with <math|<around|\||q|\|>\<less\>Q> we have
  <math|x<rsub|q>=0> then:

  <\equation*>
    0=\<lambda\>*x<rsub|q>=\<alpha\>*q<rsup|2>*x<rsub|q>-\<eta\>*<around|(|x<rsub|q+1>-2*x<rsub|q>+x<rsub|q-1>|)>=-\<eta\>*<around|(|x<rsub|q+1>+x<rsub|q-1>|)>\<le\>0
  </equation*>

  Hence, because <math|x\<ge\>0>, both <math|x<rsub|q+1>> and
  <math|x<rsub|q-1>> are equal to <math|0>. By immediate induction <math|x=0>
  and this is a contradiction.<next-line>

  Now, if <math|x<rsub|Q>=0>, then <math|0=\<lambda\>*x<rsub|Q>=\<alpha\>*Q<rsup|2>*x<rsub|Q>-\<eta\>(-2*x<rsub|Q>+x<rsub|Q-1>)=-\<eta\>*x<rsub|Q-1>\<le\>0>
  and hence <math|x<rsub|Q-1>=0>. Then, by the preceding reasoning we obtain
  a contradiction.<next-line>

  Similarly if <math|x<rsub|-Q>=0>, then <math|0=\<lambda\>*x<rsub|-Q>=\<alpha\>*Q<rsup|2>*x<rsub|-Q>-\<eta\>*<around|(|x<rsub|-Q+1>-2*x<rsub|-Q>|)>=-\<eta\>*x<rsub|-Q+1>\<le\>0>
  and hence <math|x<rsub|-Q+1>=0>. Then, as above, we obtain a
  contradiction.<next-line>

  This proves that any eigenvector <math|x\<ge\>0> of <math|M+2*\<eta\>*I>
  associated to <math|\<lambda\>> verifies in fact
  <math|x\<gtr\>0>.<next-line>

  Now, if the eigenvalue <math|\<lambda\>> was not simple, there would exist
  two eigenvectors <math|x> and <math|y> of <math|M+2*\<eta\>*I> associated
  to <math|\<lambda\>> such that <math|<around|\||x|\|><rprime|'>*y=0>.
  Hence, <math|y> must have positive coordinates and negative coordinates and
  since <math|y<rsub|q>*y<rsub|q+1>\<ge\>0>, we know that there must exist
  <math|q> such that <math|y<rsub|q>=0>. However, this contradicts our
  preceding point since <math|<around|\||y|\|>\<ge\>0> should also be an
  eigenvector of <math|M+2*\<eta\>*I> associated to <math|\<lambda\>> and it
  cannot have therefore coordinates equal to <math|0>.<next-line>

  As a conclusion, the eigenspace of <math|M+2*\<eta\>*I> associated to
  <math|\<lambda\>> is spanned by a vector <math|f<rsup|0>\<gtr\>0> and we
  scaled its <math|<with|math-font|Bbb|R><rsup|2*Q+1>>-norm to <math|1>.

  Now, because <math|M> is a symmetric matrix, we can write
  <math|v<around|(|0|)>=exp (-M*T)\<times\><around|(|1,\<ldots\>,1|)><rprime|'>>
  as:

  <\equation*>
    v<rsub|q><around|(|0|)>=<big|sum><rsub|i=0><rsup|2*Q>exp
    (-\<lambda\><rsup|i>*T)<around|\<langle\>|g<rsup|i>,<around|(|1,\<ldots\>,1|)><rprime|'>|\<rangle\>>*g<rsub|q><rsup|i>,<space|2em>\<forall\>q\<in\>{-Q,\<ldots\>,Q}
  </equation*>

  where <math|\<lambda\><rsup|0>\<le\>\<lambda\><rsup|1>\<le\>\<ldots\>\<le\>\<lambda\><rsup|2*Q>>
  are the eigenvalues of <math|M> (in increasing order and repeated if
  necessary) and <math|<around|(|g<rsup|i>|)><rsub|i>> an associated
  orthonormal basis of eigenvectors. Clearly, we can take
  <math|g<rsup|0>=f<rsup|0>>. Then, both <math|f<rsup|0><rsub|q>> and
  <math|<around|\<langle\>|f<rsup|0>,<around|(|1,\<ldots\>,1|)><rprime|'>|\<rangle\>>>
  are positive and hence different from zero. As a consequence:

  <\equation*>
    v<rsub|q><around|(|0|)>\<sim\><rsub|T\<to\>+\<infty\>>exp
    (-\<lambda\><rsup|0>*T)<around|\<langle\>|f<rsup|0>,<around|(|1,\<ldots\>,1|)><rprime|'>|\<rangle\>>*f<rsub|q><rsup|0>,<space|2em>\<forall\>q\<in\>{-Q,\<ldots\>,Q}
  </equation*>

  Then, using the expressions for the optimal quotes, we get:

  <\equation*>
    lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|b\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
    <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q+1>>|)>
  </equation*>

  <\equation*>
    lim<rsub|T\<to\>+\<infty\>> \<delta\><rsup|a\<ast\>><around|(|0,q|)>=<frac|1|\<gamma\>>*ln
    <around*|(|1+<frac|\<gamma\>|k>|)>+<frac|1|k>*ln
    <around*|(|<frac|f<rsup|0><rsub|q>|f<rsup|0><rsub|q-1>>|)>
  </equation*>

  Turning to the characterization of <math|f<rsup|0>> stated in Theorem 2, we
  just need to write the Rayleigh ratio associated to the smallest eigenvalue
  of <math|M+2*\<eta\>*I>:

  <\equation*>
    f<rsup|0>\<in\><below|<math-up|argmin>|f\<in\><with|math-font|Bbb|R><rsup|2*Q+1>,<around|\<\|\|\>|f|\<\|\|\>><rsub|2>=1>f<rprime|'>*<around|(|M+2*\<eta\>*I|)>*f
  </equation*>

  Equivalently:

  <\equation*>
    f<rsup|0>\<in\><below|<math-up|argmin>|f\<in\><with|math-font|Bbb|R><rsup|2*Q+1>,<around|\<\|\|\>|f|\<\|\|\>><rsub|2>=1><big|sum><rsub|q=-Q><rsup|Q>\<alpha\>*q<rsup|2>*f<rsub|q><rsup|2>+\<eta\>*<big|sum><rsub|q=-Q><rsup|Q-1><around|(|f<rsub|q+1>-f<rsub|q>|)><rsup|2>+\<eta\>*f<rsub|Q><rsup|2>+\<eta\>*f<rsub|-Q><rsup|2>
  </equation*>

  <math|\<Box\>>

  <with|font-series|bold|Proof of Proposition 3:><next-line>

  Let us first introduce <math|H=<around|{|u\<in\>L<rsup|1><rsub|l*o*c><around|(|<with|math-font|Bbb|R>|)>/x\<mapsto\>x*u<around|(|x|)>\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)><with|math-font-family|rm|<space|0.27em>
  and <space|0.27em> >u<rprime|'>\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>|}>>.<next-line><math|H>
  equipped with the norm <math|<around|\<\|\|\>|u|\<\|\|\>><rsub|H>=<sqrt|<big|int><rsub|<with|math-font|Bbb|R>><around*|(|\<alpha\>*x<rsup|2>*u<around|(|x|)><rsup|2>+\<eta\>*u<rprime|'><around|(|x|)><rsup|2>|)>*d*x>>
  is an Hilbert space.<next-line>

  Step 1: <math|H\<subset\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>> with
  continuous injection.<next-line>

  Let us consider <math|u\<in\>H> and <math|\<epsilon\>\<gtr\>0>.<next-line>

  We have:

  <\equation*>
    <big|int><rsub|<with|math-font|Bbb|R>\<setminus\>[-\<epsilon\>,\<epsilon\>]>u<around|(|x|)><rsup|2>*d*x\<le\><frac|1|\<epsilon\><rsup|2>>*<big|int><rsub|<with|math-font|Bbb|R>\<setminus\>[-\<epsilon\>,\<epsilon\>]>x<rsup|2>*u<around|(|x|)><rsup|2>*d*x\<less\>+\<infty\>
  </equation*>

  Hence because <math|u<rprime|'>\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>,
  we have <math|u\<in\>H<rsup|1>*<around|(|<with|math-font|Bbb|R>\<setminus\>|[>-\<epsilon\>,\<epsilon\>])>
  with a constant <math|C<rsub|\<epsilon\>>> independent of <math|u> such
  that <math|<around|\<\|\|\>|u|\<\|\|\>><rsub|H<rsup|1>*<around|(|<with|math-font|Bbb|R>\<setminus\>|[>-\<epsilon\>,\<epsilon\>])>\<le\>C<rsub|\<epsilon\>><around|\<\|\|\>|u|\<\|\|\>><rsub|H>>.
  In particular <math|u> is continuous on
  <math|<with|math-font|Bbb|R><rsup|\<ast\>>>.<next-line>

  Now, if <math|\<epsilon\>=1>, <math|\<forall\>x\<in\><around|(|0,1|)>,u<around|(|x|)>=u<around|(|1|)>-<big|int><rsub|x><rsup|1>u<rprime|'><around|(|t|)>*d*t>
  and then <math|<around|\||u<around|(|x|)>|\|>\<le\><around|\||u<around|(|1|)>|\|>+<sqrt|1-x><around|\<\|\|\>|u<rprime|'>|\<\|\|\>><rsub|L<rsup|2><around|(|<around|(|0,1|)>|)>>>.<next-line>

  Because the injection of <math|H<rsup|1><around|(|<around|(|1,+\<infty\>|)>|)>>
  in <math|C<around|(|<around|[|1,+\<infty\>|)>|)>> is continuous, we know
  that there exists a constant <math|C> independent of <math|u> such that
  <math|<around|\||u<around|(|1|)>|\|>\<le\>C<around|\<\|\|\>|u|\<\|\|\>><rsub|H<rsup|1><around|(|<around|(|1,+\<infty\>|)>|)>>>.
  Hence, there exists a constant <math|C<rprime|'>> such that
  <math|<around|\||u<around|(|1|)>|\|>\<le\>C<rprime|'><around|\<\|\|\>|u|\<\|\|\>><rsub|H>>
  and eventually a constant <math|C<rprime|''>> such that
  <math|<around|\<\|\|\>|u|\<\|\|\>><rsub|L<rsup|\<infty\>><around|(|<around|(|0,1|)>|)>>\<le\>C<rprime|''><around|\<\|\|\>|u|\<\|\|\>><rsub|H>>.
  Similarly, we obtain <math|<around|\<\|\|\>|u|\<\|\|\>><rsub|L<rsup|\<infty\>><around|(||(>-1,0))>\<le\>C<rprime|''><around|\<\|\|\>|u|\<\|\|\>><rsub|H>>.<next-line>

  Combining the above inequalities we obtain a new constant <math|K> so that
  <math|<around|\<\|\|\>|u|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>\<le\>K<around|\<\|\|\>|u|\<\|\|\>><rsub|H>>.<next-line><math|\<Box\>>

  A consequence of this first step is that
  <math|H\<subset\>H<rsup|1><around|(|<with|math-font|Bbb|R>|)>\<subset\>C<around|(|<with|math-font|Bbb|R>|)>>.<next-line>

  Step 2: The injection <math|H\<hookrightarrow\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>
  is compact.<next-line>

  Let us consider a sequence <math|<around|(|u<rsub|n>|)><rsub|n>> of
  functions in <math|H> with <math|sup<rsub|n><around|\<\|\|\>|u<rsub|n>|\<\|\|\>><rsub|H>\<less\>+\<infty\>>.<next-line>

  Because <math|H\<subset\>H<rsup|1><around|(|<with|math-font|Bbb|R>|)>>,
  <math|\<forall\>m\<in\><with|math-font|Bbb|N><rsup|\<ast\>>>, we can
  extract from <math|<around|(|u<rsub|n>|)><rsub|n>> a sequence that
  converges in <math|L<rsup|2><around|(||(>-m,m))>. Using then a diagonal
  extraction, there exists a subsequence of
  <math|<around|(|u<rsub|n>|)><rsub|n>>, still denoted
  <math|<around|(|u<rsub|n>|)><rsub|n>>, and a function
  <math|u\<in\>L<rsup|2><rsub|l*o*c><around|(|<with|math-font|Bbb|R>|)>> such
  that <math|u<rsub|n><around|(|x|)>\<to\>u<around|(|x|)>> for almost every
  <math|x\<in\><with|math-font|Bbb|R>> and <math|u<rsub|n>\<to\>u> in the
  <math|L<rsup|2><rsub|l*o*c><around|(|<with|math-font|Bbb|R>|)>> sense.

  Now, by Fatou's lemma:

  <\equation*>
    <big|int><rsub|<with|math-font|Bbb|R>>x<rsup|2>*u<around|(|x|)><rsup|2>*d*x\<le\>liminf<rsub|n\<to\>\<infty\>>
    <big|int><rsub|<with|math-font|Bbb|R>>x<rsup|2>*u<rsub|n><around|(|x|)><rsup|2>*d*x\<le\><frac|sup<rsub|n><around|\<\|\|\>|u<rsub|n>|\<\|\|\>><rsup|2><rsub|H>|\<alpha\>>
  </equation*>

  Hence, there exists a constant <math|C> such that
  <math|\<forall\>m\<in\><with|math-font|Bbb|N><rsup|\<ast\>>>:

  <\equation*>
    <big|int><rsub|<with|math-font|Bbb|R>><around|\||u<around|(|x|)>-u<rsub|n><around|(|x|)>*<around|\||<rsup|2>d*x\<le\><big|int><rsub|-m><rsup|m>|\|>*u<around|(|x|)>-u<rsub|n><around|(|x|)>*<around|\||<rsup|2>d*x+<frac|1|m<rsup|2>>*<big|int><rsub|<with|math-font|Bbb|R>\<setminus\>[-m,m]>x<rsup|2>|\|>*u<around|(|x|)>-u<rsub|n><around|(|x|)>|\|><rsup|2>*d*x
  </equation*>

  <\equation*>
    \<le\><big|int><rsub|-m><rsup|m><around|\||u<around|(|x|)>-u<rsub|n><around|(|x|)>|\|><rsup|2>*d*x+<frac|C|m<rsup|2>>
  </equation*>

  Hence <math|limsup<rsub|n\<to\>\<infty\>>
  <big|int><rsub|<with|math-font|Bbb|R>><around|\||u<around|(|x|)>-u<rsub|n><around|(|x|)>|\|><rsup|2>*d*x\<le\><frac|C|m<rsup|2>>>.<next-line>

  Sending <math|m> to <math|+\<infty\>> we get:

  <\equation*>
    limsup<rsub|n\<to\>\<infty\>> <big|int><rsub|<with|math-font|Bbb|R>><around|\||u<around|(|x|)>-u<rsub|n><around|(|x|)>|\|><rsup|2>*d*x=0
  </equation*>

  Hence <math|<around|(|u<rsub|n>|)><rsub|n>> converges towards <math|u> in
  the <math|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>
  sense.<next-line><math|\<Box\>>

  Now, we consider the equation <math|-\<eta\>*u<rprime|''><around|(|x|)>+\<alpha\>*x<rsup|2>*u<around|(|x|)>=f<around|(|x|)>>
  for <math|f\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>> and we
  define <math|u=L*f> the weak solution of this equation, <em|i.e.>:

  <\equation*>
    \<forall\>v\<in\>H,<big|int><rsub|<with|math-font|Bbb|R>><around*|(|\<alpha\>*x<rsup|2>*u<around|(|x|)>*v<around|(|x|)>+\<eta\>*u<rprime|'><around|(|x|)>*v<rprime|'><around|(|x|)>|)>*d*x=<big|int><rsub|<with|math-font|Bbb|R>>f<around|(|x|)>*v<around|(|x|)>*d*x
  </equation*>

  Step 3: <math|L:L<rsup|2><around|(|<with|math-font|Bbb|R>|)>\<to\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>
  is a well defined linear operator, compact, positive and
  self-adjoint.<next-line>

  For <math|f\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>,
  <math|v\<in\>H\<mapsto\><big|int><rsub|<with|math-font|Bbb|R>>f<around|(|x|)>*v<around|(|x|)>*d*x>
  is a continuous linear form on <math|H> because the injection
  <math|H\<hookrightarrow\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>> is
  continuous. Hence, by Lax-Milgram or Riesz's representation theorem, there
  exists a unique <math|u\<in\>H> weak solution of the above equation and
  <math|L> is a well defined linear operator.<next-line>

  Now, <math|<around|\<\|\|\>|L*f|\<\|\|\>><rsup|2><rsub|H>=<around|\<langle\>|f,L*f|\<rangle\>>\<le\><around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>*<around|\<\|\|\>|L*f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>.
  Hence, since the injection <math|H\<hookrightarrow\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>
  is continuous, there exists a constant <math|C> such that
  <math|<around|\<\|\|\>|L*f|\<\|\|\>><rsup|2><rsub|H>\<le\>C<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>*<around|\<\|\|\>|L*f|\<\|\|\>><rsub|H>>,
  which in turn gives <math|<around|\<\|\|\>|L*f|\<\|\|\>><rsub|H>\<le\>C<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>.
  Since the injection <math|H\<hookrightarrow\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>
  is compact, we obtain that <math|L> is a compact operator.<next-line>

  <math|L> is a positive operator because
  <math|<around|\<langle\>|f,L*f|\<rangle\>>=<around|\<\|\|\>|L*f|\<\|\|\>><rsup|2><rsub|H>\<ge\>0>.<next-line>

  Eventually, <math|L> is self-adjoint because
  <math|\<forall\>f,g\<in\>L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>:

  <\equation*>
    <around|\<langle\>|f,L*g|\<rangle\>>=<big|int><rsub|<with|math-font|Bbb|R>><around*|(|\<alpha\>*x<rsup|2>*L*f<around|(|x|)>*L*g<around|(|x|)>+\<eta\>*<around|(|L*f|)><rprime|'><around|(|x|)>*<around|(|L*g|)><rprime|'><around|(|x|)>|)>*d*x
  </equation*>

  <\equation*>
    =<big|int><rsub|<with|math-font|Bbb|R>><around*|(|\<alpha\>*x<rsup|2>*L*g<around|(|x|)>*L*f<around|(|x|)>+\<eta\>*<around|(|L*g|)><rprime|'><around|(|x|)>*<around|(|L*f|)><rprime|'><around|(|x|)>|)>*d*x=<around|\<langle\>|g,L*f|\<rangle\>>
  </equation*>

  <math|\<Box\>>

  Now, using the spectral decomposition of <math|L> and classical results on
  Rayleigh ratios we know that the eigenfunctions <math|f> corresponding to
  the largest eigenvalue <math|\<lambda\><rsup|0>> of <math|L> satisfy:

  <\equation*>
    <frac|1|\<lambda\><rsup|0>>=<frac|<around|\<\|\|\>|f|\<\|\|\>><rsub|H>|<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>=inf<rsub|g\<in\>H\<setminus\><around|{|0|}>>
    <frac|<around|\<\|\|\>|g|\<\|\|\>><rsub|H>|<around|\<\|\|\>|g|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>
  </equation*>

  Hence, our problem boils down to proving that the largest eigenvalue of
  <math|L> is simple and that <math|g:x\<mapsto\>exp
  <around*|(|-<frac|1|2>*<sqrt|<frac|\<alpha\>|\<eta\>>>*x<rsup|2>|)>> is an
  eigenfunction corresponding to this eigenvalue (it is straightforward that
  <math|g\<in\>H>).<next-line>

  Step 4: Any positive eigenfunction corresponds to the largest eigenvalue of
  <math|L>.<next-line>

  By definition of <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|H>>,
  <math|\<forall\>f\<in\>H,<frac|<around|\<\|\|\>|<around|\||f|\|>|\<\|\|\>><rsub|H>|<around|\<\|\|\>|<around|\||f|\|>|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>=<frac|<around|\<\|\|\>|f|\<\|\|\>><rsub|H>|<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|<with|math-font|Bbb|R>|)>>>>.
  Hence, if <math|f> is an eigenfunction of <math|L> corresponding to the
  eigenvalue <math|\<lambda\><rsup|0>>, then <math|<around|\||f|\|>> is also
  an eigenfunction of <math|L> corresponding to the eigenvalue
  <math|\<lambda\><rsup|0>>. Now, if <math|<wide|f|~>> is an eigenfunction of
  <math|L> corresponding to an eigenvalue
  <math|\<lambda\>\<neq\>\<lambda\><rsup|0>>,
  <math|<around|\<langle\>|<around|\||f|\|>,<wide|f|~>|\<rangle\>>=0>.
  Therefore <math|<wide|f|~>> cannot be positive.<next-line><math|\<Box\>>

  Step 5: <math|g> spans the eigenspace corresponding to the largest
  eigenvalue of <math|L>.<next-line>

  Differentiating <math|g> twice, we get <math|g<rprime|''><around|(|x|)>=-<sqrt|<frac|\<alpha\>|\<eta\>>>*g<around|(|x|)>+<frac|\<alpha\>|\<eta\>>*x<rsup|2>*g<around|(|x|)>>.<next-line>Hence
  <math|-\<eta\>*g<rprime|''><around|(|x|)>+\<alpha\>*x<rsup|2>*g<around|(|x|)>=<sqrt|\<alpha\>*\<eta\>>*g<around|(|x|)>>
  and <math|g> is a positive eigenfunction, necessarily associated to the
  eigenvalue <math|\<lambda\><rsup|0>> that is therefore equal to
  <math|<frac|1|<sqrt|\<alpha\>*\<eta\>>>>.<next-line>

  Now, if we look for an eigenfunction <math|f\<in\>C<rsup|\<infty\>><around|(|<with|math-font|Bbb|R>|)>\<cap\>H>
  \U because any eigenfunction of <math|L> is in
  <math|C<rsup|\<infty\>><around|(|<with|math-font|Bbb|R>|)>> \U we can look
  for <math|f> of the form <math|f=g*h>. This gives:

  <eqnarray*|<tformat|<table|<row|<cell|0>|<cell|=>|<cell|-\<eta\>*f<rprime|''><around|(|x|)>+\<alpha\>*x<rsup|2>*f<around|(|x|)>-<sqrt|\<alpha\>*\<eta\>>*f<around|(|x|)>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\>*<around*|(|g<rprime|''><around|(|x|)>*h<around|(|x|)>+2*g<rprime|'><around|(|x|)>*h<rprime|'><around|(|x|)>+g<around|(|x|)>*h<rprime|''><around|(|x|)>|)>+\<alpha\>*x<rsup|2>*g<around|(|x|)>*h<around|(|x|)>-<sqrt|\<alpha\>*\<eta\>>*g<around|(|x|)>*h<around|(|x|)>>>>>>

  Hence:

  <eqnarray*|<tformat|<table|<row|<cell|0>|<cell|=>|<cell|2*g<rprime|'><around|(|x|)>*h<rprime|'><around|(|x|)>+g<around|(|x|)>*h<rprime|''><around|(|x|)>=-2*x*<sqrt|<frac|\<alpha\>|\<eta\>>>*g<around|(|x|)>*h<rprime|'><around|(|x|)>+g<around|(|x|)>*h<rprime|''><around|(|x|)>>>|<row|<cell|>|<cell|\<Rightarrow\>>|<cell|h<rprime|''><around|(|x|)>=2*x*<sqrt|<frac|\<alpha\>|\<eta\>>>*h<rprime|'><around|(|x|)>>>|<row|<cell|>|<cell|\<Rightarrow\>>|<cell|\<exists\>K<rsub|1>,<space|1em>h<rprime|'><around|(|x|)>=K<rsub|1>*exp
  <around*|(|<sqrt|<frac|\<alpha\>|\<eta\>>>*x<rsup|2>|)>>>|<row|<cell|>|<cell|\<Rightarrow\>>|<cell|\<exists\>K<rsub|1>,K<rsub|2>,<space|1em>h<around|(|x|)>=K<rsub|1>*<big|int><rsub|0><rsup|x>exp
  <around*|(|<sqrt|<frac|\<alpha\>|\<eta\>>>*t<rsup|2>|)>*d*t+K<rsub|2>>>|<row|<cell|>|<cell|\<Rightarrow\>>|<cell|\<exists\>K<rsub|1>,K<rsub|2>,<space|1em>f<around|(|x|)>=K<rsub|1>*g<around|(|x|)>*<big|int><rsub|0><rsup|x>exp
  <around*|(|<sqrt|<frac|\<alpha\>|\<eta\>>>*t<rsup|2>|)>*d*t+K<rsub|2>*g<around|(|x|)>>>|<row|<cell|>|<cell|>|<cell|>>>>>

  Now,

  <\equation*>
    g<around|(|x|)>*<big|int><rsub|0><rsup|x>exp
    <around*|(|<sqrt|<frac|\<alpha\>|\<eta\>>>*t<rsup|2>|)>*d*t\<ge\>exp
    <around*|(|-<frac|1|2>*<sqrt|<frac|\<alpha\>|\<eta\>>>*x<rsup|2>|)>*<big|int><rsub|<frac|x|<sqrt|2>>><rsup|x>exp
    <around*|(|<sqrt|<frac|\<alpha\>|\<eta\>>>*t<rsup|2>|)>*d*t
  </equation*>

  <\equation*>
    \<ge\>x*<around*|(|1-<frac|1|<sqrt|2>>|)>
  </equation*>

  Hence, for <math|f> to be in <math|H>, we must have <math|K<rsub|1>=0>.
  Thus, <math|g> spans the eigenspace corresponding to the largest eigenvalue
  of <math|L> and Proposition 3 is proved.<next-line><math|\<Box\>>
</body>

<\references>
  <\collection>
    <associate|ap|<tuple|4|?>>
    <associate|ap2|<tuple|5|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|5|?>>
    <associate|auto-11|<tuple|5.1|?>>
    <associate|auto-12|<tuple|5.2|?>>
    <associate|auto-13|<tuple|6|?>>
    <associate|auto-14|<tuple|6.1|?>>
    <associate|auto-15|<tuple|6.2|?>>
    <associate|auto-16|<tuple|6.3|?>>
    <associate|auto-17|<tuple|6.4|?>>
    <associate|auto-18|<tuple|6|?>>
    <associate|auto-19|<tuple|7|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-20|<tuple|6.5|?>>
    <associate|auto-21|<tuple|8|?>>
    <associate|auto-22|<tuple|6.6|?>>
    <associate|auto-23|<tuple|7|?>>
    <associate|auto-24|<tuple|9|?>>
    <associate|auto-25|<tuple|10|?>>
    <associate|auto-26|<tuple|11|?>>
    <associate|auto-27|<tuple|12|?>>
    <associate|auto-28|<tuple|13|?>>
    <associate|auto-29|<tuple|13|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-30|<tuple|13|?>>
    <associate|auto-31|<tuple|roll1984simple|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|1|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|3|?>>
    <associate|auto-8|<tuple|4|?>>
    <associate|auto-9|<tuple|5|?>>
    <associate|bib-GLFT|<tuple|GLFT|?>>
    <associate|bib-amihud1980deallership|<tuple|amihud1980deallership|?>>
    <associate|bib-amihud1986asset|<tuple|amihud1986asset|?>>
    <associate|bib-avellaneda2008high|<tuple|avellaneda2008high|?>>
    <associate|bib-bayraktar2011liquidation|<tuple|bayraktar2011liquidation|?>>
    <associate|bib-benston1974determinants|<tuple|benston1974determinants|?>>
    <associate|bib-cartea2010modeling|<tuple|cartea2010modeling|?>>
    <associate|bib-cartea2011buy|<tuple|cartea2011buy|?>>
    <associate|bib-cartea2012risk|<tuple|cartea2012risk|?>>
    <associate|bib-citeulike:7621540|<tuple|citeulike:7621540|?>>
    <associate|bib-citeulike:8423311|<tuple|citeulike:8423311|?>>
    <associate|bib-cohen1979market|<tuple|cohen1979market|?>>
    <associate|bib-cohen1981transaction|<tuple|cohen1981transaction|?>>
    <associate|bib-garman1976market|<tuple|garman1976market|?>>
    <associate|bib-gueant2012PDE|<tuple|gueant2012PDE|?>>
    <associate|bib-guilbaud2011optimal|<tuple|guilbaud2011optimal|?>>
    <associate|bib-guilbaud2012optimal|<tuple|guilbaud2012optimal|?>>
    <associate|bib-hendershott2009price|<tuple|hendershott2009price|?>>
    <associate|bib-ho1981optimal|<tuple|ho1981optimal|?>>
    <associate|bib-ho1983dynamics|<tuple|ho1983dynamics|?>>
    <associate|bib-ho1984dealer|<tuple|ho1984dealer|?>>
    <associate|bib-madhavan1993analysis|<tuple|madhavan1993analysis|?>>
    <associate|bib-mildenstein1983optimal|<tuple|mildenstein1983optimal|?>>
    <associate|bib-o1986microeconomics|<tuple|o1986microeconomics|?>>
    <associate|bib-roll1984simple|<tuple|roll1984simple|?>>
    <associate|ex1|<tuple|1|?>>
    <associate|ex1b|<tuple|2|?>>
    <associate|ex2|<tuple|3|?>>
    <associate|execution|<tuple|13|?>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-10|<tuple|10|?>>
    <associate|footnote-11|<tuple|11|?>>
    <associate|footnote-12|<tuple|12|?>>
    <associate|footnote-13|<tuple|13|?>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnote-3|<tuple|3|?>>
    <associate|footnote-4|<tuple|4|?>>
    <associate|footnote-5|<tuple|5|?>>
    <associate|footnote-6|<tuple|6|?>>
    <associate|footnote-7|<tuple|7|?>>
    <associate|footnote-8|<tuple|8|?>>
    <associate|footnote-9|<tuple|9|?>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-10|<tuple|10|?>>
    <associate|footnr-11|<tuple|11|?>>
    <associate|footnr-12|<tuple|12|?>>
    <associate|footnr-13|<tuple|13|?>>
    <associate|footnr-2|<tuple|2|?>>
    <associate|footnr-3|<tuple|3|?>>
    <associate|footnr-4|<tuple|4|?>>
    <associate|footnr-5|<tuple|5|?>>
    <associate|footnr-6|<tuple|6|?>>
    <associate|footnr-7|<tuple|7|?>>
    <associate|footnr-8|<tuple|8|?>>
    <associate|footnr-9|<tuple|9|?>>
    <associate|imggamma1|<tuple|6|?>>
    <associate|imggamma2|<tuple|7|?>>
    <associate|imgk|<tuple|8|?>>
    <associate|inventory|<tuple|10|?>>
    <associate|nai|<tuple|12|?>>
    <associate|pnl|<tuple|11|?>>
    <associate|price|<tuple|9|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ho1981optimal

      avellaneda2008high

      amihud1980deallership

      citeulike:7621540

      amihud1986asset

      benston1974determinants

      cohen1981transaction

      garman1976market

      ho1984dealer

      o1986microeconomics

      citeulike:8423311

      cohen1979market

      hendershott2009price

      ho1983dynamics

      madhavan1993analysis

      mildenstein1983optimal

      roll1984simple

      avellaneda2008high

      ho1981optimal

      avellaneda2008high

      cartea2011buy

      cartea2012risk

      cartea2010modeling

      guilbaud2011optimal

      guilbaud2012optimal

      bayraktar2011liquidation

      GLFT

      avellaneda2008high

      ho1981optimal

      ho1981optimal

      avellaneda2008high

      avellaneda2008high

      avellaneda2008high

      avellaneda2008high

      ho1981optimal

      avellaneda2008high

      gueant2012PDE

      avellaneda2008high
    </associate>
    <\associate|figure>
      <tuple|normal|Behavior of the optimal bid quotes with time and
      inventory. <with|mode|<quote|math>|\<sigma\>=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-5>>

      <tuple|normal|Behavior of the optimal ask quotes with time and
      inventory. <with|mode|<quote|math>|\<sigma\>=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-6>>

      <tuple|normal|Behavior of the resulting bid-ask spread with time and
      inventory. <with|mode|<quote|math>|\<sigma\>=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-7>>

      <tuple|normal|Asymptotic behavior of optimal bid quote (bold line).
      Approximation (dotted line). Left: <with|mode|<quote|math>|\<sigma\>=0.4<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>. Right:
      <with|mode|<quote|math>|\<sigma\>=1.0<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.2<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-8>>

      <tuple|normal|Asymptotic behavior of optimal ask quote (bold line).
      Approximation (dotted line). Left: <with|mode|<quote|math>|\<sigma\>=0.4<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>. Right:
      <with|mode|<quote|math>|\<sigma\>=1.0<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.2<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-9>>

      <tuple|normal|Bid-ask spread resulting from the asymptotic optimal
      quotes for different inventories and different values for the risk
      aversion parameter <with|mode|<quote|math>|\<gamma\>>.
      <with|mode|<quote|math>|\<sigma\>=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-18>>

      <tuple|normal|Bid-ask spread resulting from the asymptotic optimal
      quotes for different inventories and different values for the risk
      aversion parameter <with|mode|<quote|math>|\<gamma\>>.
      <with|mode|<quote|math>|\<sigma\>=0.6<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|k=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-19>>

      <tuple|normal|Asymptotic optimal bid quotes for different inventories
      and different values of <with|mode|<quote|math>|k>.
      <with|mode|<quote|math>|\<sigma\>=0.3<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>>\<cdot\><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1/2>>,
      <with|mode|<quote|math>|A=0.9<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|s>>><rsup|-1>>,
      <with|mode|<quote|math>|\<gamma\>=0.01<space|1em><rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|Tick>>><rsup|-1>>,
      <with|mode|<quote|math>|T=600*<space|1em>s>.|<pageref|auto-21>>

      <tuple|normal|Price of the stock France Telecom on 15/03/2012, from
      10:00 to 16:00.|<pageref|auto-24>>

      <tuple|normal|Inventory (in ATS) when the strategy is used on France
      Telecom (15/03/2012) from 10:00 to 16:00.|<pageref|auto-25>>

      <tuple|normal|P&L when the strategy is used on France Telecom
      (15/03/2012) from 10:00 to 16:00.|<pageref|auto-26>>

      <tuple|normal|P&L of a naive market maker on France Telecom
      (15/03/2012) from 10:00 to 16:00.|<pageref|auto-27>>

      <tuple|normal|Details for the quotes and trades when the strategy is
      used on France Telecom (15/03/2012). Thin lines represent the market
      while bold lines represent the quotes of the market maker. Dotted lines
      are associated to the bid side while plain lines are associated to the
      ask side. Black points represent trades in which the market maker is
      involved.|<pageref|auto-28>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Setup
      of the model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Characterization
      of the optimal quotes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Asymptotic
      behavior and approximation of the optimal quotes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Extensions
      of the model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>The case of a trend in the
      price dynamics <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>The case of market impact
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Comparative
      statics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Dependence on
      <with|mode|<quote|math>|\<sigma\><rsup|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Dependence on
      <with|mode|<quote|math>|\<mu\>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|6.3<space|2spc>Dependence on
      <with|mode|<quote|math>|A> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|6.4<space|2spc>Dependence on
      <with|mode|<quote|math>|\<gamma\>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|6.5<space|2spc>Dependence on
      <with|mode|<quote|math>|k> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|6.6<space|2spc>Dependence on the market
      impact <with|mode|<quote|math>|\<xi\>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Backtests>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix:
      Proofs of the results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
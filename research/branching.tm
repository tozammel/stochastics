<TeXmacs|1.99.2>

<style|mmxdoc>

<\body>
  <doc-data|<doc-title|Branching ratio approximation for the self-exciting
  Hawkes process>|<doc-author|<author-data|<author-name|Stephen J.
  Hardiman>>>|<doc-author|<author-data|<author-name|Jean-Philippe
  Bouchaud>>>|<doc-date|>>

  <abstract-data|<\abstract>
    We introduce a model-independent approximation for the branching ratio of
    Hawkes self-exciting point processes. Our estimator requires knowing only
    the mean and variance of the event count in a sufficiently large time
    window, statistics that are readily obtained from empirical data. The
    method we propose greatly simplifies the estimation of the Hawkes
    branching ratio, recently proposed as a proxy for market endogeneity and
    formerly estimated using numerical likelihood maximisation. We employ our
    new method to support recent theoretical and experimental results
    indicating that the best fitting Hawkes model to describe S&P futures
    price changes is in fact critical (now and in the recent past) in light
    of the long memory of financial market activity.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>The
    self-exciting Hawkes Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.<space|2spc>Maximum
    likelihood estimation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.<space|2spc>A
    mean-variance estimator for the branching ratio <with|mode|math|n>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4.<space|2spc>Numerical
    simulations & Implementation notes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|4.1.<space|2spc>Choice of window size W
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.2.<space|2spc>Power-law kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5.<space|2spc>Empirical
    applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|5.1.<space|2spc>Flash-crash revisited
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|5.2.<space|2spc>Reflexivity : 1998 - 2013
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6.<space|2spc>Summary>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19><vspace|0.5fn>
  </table-of-contents>

  <section|The self-exciting Hawkes Process>

  The Hawkes model <cite|hawkes|hawkes2> is a simple and powerful framework
  for simulating or modelling the arrival of events which cluster in time
  (e.g. earthquake shocks and aftershocks, neural spike trains and
  transactions on financial markets). In one dimension, the model is a
  counting process <math|N<around|(|t|)>> with an intensity
  <math|\<lambda\><around|(|t|)>> (the expected number of events per unit
  time) given by a constant term <math|\<mu\>> and a `self-exciting' term
  which is a function of the event history.

  <\equation>
    \<lambda\><around|(|t|)>=\<mu\>+<big|int><rsub|-\<infty\>><rsup|t>\<phi\>*<around|(|t-s|)><math-up|d>N<around|(|s|)><label|eq:hawkes>
  </equation>

  This self-exciting term gives rise to event clustering through an
  endogenous feedback: past events contribute to the rate of future events.
  <math|\<phi\><around|(|\<tau\>|)>\<geq\>0> is the ``influence kernel''
  which decides the weight to attribute to events which occurred at a lag
  <math|\<tau\>> in the past. The base intensity <math|\<mu\>> and the kernel
  shape <math|\<phi\><around|(|t|)>> are parameters to be varied. A popular
  choice for the kernel is the exponential function
  <math|\<phi\><around|(|\<tau\>|)>=\<alpha\>*e<rsup|-\<beta\>*\<tau\>>>
  <cite|filimonov|ozaki> but in general the kernel to be used should depend
  on the application or the dynamics of the data to be modelled. Note that
  for <math|\<phi\><around|(|t|)>=0> the model reduces to a Poisson process
  with constant intensity <math|\<mu\>>.

  By taking the expectation of both sides of Eq. (<reference|eq:hawkes>) and
  assuming stationarity (i.e. a finite average event rate
  <math|E<around|[|\<lambda\><around|(|t|)>|]>=\<Lambda\>>), we can express
  the average event rate of the process as
  <math|\<Lambda\>=\<mu\>/<around|(|1-n|)>\<geq\>\<mu\>> where
  <math|n=<big|int>\<phi\><around|(|\<tau\>|)><math-up|d >\<tau\>>. One can
  create a direct mapping between the Hawkes process and the well known
  branching process <cite|harris> in which exogenous ``mother'' events occur
  with an intensity <math|\<mu\>> and may give rise to <math|x> additional
  endogenous ``daughter'' events, where <math|x> is drawn from a Poisson
  distribution with mean <math|n>. These in turn may themselves give birth to
  more ``daughter'' events, etc.

  The value <math|n>, which corresponds with the integral of the Hawkes
  kernel is the branching ratio, determines the behaviour of the model. If
  <math|n\<gtr\>1>, meaning that each event typically triggers at least one
  extra event, then the process is non-stationary and may explode in finite
  time <cite|commodityreflexivity>. However, for <math|n\<less\>1>, the
  process is stationary and has proven useful in modelling the clustered
  arrival of events in a wide variety of applications including neurobiology
  <cite|neurobiology>, social dynamics <cite|social|crime> and geophysics
  <cite|earthquakes1|earthquakes2>. The Hawkes model has also seen many
  recent applications to finance <cite|bauwens|hawkesvolatility|bormetti>,
  especially as a means of modelling the very high-frequency events affecting
  the limit-order book of financial exchanges
  <cite|bacry|hawkesmicrostructure|bacrypricetrades|toke|dafonseca>.

  One novel application of the Hawkes framework to finance is as a means of
  measuring market endogeneity or `reflexivity' in financial markets
  <cite|filimonov|commodityreflexivity>. In <cite|filimonov>, the authors
  consider mid-price changes in the E-mini S&P Futures contract between 1998
  and 2010 and observe that the branching ratio <math|n> of the best-fitting
  exponential kernel model has been increasing steadily over this period,
  from <math|n\<approx\>0.25> in 1998 to <math|n\<approx\>0.65> in 2010 (see
  our Fig. 6 below). They argue that this observation implies that the market
  has become more reflexive in recent years with the rise of high frequency
  and algorithmic trading and is therefore more prone to market instability
  and so-called ``flash crashes''.

  In <cite|criticalreflexivity>, however, we have argued that due to the
  presence of long-range dependence in the event rate of mid-price changes
  (detectable in both 1998 and 2011) as one extends the window of
  observation, the best fitting stationary Hawkes model must in fact be
  critical, i.e. have a branching ratio <math|n=1>. This is backed up by
  theoretical arguments and empirical measurements on market data.

  Let us however insist that this conclusion only holds if one believes that
  Hawkes processes provide an exact representation of the reality of markets.
  It is very plausible that the dynamics of markets is more complicated (and
  involves, for example, non-linearities absent from the Hawkes process
  defined by Eq. (<reference|eq:hawkes>)), but that the best way to represent
  this dynamics within the framework of Hawkes processes is to choose
  <math|n=1> with a long-ranged influence kernel.

  In this article we introduce a simple approximation for the branching ratio
  of the Hawkes process which allows us to faithfully reproduce the results
  of <cite|filimonov> which proposes the statistic as a measure of market
  instability and as a crash prediction metric. The interest of our
  approximation lies in its great simplicity: one need only estimate the mean
  and variance of the event count in a sufficiently large time window. The
  approximation also avoids a number of pitfalls <cite|apparentcriticality>
  inherent to the significantly more complex approach <cite|ozaki> employed
  in <cite|filimonov>.

  The estimator accepts one parameter, a time window size, <math|W>, during
  which we measure the mean and variance of the event count. We note that
  when we employ our estimator to mid-price changes in the S&P electronic
  futures market with a fixed window size <math|W> then the branching ratio
  estimate obtained increases over time as reported in <cite|filimonov>. If,
  however, we allow the window size to scale appropriately (halving in size
  every 18 months) to adapt to the decreasing latency of interactions on the
  market we recover a constant branching ratio estimate as proposed in
  <cite|criticalreflexivity>. This result reiterates the need for a
  scale-invariant, or at least scale-sensitive means of measuring the
  `reflexivity' of financial market events.

  <section|Maximum likelihood estimation>

  Given observed events (e.g. mid-price changes) at times
  <math|t<rsub|1>,t<rsub|2>,\<ldots\>,t<rsub|n>> in an interval
  <math|<around|[|0,T|]>> one can fit the Hawkes model by maximising the
  log-likelihood <cite|rubin|ozaki> over the set of parameters
  <math|\<theta\>>.

  <\equation>
    log L<around|(|t<rsub|1>,\<ldots\>,t<rsub|n>\|\<theta\>|)>=-<big|int><rsub|0><rsup|T>\<lambda\><around|(|t\|\<theta\>|)><math-up|d>t+<big|int><rsub|0><rsup|T>log
    \<lambda\><around|(|t\|\<theta\>|)><math-up|d>N<around|(|t|)><label|eq:loglikelihood>
  </equation>

  In the case of the exponential kernel <math|\<theta\>=<around|{|\<mu\>,\<alpha\>,\<beta\>|}>>.
  In practice, the model parameters <math|<around|{|<wide|\<mu\>|^>,<wide|\<alpha\>|^>,<wide|\<beta\>|^>|}>>
  which maximise this log-likelihood are obtained with numerical techniques
  due to the lack of a closed form solution <footnote|Note that the method
  above is not the only method proposed to fit the parameters of the Hawkes
  process for financial applications, indeed a recent publication
  <cite|dafonseca> proposes a fast albeit still parametric method for fitting
  the multivariate exponential Hawkes process.>. The branching ratio estimate
  is then <math|<wide|n|^>=<wide|\<alpha\>|^>/<wide|\<beta\>|^>>.

  However, there are a number of pitfalls to using this procedure as a means
  of estimating the Hawkes branching ratio
  <math|n=<big|int>\<phi\><around|(|\<tau\>|)><math-up|d>\<tau\>>
  <cite|apparentcriticality>. Arguably the most important of which is that
  any estimate of <math|n> made in this manner will be heavily dependent on
  the choice of kernel model (e.g. exponential, power-law, etc.) It may be
  that the chosen model cannot satisfactorily describe the observed events,
  hence the meaning of the branching ratio extracted from the maximum
  likelihood method is questionable.

  Care must also be taken when employing this method in the presence of
  imperfect event data as illustrated in <cite|apparentcriticality>. In one
  of their figures, the authors present a (negative) log-likelihood surface
  which features two minima (one local, and one global). The global
  log-likelihood minimum does in fact little more than describe packet
  clustering inside the millisecond which arises from the manner in which
  events arriving at the exchange at different times are bundled and recorded
  with the same timestamp. Subsequent randomisation of the timestamps inside
  a short time interval (in this case, one millisecond) creates a spurious
  high frequency correlation, that makes the global minimum irrelevant. The
  local log-likelihood minimum, which is in fact a better fit to the `true'
  lower frequency dynamics, does a poor job at explaining the spurious high
  frequency clustering and is punished with a lower log-likelihood. Indeed,
  when the authors of <cite|apparentcriticality> choose to fit this local
  minimum they corroborate results presented in <cite|criticalreflexivity>.

  We believe it is therefore essential to have additional checks (such as
  non-parametric methods <cite|bacry>) at one's disposal to support results
  obtained from likelihood maximisation. To address the pitfalls in branching
  ratio estimation that arise from the model choice we propose a simple
  model-independent tool for branching ratio approximation, in the next
  section, which accurately reproduces previous results of <cite|filimonov>
  and also indicates the criticality of the relevant Hawkes process which
  describes the market.

  <section|A mean-variance estimator for the branching ratio <math|n>>

  We begin with a general expression relating the Fourier transform of the
  kernel function to the Fourier transform of the auto-covariance\ 

  <\equation>
    \<nu\><around|(|\<tau\>|)>=E<around|[|<frac|<math-up|d>N<around|(|t|)><math-up|d>N*<around|(|t+\<tau\>|)>|<math-up|d>t<rsup|2>>|]>-\<Lambda\><rsup|2>
  </equation>

  \ of the event rate. (see <cite|hawkes|bacry> for a derivation).

  <\equation>
    <wide|\<nu\>|^><around|(|\<omega\>|)>=<frac|\<Lambda\>|<around*|\||1-<wide|\<phi\>|^><around|(|\<omega\>|)>|\|><rsup|2>>
  </equation>

  Setting <math|\<omega\>=0> we obtain a relation between the branching
  ratio, the average event rate and the integral of the auto-covariance (in
  the stationary case <math|n\<leq\>1>)

  <\equation>
    <label|basic><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|t|)><math-up|d>t=<frac|\<Lambda\>|<around*|\||1-<big|int><rsub|0><rsup|\<infty\>>\<phi\><around|(|t|)><math-up|d>t|\|><rsup|2>>\<equiv\><frac|\<Lambda\>|<around|(|1-n|)><rsup|2>>
  </equation>

  Therefore, to deduce the branching ratio of the stationary Hawkes process,
  we need only find the value of <math|\<Lambda\>> and
  <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|t|)><math-up|d>t>.
  Estimating <math|\<Lambda\>> is trivial, it is given by the empirical
  average number of events per unit time. To estimate
  <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|t|)><math-up|d>t>,
  we consider the variance of the total event count <math|N<rsub|W>> in a
  window of length <math|W>. Theoretically, this is given by:

  <eqnarray|<tformat|<table|<row|<cell|\<sigma\><rsup|2><rsub|W>>|<cell|=>|<cell|<math-up|E><around*|[|<big|int><rsub|t=0><rsup|W><frac|<math-up|d>N<around|(|t|)>|<math-up|d>t><math-up|d>t*<big|int><rsub|t<rprime|'>=0><rsup|W><frac|<math-up|d>N<around|(|t<rprime|'>|)>|<math-up|d>t<rprime|'>><math-up|d>t<rprime|'>|]>-<around|(|\<Lambda\>*W|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|t=0><rsup|W><big|int><rsub|t<rprime|'>=0><rsup|W>\<nu\>*<around|(|t-t<rprime|'>|)><math-up|d>t<space|0.17em><math-up|d>t<rprime|'>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|t=0><rsup|W><big|int><rsub|\<tau\>=-t><rsup|W-t>\<nu\><around|(|\<tau\>|)><math-up|d>t<space|0.17em><math-up|d>\<tau\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<tau\>=-W><rsup|W>\<nu\><around|(|\<tau\>|)>*<around*|(|W-<around*|\||\<tau\>|\|>|)><math-up|d>\<tau\>>>|<row|<cell|>|<cell|\<leq\>>|<cell|W*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|\<tau\>|)>*d*\<tau\><eq-number><label|eq:bounded>>>>>>

  We then note that provided:

  <\enumerate>
    <item><math|\<nu\><around|(|t|)>\<to\>0> for
    <math|<around|\||t|\|>\<gtr\>R>

    <item><math|W\<gg\>R> such that <math|<around|(|W-<around|\||t|\|>|)>/W\<approx\>1>
    for all <math|<around|\||t|\|>\<less\>R>
  </enumerate>

  then

  <\equation>
    \<sigma\><rsup|2><rsub|W>\<approx\>W*<big|int><rsub|\<tau\>=-\<infty\>><rsup|\<infty\>>\<nu\><around|(|\<tau\>|)><math-up|d>\<tau\><label|eq:covariance>
  </equation>

  and we find, using Eq. (<reference|basic>):

  <eqnarray|<tformat|<table|<row|<cell|n\<approx\>>|<cell|1-<sqrt|<frac|\<mu\><rsub|W>|\<sigma\><rsup|2><rsub|W>>>\<assign\><wide|n|~><eq-number><label|eq:simple>>>>>>

  where <math|\<mu\><rsub|W>=\<Lambda\>*W> is the average number of events
  falling in a window of size <math|W>. The above expression has a very
  intuitive interpretation. When the variance is equal to the event rate, the
  process is obeying Poisson statistics and <math|n=0>. Any increase in the
  variance above the event rate indicates some positive correlations and,
  within a Hawkes framework, a positive branching ratio.

  Note from Eq. (<reference|eq:bounded>) that
  <math|\<sigma\><rsup|2><rsub|W>/W> is a biased estimator for
  <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|\<tau\>|)>>
  and for a general <math|W> will fall short of its theoretical value. This
  means that Eq. (<reference|eq:simple>) will generally under-estimate the
  branching ratio and only become exact in the limit <math|W\<to\>\<infty\>>.

  In practice, to estimate the branching ratio of an empirical sample of
  total length <math|T=m*W> we substitute the mean and variance term in Eq.
  (<reference|eq:simple>) by their sample estimates:

  <\equation>
    <wide|\<mu\>|~><rsub|W>=W*<frac|N<rsub|T>|T>\<equiv\><frac|1|m>*<big|sum><rsub|i=1><rsup|m>N<rsub|W><around|(|i|)>
  </equation>

  <\equation>
    <wide|\<sigma\>|~><rsup|2><rsub|W>=<frac|1|m-1>*<big|sum><rsub|i=1><rsup|m><around*|(|N<rsub|W><around|(|i|)>-<wide|\<mu\>|~><rsub|W>|)><rsup|2>
  </equation>

  An estimate obtained in this fashion is asymptotically convergent for large
  <math|T\<gg\>W>, i.e. <math|m\<gg\>1>. For a fixed window size <math|W> we
  can always ensure that our estimate of the variance of <math|N<rsub|W>> is
  within a desired maximum error with a desired minimum probability by
  increasing <math|T> and therefore the number of observations <math|m> of
  <math|N<rsub|W>>. Furthermore, we can make Eq. (<reference|eq:covariance>)
  exact by allowing <math|W> to be arbitrarily large.

  Note, however, that for any finite <math|m>, the average of
  <math|<wide|n|~>> over all possible realisations of the process is in fact
  <math|-\<infty\>>! This is because a value
  <math|<wide|\<sigma\>|~><rsup|2><rsub|W>=0> is always possible with a non
  zero probability. For this reason we choose to present the median of our
  estimates.

  <section|Numerical simulations & Implementation notes>

  In Fig. <reference|fig:varying>, we test the estimation procedure described
  in the previous section on a number of simulated exponential Hawkes
  processes with a variety of branching ratios. To do this we fix
  <math|\<beta\>=1.0> but vary <math|\<alpha\>=n> in the range
  <math|0\<leq\>\<alpha\>\<leq\>0.95>. We choose a base intensity
  <math|\<mu\>=1-n> such that each process has the same average event rate
  <math|\<Lambda\>=1>. We simulate the process for a time <math|T=10<rsup|5>>
  using simulation Algorithm 1 described in <cite|moller2005perfect>. This
  procedure is prone to edge effects so we disregard the initial period of
  size <math|10<rsup|4>> to ensure the process is close to stationarity in
  the period studied.

  We estimate the branching ratio with a window size <math|W=20>
  significantly larger than the time-scale of correlation of our process
  <math|\<beta\><rsup|-1>=1>. However, the window size chosen is also
  sufficiently small that we have a significant number of independent
  observations <math|m=<around|(|0.9\<times\>10<rsup|5>|)>/20> with which to
  make a reliable estimate of the variance of <math|N<rsub|W>>. We see very
  good agreement between our branching ratio estimates and the input
  branching ratio of the simulation, see Fig. <reference|fig:varying>.

  Note however, that our approximation systematically underestimates the
  branching ratio since our finite window size does not completely cover the
  region of support of the autocorrelation function. This is particularly
  visible in Fig. <reference|fig:varying> for large <math|n>. We now
  investigate the effect of window size on the estimate obtained.

  <big-figure|<image|varying_n_20.pdf|4.25in|2.5in||>|<label|fig:varying>
  Applying the mean-variance branching ratio approximation method to a
  simulated Hawkes process with exponential kernel form and scale parameter
  <math|\<beta\>=1.0>. <math|\<alpha\>> is varied to decide the branching
  ratio, and <math|\<mu\>> is varied to keep the average event rate fixed at
  <math|\<Lambda\>=1.0>. The process is simulated for <math|T=100000*s> and
  the branching ratio estimate is made using Equation <reference|eq:simple>
  with a window size <math|W=20>. The mean and [5%,95%] confidence bands are
  calculated over an ensemble of 100 process for each parameter set.>

  <subsection|Choice of window size W>

  For Eq. (<reference|eq:covariance>) to be accurate, we must choose a large
  <math|W>. However for a finite sample size, large <math|W> implies small
  <math|m=<around|(|T/W|)>> and therefore less statistical power with which
  to estimate the variance of the event count <math|N<rsub|W>>. This
  compromise is illustrated in Fig. <reference|fig:varying> for which we
  simulate an ensemble of exponential Hawkes processes with parameters
  <math|\<alpha\>=0.75>, <math|\<beta\>=1.0> and <math|\<mu\>=0.25>. We note
  that for increasing window size <math|W>, the confidence bands of our
  estimate converge on the expected value of <math|n=0.75>.

  However when we make the window size too large, we suffer significant error
  coming from the estimation of the variance. For the practical
  implementation of this procedure to empirical data we recommend a choice of
  window size sufficiently large to capture the bulk of autocorrelation
  present in the event rate, but sufficiently small that one can expect to
  obtain reliable estimates of the variance of the event count in that
  window.

  One can approximate upper and lower confidence intervals on the branching
  ratio estimate from a single realisation of a time series by bootstrap
  re-sampling. Indeed the simple variance estimator of Eq.
  (<reference|eq:variance>) is not optimal and can be improved with the use
  of over-lapping windows or, for example, a Monte Carlo sampling scheme
  which selects random windows with replacement.

  <big-figure|<image|varying_W_simulation.pdf|4.25in|2.5in||>|<label|fig:varying>
  Applying the mean-variance branching ratio approximation method to
  simulated data. Shaded area represents the [5%,95%] confidence interval. We
  note that the branching ratio estimate converges on the expected value of
  <math|0.75> as the window size increases. For very large W, we lack a
  sufficient number of event count observations to estimate the variance of
  <math|N<rsub|W>> with precision and the confidence interval grows
  considerably.>

  <subsection|Power-law kernel>

  Finally we test the estimation procedure on a (near) critical power-law
  Hawkes process, a type suggested in some recent publications as a good fit
  to financial event data <cite|bacry|criticalreflexivity>. Specifically, we
  consider a kernel with an Omori law form:

  <\equation>
    \<phi\><around|(|\<tau\>|)>=<frac|n*\<epsilon\>*\<tau\><rsub|0><rsup|\<epsilon\>>|<around*|(|\<tau\><rsub|0>+\<tau\>|)><rsup|<around*|(|1+\<epsilon\>|)>>>
  </equation>

  In the critical case of <math|n=1> with
  <math|0\<less\>\<epsilon\>\<less\>0.5> this process will exhibit long-range
  dependence, with an autocorrelation function
  <math|\<nu\><around|(|\<tau\>|)>> decaying asymptotically as a power law:
  <math|\<nu\><around|(|\<tau\>|)>\<sim\>\<tau\><rsup|-<around|(|1-2*\<epsilon\>|)>>>
  <cite|bremaud|criticalreflexivity>. The integral of the autocorrelation
  function is therefore divergent for large <math|\<tau\>>'s and the variance
  of the event count in a window of size <math|W> grows with as
  <math|\<sigma\><rsup|2><rsub|W>\<sim\>W<rsup|1+2*\<epsilon\>>>. The
  <math|<sqrt|<frac|\<mu\><rsub|W>|\<sigma\><rsup|2><rsub|W>>>> term in Eq.
  <reference|eq:simple> will in this case not converge to a finite constant
  for large <math|W> but rather shrink to zero, leading to
  <math|1-<wide|n|~>\<sim\>W<rsup|-\<epsilon\>>>.

  We have simulated such a process with exponent <math|\<epsilon\>=0.35> and
  cut-off parameter <math|\<tau\><rsub|0>=1.0>. To allow our simulation to
  attain a stationary state with an average event rate
  <math|\<Lambda\>\<approx\>1>, we make our process very near critical by
  choosing <math|n=0.99> and <math|\<mu\>=0.01>. We simulate for a very long
  period <math|T=1\<times\>10<rsup|9>> and discard the first
  <math|0.9\<times\>10<rsup|9>> to ensure the process is close to
  stationarity (<math|\<Lambda\>\<gtr\>0.99> at
  <math|0.9\<times\>10<rsup|9>>). In Fig. <reference|fig:power> we present
  the results of branching ratio estimation using Eq. (<reference|eq:simple>)
  with a variety of window sizes <math|W>.

  We note that the branching ratio estimate we obtain is very much dependent
  on the choice of window size used. To capture all the correlation present
  in the process and obtain estimates close to the the true input value
  <math|n=0.99> we must probe the correlation on very large scales, by
  choosing a very large value for <math|W>. The branching ratio obtained
  indeed varies with window size according to the law
  <math|W<rsup|-\<epsilon\>>>, in a similar way to the integral of the kernel
  <math|\<phi\><around|(|\<tau\>|)>>, see Fig. <reference|fig:power>.

  <big-figure|<image|power_law.pdf|4.25in|2.5in||> |<label|fig:power>
  <math|1-<wide|n|~>> for simulated near-critical
  (<math|n=0.99,\<epsilon\>=0.35>) power-law Hawkes processes. The value for
  <math|1-<wide|n|~>> that we obtain approximately scales as
  <math|\<sim\>W<rsup|-0.35>> for large <math|W>. Note that the simulated
  process is only `near-critical' (with a branching ratio
  <math|n=1-1\<times\>10<rsup|-2>>) so for very large <math|W> the curve
  levels off and converges to <math|1\<times\>10<rsup|-2>>.3>

  <section|Empirical applications>

  <subsection|Flash-crash revisited>

  To demonstrate the effectiveness of this simple estimator we have repeated
  the flash-crash day branching ratio analysis of Filimonov & Sornette
  <cite|filimonov>. We consider non-overlapping periods of 10 minutes in the
  hours of trading before and just after the flash-crash. For each 10-minute
  period, we calculate the sample mean and variance of the number of
  mid-price changes in the 60 windows of length <math|W=10*s> contained. The
  resulting values are plugged into Eq. (<reference|eq:simple>) to obtain an
  approximation of the branching ratio for each period. The results are
  presented in Fig. <reference|fig:flashcrash>.

  <big-figure|<image|flashcrash.pdf|4.25in|2.5in||>|<label|fig:flashcrash>
  Reproduction of the flash-crash branching ratio analysis of Filimonov &
  Sornette using the mean-variance estimator. Our results compare well with
  those obtained by maximising the likelihood of the exponential model (with
  1-second randomisation). The dashed line is the E-mini S&P price. The
  points are placed at the end of the 10-minute period for which the
  branching ratio estimate is made. The shaded region is a [10%,90%]
  confidence interval generated by bootstrap re-sampling.>

  Note that this simple estimator is biased, and for a general <math|W>, will
  typically underestimate the value of <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<nu\><around|(|t|)><math-up|d>t>
  and therefore the branching ratio. Since we consider a window size
  <math|W=10*s> we have systematically underestimated <math|n> in Figure
  <reference|fig:flashcrash> as measurements of <math|\<nu\><around|(|t|)>>
  on this data have support outside the interval <math|[-10*s,10*s]> <emdash>
  there is still significant autocorrelation in the event rate at scales
  longer than <math|10*s>.

  However, we have identified that a window size <math|W> of the order of
  approximately 10 to 30 seconds produces estimates of the branching ratio on
  our data in line with those obtained by ML fitting to the exponential model
  after intra-second randomisation (the method applied in <cite|filimonov>.)
  Note that we do not fix <math|\<beta\>> in our ML fit but let it settle
  naturally at the value which maximises the log-likelihood. We observe that
  this value <math|<wide|\<beta\>|^>> is very much dependent on the period of
  randomisation<footnote|To address the limited precision of the event data
  in <cite|filimonov>, the authors randomise timestamps uniformly inside the
  second that they are reported.> of the timestamps. When we randomise
  timestamps inside each millisecond we obtain
  <math|<wide|\<beta\>|^><rsup|-1>\<approx\>10<rsup|-2>> for periods in 2010
  but randomisation at larger intervals (e.g. the intra-second randomisation
  of Filimonov & Sornette) prevents <math|<wide|\<beta\>|^><rsup|-1>> from
  exceeding values of the order of magnitude of the scale of randomisation.

  Note that since our results with <math|W=10*s> correspond well with those
  obtained using the methods of Filimonov & Sornette <cite|filimonov>, their
  procedure must <em|also> underestimate the branching ratio. To converge on
  the true <math|n> in expectation, we must take Eq. (<reference|eq:simple>)
  in the limit of <math|W\<to\>\<infty\>>. We do just this in Fig.
  <reference|fig:n> for mid-price changes of the E-mini S&P Futures contract
  in 2010. One notes that as the window size increases, the branching ratio
  converges to <math|n=1> in a non-trivial way. As reported in
  <cite|criticalreflexivity> for the structure of the kernel at short and
  long time-scales, two regimes are detectable with a transition around five
  minutes. The branching ratio asymptotically tends towards <math|n=1.0> with
  a scaling exponent <math|\<epsilon\>=-0.37> compatible with the value of
  <math|0.45> estimated in <cite|criticalreflexivity> for a 14-year period.
  Note that in taking the limit <math|W\<to\>\<infty\>> we consider variation
  in the event rate at significant time-scales to be explained by the
  stationary Hawkes model.

  <big-figure|<image|n_2010.pdf|4.25in|2.5in||>|<label|fig:n>
  <math|1-<wide|n|~>>, the estimate of the branching ratio as a function of
  window size for E-mini S&P mid-price changes in 2010. The mean and variance
  of <math|N<rsub|W>> are estimated on the full year. The change of power-law
  behaviour occurs around <math|100> seconds. Note that we have `stitched'
  together all 5-minute bins of regular trading hours (09:30 to 16:00 EST)
  that contain at least one event (this solves a problem arising from missing
  data at half-days). We have then de-trended the intra-day seasonality by
  dividing each 5-minute event count by a normalised average event rate for
  each 5-minutes of the trading day calculated on the full year.>

  <subsection|Reflexivity : 1998 - 2013>

  Using the mean-variance estimator, we can also easily reproduce the result
  of <cite|filimonov> that claims to demonstrate that reflexivity has been
  increasing in the S&P futures market since 1998. To do this we set our only
  parameter <math|W=30*s> and estimate the branching ratio in periods of
  15-minutes. In Fig. <reference|fig:19982013> we present the 2-month medians
  of these estimates beside the median of the branching ratio estimate
  obtained using the exponential maximum likelihood approach after
  intra-second randomisation.

  <big-figure|<image|1998_to_2013.pdf|4.25in|2.5in||> |<label|fig:19982013>
  Estimates of the branching ratio for 15-minute windows using the method of
  Filimonov & Sornette <cite|filimonov> and estimates using the mean-variance
  estimator with a window size of <math|W=30*s>. Note that our MLE results
  differ somewhat from the plot presented in <cite|filimonov>. We attribute
  this to differences in the data source or identification of mid-price
  changes.>

  Since we expect the minimum time-scale of correlation in the data to have
  decreased over the past decades (due to decreasing latency with advancing
  technology) we now re-perform the experiment but with a window size
  <math|W<rsub|t>> that follows Moore's law in such a way to keep the average
  number of events in <math|W<rsub|t>> roughly constant. More precisely the
  window size <math|W<rsub|t>> halves every 18 months; this describes well
  the increase in the high frequency activity of markets, see
  <cite|criticalreflexivity>. The results of this experiment are presented in
  Fig. <reference|fig:varying> and confirm that the kernel integral is
  approximately invariant over time provided that the measurement window
  <math|W<rsub|t>> is appropriately rescaled to account for the changing
  speed of interactions in the market. We find this quite remarkable, as this
  suggests that the amount of self-reflexivity in financial markets is
  <with|font-shape|italic|scale invariant>, and has not significantly
  increased due to high-frequency trading.

  <big-figure|<image|varying_W.pdf|4.25in|2.5in||>|<label|fig:varying>
  Estimates of the branching ratio on 2-month periods using the mean-variance
  estimator with a window size that follows Moore's law:
  <math|W<rsub|t>=W<rsub|0>*e<rsup|-c*<around|(|t-t<rsub|0>|)>>> with
  <math|c=-log <around|(|1/2|)>/<around|(|18<space|0.17em><math-up|months>|)>>
  and <math|t<rsub|0>=1998>. We again stitch together periods of regular
  trading hours and de-trend the event count by the intra-day U-shape for
  each year. When <math|W> is appropriately rescaled, the branching ratio
  estimate is approximately constant through time, for all values of
  <math|W<rsub|0>>, and tends to <math|n=1.0> for large <math|W<rsub|0>>.>

  <section|Summary>

  We have introduced a simple estimator for the branching ratio of Hawkes
  self-exciting point-process. The method is straight-forward to apply to
  empirical event data since it requires only a rudimentary calculation on
  the mean and variance of the event rate. The estimator does not suffer from
  the bias inherent to the contentious question of the choice of kernel in
  the likelihood maximisation approach, and furthermore it avoids the need
  for complicated numerical minimisation techniques.

  Despite its simplicity, our estimator can accurately reproduce results
  obtained for the branching ratio using this prior method. The estimator
  presented is indeed a biased estimator, but it can be made asymptotically
  unbiased in the limit of large <math|W> and <math|T>, for which we observe
  that the branching ratio for empirical mid-price changes of the E-mini S&P
  futures contract approaches unity in line with previous theoretical and
  empirical results <cite|criticalreflexivity>.

  Furthermore we demonstrate that if the window size is allowed to scale with
  Moore's law and adapt to the changing speed of interaction in the market
  over the past fifteen years, then the branching ratio approximation
  recovered is constant supporting prior observations of the invariance of
  the Hawkes kernel and branching ratio over time in
  <cite|criticalreflexivity>.

  Finally, let us reiterate the caveat made above: the Hawkes analysis of the
  activity in financial markets leads to the conclusion that the process must
  be critical. However, it might well be that the dynamics of markets is more
  complicated and requires non-linearities absent from the Hawkes process
  defined by Eq. (<reference|eq:hawkes>)). More work on this issue would be
  highly interesting, and is in progress in our group.

  <section*|Acknowledgements>

  We thank V. Filimonov for many productive discussions about this topic. We
  are also indebted to N. Bercot, J. Kockelkoren, M. Potters, I.
  Mastromatteo, P. Blanc and J. Donier for interesting and useful comments.

  <\bibliography|bib|plain|branching>
    <with|href|<macro|1|2|<arg|2>>|<\bib-list|10>
      <bibitem*|1><label|bib-hawkes>A.<nbsp>G. Hawkes, ``Spectra of some
      mutually exciting point processes,''
      <with|font-shape|italic|Biometrika> <with|font-series|bold|58> (1970)
      83.

      <bibitem*|2><label|bib-hawkes2>A.<nbsp>G. Hawkes, ``Point spectra of
      some mutually exciting point processes,''
      <with|font-shape|italic|Journal of the Royal Statistical Society,
      Series B> <with|font-series|bold|33> no.<nbsp>3, (1971) 438--443.

      <bibitem*|3><label|bib-filimonov>V.<nbsp>Filimonov and
      D.<nbsp>Sornette, ``Quantifying reflexivity in financial markets:
      Toward a prediction of flash crashes,''
      <with|font-shape|italic|Physical Review E> <with|font-series|bold|85>
      (2012) 056108.

      <bibitem*|4><label|bib-ozaki>T.<nbsp>Ozaki, ``Maximum likelihood
      estimation of Hawkes self-exciting point process,''
      <with|font-shape|italic|Annals of the Institute of Statistical
      Mathematics> <with|font-series|bold|31> (1979) 145--155. Part B.

      <bibitem*|5><label|bib-harris>T.<nbsp>E. Harris,
      <with|font-shape|italic|The Theory of Branching Processes>.
      <newblock>Dover Publications, 2002.

      <bibitem*|6><label|bib-commodityreflexivity>V.<nbsp>Filimonov,
      D.<nbsp>Bicchetti, N.<nbsp>Maystre, and D.<nbsp>Sornette,
      ``Quantification of the high level of endogeneity and of structural
      regime shifts in commodity markets.,'' <with|font-shape|italic|Journal
      of International Money and Finance> <with|font-series|bold|42> (April,
      2013) 174--192.

      <bibitem*|7><label|bib-neurobiology>V.<nbsp>Pernice, B.<nbsp>Staude,
      S.<nbsp>Cardanobile, and S.<nbsp>Rotter, ``How structure determines
      correlations in neuronal networks,'' <with|font-shape|italic|PLOS
      Computational Biology> <with|font-series|bold|7> (2011) e1002059.

      <bibitem*|8><label|bib-social>R.<nbsp>Crane and D.<nbsp>Sornette,
      ``Robust dynamic classes revealed by measuring the response function of
      a social system,'' <with|font-shape|italic|Journal of the American
      Statistical Association> <with|font-series|bold|105> no.<nbsp>41,
      (September, 2008) 15649--15653.

      <bibitem*|9><label|bib-crime>G.<nbsp>O. Mohler, M.<nbsp>B. Short,
      P.<nbsp>J. Brantingham, F.<nbsp>P. Schoenberg, and G.<nbsp>E. Tita,
      ``Self-exciting point process modeling of crime,''
      <with|font-shape|italic|Journal of the American Statistical
      Association> <with|font-series|bold|106> (2011) 100--108.

      <bibitem*|10><label|bib-earthquakes1>Y.<nbsp>Ogata, ``Seismicity
      analysis through point-process modeling: A review,''
      <with|font-shape|italic|Pure and Applied Geopysics>
      <with|font-series|bold|155> no.<nbsp>2-4, (1999) 471--507.

      <bibitem*|11><label|bib-earthquakes2>A.<nbsp>Helmstetter and
      D.<nbsp>Sornette, ``Subcritical and supercritical regimes in epidemic
      models of earthquake aftershocks,'' <with|font-shape|italic|Journal of
      Geophysical Research: Solid Earth> <with|font-series|bold|107>
      no.<nbsp>B10, (2002) ESE 10--1--ESE 10--21.

      <bibitem*|12><label|bib-bormetti>G.<nbsp>Bormetti, L.<nbsp>M.
      Calcagnile, M.<nbsp>Treccani, F.<nbsp>Corsi, S.<nbsp>Marmi, and
      F.<nbsp>Lillo, ``Modelling systemic cojumps with Hawkes factor
      models,'' <hlink|<with|font-family|tt|arXiv:1301.6141
      [q-fin.ST]>|http://arxiv.org/abs/1301.6141>.

      <bibitem*|13><label|bib-bauwens>L.<nbsp>Bauwens and N.<nbsp>Hautsch,
      ``Modelling financial high frequency data using point processes,'' in
      <with|font-shape|italic|Handbook of Financial Time Series>,
      T.<nbsp>Mikosch, J.-P. Kreiss, R.<nbsp>A. Davis, and T.<nbsp>G.
      Andersen, eds. <newblock>Springer Berlin Heidelberg, 2009.

      <bibitem*|14><label|bib-hawkesvolatility>P.<nbsp>Embrechts,
      T.<nbsp>Liniger, and L.<nbsp>Lin, ``Multivariate Hawkes processes: an
      application to financial data,'' <with|font-shape|italic|Journal of
      Applied Probability> <with|font-series|bold|48A> (August, 2011)
      367--378.

      <bibitem*|15><label|bib-bacry>E.<nbsp>Bacry, K.<nbsp>Dayri, and J.-F.
      Muzy, ``Non-parametric kernel estimation for symmetric Hawkes
      processes. application to high frequency financial data,''
      <with|font-shape|italic|European Physics Journal B>
      <with|font-series|bold|85> no.<nbsp>5, (2012) 157.

      <bibitem*|16><label|bib-bacrypricetrades>E.<nbsp>Bacry and J.-F. Muzy,
      ``Hawkes model for price and trades high-frequency dynamics,''
      <with|font-shape|italic|Quantitative Finance>
      <with|font-series|bold|14> (2014) 1147--1166.

      <bibitem*|17><label|bib-toke>I.<nbsp>M. Toke and F.<nbsp>Pomponio,
      ``Modelling trades-through in a limit order book using Hawkes
      processes,'' <with|font-shape|italic|Economics: The Open-Access,
      Open-Assessment E-Journal> <with|font-series|bold|6> (2012) .

      <bibitem*|18><label|bib-dafonseca>J.<nbsp>D. Fonseca and
      R.<nbsp>Zaatour, ``Hawkes process: Fast calibration, application to
      trade clustering, and diffusive limit,''
      <with|font-shape|italic|Journal of Futures Markets> (2013) .

      <bibitem*|19><label|bib-hawkesmicrostructure>E.<nbsp>Bacry,
      S.<nbsp>Delattre, M.<nbsp>Hoffmann, and J.-F. Muzy, ``Modeling
      microstructure noise with mutually exciting point processes,''
      <with|font-shape|italic|Quantitative Finance>
      <with|font-series|bold|13> (2012) 65--77.

      <bibitem*|20><label|bib-criticalreflexivity>S.<nbsp>J. Hardiman,
      N.<nbsp>Bercot, and J.-P. Bouchaud, ``Critical reflexivity in financial
      markets: a Hawkes process analysis,'' <with|font-shape|italic|The
      European Physical Journal B> <with|font-series|bold|86> no.<nbsp>10,
      (2013) 1--9.

      <bibitem*|21><label|bib-apparentcriticality>V.<nbsp>Filimonov and
      D.<nbsp>Sornette, ``Apparent criticality and calibration issues in the
      Hawkes self-excited point process model: application to high-frequency
      financial data,'' <hlink|<with|font-family|tt|arXiv:1308.6756
      [q-fin.ST]>|http://arxiv.org/abs/1308.6756>.

      <bibitem*|22><label|bib-rubin>I.<nbsp>Rubin, ``Regular point processes
      and their detection,'' <with|font-shape|italic|IEEE Transactions on
      Information Theory> <with|font-series|bold|IT-18> (September, 1972)
      547--557.

      <bibitem*|23><label|bib-moller2005perfect>J.<nbsp>Møller and J.<nbsp>G.
      Rasmussen, ``Perfect simulation of hawkes processes,''
      <with|font-shape|italic|Advances in Applied Probability> (2005)
      629--646.

      <bibitem*|24><label|bib-bremaud>P.<nbsp>Brémaud and L.<nbsp>Massoulié,
      ``Hawkes branching point processes without ancestors,''
      <with|font-shape|italic|Journal of Applied Probabability>
      <with|font-series|bold|38> no.<nbsp>1, (2001) 122--135.
    </bib-list>>
  </bibliography>
</body>

<initial|<\collection>
</collection>>
<TeXmacs|1.99.3>

<style|<tuple|amsart|american>>

<\body>
  <doc-data|<doc-title|The Density of The Duration Until The Next Event of A
  Hawkes Process>|<doc-author|<author-data|<author-name|<date|>>>>|<doc-author|<author-data|<author-name|<space|5em>Stephen
  Crowley>|<\author-affiliation>
    \;
  </author-affiliation>>>><\footnote>
    stephenc@nym.hush.com
  </footnote>

  \;

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>Hawkes
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1.<space|2spc>The (Standard) Exponential Hawkes
    Process of Arbitrary Order <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|2tab|1.1.1.<space|2spc>Maximum Likelihood Estimation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.1.2.<space|2spc>The case when P=1 and the Lambert W
    Function: Transcendental Recursion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|1.1.3.<space|2spc>Maximum Likelihood Estimation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.2.<space|2spc>An Expression for the Density of the
    Duration Until the Next Event When <with|mode|math|P=1>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|1.2.1.<space|2spc>The Case of Any Order
    <with|mode|math|P=n> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.3.<space|2spc>Filtering, Prediction, Estimation,
    etc <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.4.<space|2spc>Calculation of the Expected Number of
    Events Any Given Time From Now <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|1.4.1.<space|2spc>Prediction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Hawkes Processes>

  <subsection|The (Standard) Exponential Hawkes Process of Arbitrary Order>

  A uni-variate linear self-exciting counting process <math|N<rsub|t>> is one
  that can be expressed as\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|int><rsub|-\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>><label|HawkesIntensity>
  </equation>

  where <math|\<mu\><around*|(|t|)>> is some baseline which factors in
  sources of non-stationarity, see (<reference|lambda0>).
  <cite|hawkes-finance><cite|hawkes1971spectra><cite|shek2010modeling><cite|chavez2012high><cite-detail|hautsch2011econometrics|11.3>
  Here, \ <math|\<nu\>:\<bbb-R\><rsub|+>\<rightarrow\>\<bbb-R\><rsub|+>> is a
  kernel function which expresses the positive influence of past events
  <math|t<rsub|i>> on the current value of the intensity process, and
  <math|\<kappa\>> is a scaling factor for the baseline intensity
  <math|\<mu\><around*|(|t|)>>. For comparison with the multivariate case see
  Equation (<reference|mhi>). \ The Hawkes process of order <math|P> is a
  defined by the exponential kernel

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>
  </equation>

  The intensity of the exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t-s|)>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  where <math|B<rsub|j><around*|(|i|)>> is given recursively by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|><big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|>*<around*|(|1+<big|sum><rsub|k=1><rsup|i-2>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1><rsub|>|)>><around*|(|1+B<rsub|j><around*|(|i-1|)>|)>>>>>><label|Bj>
  </equation>

  since <math| e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|i-1>|)>>=e<rsup|-\<beta\><rsub|j>0>=e<rsup|-0>=1>.
  A uni-variate Hawkes process is stationary if the branching ratio is less
  than one.

  <\equation>
    <big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>\<less\>1
  </equation>

  If a Hawkes process is stationary then the unconditional mean is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>=E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-E<around*|[|\<nu\><around*|(|t|)>|]>>>>|<row|<cell|>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>>>>>>>
  </equation>

  where <math|E<around*|(|*\<cdummy\>|)>> is the Lebesgue integral over the
  positive real axis. For consecutive events, the dual-predictable projection
  is expressed (<reference|compensator>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<nu\><around*|(|t|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>>
  </equation>

  compared with the multivariate compensator in Equation
  (<reference|lhm>)where there is the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k>\<leqslant\>t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|i-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=1+e<rsup|-\<beta\><rsub|j>\<Delta\>t<rsub|i>>A<rsub|j><around*|(|i-1|)>>>>>><label|A>
  </equation>

  with <math|A<rsub|j><around*|(|0|)>=0> since the integral of the
  exponential kernel (<reference|exp>) is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> <around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>
    <around*|(|e<rsup|-\<beta\><rsub|j> t<rsub|i>>-e<rsup|-\<beta\><rsub|j>t<rsub|i-1>>|)>>>>>>
  </equation>

  \ If <math|\<lambda\><rsub|0><around*|(|t|)>> does not vary with time, that
  is, <math|\<lambda\><rsub|0><around*|(|t|)>=\<lambda\><rsub|0>> then
  (<reference|hc>) simplifies to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>-t<rsub|k>><rsup|t<rsub|i>-t<rsub|k>>\<nu\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>>>>
  </equation>

  Similarly, another parametrization is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<kappa\>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\>
    \<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|kappa>
  </equation>

  where <math|\<kappa\>> scales the predetermined baseline intensity
  <math|\<lambda\><rsub|0><around*|(|s|)>>. In this parametrization the
  intensity is also scaled by <math|\<kappa\>>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<kappa\>*\<lambda\><rsub|0><around*|(|t|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  this allows to precompute the deterministic part of the compensator
  <math|\<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
  \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s>.

  <subsubsection|Maximum Likelihood Estimation>

  The log-likelihood of a simple point process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln\<cal-L\><around*|(|N<around*|(|t|)><rsub|t\<in\><around*|[|0,T|]>>|)>>|<cell|=<big|int><rsub|0><rsup|T><around*|(|1-\<lambda\><around*|(|s|)>|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|T>\<lambda\><around*|(|s|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>>>>
  </equation>

  which in the case of the Hawkes model of order <math|P> can be explicitly
  written <cite|ozaki1979maximum> as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1\<ldots\>n>|)>>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=T+<big|sum><rsub|i=1><rsup|n><around*|(|ln\<lambda\><around*|(|t<rsub|i>|)>-\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=1><rsup|i-1>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    B<rsub|j><around*|(|i|)>|)>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|<rsub|T>>\<kappa\>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|n>-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>\<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    B<rsub|j><around*|(|i|)>|)>>>>>>
  </equation>

  where <math|T=t<rsub|n>> and <math|B<rsub|j><around*|(|i|)>>
  <cite|ogata1981lewis> is defined by (<reference|Bj>) If the baseline
  intensity \ is constant <math|\<lambda\><rsub|0><around*|(|t|)>=1> then the
  log-likelihood can be written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}><rsub|>|)>>|<cell|=T-\<kappa\>T-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|T-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    B<rsub|j><around*|(|i|)>|)>>>>>><with|mode|text|><label|hawkesll>
  </equation>

  Note that it was necessary to shift each <math|t<rsub|i>> by
  <math|t<rsub|1>> so that <math|t<rsub|1>=0> and <math|T=t<rsub|n>>. Also
  note that <math|T> is just an additive constant which does not vary with
  the parameters so for the purposes of estimation can be removed from the
  equation. \ 

  <subsubsection|The case when P=1 and the Lambert W Function: Transcendental
  Recursion>

  The Hawkes process of order <math|P=1> is a defined by the exponential
  kernel

  <\equation>
    \<nu\><around*|(|t|)>=<rsup|>\<alpha\><rsub|> e<rsup|-\<beta\><rsub|>
    t><label|exp>
  </equation>

  The intensity of the exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|t-s|)>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|k=1><rsup|<wide|N|\<breve\>><rsup|><rsub|t>>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsup|<wide|N|\<breve\>><rsup|><rsub|t>><rsub|k=1>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+\<alpha\><rsub|><big|sum><rsub|k=1><rsup|<wide|N|\<breve\>><rsup|><rsub|t>>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+\<alpha\><rsub|
    >B<rsub|><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  where <math|B<rsub|><around*|(|t|)>> is given by equation (<reference|Bj>).
  A uni-variate Hawkes process is stationary if the branching ratio is less
  than one.

  <\equation>
    <frac|\<alpha\><rsub|>|\<beta\><rsub|>>\<less\>1<label|hs>
  </equation>

  If a Hawkes process is stationary then the unconditional mean is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>=E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|=<frac|\<lambda\><rsub|0>|1-<big|int><rsub|0><rsup|\<infty\>>\<nu\><around*|(|t|)>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|\<lambda\><rsub|0>|1-<big|int><rsub|0><rsup|\<infty\>>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|> t>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|\<lambda\><rsub|0>|1-<frac|\<alpha\><rsub|>|\<beta\><rsub|>>>>>>>><label|hm>
  </equation>

  For consecutive events, let <math|\<Delta\>t<rsub|i>=t<rsub|i>-t<rsub|i-1>>,
  then the compensator, also known as the dual predictable projection, is
  (<reference|compensator>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<lambda\><rsub|0><around*|(|t|)>+\<alpha\><rsub|
    >B<rsub|j><around*|(|N<rsub|t>|)>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<alpha\><rsub|><big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+\<alpha\><rsub|><big|sum><rsub|k=1><rsup|i-1>
    <big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=1><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=1><rsup|i-1><rsup|><frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|1-e<rsup|-\<beta\>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|hc>
  </equation>

  compared with the multivariate compensator in Equation (<reference|lhm>)
  where there is the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k>\<leqslant\>t<rsub|i>>e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|i-1>e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=1+e<rsup|-\<beta\>\<Delta\>t<rsub|i><rsub|>>A<rsub|j><around*|(|i-1|)>>>>>><label|A>
  </equation>

  with <math|A<rsub|j><around*|(|0|)>=0> since the integral of the
  exponential kernel (<reference|exp>) is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|> <around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<rsup|><frac|\<alpha\><rsub|>|\<beta\><rsub|>>
    <around*|(|e<rsup|-\<beta\><rsub|> t<rsub|i>>-e<rsup|-\<beta\><rsub|>t<rsub|i-1>>|)>>>>>>
  </equation>

  \ If <math|\<lambda\><rsub|0><around*|(|t|)>> does not vary with time, that
  is, let <math|\<lambda\><rsub|0><around*|(|t|)>=\<lambda\><rsub|0>> \ and
  <math|\<Delta\>t<rsub|i>=t<rsub|i>-t<rsub|i-1>> then (<reference|hc>)
  simplifies to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=\<Delta\>t<rsub|i><rsup|>
    \<lambda\><rsub|0>+<big|sum><rsub|k=1><rsup|i-1><frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=\<Delta\>t<rsub|i>\<lambda\><rsub|0>+<big|sum><rsub|k=1><rsup|i-1><big|int><rsub|t<rsub|i-1>-t<rsub|k>><rsup|t<rsub|i>-t<rsub|k>>\<nu\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<Delta\>t<rsub|i>\<lambda\><rsub|0>+<frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|1-e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>>
  </equation>

  Similarly, another parametrization is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<kappa\>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|1-e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|1-e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\>
    \<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>+<frac|\<alpha\><rsub|>|\<beta\><rsub|>><around*|(|1-e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|kappa>
  </equation>

  where <math|\<kappa\>> scales the baseline intensity
  <math|\<lambda\><rsub|0><around*|(|s|)>>. In this parametrization the
  intensity is also scaled by <math|\<kappa\>>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<kappa\>*\<lambda\><rsub|0><around*|(|t|)>+\<alpha\><rsub|>B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  this allows the baseline(apriori) part of the compensator be defined by
  <math|\<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
  \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s> .

  <subsubsection|Maximum Likelihood Estimation>

  The log-likelihood of a simple point process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln\<cal-L\><around*|(|N<around*|(|t|)><rsub|t\<in\><around*|[|0,T|]>>|)>>|<cell|=<big|int><rsub|0><rsup|T><around*|(|1-\<lambda\><around*|(|s|)>|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|T>\<lambda\><around*|(|s|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>>>>
  </equation>

  which in the case of the Hawkes model of order <math|P> can be explicitly
  written <cite|ozaki1979maximum> as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1\<ldots\>n>|)>>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=T+<big|sum><rsub|i=1><rsup|n><around*|(|ln\<lambda\><around*|(|t<rsub|i>|)>-\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=1><rsup|i-1>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|<rsub|T>>\<kappa\>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|n>-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>\<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>>>>
  </equation>

  where <math|T=t<rsub|n>> and we have the recursion<cite|ogata1981lewis>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><around*|(|1+R<rsub|j><around*|(|i-1|)>|)>>>|<row|<cell|>|<cell|>>>>>
  </equation>

  If we have constant baseline intensity <math|\<lambda\><rsub|0><around*|(|t|)>=1>
  then the log-likelihood can be written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}><rsub|>|)>>|<cell|=T-\<kappa\>T-<big|sum><rsub|i=1><rsup|n=N<rsub|t>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|T-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>>>><with|mode|text|><label|hawkesll>
  </equation>

  Note that it was necessary to shift each <math|t<rsub|i>> by
  <math|t<rsub|1>> so that <math|t<rsub|1>=0> and <math|T=t<rsub|n>>. Also
  note that <math|T> is just an additive constant which does not vary with
  the parameters so for the purposes of estimation can be removed from the
  equation.\ 

  <subsection|An Expression for the Density of the Duration Until the Next
  Event When <math|P=1>>

  The simplest case occurs when the baseline intensity
  <math|\<lambda\><rsub|0><around*|(|t|)>=1> is constant unity (apparently
  this is the 'shot noise' case) and <math|P=1> where we have

  <\equation>
    \<lambda\><around*|(|<around*|{|t<rsub|i>|}>|)>=\<kappa\>+<big|sum><rsub|t<rsub|i>\<less\>t><big|sum><rsub|j=1><rsup|1>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> <around*|(|t-t<rsub|i>|)>>=\<kappa\>+<big|sum><rsub|t<rsub|i>\<less\>t>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|> <around*|(|t-t<rsub|i>|)>><label|Hawkes1>
  </equation>

  where

  <\equation>
    E<around*|[|\<lambda\><around*|(|t|)>|]>=<frac|\<kappa\>|1-<frac|\<alpha\>|\<beta\>>>
  </equation>

  is the expected value of the unconditional mean intensity.

  \;

  <\equation>
    a<rsub|n>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|>t<rsub|k>>
  </equation>

  <\equation>
    b<rsub|n>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|><around*|(|t<rsub|k>-t<rsub|n>|)>>
  </equation>

  <\equation>
    c<rsub|n>=<big|sum><rsub|k=0><rsup|n><big|sum><rsub|l=0><rsup|n>e<rsup|\<beta\><rsub|><around*|(|t<rsub|k>+t<rsub|l>-
    t<rsub|n>|)>>
  </equation>

  \;

  The expected time of the next point can be obtained by integrating out the
  (unit exponentiallly distributed, the fundamental normal shot noise)
  <math|\<varepsilon\>> appearing in the inverse compensator

  <\equation>
    <with|font-base-size|14|\<Lambda\><rsub|><rsup|-1><around*|(|\<varepsilon\>;\<alpha\><rsub|>,\<beta\><rsub|><rsub|>|)>=<tabular|<tformat|<table|<row|<cell|<frac|<tabular|<tformat|<table|<row|<cell|t
    a<rsub|n> \ >>>>>|A<rsub|1><around*|(|n|)>>\<cdot\>e<rsup|-\<beta\><rsub|>t>+>>|<row|<cell|<frac|a<rsub|n>|\<beta\><rsub|>
    A<rsub|1><around*|(|n|)>>\<cdot\>e<rsup|-\<beta\><rsub|>t<rsub|n>>
    W<around*|(|<frac|\<alpha\><rsub|> |\<kappa\>>A<rsub|1><around*|(|n|)>\<cdot\>e<rsup|<frac|\<alpha\><rsub|>b<rsub|n>-\<beta\><rsub|>\<varepsilon\>|\<kappa\>>>|)>+>>|<row|<cell|<frac|e<rsup|-\<beta\><rsub|>t<rsub|n>>|\<kappa\>
    A<rsub|1><around*|(|n|)>><around*|(|a<rsub|n>
    \<varepsilon\>-<frac|\<alpha\><rsub|>|\<beta\><rsub|>>
    c<rsub|n>|)>>>>>><label|P1pred>>
  </equation>

  so that\ 

  <\equation>
    \<Epsilon\><around*|[|\<Lambda\><rsub|><rsup|-1><around*|(|\<varepsilon\>;\<alpha\><rsub|>,\<beta\><rsub|><rsub|>|)><around*|\||\<cal-F\><rsub|t>|\<nobracket\>>|]>=<big|int><rsub|0><rsup|\<infty\>>\<Lambda\><rsub|><rsup|-1><around*|(|\<varepsilon\>;\<alpha\><rsub|>,\<beta\><rsub|><rsub|>|)>\<mathd\>\<varepsilon\>
  </equation>

  \;

  The recursive equations with initial conditions <math|b<rsub|0>=1> and
  <math|d<rsub|0>=e<rsup|\<beta\><rsub|>t<rsub|0>>> are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|a<rsub|n>>|<cell|=a<rsub|n-1>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+1>>|<row|<cell|b<rsub|n><rsup|>>|<cell|=b<rsub|n-1>
    e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+1>>|<row|<cell|c<rsub|n>>|<cell|=c<rsub|n-1>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+e<rsup|\<beta\><rsub|>t<rsub|n>>+2
    a<rsub|n-1>>>>>>
  </equation>

  It would be nice to have expressions like this involving the Lambert W
  function for <math|P\<gtr\>1> but neither Maple nor Mathematica were able
  to find any solutions in terms of \Pknown\Q functions for <math|P\<gtr\>1>.
  It is noted that Equation (<reference|P1inverse>) has the form

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around*|(|p+q
    W<around*|(|r e<rsup|-s x+t>|)>+u x|)>e<rsup|-x>\<mathd\>x<label|lambertW6>>>>>>
  </equation>

  which is a function of 6 variables, <math|<around*|{|p,q,r,s,t,u|}>>, for
  which it would be a very nice thing to have a closed form expression, in
  order to avoid a recourse to numerical or Monte Carlo integration. It seems
  that such an expression is very likely to exist because if we drop the
  variable <math|s> from Equation (<reference|lambertW6>) we get a
  closed-form expression of the form

  <with|font-base-size|10|<\equation>
    <with|font-base-size|10|<big|int><rsub|0><rsup|\<infty\>><around*|(|p+q
    W<around*|(|r e<rsup|- x+t>|)>+u x|)>e<rsup|-x>\<mathd\>x=q W<around*|(|r
    e<rsup|t>|)>+<frac|q |W<around*|(|r e<rsup|t>|)>>-q+u+p-<frac|q|r
    e<rsup|t>>><with|font-base-size|10|>
  </equation>>

  We can break this problem down into a more manageable one by calculating
  some more integrals to see if we can find a pattern. Let us begin with the
  integral

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>W<around*|(|e<rsup|-s
    x>|)>e<rsup|-x>\<mathd\>x=W<around*|(|1|)>\<noplus\>+<around*|(|-<frac|1|s>|)><rsup|-<frac|1|s>>
    <around*|(|\<Gamma\><around*|(|<frac|1|s>|)>-s
    \<Gamma\><around*|(|1+<frac|1|s>,-<frac|W<around*|(|1|)>|s>|)>|)>
  </equation>

  whose closed-form expression was found by Vladimir Reshetnikov. <cite|vr-W>

  <subsubsection|The Case of Any Order <math|P=n>>

  For general values of the order <math|P>, the equation whose root is to be
  sought is given by the expression

  <\equation>
    <with|font-base-size|10|\<varphi\><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=<with|font-base-size|9|<tabular|<tformat|<table|<row|<cell|<with|font-base-size|10|<with|font-base-size|9|<around*|(|<big|prod><rsub|k=1><rsup|P>\<beta\><rsub|k>|)>><around*|(|\<kappa\>
    x-<around*|(|\<varepsilon\>+\<kappa\>T|)>|)>e<rsup|<big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k><around*|(|x+
    T|)>>+\<ldots\>>>>|<row|<cell|<with|font-base-size|8|\<ldots\>+<big|sum><rsub|m=1><rsup|P><around*|(|<big|prod><rsub|k=1><rsup|<with|font-base-size|7|>P><choice|<tformat|<table|<row|<cell|\<alpha\><rsub|k>>|<cell|m=k>>|<row|<cell|\<beta\><rsub|k>>|<cell|m\<neq\>k>>>>>|)>><with|font-base-size|10|<big|sum><rsub|k=0><rsup|n>e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|x+<choice|<tformat|<table|<row|<cell|T>|<cell|j\<neq\>m>>|<row|<cell|t<rsub|k>>|<cell|j=m>>>>>|)>>-e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|T+<with|font-base-size|9|<choice|<tformat|<table|<row|<cell|x>|<cell|j\<neq\>m>>|<row|<cell|
    t<rsub|k>>|<cell|j=m>>>>>>|)>>>>>>>><label|prediction>>>
  </equation>

  where <math|T=t<rsub|n>> is arrival time of the most recent point and it is
  noted that the product of piece-wise functions can be written as\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|prod><rsub|k=1><rsup|<with|font-base-size|7|>P><choice|<tformat|<table|<row|<cell|\<alpha\><rsub|k>>|<cell|m=k>>|<row|<cell|\<beta\><rsub|k>>|<cell|m\<neq\>k>>>>>>|<cell|=\<alpha\><rsub|m><around*|(|<big|prod><rsub|k=1><rsup|m-1>\<beta\><rsub|k>|)><around*|(|<big|prod><rsub|k=m+1><rsup|P>\<beta\><rsub|k>|)>>>|<row|<cell|>|<cell|=\<alpha\><rsub|m><below|<big|prod><rsub|k=1><rsup|P>|k\<neq\>m>\<beta\><rsub|k>>>>>>
  </equation>

  and the sums likewise

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|x+<choice|<tformat|<table|<row|<cell|T>|<cell|j\<neq\>m>>|<row|<cell|t<rsub|k>>|<cell|j=m>>>>>|)>>|<cell|=\<beta\><rsub|m><around*|(|x+t<rsub|k>|)><rsub|>+<big|sum><rsub|j=1><rsup|m-1>\<beta\><rsub|j><around*|(|x+T|)>+<big|sum><rsub|j=m+1><rsup|P>\<beta\><rsub|j><around*|(|x+T|)>>>|<row|<cell|>|<cell|=\<beta\><rsub|m><around*|(|x+t<rsub|k>|)><rsub|>+<below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j><around*|(|x+T|)>>>|<row|<cell|>|<cell|=\<sigma\><rsub|m,k><around*|(|x,x|)>>>>>>
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|T+<with|font-base-size|9|<choice|<tformat|<table|<row|<cell|x>|<cell|j\<neq\>m>>|<row|<cell|
    t<rsub|k>>|<cell|j=m>>>>>>|)>>|<cell|=\<beta\><rsub|m><around*|(|T+t<rsub|k>|)>+<big|sum><rsub|j=1><rsup|m-1>\<beta\><rsub|j><around*|(|x+T|)>+<big|sum><rsub|j=m+1><rsup|P>\<beta\><rsub|j><around*|(|x+T|)>>>|<row|<cell|>|<cell|=\<beta\><rsub|m><around*|(|T+t<rsub|k>|)>+<below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j><around*|(|x<rsub|>+T|)>>>|<row|<cell|>|<cell|=\<sigma\><rsub|m,k><around*|(|x,T|)>>>>>>
  </equation>

  so that (<reference|prediction>) can be rewritten as

  <\equation>
    <with|font-base-size|10|<with|font-base-size|10|\<varphi\><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=><tabular|<tformat|<table|<row|<cell|<with|font-base-size|10|\<tau\><around*|(|x,\<varepsilon\>|)>+<big|sum><rsub|j=1><rsup|P>\<phi\><rsub|j>
    <big|sum><rsub|k=0><rsup|N<rsub|T>><around*|(|\<sigma\><rsub|j,k><around*|(|x,x|)>-\<sigma\><rsub|j,k><around*|(|x,T|)>|)>><with|font-base-size|10|<rsup|>>>>>>>><label|uc>
  </equation>

  to be compared with the multivariate case in Equation (<reference|mc>),
  where

  <\equation>
    \<sigma\><rsub|m,k><around*|(|x,a|)>=e<rsup|<around*|(|a+t<rsub|k>|)>\<beta\><rsub|m><rsub|>+<around*|(|x+T|)><below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j>>
  </equation>

  <\equation>
    \<phi\><rsub|m>=\<alpha\><rsub|m><below|<big|prod><rsub|k=1><rsup|P>|k\<neq\>m>\<beta\><rsub|k>=<big|prod><rsub|k=1><rsup|P><choice|<tformat|<table|<row|<cell|\<alpha\><rsub|k>>|<cell|k=m>>|<row|<cell|\<beta\><rsub|k>>|<cell|k\<neq\>m>>>>>
  </equation>

  <\equation>
    \<tau\><around*|(|x,\<varepsilon\>|)>=<around*|(|<around*|(|x-T|)>\<kappa\>-\<varepsilon\>|)>\<upsilon\>\<eta\><around*|(|x|)>
  </equation>

  <\equation>
    \<eta\><with|font-base-size|10|<around*|(|x|)>=e<rsup|<around*|(|x+
    T|)><big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k>>>
  </equation>

  <\equation>
    \<upsilon\>=<big|prod><rsub|k=1><rsup|P>\<beta\><rsub|k>
  </equation>

  The derivative given by

  <\equation>
    <with|font-base-size|10|<tabular|<tformat|<table|<row|<cell|\<varphi\><rprime|'><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=<with|font-base-size|9|\<upsilon\><with|font-base-size|8|<around*|(|\<kappa\>\<eta\><around*|(|x|)><with|font-base-size|9|>+\<tau\><around*|(|x,\<varepsilon\>|)>|)>+<big|sum><rsub|m=1><rsup|P>\<phi\><rsub|m>
    <big|sum><rsub|k=0><rsup|n><around*|(|\<mu\>
    \<sigma\><rsub|m,k><around*|(|x|)>-\<mu\><rsub|m>
    \<sigma\><rsub|m,k><around*|(|T|)>|)>>>>>>>>><tabular|<tformat|<table|<row|<cell|>>|<row|<cell|>>>>>
  </equation>

  where

  <\equation>
    \<mu\>=<big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k>
  </equation>

  <\equation>
    \<mu\><rsub|m>=<below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j>
  </equation>

  is needed so that the Newton sequence can be expressed as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|x<rsub|i+1>>|<cell|=x<rsub|i>-<frac|\<varphi\><rsub|2><around*|(|x<rsub|i>|)>|\<varphi\><rsub|2><rprime|'><around*|(|x<rsub|i>|)>>>>|<row|<cell|>|<cell|<with|font-base-size|5|=x<rsub|i>-<frac|\<tau\><around*|(|x<rsub|i>,\<varepsilon\>|)>+<big|sum><rsub|m=1><rsup|P>\<phi\><rsub|m>
    <big|sum><rsub|k=0><rsup|n><around*|(|\<sigma\><rsub|m,k><around*|(|x<rsub|i>,x<rsub|i>|)>-\<sigma\><rsub|m,k><around*|(|x<rsub|i>,T|)>|)>|\<upsilon\><around*|(|\<kappa\>\<eta\><around*|(|x<rsub|i>|)>+\<tau\><around*|(|x<rsub|i>,\<varepsilon\>|)>|)>+<big|sum><rsub|m=1><rsup|P>\<phi\><rsub|m>
    <big|sum><rsub|k=0><rsup|n><around*|(|\<mu\>
    \<sigma\><rsub|m,k><around*|(|x<rsub|i>|)>-\<mu\><rsub|m>
    \<sigma\><rsub|m,k><around*|(|T|)>|)>>>>>>>>
  </equation>

  and simplified a bit(at least notationally) if we let

  <\equation>
    \<rho\><around*|(|x,d|)>=<with|font-base-size|9|<tabular|<tformat|<table|<row|<cell|<big|sum><rsub|m=1><rsup|P>\<phi\><rsub|m><big|sum><rsub|k=0><rsup|n><around*|(|\<sigma\><rsub|m,k><around*|(|x|)><choice|<tformat|<table|<row|<cell|1>|<cell|d=0>>|<row|<cell|\<mu\>>|<cell|d=1>>>>>
    - \ \<sigma\><rsub|m,k><around*|(|T|)><choice|<tformat|<table|<row|<cell|1>|<cell|d=0>>|<row|<cell|\<mu\><rsub|m>>|<cell|d=1>>>>>|)>>>>>>>
  </equation>

  then

  <\equation>
    <with|font-base-size|10|<tabular|<tformat|<table|<row|<cell|x<rsub|i+1><around*|(|\<varepsilon\>|)>>|<cell|=x<rsub|i><around*|(|\<varepsilon\>|)>-<frac|\<varphi\><rsub|P><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>|\<varphi\><rsub|P><rprime|'><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>>>>|<row|<cell|>|<cell|<with|font-base-size|10|=x<rsub|i>-<frac|\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,0|)>|\<upsilon\><around*|(|\<kappa\>\<eta\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>+\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,1|)>>>>>>>>>
  </equation>

  so that

  <\equation>
    \<Lambda\><rsub|P><rsup|-1><around*|(|\<varepsilon\>;t<rsub|0>\<ldots\>T|)>=lim<rsub|m\<rightarrow\>\<infty\>>x<rsub|m><around*|(|\<varepsilon\>|)>
  </equation>

  which leads to the expression for the expected arrival time of the next
  point

  <\equation>
    <big|int><rsub|0><rsup|\<infty\> >\<Lambda\><rsub|P><rsup|-1><around*|(|\<varepsilon\>;t<rsub|0>\<ldots\>T|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\>=<big|int><rsub|0><rsup|\<infty\>
    >lim<rsub|m\<rightarrow\>\<infty\>>x<rsub|m><around*|(|\<varepsilon\>|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\><label|Etn1>
  </equation>

  \;

  Fatou's lemma<cite|Mti> can probably be invoked so that the order of the
  limit and the integral in Equation (<reference|Etn1>) can be exchanged,
  with perhaps the introduction of another function, which of course would
  greatly reduce the computational complexity of the equation. The sequence
  of functions is known as a Newton sequence
  <cite-detail|RandomIntegralEquations|3.3p118> There is also the limit

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|x\<rightarrow\>\<infty\>><frac|\<varphi\><rsub|P><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>|\<varphi\><rsub|P><rprime|'><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>>>|<cell|=lim<rsub|x\<rightarrow\>\<infty\>><frac|\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,0|)>|\<upsilon\><around*|(|\<kappa\>\<eta\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>+\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,1|)>>>>|<row|<cell|>|<cell|=<frac|1|\<mu\>>>>>>>
  </equation>

  There is more to be done here. <cite|steboyd> Actually, the notion of
  viscosity solutions and energy functional minimization in an infinite
  dimensional setting can be invoked to prove uniqueness and convergence
  (<reference|Etn1>) so that

  <\equation>
    x<rsub|m><around*|(|\<varepsilon\>|)><above|\<longrightarrow\>|\<Lambda\><rsup|-1><rsub|P>>x<around*|(|\<varepsilon\>|)>
    as m\<rightarrow\>\<infty\>
  </equation>

  which means that <math|x<rsub|m><around*|(|\<varepsilon\>|)>>
  <math|\<Lambda\><rsup|-1>>-converges to
  <math|x<around*|(|\<varepsilon\>|)>>. <cite-detail|livflpde|Ch.3 Def.7
  p.43>

  <subsection|Filtering, Prediction, Estimation, etc><label|univarPred>

  The next occurrence time of a point process, given the most recent time of
  occurrence of a point of a process, can be predicted by solving for the
  unknown time <math|t<rsub|n+1>> when <math|<around*|{|t<rsub|n>|}>> is a
  sequence of event times. Let \ 

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|\<Lambda\><rsub|next><around*|(|t<rsub|n>,\<delta\>|)>=<around*|{|t<rsub|n+1>:\<Lambda\><around*|(|t<rsub|n>,t<rsub|n+1>|)>=\<delta\>|}>>>>>><label|up>
  </equation>

  where

  <\equation>
    \<Lambda\><around*|(|t<rsub|n>,t<rsub|n+1>|)>=<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>>\<lambda\><around*|(|s;\<frak-F\><rsub|s>|)>\<mathd\>s
  </equation>

  and <math|><math|\<frak-F\><rsub|s>> is the <math|\<sigma\>>-algebra
  filtration up to and including time <math|s> and the parameters of
  <math|\<lambda\>> are fixed. The multivariate case is covered in Section
  (<reference|multivarPred>). The idea is to integrate over the solution of
  Equation (<reference|up>) with all possible values of
  <math|\<varepsilon\>>, distributed according to the unit exponential
  distribution. The reason for the plural form, time(s), rather than the
  singular form, time, is that Equation (<reference|up>) actually has a
  single real solution and <math|N> number of complex solutions, where
  <math|N> is the number of points that have occurred in the process up until
  the time of prediction. This set of complex expected future event arrival
  times is deemed the <em|constellation> of the process, which becomes more
  detailed with the occurance \ of each event(the increasing
  <math|\<sigma\>>-algebra filtration). We shall ignore the constellation for
  now, and single out the sole real valued element as the expected real time
  until the next event. After all, does it even make \ sense to say
  \Psomething will probably happen around <math|9.8+i7.2> seconds from now?\Q
  where <math|i> is the imaginary unit, <math|i=<sqrt|-1>>. The recursive
  equations for the resemble the heta functions of number theory if you one
  extends from real valued <math|\<beta\>\<in\>\<bbb-R\>> to a complex
  <math|\<beta\>=i>.

  <subsection|Calculation of the Expected Number of Events Any Given Time
  From Now>

  The expected number of events given any time from now whatsoever can be
  calculated by integrating out <math|\<varepsilon\>> since the process which
  is adapted to the compensator will be closer to being a unit rate Poisson
  process the closer the parameters are to being correct and the model
  actually being a good model of the phemenona it is being applied to. Let
  <math|F<rsub|t>> be all points up until now, let\ 

  <\equation*>
    E<around*|(|t<rsub|n+1>|)>=<big|int><rsub|0><rsup|\<infty\>>\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;\<alpha\>,\<beta\>,F<rsub|t<rsub|n>>|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\>
  </equation*>

  then iterate the process, by proceeding as if the next point of the process
  will occur at the predicted time, simply append the expectation to the
  current state vector, and project the next point, repeating the process as
  fast ast the computer will go until some sufficient stopping criteria is
  met. This equation seems very similiar to the infinite horizon discounted
  regulator of optimal control; see <cite-detail|ocvshjb|1.1>.

  \;

  <subsubsection|Prediction><label|multivarPred>

  The next event arrival time of the <math|m>-th dimension of a multivariate
  Hawkes process having the usual exponential kernel can be predicted in the
  same way as the uni-variate process in Section (<reference|univarPred>), by
  solving for the unknown <math|t<rsub|n+1>> in the equation

  <\equation>
    <around*|{|t<rsub|n+1><rsup|m>:\<varepsilon\>=\<Lambda\><rsup|m><around*|(|t<rsub|n><rsup|m>,t<rsub|n+1><rsup|m>|)>=<big|int><rsub|t<rsup|m><rsub|n>><rsup|t<rsup|m><rsub|n+1>>\<lambda\><rsup|m><around*|(|s;\<frak-F\><rsub|s>|)>\<mathd\>s<label|mp>|}>
  </equation>

  where <math|\<Lambda\><rsup|m><around*|(|t<rsub|n><rsup|m>,t<rsub|n+1><rsup|m>|)>>
  is the compensator from Equation (<reference|lhm>)<math|> and
  <math|\<frak-F\><rsub|s>> is the filtration up to time <math|s> and the
  parameters of <math|\<lambda\><rsup|m>> are fixed. As is the case for the
  uni-variate Hawkes process, the idea is to average over all possible
  realizations of <math|\<varepsilon\>> (of which there are an uncountable
  infinity) weighted according to an exponential unit distribution. Another
  idea for more accurate prediction is to model the deviation of the
  generalized residuals from a true exponential distribution and then include
  the predicted error when calculating this expectation.\ 

  Let the most recent arrival time of the pooled and <math|m>-th processes
  respectively be given by

  <\equation>
    T=max<around*|(|T<rsub|m>:m=1\<ldots\>M|)>
  </equation>

  <\equation>
    T<rsup|><rsub|m >=max<around*|(|t<rsup|m><rsub|n>:n=0\<ldots\>N<rsup|m>-1|)>=t<rsup|m><rsub|N<rsup|m>-1>
  </equation>

  and\ 

  <\equation>
    <wide|N|\<breve\>><rsup|n><rsub|T<rsub|m>><rsup|>=<big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsup|n>><choice|<tformat|<table|<row|<cell|1>|<cell|t<rsup|n><rsub|k>\<less\>T<rsub|m>>>|<row|<cell|0>|<cell|>>>>>
  </equation>

  count the number of points occurring in the <math|n>-th dimension before
  the most recent point of the <math|m>-th dimension and

  <\equation>
    <wide|N|\<breve\>><around*|(|t<rsub|j><rsup|m>\<less\>t<rsub|k><rsup|n>|)>
  </equation>

  then the next arrival time for a given value of the exponential random
  variable <math|\<varepsilon\>> of the <math|m>-th dimension of a
  multivariate Hawkes process having the standard exponential kernel is found
  by solving for the real root of\ 

  <\equation>
    <with|font-base-size|9|\<varphi\><rsub|m><around*|(|x<around*|(|\<varepsilon\>|)>;\<cal-F\><rsub|T>|)>=>\<tau\><rsub|m><around*|(|x,\<varepsilon\>|)>+<big|sum><rsub|l=1><rsup|P><big|sum><rsub|i=1><rsup|M>\<phi\><rsub|m,i,l>
    <big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|T<rsub|m>><rsup|i>><around*|(|\<sigma\><rsub|m,i,l,k><around*|(|x,x|)>-\<sigma\><rsub|m,i,l,k><around*|(|x,T<rsub|m>|)>|)><label|mc>
  </equation>

  which is similar to the uni-variate case

  <\equation>
    <with|font-base-size|10|<with|font-base-size|10|\<varphi\><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=><tabular|<tformat|<table|<row|<cell|<with|font-base-size|10|\<tau\><around*|(|x,\<varepsilon\>|)>+<big|sum><rsub|j=1><rsup|P>\<phi\><rsub|j>
    <big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|T>><around*|(|\<sigma\><rsub|j,k><around*|(|x,x|)>-\<sigma\><rsub|j,k><around*|(|x,T|)>|)>><with|font-base-size|10|<rsup|>>>>>>>>
  </equation>

  where

  <\equation>
    \<cal-F\><rsub|T>=<around*|{|\<kappa\><rsub|\<ldots\>>,\<alpha\><rsub|\<ldots\>>,\<beta\><rsub|\<ldots\>>,t<rsup|1><rsub|0>\<ldots\>t<rsup|1><rsub|N<rsup|1>>\<leqslant\>T,\<ldots\>,t<rsup|m><rsub|0>\<ldots\>t<rsup|m><rsub|N<rsup|m>>\<leqslant\>T,\<ldots\>,t<rsup|M><rsub|0>\<ldots\>t<rsup|M><rsub|N<rsup|M>>\<leqslant\>T|}>
  </equation>

  is the filtration up to time <math|T>, to be interpreted as the set of
  available information, here denoting fitted parameters and observed arrival
  times of all dimensions, and where\ 

  <\equation>
    \<tau\><rsub|m><around*|(|x,\<varepsilon\>|)>=<around*|(|<around*|(|x-T<rsub|m>|)>\<kappa\><rsub|m>-\<varepsilon\>|)>\<upsilon\><rsub|m>\<eta\><rsub|m><around*|(|x|)>
  </equation>

  <\equation>
    \<eta\><rsub|m><with|font-base-size|10|<around*|(|x|)>=e<rsup|<around*|(|x+
    T<rsub|m>|)><big|sum><rsub|j=1><rsup|P><big|sum><rsub|n=1><rsup|M>\<beta\><rsub|m,n,j>>>
  </equation>

  can be seen to be similar to the uni-variate equations
  <math|\<tau\><around*|(|x,\<varepsilon\>|)>=<around*|(|<around*|(|x-T|)>\<kappa\>-\<varepsilon\>|)>\<upsilon\>\<eta\><around*|(|x|)>>
  and <math|\<eta\><with|font-base-size|10|<around*|(|x|)>=e<rsup|<around*|(|x+T|)><big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k>>>>
  and

  <\equation>
    \<upsilon\><rsub|m>=<big|prod><rsub|j=1><rsup|P><big|prod><rsub|n=1><rsup|M>\<beta\><rsub|m,n,j>
  </equation>

  <\equation>
    \<phi\><rsub|m,p,k>=<big|prod><rsub|j=1><rsup|P><big|prod><rsub|n=1><rsup|M><choice|<tformat|<table|<row|<cell|\<alpha\><rsub|m,n,j>>|<cell|n=p
    and j=k>>|<row|<cell|\<beta\><rsub|m,n,j>>|<cell|n\<neq\>p or
    j\<neq\>k>>>>>
  </equation>

  <\equation>
    \<sigma\><rsub|m,i,l,k><around*|(|x,a|)>=e<rsup|<big|sum><rsub|j=1><rsup|P><big|sum><rsub|n=1><rsup|M>\<beta\><rsub|m,n,j><choice|<tformat|<table|<row|<cell|a+t<rsup|n><rsub|k>>|<cell|n=i
    and j=l>>|<row|<cell|x+T<rsub|n>>|<cell|n\<neq\>i orj\<neq\>l>>>>>>
  </equation>

  For comparison, the uni-variate case is Equation (<reference|uc>) where

  <\equation>
    \<sigma\><rsub|m,k><around*|(|x,a|)>=e<rsup|<around*|(|a+t<rsub|k>|)>\<beta\><rsub|m><rsub|>+<around*|(|x+T|)><below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j>>=e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><choice|<tformat|<table|<row|<cell|a+t<rsub|k><rsub|>>|<cell|j=m>>|<row|<cell|x+T>|<cell|j\<neq\>m>>>>>>
  </equation>

  \;

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|11>
      <bibitem*|1><label|bib-ocvshjb>Martino Bardi<localize| and >Italo
      Capuzzo-Dolcetta.<newblock> <with|font-shape|italic|Optimal Control and
      Viscosity Solutions of Hamilton-Jacobi-Bellman Equations (Systems &
      Control: Foundations & Applications)>.<newblock> Birkauser Boston,
      1<localize| edition>, 1997.<newblock>

      <bibitem*|2><label|bib-RandomIntegralEquations>A.T.<nbsp>Bharucha-Reid.<newblock>
      <with|font-shape|italic|Random Integral Equations>,
      <localize|volume><nbsp>96<localize| of
      ><with|font-shape|italic|Mathematics in Science and
      Engineering>.<newblock> Academic Press, 1972.<newblock>

      <bibitem*|3><label|bib-steboyd>J.<nbsp>Boyd.<newblock>
      <with|font-shape|italic|Solving Transcendental Equations>.<newblock>
      Society for Industrial and Applied Mathematics, Philadelphia, PA,
      2014.<newblock>

      <bibitem*|4><label|bib-chavez2012high>V.<nbsp>Chavez-Demoulin<localize|
      and >JA McGill.<newblock> High-frequency financial data modeling using
      hawkes processes.<newblock> <with|font-shape|italic|Journal of Banking
      & Finance>, 2012.<newblock>

      <bibitem*|5><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83\U90,
      1971.<newblock>

      <bibitem*|6><label|bib-livflpde>N.<nbsp>Katzourakis.<newblock>
      <with|font-shape|italic|An Introduction To Viscosity Solutions for
      Fully Nonlinear PDE with Applications to Calculus of Variations in
      <math|L<rsup|\<infty\>>>>.<newblock> SpringerBriefs in Mathematics.
      Springer International Publishing, 2014.<newblock>

      <bibitem*|7><label|bib-ogata1981lewis>Y.<nbsp>Ogata.<newblock> On
      lewis' simulation method for point processes.<newblock>
      <with|font-shape|italic|Information Theory, IEEE Transactions on>,
      27(1):23\U31, 1981.<newblock>

      <bibitem*|8><label|bib-ozaki1979maximum>T.<nbsp>Ozaki.<newblock>
      Maximum likelihood estimation of hawkes' self-exciting point
      processes.<newblock> <with|font-shape|italic|Annals of the Institute of
      Statistical Mathematics>, 31(1):145\U155, 1979.<newblock>

      <bibitem*|9><label|bib-Mti>M.M.<nbsp>Rao.<newblock>
      <with|font-shape|italic|Measure Theory and Integration>,
      <localize|volume> 265<localize| of ><with|font-shape|italic|Pure and
      Applied Mathematics>.<newblock> Marcel Dekker, 2nd, Revised and
      Expanded<localize| edition>, 2004.<newblock>

      <bibitem*|10><label|bib-shek2010modeling>H.<nbsp>Shek.<newblock>
      Modeling high frequency market order dynamics using self-excited point
      process.<newblock> <with|font-shape|italic|Available at SSRN 1668160>,
      2010.<newblock>

      <bibitem*|11><label|bib-hawkes-finance>Ioane<nbsp>Muni Toke.<newblock>
      An introduction to hawkes processes with applications to
      finance.<newblock> <with|font-shape|italic|???>,
      <slink|http://fiquant.mas.ecp.fr/ioane_files/HawkesCourseSlides.pdf>,
      2012.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|sfactor|4>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|A|<tuple|21|5>>
    <associate|B|<tuple|28|?>>
    <associate|Bj|<tuple|4|2>>
    <associate|E|<tuple|7|2>>
    <associate|Etn1|<tuple|58|9>>
    <associate|Hawkes1|<tuple|30|7>>
    <associate|HawkesIntensity|<tuple|1|1>>
    <associate|P1inverse|<tuple|42|8>>
    <associate|P1pred|<tuple|35|7>>
    <associate|S|<tuple|12|2>>
    <associate|acd|<tuple|?|2>>
    <associate|acdcomp|<tuple|20|5>>
    <associate|acdll|<tuple|23|5>>
    <associate|acdpsi|<tuple|21|5>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.4.1|10>>
    <associate|auto-11|<tuple|76|11>>
    <associate|auto-12|<tuple|76|11>>
    <associate|auto-13|<tuple|2.2|9>>
    <associate|auto-14|<tuple|2.2.1|10>>
    <associate|auto-15|<tuple|2.3|12>>
    <associate|auto-16|<tuple|2.4|12>>
    <associate|auto-17|<tuple|1|12>>
    <associate|auto-18|<tuple|2.4.1|12>>
    <associate|auto-19|<tuple|92|13>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|3|15>>
    <associate|auto-21|<tuple|3.1|15>>
    <associate|auto-22|<tuple|3.2.1|13>>
    <associate|auto-23|<tuple|3.2.1|13>>
    <associate|auto-24|<tuple|4|13>>
    <associate|auto-25|<tuple|4.1|14>>
    <associate|auto-26|<tuple|4.1|14>>
    <associate|auto-27|<tuple|4.2.1|16>>
    <associate|auto-28|<tuple|5|17>>
    <associate|auto-29|<tuple|5.1|17>>
    <associate|auto-3|<tuple|1.1.1|3>>
    <associate|auto-30|<tuple|144|22>>
    <associate|auto-31|<tuple|3|23>>
    <associate|auto-32|<tuple|3.1|23>>
    <associate|auto-33|<tuple|144|22>>
    <associate|auto-34|<tuple|4|23>>
    <associate|auto-35|<tuple|4.1|23>>
    <associate|auto-36|<tuple|4.1|24>>
    <associate|auto-37|<tuple|3.1.1|27>>
    <associate|auto-38|<tuple|3.1.1|27>>
    <associate|auto-39|<tuple|4|27>>
    <associate|auto-4|<tuple|1.1.2|4>>
    <associate|auto-40|<tuple|4.1|28>>
    <associate|auto-41|<tuple|7|28>>
    <associate|auto-42|<tuple|8|29>>
    <associate|auto-43|<tuple|8|30>>
    <associate|auto-44|<tuple|9|31>>
    <associate|auto-45|<tuple|10|32>>
    <associate|auto-46|<tuple|11|33>>
    <associate|auto-47|<tuple|12|34>>
    <associate|auto-48|<tuple|13|34>>
    <associate|auto-49|<tuple|14|34>>
    <associate|auto-5|<tuple|1.1.3|6>>
    <associate|auto-50|<tuple|4.1.3|34>>
    <associate|auto-51|<tuple|15|35>>
    <associate|auto-52|<tuple|4.1.4|35>>
    <associate|auto-53|<tuple|159|36>>
    <associate|auto-54|<tuple|5|37>>
    <associate|auto-55|<tuple|5.1|37>>
    <associate|auto-56|<tuple|16|38>>
    <associate|auto-57|<tuple|4.1.4|39>>
    <associate|auto-58|<tuple|169|40>>
    <associate|auto-59|<tuple|5|41>>
    <associate|auto-6|<tuple|1.2|7>>
    <associate|auto-60|<tuple|5.1|41>>
    <associate|auto-61|<tuple|20|42>>
    <associate|auto-62|<tuple|5|43>>
    <associate|auto-63|<tuple|5.1|43>>
    <associate|auto-64|<tuple|21|44>>
    <associate|auto-7|<tuple|1.2.1|8>>
    <associate|auto-8|<tuple|1.3|10>>
    <associate|auto-9|<tuple|1.4|10>>
    <associate|bib-MonsterMoonshine|<tuple|6|13>>
    <associate|bib-Mti|<tuple|9|12>>
    <associate|bib-NumericalMotives92|<tuple|9|14>>
    <associate|bib-Paiva08reproducingkernel|<tuple|15|17>>
    <associate|bib-RandomIntegralEquations|<tuple|2|11>>
    <associate|bib-aci|<tuple|12|18>>
    <associate|bib-appa|<tuple|13|17>>
    <associate|bib-bauwens2009modelling|<tuple|1|18>>
    <associate|bib-bowsher2007modelling|<tuple|1|13>>
    <associate|bib-cai2007model|<tuple|2|36>>
    <associate|bib-chavez2012high|<tuple|4|12>>
    <associate|bib-dennis1987optimization|<tuple|4|22>>
    <associate|bib-dm|<tuple|6|14>>
    <associate|bib-embrechts2011multivariate|<tuple|6|13>>
    <associate|bib-engle1998autoregressive|<tuple|8|40>>
    <associate|bib-generalizedHawkes|<tuple|17|15>>
    <associate|bib-hautsch2011econometrics|<tuple|6|13>>
    <associate|bib-hawkes-finance|<tuple|11|12>>
    <associate|bib-hawkes1971spectra|<tuple|5|12>>
    <associate|bib-hfmm|<tuple|8|14>>
    <associate|bib-hypergeometricRepresentation|<tuple|19|17>>
    <associate|bib-intro2pp|<tuple|5|13>>
    <associate|bib-karr|<tuple|7|13>>
    <associate|bib-kwok2008diagnostic|<tuple|7|18>>
    <associate|bib-lambertw|<tuple|4|14>>
    <associate|bib-lambertwss|<tuple|11|15>>
    <associate|bib-liniger2009multivariate|<tuple|13|13>>
    <associate|bib-livflpde|<tuple|6|12>>
    <associate|bib-memip|<tuple|12|13>>
    <associate|bib-nvs|<tuple|13|18>>
    <associate|bib-ocvshjb|<tuple|1|11>>
    <associate|bib-ogata1978asymptotic|<tuple|15|40>>
    <associate|bib-ogata1981lewis|<tuple|7|12>>
    <associate|bib-osd|<tuple|5|14>>
    <associate|bib-ozaki1979maximum|<tuple|8|12>>
    <associate|bib-shek2010modeling|<tuple|10|12>>
    <associate|bib-sp|<tuple|13|14>>
    <associate|bib-spit|<tuple|11|14>>
    <associate|bib-spp2|<tuple|17|14>>
    <associate|bib-steboyd|<tuple|3|11>>
    <associate|bib-vr-W|<tuple|24|24>>
    <associate|bib-wiseman1994quantum|<tuple|19|15>>
    <associate|compensator|<tuple|10|2>>
    <associate|exp|<tuple|16|4>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|gr|<tuple|11|2>>
    <associate|hawkesll|<tuple|29|6>>
    <associate|hc|<tuple|20|5>>
    <associate|hes|<tuple|17|4>>
    <associate|hll|<tuple|122|25>>
    <associate|hm|<tuple|19|5>>
    <associate|hmm|<tuple|117|24>>
    <associate|hs|<tuple|18|4>>
    <associate|hwc|<tuple|87|14>>
    <associate|incompleteGamma|<tuple|102|17>>
    <associate|kappa|<tuple|24|6>>
    <associate|lambda0|<tuple|150|29>>
    <associate|lambertW|<tuple|3.1|15>>
    <associate|lambertW6|<tuple|38|7>>
    <associate|lambertw|<tuple|93|15>>
    <associate|lhm|<tuple|86|13>>
    <associate|linv|<tuple|92|15>>
    <associate|llmvh|<tuple|91|14>>
    <associate|llmvh2|<tuple|95|15>>
    <associate|llmvh3|<tuple|96|15>>
    <associate|mc|<tuple|68|11>>
    <associate|mhi|<tuple|78|12>>
    <associate|mhl|<tuple|88|14>>
    <associate|mhp1|<tuple|80|12>>
    <associate|mp|<tuple|63|10>>
    <associate|mspy|<tuple|4.1.3|34>>
    <associate|multivarPred|<tuple|1.4.1|10>>
    <associate|phi|<tuple|29|5>>
    <associate|prediction|<tuple|41|8>>
    <associate|table1|<tuple|1|23>>
    <associate|uc|<tuple|45|8>>
    <associate|univarPred|<tuple|1.3|10>>
    <associate|up|<tuple|61|10>>
    <associate|wacdll|<tuple|27|6>>
    <associate|wlrr|<tuple|157|30>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hawkes-finance

      hawkes1971spectra

      shek2010modeling

      chavez2012high

      hautsch2011econometrics

      ozaki1979maximum

      ogata1981lewis

      ozaki1979maximum

      ogata1981lewis

      vr-W

      Mti

      RandomIntegralEquations

      steboyd

      livflpde

      ocvshjb
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Hawkes
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1.<space|2spc>The (Standard) Exponential
      Hawkes Process of Arbitrary Order <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1.<space|2spc>Maximum Likelihood
      Estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2.<space|2spc>The case when P=1 and the
      Lambert W Function: Transcendental Recursion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.1.3.<space|2spc>Maximum Likelihood
      Estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.2.<space|2spc>An Expression for the
      Density of the Duration Until the Next Event When
      <with|mode|<quote|math>|P=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.1.<space|2spc>The Case of Any Order
      <with|mode|<quote|math>|P=n> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.3.<space|2spc>Filtering, Prediction,
      Estimation, etc <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.4.<space|2spc>Calculation of the Expected
      Number of Events Any Given Time From Now
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.4.1.<space|2spc>Prediction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
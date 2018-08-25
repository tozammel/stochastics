<TeXmacs|1.99.3>

<style|<tuple|amsart|american>>

<\body>
  <doc-data|<doc-title|Point Process Models for Multivariate High-Frequency
  Irregularly Spaced Data>||<doc-author|<\author-data|<author-name|>>
    \;
  </author-data>>|<doc-author|<author-data|<author-name|>|<\author-affiliation>
    \;

    \;
  </author-affiliation>>>|<doc-author|<\author-data|<author-name|>>
    \;
  </author-data>>|<doc-author|<author-data|<\author-affiliation>
    March 17, 2014

    \;

    Stephen Crowley
  </author-affiliation>|<\author-affiliation>
    stephen.crowley@hushmail.com
  </author-affiliation>>>>

  <\abstract>
    Definitions from the theory of point processes are recalled. Models of
    intensity function parametrization and maximum likelihood estimation from
    data are explored. Closed-form log-likelihood expressions are given for
    the (exponential) Hawkes (univariate and multivariate)process,
    Autoregressive Conditional Duration(ACD), with both exponential and
    Weibull distributed errors, and a hybrid model combining the ACD and the
    exponential Hawkes models. Formulas are also derived, however without the
    elegant recursions of the exponential kernels, for kernels of the Weibull
    and Gamma type and comparison of the Weibullfit vs exponential kernel
    fits via QQ and probability plots are provided. The additional complexity
    of the Hawkes-Weibull or the ACD-Hawkes appears to not be worth the
    tradeoff. Diurnal, or daily, adjustment of the deterministic predictable
    part of the intensity variation via piecewise polynomial splines is
    discussed. Data from the symbol SPY on three different electronic markets
    is used to estimate model parameters and generate illustrative plots. The
    parameters were \ estimated without diurnal adjustments, a repeat of the
    analysis with adjustments is due in a future version of this article. The
    connection of the Hawkes process to quantum theory is briefly mentioned.
    Prediction of the next point of a Hawkes process is briefly discussed and
    a closed-form expression in terms of the Lambert W function for the
    standard exponential kernel with P=1 is calculated.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>Defintions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1.5fn|1.1.<space|2spc>Point Processes and Intensities
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|3fn|1.1.1.<space|2spc>Stochastic Integrals
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1.5fn|1.2.<space|2spc>The Hawkes Process
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|3fn|1.2.1.<space|2spc>Linear Self-Exciting Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|3fn|1.2.2.<space|2spc>The Hawkes(1) Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|3fn|1.2.3.<space|2spc>Maximum Likelihood Estimation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|3fn|1.2.4.<space|2spc>The Hawkes Process in Quantum Theory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1.5fn|1.3.<space|2spc>Predicting When The Next Event Of A
    Process Will Occur <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|3fn|1.3.1.<space|2spc>Predicting White Noise Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|3fn|1.3.2.<space|2spc>The case of P=1 and the Lambert W
    Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|3fn|1.3.3.<space|2spc>The Case of Any Order <space|P=n>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1.5fn|1.4.<space|2spc>Alternative Kernels for the Hawkes
    Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|3fn|1.4.1.<space|2spc>A Generalized Exponential Kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|3fn|1.4.2.<space|2spc>The Hawkes Process Having a Weibull
    Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|3fn|1.4.3.<space|2spc>The Hawkes Process Having a Gamma
    Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|3fn|1.4.4.<space|2spc>A Hyperbolic Kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1.5fn|1.5.<space|2spc>Assessing Goodness of Fit with
    Graphical Methods <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1.5fn|1.6.<space|2spc>Combining the ACD and Hawkes Models
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|3fn|1.6.1.<space|2spc>Comparison of Hawkes-Exp vs
    ACD+Hawkes-Exp Model Fits <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1.5fn|1.7.<space|2spc>Multivariate Hawkes Models
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|3fn|1.7.1.<space|2spc>The Compensator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|3fn|1.7.2.<space|2spc>Log-Likelihood
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    <with|par-left|3fn|1.7.3.<space|2spc>Projection of the Next Occurance
    Time \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.<space|2spc>Numerical
    Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37><vspace|0.5fn>

    <with|par-left|1.5fn|2.1.<space|2spc>The Nelder-Mead Algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <with|par-left|3fn|2.1.1.<space|2spc>Starting Points for Optimizing the
    Hawkes Process of Order <space|P> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.<space|2spc>Examples>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40><vspace|0.5fn>

    <with|par-left|1.5fn|3.1.<space|2spc>Millisecond Resolution Trade
    Sequences <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>>

    <with|par-left|3fn|3.1.1.<space|2spc>Adjusting for the Deterministic
    Daily Intensity Variation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|3fn|3.1.2.<space|2spc>Univarate Hawkes model fit to SPY
    (SPDR S&P 500 ETF Trust) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>>

    <with|par-left|3fn|3.1.3.<space|2spc>Multivariate SPY Data for 2012-08-14
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>>

    <with|par-left|3fn|3.1.4.<space|2spc>Multivariate SPY Data for 2012-11-19
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4.<space|2spc>Appendix>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57><vspace|0.5fn>

    <with|par-left|1.5fn|4.1.<space|2spc>The Lambert W Function
    <with|mode|space|W(k,x)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58>>
  </table-of-contents>

  <section|Defintions>

  <subsection|Point Processes and Intensities>

  Consider a <space|K> dimensional multivariate point process. Let
  <space|N<rsup|k><rsub|t>> denote the <em|counting process> associated with
  the <space|k>-th point process which is simply the number of events which
  have occured by time <space|t>. Let <space|F<rsub|t>> denote the filtration
  of the pooled process <space|N<rsub|t>> of <space|K> point processes
  consisting of the set <space|t<rsub|0><rsup|k>\<less\>t<rsub|1><rsup|k>\<less\>t<rsub|2><rsup|k>\<less\>
  \<ldots\>\<less\>t<rsub|i><rsup|k>\<less\> \<ldots\>> denoting the history
  of arrival times of each event type associated with the
  <space|k=1\<ldots\>K> point processes. At time <space|t>, the most recent
  arrival time will be denoted <space|t<rsub|N<rsup|k><rsub|t>><rsup|k>>. A
  process is said to be simple if no points occur at the same time, that is,
  there are no zero-length durations. The right-continuous(cadlag) counting
  process<cite-detail|hautsch2011econometrics|4.1.1.2> can be represented as
  a sum of Heaviside step functions <space|\<theta\><around*|(|t|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|t\<less\>0>>|<row|<cell|1>|<cell|t\<geqslant\>0>>>>>>

  <\equation>
    N<rsup|k><rsub|t>=<big|sum><rsub|t<rsub|i><rsup|k>\<leqslant\>t><rsup|>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>
  </equation>

  The counting function(process) jumps at the occurrence of each point and
  its value is the number of points occuring up to the point in time of the
  jump, inclusively. The left-continuous counting function does not include
  the time of the most recent jump, it counts the number of events occuring
  <em|before> t and is denoted by

  <\equation>
    <wide|N|\<breve\>><rsup|k><rsub|t>=<big|sum><rsub|t<rsub|i><rsup|k>\<less\>t>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>
  </equation>

  The <em|conditional intensity function> gives the conditional probability
  per unit time that an event of type <space|k> occurs in the next instant.\ 

  <\equation>
    \<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>=lim<rsub|\<Delta\>t\<rightarrow\>0><frac|Pr<around*|(|N<rsup|k><rsub|t+\<Delta\>t>-N<rsup|k><rsub|t>\<gtr\>0<mid|\|>F<rsub|t>|)>|\<Delta\>t>
  </equation>

  For small values of <space|\<Delta\>t> we have

  <\equation>
    \<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<Delta\>t=E<around*|(|N<rsub|t+\<Delta\>t><rsup|k>-N<rsup|k><rsub|t><mid|\|>F<rsub|t>|)>+o<around*|(|\<Delta\>t|)>
  </equation>

  so that

  <\equation>
    E<around*|(|<around*|(|N<rsup|k><rsub|t+\<Delta\>t>-N<rsup|k><rsub|t>|)>-\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<Delta\>t|)>=o<around*|(|\<Delta\>t|)>
    <label|E>
  </equation>

  and (<reference|E>) will be uncorrelated with the past of <space|F<rsub|t>>
  as <space|\<Delta\>t\<rightarrow\>0>. Next consider

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|\<Delta\>t\<rightarrow\>0><big|sum><rsub|j=1><rsup|<frac|<around*|(|s<rsub|1>-s<rsub|0>|)>|\<Delta\>t>><around*|(|N<rsup|k><rsub|s<rsub|0>+j\<Delta\>t>-N<rsub|s<rsub|0>+<around*|(|j-1|)>\<Delta\>t><rsup|k>|)>-\<lambda\><rsup|k><around*|(|s<rsub|0>+j\<Delta\>t<mid|\|>F<rsub|t>|)>\<Delta\>t>>|<row|<cell|=lim<rsub|\<Delta\>t\<rightarrow\>0><around*|(|N<rsub|s<rsub|0>><rsup|k>-N<rsup|k><rsub|s<rsub|1>>|)>-<big|sum><rsub|j=1><rsup|<frac|*<around*|(|s<rsub|1>-s<rsub|0>|)>|\<Delta\>t>>\<lambda\><rsup|k><around*|(|j\<Delta\>t<mid|\|>F<rsub|t>|)>\<Delta\>t>>|<row|<cell|=<around*|(|N<rsup|k><rsub|s<rsub|0>>-N<rsup|k><rsub|s<rsub|1>>|)>-<big|int><rsub|s<rsub|0>><rsup|s<rsub|1>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t>>>>>
  </equation>

  which will be uncorrelated with <space|F<rsub|s<rsub|0>>>, that is

  <\equation>
    E<around*|(|<big|int><rsub|s<rsub|0>><rsup|s<rsub|1>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t|)>=N<rsup|k><rsub|s<rsub|0>>-N<rsup|k><rsub|s<rsub|1>>
  </equation>

  The integrated intensity function is known as the <em|compensator>, or more
  precisely, the <em|<space|F<rsub|t>>-compensator> and will be denoted by

  <\equation>
    \<Lambda\><rsup|k><around*|(|s<rsub|0>,s<rsub|1>|)>=<big|int><rsub|s<rsub|0>><rsup|s<rsub|1>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t<label|compensator>
  </equation>

  Let <space|x<rsub|k>=t<rsub|i><rsup|k>-t<rsub|i-1><rsup|k>> denote the time
  interval, or duration, between the <space|i>-th and
  <space|<around*|(|i-1|)>>-th arrival times. The
  <space|F<rsub|t>>-<em|conditional survivor function> for the <space|k>-th
  process is given by

  <\equation>
    S<rsub|k><around*|(|*x<rsub|i><rsup|k>|)>=P<rsub|k><around*|(|t<rsub|i><rsup|k>\<gtr\>x<rsub|i><rsup|k><mid|\|>F<rsub|t<rsub|i-1>+\<tau\>>|)>
  </equation>

  Let

  <\equation*>
    <wide|\<cal-E\>|~><rsub|i><rsup|k>=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t=\<Lambda\><rsup|k><around*|(|t<rsub|i-1>,t<rsub|i>|)><rsub|><label|gr>
  </equation*>

  then provided the survivor function is absolutely continuous with respect
  to Lebesgue measure(which is an assumption that needs to be verified,
  usually by graphical tests) we have

  <\equation>
    <with|font-base-size|12|S<rsup|k><around*|(|x<rsub|i><rsup|k>|)>=e<rsup|-<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t>>=e<rsup|-<wide|\<cal-E\>|~><rsub|i><rsup|k>><label|S>
  </equation>

  and <space|<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>> is an i.i.d.
  exponential random variable with unit mean and variance. Since
  <space|E<around*|(|<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>|)>=1> the
  random variable\ 

  <\equation>
    \<cal-E\><rsub|N<around*|(|t|)>><rsup|k>=1-<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>
  </equation>

  has zero mean and \ unit variance. Positive values of
  <space|\<cal-E\><rsub|N<around*|(|t|)>>> indicate that the path of
  conditional intensity function <space|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>>
  under-predicted the number of events in the time interval and negative
  values of <space|\<cal-E\><rsub|N<around*|(|t|)>>> indicate that
  <space|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>> over-predicted
  the number of events in the interval. \ In this way, (<reference|gr>) can
  be interpreated as a generalized residual. The <em|backwards recurrence
  time> given by

  <\equation>
    U<rsup|<around*|(|k|)>><around*|(|t|)>=t-t<rsub|N<rsup|k><around*|(|t|)>>
  </equation>

  increases linearly with jumps back to 0 at each new point.\ 

  <subsubsection|Stochastic Integrals>

  The <em|stochastic Stieltjes integral><cite-detail|bowsher2007modelling|2.1><cite-detail|karr|2.2>
  of a measurable process, having either locally bounded or nonnegative
  sample paths, <space|X<around*|(|t|)>> with respect to <space|N<rsup|k>>
  exists and for each <space|t> we have

  <\equation>
    <big|int><rsub|<around*|(|0,t|]>>X<around*|(|s|)>\<mathd\>N<rsup|k><rsub|s>=<big|sum><rsub|i\<geqslant\>1>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>X<around*|(|t<rsub|i><rsup|k>|)>
  </equation>

  \ 

  <subsection|The Hawkes Process>

  <subsubsection|Linear Self-Exciting Processes>

  A (univariate) linear self-exciting (counting) process <space|N<rsub|t>> is
  one that can be expressed as <cite|hawkes-finance><cite|hawkes1971spectra><cite|shek2010modeling><cite|chavez2012high><cite-detail|hautsch2011econometrics|11.3>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|-\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>><label|HawkesIntensity>
  </equation>

  where <space|\<lambda\><rsub|0><around*|(|t|)>> is a deterministic base
  intensity, see (<reference|lambda0>), \ <space|\<nu\>:\<bbb-R\><rsub|+>\<rightarrow\>\<bbb-R\><rsub|+>>
  expresses the positive influence of past events <space|t<rsub|i>> on the
  current value of the intensity process, and <space|\<kappa\>> takes the
  place of the <space|\<lambda\><rsub|0>> constant in the referenced papers.
  For comparison with the multivariate case see Equation (<reference|mhi>).
  The (exponential) Hawkes process of order <space|P> is a linear
  self-exciting process defined by the exponential kernel

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t><label|exp>
  </equation>

  which has the survivor function

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<around*|(|t|)>>|<cell|=<big|int><rsub|t><rsup|\<infty\>>\<nu\><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> s>\<mathd\>s>>|<row|<cell|>|<cell|=<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j>t><big|prod><rsub|k=1,k\<neq\>j><rsup|P>\<beta\><rsub|k>|<big|prod><rsub|j=1><rsup|P>\<beta\><rsub|j>>>>>>><label|hes>
  </equation>

  where the product <space|<big|prod><rsup|P><rsub|k=1,k\<neq\>j>> denotes
  that <space|k=j> is excluded so that the hazard function is written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<nu\>|\<bar\>><around*|(|t|)>>|<cell|=<frac|\<nu\><around*|(|t|)>|S<around*|(|t|)>>>>|<row|<cell|>|<cell|=<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>|<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j>t><big|prod><rsub|k=1,k\<neq\>j><rsup|P>\<beta\><rsub|k>|<big|prod><rsub|j=1><rsup|P>\<beta\><rsub|j>>>>>|<row|<cell|>|<cell|=<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t><big|prod><rsub|j=1><rsup|P>\<beta\><rsub|j>|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j>t><big|prod><rsub|k=1,k\<neq\>j><rsup|P>\<beta\><rsub|k>>>>>>>
  </equation>

  so that the \Pinstantaneous\Q hazard rate is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|t\<rightarrow\>0><wide|\<nu\>|\<bar\>><around*|(|t|)>>|<cell|=<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    <big|prod><rsub|j=1><rsup|P>\<beta\><rsub|j>|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|prod><rsub|k=1,k\<neq\>j><rsup|P>\<beta\><rsub|k>>>>>>>
  </equation>

  The intensity of the exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t-s|)>>\<mathd\>N<rsub|s>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|k=0><rsup|N<rsub|t>-1><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|N<rsub|t>-1>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|N<rsub|t>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>|<cell|\<forall\>t\<in\>t<rsub|i>>>>>>
  </equation>

  where <space|B<rsub|j><around*|(|i|)>> is given recursively by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|><big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|>*<around*|(|1+<big|sum><rsub|k=1><rsup|i-2>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|i-1><rsub|>|)>><around*|(|1+B<rsub|j><around*|(|i-1|)>|)>>>>>><label|Bj>
  </equation>

  since <space| e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|i-1>|)>>=e<rsup|-\<beta\><rsub|j>0>=e<rsup|-0>=1>.
  A univariate Hawkes process is stationary if the branching ratio is less
  than one.

  <\equation>
    <big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>\<less\>1<label|hs>
  </equation>

  If a Hawkes process is stationary then the unconditional mean is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>=E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|=<frac|\<lambda\><rsub|0>|1-<big|int><rsub|0><rsup|\<infty\>>\<nu\><around*|(|t|)>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|\<lambda\><rsub|0>|1-<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|\<lambda\><rsub|0>|1-<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>>>>>>><label|hm>
  </equation>

  For consecutive events, we have the compensator (<reference|compensator>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<lambda\><rsub|0><around*|(|t|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|hc>
  </equation>

  compared with the multivariate compensator in Equation
  (<reference|lhm>)where there is the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k>\<leqslant\>t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|i-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=1+e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>A<rsub|j><around*|(|i-1|)>>>>>><label|A>
  </equation>

  with <space|A<rsub|j><around*|(|0|)>=0> since the integral of the
  exponential kernel (<reference|exp>) is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> <around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>
    <around*|(|e<rsup|-\<beta\><rsub|j> t<rsub|i>>-e<rsup|-\<beta\><rsub|j>t<rsub|i-1>>|)>>>>>>
  </equation>

  \ If <space|\<lambda\><rsub|0><around*|(|t|)>=\<lambda\><rsub|0>> then
  (<reference|hc>) simplifies to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>-t<rsub|k>><rsup|t<rsub|i>-t<rsub|k>>\<nu\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|>\<lambda\><rsub|0>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>>>>
  </equation>

  Similiarly, another parametrization is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<kappa\>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
    \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>|<row|<cell|>|<cell|=\<kappa\>
    \<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|kappa>
  </equation>

  where <space|\<kappa\>> scales the predetermined baseline intensity
  <space|\<lambda\><rsub|0><around*|(|s|)>>. In this parameterization the
  intensity is also scaled by <space|\<kappa\>>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<kappa\>*\<lambda\><rsub|0><around*|(|t|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  this allows to precompute the deterministic part of the compensator
  <space|\<Lambda\><rsub|0><around*|(|t<rsub|i-1>,t<rsub|i>|)>=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>
  \<lambda\><rsub|0><around*|(|s|)>\<mathd\>s>.

  <subsubsection|The Hawkes(1) Model>

  The simplest case occurs when the baseline intensity
  <space|\<lambda\><rsub|0><around*|(|t|)>=1> is constant and <space|P=1>
  where we have

  <\equation>
    \<lambda\><around*|(|t|)>=\<kappa\>+<big|sum><rsub|t<rsub|i>\<less\>t>\<alpha\>
    e<rsup|-\<beta\> <around*|(|t-t<rsub|i>|)>>
  </equation>

  which has the unconditional mean

  <\equation>
    E<around*|[|\<lambda\><around*|(|t|)>|]>=<frac|\<kappa\>|1-<frac|\<alpha\>|\<beta\>>>
  </equation>

  <subsubsection|Maximum Likelihood Estimation>

  The log-likelihood of a simple point process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln\<cal-L\><around*|(|N<around*|(|t|)><rsub|t\<in\><around*|[|0,T|]>>|)>>|<cell|=<big|int><rsub|0><rsup|T><around*|(|1-\<lambda\><around*|(|s|)>|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|T>\<lambda\><around*|(|s|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><around*|(|s|)>\<mathd\>N<rsub|s>>>>>>
  </equation>

  which in the case of the Hawkes model of order <space|P> can be explicitly
  written <cite|ozaki1979maximum> as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1\<ldots\>n>|)>>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=T+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>-\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln\<lambda\><around*|(|t<rsub|i>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=1><rsup|i-1>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<rsub|>T-\<Lambda\><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>
    \<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>|<row|<cell|>|<cell|=T-<big|int><rsub|0><rsup|<rsub|T>>\<kappa\>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|n>-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<kappa\>\<lambda\><rsub|0><around*|(|t<rsub|i>|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>>>>
  </equation>

  where <space|T=t<rsub|n>> and we have the recursion<cite|ogata1981lewis>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><around*|(|1+R<rsub|j><around*|(|i-1|)>|)>>>>>>
  </equation>

  If we have constant baseline intensity <space|\<lambda\><rsub|0><around*|(|t|)>=1>
  then the log-likelihood can be written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1\<ldots\>n>|)>>|<cell|=T-\<kappa\>T-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|n>-t<rsub|i>|)>>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<lambda\><rsub|0>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>>>>>><with|mode|text|><label|hawkesll>
  </equation>

  Note that it was necessary to shift each <space|t<rsub|i>> by
  <space|t<rsub|1>> so that <space|t<rsub|1>=0> and <space|t<rsub|n>=T>. Also
  note that <space|T> is just an additive constant which does not vary with
  the parameters so for the purposes of estimation can be removed from the
  equation.

  <subsubsection|The Hawkes Process in Quantum Theory>

  The Hawkes process arises in quantum theory by considering feedback via
  continuous measurements where the quantum analog of a self-exciting point
  process is a source of irreversibility whose strength is controlled by the
  rate of detections from that source. <cite|wiseman1994quantum>.\ 

  <subsection|Predicting When The Next Event Of A Process Will
  Occur><label|univarPred>

  The next event arrival time(s) of a point process can be predicted by
  solving for the unknown(s) <space|t<rsub|n+1>> in the equation

  <\equation>
    <around*|{|t<rsub|n+1>:\<varepsilon\>=\<Lambda\><around*|(|t<rsub|n>,t<rsub|n+1>|)>=<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>>\<lambda\><around*|(|s;\<frak-F\><rsub|s>|)>\<mathd\>s|}><label|up>
  </equation>

  where <space|><space|\<frak-F\><rsub|s>> is the filtration up to and
  including time <space|s> and the parameters of <space|\<lambda\>> are
  fixed. The multivariate case is covered in Section
  (<reference|multivarPred>). The idea is to integrate over the solution of
  Equation (<reference|up>) with all possible values of
  <space|\<varepsilon\>>, distributed according to the unit exponential
  distribution. The reason for the plural form, time(s), rather than the
  singular form, time, is that Equation (<reference|up>) actually has a
  single real solution and <space|N> number of complex solutions, where
  <space|N> is the number of points that have occured in the process up until
  the time of prediction. This set of complex expected future event arrival
  times is the <em|constellation> of the process, which changes with the
  arrival of each event(the increasing <space|\<sigma\>>-algebra filtration),
  and has somewhat of a multiverse interpretation if thought about from a
  physical context.

  <subsubsection|Predicting White Noise Processes>

  <cite-detail|li1|Preface> was written to be read. :)

  <subsubsection|The case of P=1 and the Lambert W Function>

  If <space|P=1> the inverse equation actually has a closed form in terms of
  the Lambert W function (<reference|lambertW>), that is, let

  <\equation>
    a<around*|(|n|)>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|k>+2
    t<rsub|n>|)>>
  </equation>

  <\equation>
    b<around*|(|n|)>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|k>+t<rsub|n>|)>>
  </equation>

  <\equation>
    c<around*|(|n|)>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|1>t<rsub|k>>
  </equation>

  <\equation>
    d<around*|(|n|)>=<big|sum><rsub|k=0><rsup|n><big|sum><rsub|l=0><rsup|n>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|l>+t<rsub|k>+t<rsub|n>|)>>
  </equation>

  then

  \;

  <\equation>
    <with|font-base-size|14|\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;t<rsub|0>\<ldots\>t<rsub|n>|)>=<tabular|<tformat|<table|<row|<cell|<frac|<tabular|<tformat|<table|<row|<cell|a<around*|(|n|)>t<rsub|n>z>>>>>|b<around*|(|n|)>>+>>|<row|<cell|<frac|a<around*|(|n|)>z
    W<around*|(|<frac|\<alpha\><rsub|1>b<around*|(|n|)>e<rsup|-<frac|<around*|(|<around*|(|2\<kappa\>t<rsub|n>+\<varepsilon\>|)>\<beta\><rsub|1>e<rsup|\<beta\><rsub|1>t<rsub|n>>-\<alpha\><rsub|1>c<around*|(|n|)>|)>z|\<kappa\>>>|\<kappa\>>|)>|\<beta\><rsub|1>b<around*|(|n|)>>+>>|<row|<cell|<frac|z|\<kappa\>
    b<around*|(|n|)>><around*|(|a<around*|(|n|)>\<varepsilon\>-<frac|\<alpha\><rsub|1>d<around*|(|n|)>|\<beta\><rsub|1>>|)>>>>>><label|P1pred>>
  </equation>

  where <space|z=e<rsup|-\<beta\><rsub|1>t<rsub|n>>> so that the expectation
  of the occurrence of the next point is given by the integral

  <with|font-base-size|5|<\equation>
    <with|font-base-size|4|<big|int><rsub|0><rsup|\<infty\>
    >\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;t<rsub|0>\<ldots\>t<rsub|n>|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\>=<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|<tabular|<tformat|<table|<row|<cell|a<around*|(|n|)>t<rsub|n>
    e<rsup|-\<beta\><rsub|1>t<rsub|n>>>>>>>|b<around*|(|n|)>>+<frac|a<around*|(|n|)>e<rsup|-\<beta\><rsub|1>t<rsub|n>>W<around*|(|<frac|1|\<kappa\>>\<alpha\><rsub|1>b<around*|(|n|)>e<rsup|<around*|(|-<frac|1|\<kappa\>><around*|(|<around*|(|2\<kappa\>t<rsub|n>+\<varepsilon\>|)>\<beta\><rsub|1>e<rsup|\<beta\><rsub|1>t<rsub|n>>-\<alpha\><rsub|1>c<around*|(|n|)>|)>e<rsup|-\<beta\><rsub|1>t<rsub|n>>|)>>|)>|\<beta\><rsub|1>b<around*|(|n|)>>+<frac|1|\<kappa\>><around*|(|<frac|a<around*|(|n|)>e<rsup|-\<beta\><rsub|1>t<rsub|n>>\<varepsilon\>|b<around*|(|n|)>>-<frac|e<rsup|-\<beta\><rsub|1>t<rsub|n>>\<alpha\><rsub|1>d<around*|(|n|)>|\<beta\><rsub|1>b<around*|(|n|)>>|)>|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\>><label|P1inverse>
  </equation>>

  which, as far as I am aware, must be calculated with numeric methods which
  are actually far more effecient than Monte Carlo sampling as other studies
  have suggested. Equation (<reference|P1pred>) suffers from numerical
  problems due to massive sums of exponentials. We can rescale the equations
  and drop one of them, let

  <\equation>
    <wide|a|^><around*|(|n|)>=<frac|a<around*|(|n|)>|e<rsup|\<beta\><rsub|1>2t<rsub|n>>>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|1>t<rsub|k>>
  </equation>

  <\equation>
    <wide|b|^><around*|(|n|)>=<frac|b<around*|(|n|)>|e<rsup|\<beta\><rsub|1>2t<rsub|n>>>=<big|sum><rsub|k=0><rsup|n>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|k>-t<rsub|n>|)>>
  </equation>

  <\equation>
    <wide|d|^><around*|(|n|)>=<frac|d<around*|(|n|)>|e<rsup|\<beta\><rsub|1>2t<rsub|n>>>=<big|sum><rsub|k=0><rsup|n><big|sum><rsub|l=0><rsup|n>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|l>+t<rsub|k>-
    t<rsub|n>|)>>
  </equation>

  then Equation (<reference|P1pred>) can be re-written as

  <\equation>
    <with|font-base-size|14|\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;t<rsub|0>\<ldots\>t<rsub|n>|)>=<tabular|<tformat|<table|<row|<cell|<frac|<tabular|<tformat|<table|<row|<cell|<wide|a|^><around*|(|n|)>t<rsub|n>
    z>>>>>|<wide|b|^><around*|(|n|)>>+>>|<row|<cell|<frac|<wide|a|^><around*|(|n|)>
    z W<around*|(|<frac|\<alpha\><rsub|1><wide|b|^><around*|(|n|)>e<rsup|<frac|\<alpha\><rsub|1><wide|b|^><around*|(|n|)>-\<beta\><rsub|1>\<varepsilon\>|\<kappa\>>>|\<kappa\>>|)>|\<beta\><rsub|1><wide|b|^><around*|(|n|)>>+>>|<row|<cell|<frac|z|\<kappa\><wide|b|^><around*|(|n|)>><around*|(|<wide|a|^><around*|(|n|)>\<varepsilon\>-<frac|\<alpha\><rsub|1><wide|d|^><around*|(|n|)>|\<beta\><rsub|1>>|)>>>>>><label|P1pred>>
  </equation>

  We have the following recursions with initial conditions
  <space|<wide|b|^><around*|(|0|)>=1> and
  <space|<wide|d|^><around*|(|0|)>=e<rsup|\<beta\><rsub|1>t<rsub|0>>>

  <\equation>
    <wide|b|^><around*|(|n|)>=<wide|b|^><around*|(|n-1|)>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|n-1>-t<rsub|n>|)>>+1
  </equation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|d|^><around*|(|n|)>>|<cell|=<wide|d|^><around*|(|n-1|)>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|n-1>-t<rsub|n>|)>>+e<rsup|\<beta\><rsub|1>t<rsub|n>>+2<big|sum><rsub|k=0><rsup|n-1>e<rsup|\<beta\><rsub|1>t<rsub|k>>>>|<row|<cell|>|<cell|=<wide|d|^><around*|(|n-1|)>e<rsup|\<beta\><rsub|1><around*|(|t<rsub|n-1>-t<rsub|n>|)>>+e<rsup|\<beta\><rsub|1>t<rsub|n>>+2
    <wide|a|^><around*|(|n-1|)>>>>>>
  </equation>

  It would be nice to have expressions like this involving the Lambert W
  function for <space|P\<gtr\>1> but neither Maple nor Mathematica were able
  to find any solutions in terms of \Pknown\Q functions for
  <space|P\<gtr\>1>. It is noted that Equation (<reference|P1inverse>) has
  the form

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around*|(|p+q
    W<around*|(|r e<rsup|-s x+t>|)>+u x|)>e<rsup|-x>\<mathd\>x<label|lambertW6>>>>>>
  </equation>

  which is a function of 6 variables, <space|<around*|{|p,q,r,s,t,u|}>>, for
  which it would be a very nice thing to have a closed form expression, in
  order to avoid a recourse to numerical or Monte Carlo integration. It seems
  that such an expression is very likely to exist because if we drop the
  variable <space|s> from Equation (<reference|lambertW6>) we get a
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

  whose closed-form expresssion was found by Vladimir Reshetnikov.
  <cite|vr-W>

  <subsubsection|The Case of Any Order <space|P=n>>

  For general values of the order <space|P>, the equation whose root is to be
  sought is given by the expression

  <\equation>
    <with|font-base-size|10|\<varphi\><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=<with|font-base-size|9|<tabular|<tformat|<table|<row|<cell|<with|font-base-size|10|<with|font-base-size|9|<around*|(|<big|prod><rsub|k=1><rsup|P>\<beta\><rsub|k>|)>><around*|(|\<kappa\>
    x-<around*|(|\<varepsilon\>+\<kappa\>T|)>|)>e<rsup|<big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k><around*|(|x+
    T|)>>+\<ldots\>>>>|<row|<cell|<with|font-base-size|8|\<ldots\>+<big|sum><rsub|m=1><rsup|P><around*|(|<big|prod><rsub|k=1><rsup|<with|font-base-size|7|>P><choice|<tformat|<table|<row|<cell|\<alpha\><rsub|k>>|<cell|m=k>>|<row|<cell|\<beta\><rsub|k>>|<cell|m\<neq\>k>>>>>|)>><with|font-base-size|10|<big|sum><rsub|k=0><rsup|n>e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|x+<choice|<tformat|<table|<row|<cell|T>|<cell|j\<neq\>m>>|<row|<cell|t<rsub|k>>|<cell|j=m>>>>>|)>>-e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><around*|(|T+<with|font-base-size|9|<choice|<tformat|<table|<row|<cell|x>|<cell|j\<neq\>m>>|<row|<cell|
    t<rsub|k>>|<cell|j=m>>>>>>|)>>>>>>>><label|prediction>>>
  </equation>

  where <space|T=t<rsub|n>> is arrival time of the most recent point and it
  is noted that the product of piecewise functions can be written as\ 

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

  is needed so that the Newton iteration can be written

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

  I have a hunch that Fatou's lemma can be invoked so that the order of the
  limit and the integral in Equation (<reference|Etn1>) can be exchanged,
  with perhaps the introduction of another function, which of course would
  greatly reduce the computational complexity of the equation. The graph of
  the Newton iteration for a arbitrary chosen set of parameters and times is
  shown below.

  <big-figure|<image|newtonIterator34.eps|4in|4in||>|Graph of the Newton
  iteration with <space|P=3> and <space|n=4> having parameters
  <space|<around*|{|\<kappa\>=0.2,\<varepsilon\>=0.9,\<alpha\>=<around*|(|0.12,0.34,0.6|)>,\<beta\>=<around*|(|1.34,1.75,0.9|)>,t=<around*|(|0.5,1.3,3.4,6.4,7|)>|}>>
  is shown below.>

  We also have the limit

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|x\<rightarrow\>\<infty\>><frac|\<varphi\><rsub|P><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>|\<varphi\><rsub|P><rprime|'><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>>>|<cell|=lim<rsub|x\<rightarrow\>\<infty\>><frac|\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,0|)>|\<upsilon\><around*|(|\<kappa\>\<eta\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>+\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,1|)>>>>|<row|<cell|>|<cell|=<frac|1|\<mu\>>>>>>>
  </equation>

  <subsection|Alternative Kernels for the Hawkes Process>

  <subsubsection|A Generalized Exponential Kernel>

  In the paper of <cite|ogata1981lewis> there is made a reference to
  <cite|generalizedHawkes>, which appears to not be available online.
  Nevertheless, <cite|ogata1981lewis> contains the necessary recursive
  formulas. Here, the expontial kernel changes from (<reference|exp>)

  <\equation>
    \<nu\><around*|(|t|)>=\<alpha\> e<rsup|-\<beta\> t>
  </equation>

  to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<nu\><around*|(|t|)>>|<cell|=<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j> e<rsup|-\<beta\> t>>>>>>
  </equation>

  with a recursive structure that involves binomial coefficients. The
  intensity of the generalized exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j> e<rsup|-\<beta\><around*|(|t-s|)>>\<mathd\>N<rsub|s>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|k=0><rsup|N<rsub|t>-1><big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j> e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P><big|sum><rsub|k=0><rsup|N<rsub|t>-1>\<alpha\><rsub|j>
    t<rsup|j> e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j><big|sum><rsub|k=0><rsup|N<rsub|t>-1>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>>|<cell|>>|<row|<cell|\<lambda\><around*|(|t<rsub|i>|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)> >|<cell|>>>>>
  </equation>

  Note that <space|\<beta\>> does not have a subscript in this
  parametrization. For consecutive events, we have the compensator
  (<reference|compensator>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j><big|sum><rsub|k=0><rsup|N<rsub|t>-1>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j><big|sum><rsub|k=0><rsup|N<rsub|t>-1>
    e<rsup|-\<beta\><rsub|><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><wide|\<nu\>|^><around*|(|t<rsub|i>-t<rsub|k>|)>-<wide|\<nu\>|^><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1>>>>>>
  </equation>

  where <space|<wide|\<nu\>|^><around*|(|t|)>> is the antiderivative of the
  kernel

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<nu\>|^><around*|(|t|)>>|<cell|=<big|int>\<nu\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    t<rsup|j> e<rsup|-\<beta\> t>\<mathd\>t>>|<row|<cell|>|<cell|=<frac|e<rsup|-\<beta\>t>|\<beta\><rsup|P+1>><big|sum><rsub|k=0><rsup|P>\<alpha\><rsub|k><big|sum><rsub|j=0><rsup|k>-\<beta\><rsup|P-<around*|(|k-j|)>>*<around*|(|k-j|)>!<choose|k|k-j>t<rsup|j>>>|<row|<cell|>|<cell|=<frac|e<rsup|-\<beta\>t>|
    \<beta\><rsup|P+1>><big|sum><rsub|k=1><rsup|P><frac|\<alpha\><rsub|k>
    \<beta\><rsup|-k> <around*|(|\<beta\> t|)><rsup|k>
    e<rsup|\<beta\>t><around*|(|2\<beta\><rsup|P+1>-\<beta\><rsup|P+2>|)>\<Gamma\><around*|(|k+1,\<beta\>t|)>|<around*|(|\<beta\>
    t|)><rsup|k+1><around*|(|\<beta\>-2|)>>>>|<row|<cell|>|<cell|=-<frac|1|\<beta\>><big|sum><rsub|k=0><rsup|P>\<alpha\><rsub|k>
    \<beta\><rsup|-k> \<Gamma\><around*|(|k+1,\<beta\> t|)>>>>>>
  </equation>

  where <space|\<Gamma\><around*|(|k,\<beta\>t|)>> is the incomplete Gamma
  function (<reference|incompleteGamma>). The log-likelihood for the Hawkes
  process having this generalized exponential kernel is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1\<ldots\>n>|)>>|<cell|=<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<lambda\><rsub|0><around*|(|t<rsub|i>|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>-\<kappa\><big|int><rsub|0><rsup|T>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t-<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    S<rsub|j><around*|(|T-t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<lambda\><rsub|0><around*|(|t<rsub|i>|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>-<big|sum><rsub|i=1><rsup|n>\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<with|font-base-size|9|<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    S<rsub|j><around*|(|T-t<rsub|i>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n>ln<around*|(|\<lambda\><rsub|0><around*|(|t<rsub|i>|)>\<kappa\>+<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    R<rsub|j><around*|(|i|)>|)>-<around*|(|\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<with|font-base-size|9|<big|sum><rsub|j=0><rsup|P>\<alpha\><rsub|j>
    S<rsub|j><around*|(|T-t<rsub|i>|)>>|)>>>>>>
  </equation>

  where <space|R<rsub|j><around*|(|i|)>> and <space|S<rsub|j><around*|(|t|)>>
  are given recursively and <space|T=t<rsub|n>> is the time of the last point
  in the sample. Let\ 

  <\equation>
    t<rsub|0>=0
  </equation>

  <\equation>
    R<rsub|0><around*|(|1|)>=0
  </equation>

  <\equation>
    S<rsub|0><around*|(|t|)>=<frac|1-e<rsup|-\<beta\>t>|\<beta\>>
  </equation>

  then

  <\equation>
    A<rsub|k><around*|(|t|)>=t<rsup|k> e<rsup|-\<beta\>t>
  </equation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|j><around*|(|i|)>>|<cell|=A<rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>+<big|sum><rsub|k=0><rsup|j><choose|j|k>A<rsub|j-k><around*|(|t<rsub|i>-t<rsub|i-1>|)>R<rsub|k><around*|(|i-1|)>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|j>
    e<rsup|-\<beta\><around*|(|t<rsub|i>-t<rsub|i-1>|)>>+<big|sum><rsub|k=0><rsup|j><choose|j|k><around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|j-k>
    e<rsup|-\<beta\><around*|(|t<rsub|i>-t<rsub|i-1>|)>>R<rsub|k><around*|(|i-1|)>>>>>>
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<rsub|j><around*|(|t|)>>|<cell|=<frac|j
    S<rsub|j-1><around*|(|t|)>-A<rsub|j><around*|(|t|)>|\<beta\>>>>|<row|<cell|>|<cell|=<frac|j
    S<rsub|j-1><around*|(|t|)>-t<rsup|j> e<rsup|-\<beta\>t>|\<beta\>>>>>>>
  </equation>

  <subsubsection|The Hawkes Process Having a Weibull Kernel>

  The exponential kernel of the Hawkes process can be replaced with that of a
  Weibull kernel. <cite-detail|appa|6.3> Recall that the intensity of a
  Hawkes process is defined by (<reference|HawkesIntensity>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|-\<infty\>><rsup|t>\<psi\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|i>\<less\>t>\<psi\><around*|(|t-t<rsub|i>|)>>>>>>
  </equation>

  where the exponential kernel <space|\<psi\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
  e<rsup|-\<beta\><rsub|j> t>> is replaced by the Weibull kernel\ 

  <\equation>
    \<psi\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>
  </equation>

  with parameter vectors <space|\<alpha\><rsub|j>,\<upsilon\><rsub|j>,\<omega\><rsub|j>>
  so the Hawkes-Weibull intensity is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t-s|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-s|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|k=0><rsup|N<rsub|t>-1><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<kappa\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|N<rsub|t>-1>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><big|sum><rsub|k=0><rsup|N<rsub|t>-1><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)>C<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  and <space|C<rsub|j><around*|(|n|)>> is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|C<rsub|j><around*|(|n|)>>|<cell|=<big|sum><rsub|k=0><rsup|n-1><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>>>>>>
  </equation>

  where the branching ratio is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>\<psi\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>>>>>>
  </equation>

  The survivor function of the Weibull kernel is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<around*|(|t|)>>|<cell|=<big|int><rsub|t><rsup|\<infty\>>\<nu\><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|s|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|s|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>s>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-t<rsup|\<upsilon\><rsub|j>>\<omega\><rsub|j><rsup|-\<upsilon\><rsub|j>>>>>>>>
  </equation>

  which is surprisingly quite a bit less complicated than survivor function
  of the exponential kernel (<reference|hes>). The hazard function is the
  quotient of the kernel over the survivor function

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<psi\>|\<bar\>><around*|(|t|)>>|<cell|=<frac|\<psi\><around*|(|t|)>|S<around*|(|t|)>>>>|<row|<cell|>|<cell|=<frac|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>|<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-t<rsup|\<upsilon\><rsub|j>>\<omega\><rsub|j><rsup|-\<upsilon\><rsub|j>>>>>>>>><tabular|<tformat|<table|<row|<cell|>>>>>
  </equation>

  Now, similiar to (<reference|hc>),the compensator is calculated

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<cal-E\>|~><rsub|i>>|<cell|=\<Lambda\><rsup|k><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|k=0><rsup|i-1>\<psi\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>\<psi\><around*|(|t<rsub|i>-t<rsub|k>|)>-\<psi\><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><big|sum><rsub|k=0><rsup|i-1><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P>-\<alpha\><rsub|j><around*|(|e<rsup|-<around*|(|<frac|t<rsub|i><rsup|>-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<nu\><rsub|j>>
    <rsup|>>-e<rsup|-<around*|(|<frac|t<rsub|i-1><rsup|>-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<nu\><rsub|j>><rsup|>>|)>>>>>><label|hwc>
  </equation>

  where the integral of the Weibull kernel over consecutive events is given
  by an application of the first fundamental theorem of calculus

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<psi\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<wide|\<psi\>|^><around*|(|t<rsub|i>|)>-<wide|\<psi\>|^><around*|(|t<rsub|i-1>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>-\<alpha\><rsub|j>
    <around*|(|e<rsup|-<around*|(|<frac|t<rsub|i>|\<omega\><rsub|j>>|)><rsup|\<nu\><rsub|j>>>-e<rsup|-<around*|(|<frac|t<rsub|i-1>|\<omega\><rsub|j>>|)><rsup|\<nu\><rsub|j>>>|)>>>>>>
  </equation>

  where <space|<wide|\<psi\>|^><around*|(|t|)>> is the antiderivative of the
  kernel <space|\<psi\><around*|(|t|)>> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<tabular|<tformat|<table|<row|<cell|<wide|\<psi\>|^><around*|(|t|)>>|<cell|=<big|int>\<psi\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>-\<alpha\><rsub|j>
    e<rsup|-<around*|(|<frac|t|\<omega\><rsub|j>>|)><rsup|\<nu\><rsub|j>>>>>>>>>>>>>
  </equation>

  The change-of-variables in (<reference|hwc>) can be made, let\ 

  <\equation>
    s=-<around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>
  </equation>

  then

  <\equation>
    \<mathd\>s<rsub|k>=-\<mathd\>s<rsub|><around*|(|<frac|\<upsilon\><rsub|j>|\<omega\><rsub|j>>|)><around*|(|<frac|t-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>-1>
  </equation>

  so (<reference|hwc>) can be written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<cal-E\>|~><rsub|i>>|<cell|=\<Lambda\><rsup|k><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|i-1>\<alpha\><rsub|j><big|int><rsub|<around*|(|<frac|t<rsub|i-1>-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>><rsup|<around*|(|<frac|t<rsub|i>-t<rsub|k>|\<omega\><rsub|j>>|)><rsup|\<upsilon\><rsub|j>>>e<rsup|-s>\<mathd\>s>>>>>
  </equation>

  When <space|\<upsilon\><rsub|j>=1,\<omega\><rsub|j>=1> the Hawkes-Weibull
  process reduces to the standard exponential Hawkes process.\ 

  <subsubsection|The Hawkes Process Having a Gamma Kernel>

  Another parametrization we can try is having a kernel given by a mixture of
  gamma distributions

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|-\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>>
  </equation>

  with

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t|b<rsub|j>>>
  </equation>

  having parameter vectors <space|\<alpha\><rsub|j>,b<rsub|j>,c<rsub|j>> so
  that the intensity is written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t-s|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-s|b<rsub|j>>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|i=0><rsup|N<rsub|t>-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t-t<rsub|i>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|i>|b<rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|i=0><rsup|N<rsub|t>-1><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t-t<rsub|i>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|i>|b<rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j><rsub|>\<Gamma\><around*|(|c<rsub|j>|)>><big|sum><rsub|i=0><rsup|N<rsub|t>-1>
    <around*|(|<frac|t-t<rsub|i>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|i>|b<rsub|j>>>>>>>>
  </equation>

  where the branching ratio is\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>>>>>>
  </equation>

  The compensator is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<cal-E\>|~><rsub|i>>|<cell|=\<Lambda\><rsup|k><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|k=0><rsup|i-1>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j><rsub|>\<Gamma\><around*|(|c<rsub|j>|)>><big|sum><rsub|k=0><rsup|i-1>
    <around*|(|<frac|t-t<rsub|k>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|k>|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j><rsub|>\<Gamma\><around*|(|c<rsub|j>|)>><big|sum><rsub|k=0><rsup|i-1>
    <around*|(|<frac|t-t<rsub|k>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|k>|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j><rsub|>\<Gamma\><around*|(|c<rsub|j>|)>><around*|(|<frac|t-t<rsub|k>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|k>|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>
    <wide|\<nu\>|^><around*|(|t<rsub|i>-t<rsub|k>|)>-<wide|\<nu\>|^><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>|<row|<cell|>|<cell|<with|font-base-size|6|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>
    <big|sum><rsub|j=1><rsup|P>-\<alpha\><rsub|j><frac|<around*|(|c<rsub|j>+1|)>|\<Gamma\><around*|(|c<rsub|j>+2|)>>\<ldots\>>>>|<row|<cell|>|<cell|<with|font-base-size|6|\<ldots\><around*|(|<with|font-base-size|8|>\<Gamma\><around*|(|c<rsub|j>+1,<frac|<around*|(|t<rsub|i>-t<rsub|k>|)>|b<rsub|j>>|)>-\<Gamma\><around*|(|c<rsub|j>+1,
    <frac|<around*|(|t<rsub|i-1>-t<rsub|k>|)>|b<rsub|j>>|)>-e<rsup|-<frac|<around*|(|t<rsub|i>-t<rsub|k>|)>|b<rsub|j>>><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|c<rsub|j>>b<rsub|j><rsup|-c<rsub|j>>+e<rsup|-<frac|<around*|(|t<rsub|i-1>-t<rsub|k>|)>|b<rsub|j>>><around*|(|t<rsub|i-1>-t<rsub|k>|)><rsup|c<rsub|j>>b<rsub|j><rsup|-c<rsub|j>>|)>>>>>>>
  </equation>

  since the integral of the gamma kernel over consecutive events is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j><rsub|>\<Gamma\><around*|(|c<rsub|j>|)>><big|sum><rsub|i=0><rsup|N<rsub|t>-1>
    <around*|(|<frac|t-t<rsub|i>|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t-t<rsub|i>|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<wide|\<nu\>|^><around*|(|t<rsub|i>|)>-<wide|\<nu\>|^><around*|(|t<rsub|i-1>|)>>>|<row|<cell|>|<cell|<with|font-base-size|8|=<big|sum><rsub|j=1><rsup|P>-<frac|\<alpha\><rsub|j><around*|(|c<rsub|j>+1|)>|\<Gamma\><around*|(|c<rsub|j>+2|)>><around*|(|\<Gamma\><around*|(|c<rsub|j>+1,<frac|t<rsub|i>|b<rsub|j>>|)>-\<Gamma\><around*|(|c<rsub|j>+1,<frac|
    t<rsub|i-1>|b<rsub|j>>|)>-e<rsup|- <frac|t<rsub|i>|b<rsub|j>>>
    t<rsub|i><rsup|c<rsub|j>>b<rsub|j><rsup|-c<rsub|j>>+e<rsup|-
    <frac|t<rsub|i-1>|b<rsub|j>>> t<rsub|i-1><rsup|c<rsub|j>>b<rsub|j><rsup|-c<rsub|j>>|)>>>>>>>
  </equation>

  where <space|<wide|\<nu\>|^><around*|(|t|)>> is the integral of
  <space|\<nu\><around*|(|t|)>> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|font-base-size|9|><wide|\<nu\>|^><around*|(|t|)>>|<cell|=<big|int><rsub|><rsup|>\<nu\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|b<rsub|j>
    \<Gamma\><around*|(|c<rsub|j>|)>> <around*|(|<frac|t|b<rsub|j>>|)><rsup|c<rsub|j>-1>
    e<rsup|-<frac|t|b<rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|<with|font-base-size|9|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>b<rsub|j><rsup|c<rsub|j>>e<rsup|-<frac|<rsub|t>|2b<rsub|j>>>b<rsub|j><rsup|-c<rsub|j>>|
    \<Gamma\><around*|(|c<rsub|j>+2|)>><around*|(|<around*|(|<frac|t|b<rsub|j>>|)><rsup|<frac|c<rsub|j>|2>>M<rsub|<frac|c<rsub|j>|2>,<frac|c<rsub|j>|2>+<frac|1|2>><around*|(|<frac|t
    |b<rsub|j>>|)>+<around*|(|<frac|t |b<rsub|j>>|)><rsup|c<rsub|j>>*e<rsup|-<frac|t
    |2 b<rsub|j>><rsup|>><around*|(|c<rsub|j>+1|)>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<Gamma\><around*|(|c<rsub|j>+2|)>><around*|(|\<Gamma\>*<around*|(|c<rsub|j>+2|)>+<around*|(|<around*|(|<frac|t|b<rsub|j>>|)><rsup|c<rsub|j>>e<rsup|-<frac|t|b<rsub|j>>>-\<Gamma\><around*|(|c<rsub|j>+1,<frac|t|b<rsub|j>>|)>|)><around*|(|c<rsub|j>+1|)>|)>>>>>>
  </equation>

  where\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|M<rsub|\<mu\>,\<nu\>><around*|(|z|)>>|<cell|=e<rsup|-<frac|z|2>>
    z<rsup|\<nu\>+<frac|1|2>> <rsub|1>F<rsub|1><around*|(|<tabular|<tformat|<table|<row|<cell|<frac|1|2>-\<mu\>+\<nu\>>>|<row|<cell|1+2\<nu\>>>>>>;z|)>>>>>>
  </equation>

  is the Whittaker M function which solves the equation
  <space|y<rprime|''>+<around*|(|-<frac|1|4>+<frac|\<mu\>|z>+<frac|<frac|1|4>-\<nu\><rsup|2>|z<rsup|2>>|)>y=0>
  and

  <\equation>
    <rsub|1>F<rsub|1><around*|(|<tabular|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>>>>;z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\><around*|(|a+k|)>\<Gamma\><around*|(|b|)>z<rsup|k>|\<Gamma\><around*|(|a|)>\<Gamma\><around*|(|k+1|)>\<Gamma\><around*|(|b+k|)>>
  </equation>

  \ is the confluent hypergeometric function<cite|hypergeometricRepresentation>
  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Gamma\><around*|(|a,z|)>>|<cell|=\<Gamma\><around*|(|a|)>-<frac|z<rsup|a>
    <rsub|1>F<rsub|1><around*|(|<tabular|<tformat|<table|<row|<cell|a>>|<row|<cell|1+a>>>>>;-z|)>|a>>>>>><label|incompleteGamma>
  </equation>

  is the incomplete Gamma function. When <space|b<rsub|j>=1> and
  <space|c<rsub|j>=1> the Hawkes-Gamma model reduces to the standard Hawkes
  model with an exponential kernel.

  <subsubsection|A Hyperbolic Kernel>

  Another interesting kernel is the hyperbolic kernel having \Plong memory\Q
  features. As usual the intensity is defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>>
  </equation>

  with the hyperbolic kernel

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|<around*|(|t+\<beta\><rsub|j>|)><rsup|p<rsub|j>>>
  </equation>

  having parameter vectors <space|\<alpha\><rsub|j>,\<beta\><rsub|j>,p<rsub|j>>
  so that the intensity is written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|<around*|(|t+\<beta\><rsub|j>|)><rsup|p<rsub|j>>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|i=0><rsup|N<rsub|t>-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|<around*|(|<around*|(|t-t<rsub|i>|)>+\<beta\><rsub|j>|)><rsup|p<rsub|j>>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|i=0><rsup|N<rsub|t>-1><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<around*|(|t-t<rsub|i>|)>+\<beta\><rsub|j>|)><rsup|-p<rsub|j>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|i=0><rsup|N<rsub|t>-1><around*|(|<around*|(|t-t<rsub|i>|)>+\<beta\><rsub|j>|)><rsup|-p<rsub|j>>>>>>>
  </equation>

  The compensator is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<cal-E\>|~><rsub|i>>|<cell|=\<Lambda\><rsup|k><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|k=0><rsup|i-1>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>
    <wide|\<nu\>|^><around*|(|t<rsub|i>-t<rsub|k>|)>-<wide|\<nu\>|^><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>h<rsub|j><big|sum><rsub|k=0><rsup|i-1><around*|(|<around*|(|t-t<rsub|k>|)>+\<kappa\><rsub|j>|)><rsup|-p<rsub|j>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|<around*|(|t-t<rsub|k>|)>+\<beta\><rsub|j>|)><rsup|-p<rsub|j>>\<mathd\>t>>|<row|<cell|>|<cell|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1><around*|(|<around*|(|t-t<rsub|k>|)>+\<beta\><rsub|j>|)><rsup|-p<rsub|j>>\<mathd\>t>>|<row|<cell|>|<cell|<with|font-base-size|10|=\<kappa\><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<big|sum><rsub|k=0><rsup|i-1>-<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><around*|(|<around*|(|\<beta\><rsub|j>+<around*|(|t<rsub|i>-t<rsub|k>|)>|)><rsup|1-p<rsub|j>>-<around*|(|\<beta\><rsub|j>+<around*|(|t<rsub|i-1>-t<rsub|k>|)>|)><rsup|1-p<rsub|j>>|)>|p<rsub|j>-1>>>>>>>
  </equation>

  since the integral of the hyperbolic kernel over consecutive events is
  given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|t+\<beta\><rsub|j>|)><rsup|-p<rsub|j>>\<mathd\>t>>|<row|<cell|>|<cell|=<wide|\<nu\>|^><around*|(|t<rsub|i>|)>-<wide|\<nu\>|^><around*|(|t<rsub|i-1>|)>>>|<row|<cell|>|<cell|<with|font-base-size|8|=-<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><around*|(|<around*|(|\<beta\><rsub|j>+t<rsub|i>|)><rsup|1-p<rsub|j>>-<around*|(|\<beta\><rsub|j>+t<rsub|i-1>|)><rsup|1-p<rsub|j>>|)>|p<rsub|j>-1>>>>>>>
  </equation>

  The antiderivative of the kernel is

  <\equation>
    <wide|\<nu\>|^><around*|(|t|)>=<big|int>\<nu\><around*|(|t|)>\<mathd\>t=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><around*|(|\<beta\><rsub|j>+t|)><rsup|1-p<rsub|j>>|1-p<rsub|j>>
  </equation>

  and definite integral

  <\equation>
    <big|int><rsub|0><rsup|s>\<nu\><around*|(|t|)>\<mathd\>t=<big|sum><rsub|j=1><rsup|P>-<frac|\<alpha\><rsub|j><around*|(|\<beta\><rsub|j>+s|)><rsup|-p<rsub|j>>
    <around*|(|\<beta\><rsub|j>-\<beta\><rsub|j><around*|(|<frac|\<beta\><rsub|j>+s|\<beta\><rsub|j>>|)><rsup|p<rsub|j>>+s|)>|p<rsub|j>-1>
  </equation>

  The branching ratio is given by

  <\equation>
    <with|font-base-size|12|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<with|font-base-size|11|<big|int><rsub|0><rsup|\<infty\>>\<nu\><around*|(|t|)>\<mathd\>t>>|<cell|=<choice|<tformat|<table|<row|<cell|<frac|<big|sum><rsub|i=1><rsup|P>\<beta\><rsub|i><rsup|1-p<rsub|i>>
    \<alpha\><rsub|i> <around*|(|1-<below|<above|<below|<big|prod><rsub|k=1><rsup|P>|k\<neq\>i>p<rsub|k>|>|>-<below|<big|sum><rsub|k=1><rsup|P>p<rsub|k>|k\<neq\>i>|)>|<big|prod><rsub|j=1><rsup|P><around*|(|p<rsub|j>-1|)>>>|<cell|\<forall\>p<rsub|j>\<gtr\><with|font-base-size|11|>1>>|<row|<cell|\<infty\>>|<cell|\<exists\>p<rsub|j>\<leqslant\>1>>>>>>>>>>>
  </equation>

  where <space|\<exists\>> is an existential quantifier which means \Pat
  least one of\Q' whatever follows it is true and the product with an
  excluded index is equivalent to\ 

  <\equation>
    <below|<big|prod><rsub|k=1><rsup|P>|k\<neq\>i>p<rsub|k>=<big|prod><rsub|k=1><rsup|i-1>p<rsub|k><big|prod><rsup|P><rsub|k=i+1>p<rsub|k>
  </equation>

  and likewise for the sum

  <\equation>
    <below|<big|sum><rsub|k=1><rsup|P>|k\<neq\>i>p<rsub|k>=<big|sum><rsub|k=1><rsup|i-1>p<rsub|k>+<big|sum><rsup|P><rsub|k=i+1>p<rsub|k>
  </equation>

  <subsection|Assessing Goodness of Fit with Graphical Methods>

  The compensator of a point process, if it is a good fit, will be an i.i.d.
  exponentially distributed random variable with mean <space|1> (and thus
  variance 1 and skewness 2) and no significant autocorrelation at any lag.
  To demonstrate this, the first 5000 points of SPY on the INET exchange on
  2012-11-30 were fit with the standard exponential Hawkes kernel of order
  <space|P=2> and the Weibull kernel of order <space|P=2>. This limited
  number of 5000 points (accounting for a little over 59 minutes of trading
  time) was chosen due to the lack of recursion available for the Hawkes
  kernel and thus increased computational complexity.\ 

  <\big-figure>
    <image|SPY-INET-2012-11-30-first-5000-hawkes-2-exp-probplot.eps|6in|4in||>
  </big-figure|Probability plot for Hawkes-Exp Order 2 fit vs Exponential(1)
  distribution>

  <big-figure|<image|SPY-INET-2012-11-30-first-5000-hawkes-2-weib-probplot.eps|6in|4in||>|Probability
  plot for Hawkes-Weibull Order 2 fit vs Exponential(1) distribution>

  <big-figure|<image|SPY-INET-2012-11-30-hawkes-2hyp-probplot.eps|6in|4in||>|Probability
  plot for Hawkes-Hyperbolic Order 2 fit vs Exponential(1) distribution>

  <big-figure|<image|SPY-INET-2012-11-30-first-5000-hawkes-2-exp-qqplot.eps|6in|4in||>|Quantiles
  of exponential Distribution vs Hawkes-Exp Order 2 fit>

  \;

  <big-figure|<image|SPY-INET-2012-11-30-first-5000-hawkes-2-weib-qqplot.eps|6in|4in||>|Quantiles
  of exponential Distribution vs Hawkes-Weibull Order 2 fit>

  <big-figure|<image|SPY-INET-2012-11-30-hawkes-2hyp-qqplot.eps|6in|4in||>|Quantiles
  of exponential Distribution vs Hawkes-Hyperbolic Order 2 fit>

  Table (<reference|table1>) lists the log-likelihood, mean, variance, and
  skew of the compensator for the \ exponential and Weibull fits.

  <big-table|<space|<tabular*|<tformat|<table|<row|<cell|>|<cell|Hawkes-Exp>|<cell|Hawkes-Weibull>|<cell|Hawkes-Hyperbolic>>|<row|<cell|ln\<cal-L\>>|<cell|935.8106454999223>|<cell|972.8236127532505>|<cell|934.351208722037>>|<row|<cell|Mean>|<cell|
  1.00000225846881>|<cell| 1.00017927572359>|<cell|1.00024283933897>>|<row|<cell|Variance>|<cell|
  1.08823532290517 >|<cell|1.08097250910931>|<cell|
  1.0294837410725>>|<row|<cell|Skewness>|<cell|
  2.18458483003574>|<cell|2.33622435438673>|<cell|2.16195765106546>>>>>>|<label|table1>>

  As can be seen, the rather meager increase of the log-likehood score gained
  by switching to the Weibull model and giving up recursion appears to not be
  worth it, and note that the skew of the Weibull fit is a little higher than
  the exp fit however the Weibull does fit better and goes further into the
  tails of the distribution before diverging. The hyperbolic kernel has a
  slightly lower log-likelihood score than the exponential, however the
  variance and skew are lower than both the other two kernels and also the QQ
  and probability plots show a closer fit to the linear slope before the
  tails diverge.\ 

  <subsection|Combining the ACD and Hawkes Models>

  The ACD and Hawkes models can be combined to provide a model for intraday
  volatility. <cite|cai2007model> Let

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>+<frac|1|\<psi\><rsub|N<rsub|t>>>+<big|int><rsub|0><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>>>>
  </equation>

  where <space|\<lambda\><rsub|0><around*|(|t|)>> is the determinstic
  baseline intensity(<reference|lambda0>) and where the
  ACD(<reference|acdpsi>) part is\ 

  <\equation>
    \<psi\><rsub|i>=\<omega\>+<big|sum><rsub|j=1><rsup|m>\<alpha\><rsub|j>
    x<rsub|i-j>+<big|sum><rsub|j=1><rsup|q>\<beta\><rsub|j>
    \<psi\><rsub|i-j><label|hmm>
  </equation>

  and the Hawkes part has the exponential kernel(<reference|exp>)

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>
    e<rsup|-\<varphi\><rsub|j> t>
  </equation>

  so that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>|<cell|=<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>
    e<rsup|-\<varphi\><rsub|j> <around*|(|t-s|)>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|N<rsub|t>>\<nu\><around*|(|t-t<rsub|k>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|N<rsub|t>><big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>
    e<rsup|-\<varphi\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j><big|sum><rsub|k=0><rsup|N<rsub|t>>
    e<rsup|-\<varphi\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  where we have replaced <space|\<alpha\>=\<gamma\>> and
  <space|\<beta\>=\<varphi\>> in the Hawkes part so that the parameter names
  do not conflict with the ACD part where <space|\<alpha\>> and
  <space|\<beta\>> are also used as parameter names. The Hawkes part of the
  intensity has a recursive structure similiar to that of the compensator.
  Let\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=0><rsup|i-1>
    e<rsup|-\<varphi\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=<around*|(|1+B<rsub|j><around*|(|i-1|)>|)>e<rsup|-\<varphi\><rsub|j><around*|(|t-t<rsub|i><rsub|>|)>>>>>>>
  </equation>

  where <space|B<rsub|j><around*|(|0|)>=0>. Then we have

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>+<frac|1|\<omega\>+<big|sum><rsub|j=1><rsup|m>\<alpha\><rsub|j>
    x<rsub|N<rsub|t>-j>+<big|sum><rsub|j=1><rsup|q>\<beta\><rsub|j>
    \<psi\><rsub|N<rsub|t>-j>>+<big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  The log-likelihood for this hybrid model can be written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1,..,n>|)>>|<cell|=<big|sum><rsub|i=1><rsup|n><around*|(|ln
    \<lambda\><around*|(|t<rsub|i>|)>-<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t|)><rsub|>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><around*|(|ln
    \<lambda\><around*|(|t<rsub|i>|)>-\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><around*|(|ln
    \<lambda\><around*|(|t<rsub|i>|)>-<wide|\<cal-E\>|~><rsub|i>|)>>>>>><label|hll>
  </equation>

  By direct calculation, combining (<reference|acdcomp>) and
  (<reference|hc>), and letting <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> we
  have the compensator

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|\<cal-E\>|~><rsub|i>>|<cell|=\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t<rsub|>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<lambda\><rsub|0><around*|(|t|)>+<frac|1|\<psi\><rsub|N<rsub|t>+1>>+<big|int><rsub|0><rsup|t<rsub|>>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>|)>\<mathd\>t<rsub|>>>|<row|<cell|>|<cell|=<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<lambda\><rsub|0><around*|(|t|)>+<big|int><rsub|0><rsup|t<rsub|>>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>|)>\<mathd\>t<rsub|>>>|<row|<cell|>|<cell|<with|font-base-size|8|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<gamma\><rsub|j>|\<varphi\><rsub|j>><around*|(|e<rsup|-\<varphi\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<varphi\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|t|)>\<mathd\>t+<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|sum><rsub|j=1><rsup|P><frac|\<gamma\><rsub|j>|\<varphi\><rsub|j>><around*|(|1-e<rsup|-\<varphi\><rsub|j>
    x<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>>
  </equation>

  where <space|\<psi\><rsub|i>> is defined by (<reference|hmm>) and

  <\equation>
    A<rsub|j><around*|(|i|)>=1+e<rsup|-\<varphi\><rsub|j>
    x<rsub|i>>A<rsub|j><around*|(|i-1|)>
  </equation>

  \ is given by (<reference|A>) so that (<reference|hll>) can be wriitten as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|ln
    \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=0,..,n>|)>>|<cell|=<big|sum><rsub|i=1><rsup|n><around|(|ln
    \<lambda\><around*|(|t<rsub|i>|)>-<wide|\<cal-E\>|~><rsub|i>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><around*|(|ln
    \<lambda\><around*|(|t<rsub|i>|)>-<around*|(|<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|sum><rsub|j=1><rsup|P><frac|\<gamma\><rsub|j>|\<varphi\><rsub|j>><around*|(|1-e<rsup|-\<varphi\><rsub|j>
    x<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>|)>|)>>>|<row|<cell|>|<cell|<with|font-base-size|8|=<big|sum><rsub|i=1><rsup|n>ln
    <around*|(|<frac|1|\<psi\><rsub|i>>+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>
    e<rsup|-\<varphi\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>-<around*|(|<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|sum><rsub|j<with|font-base-size|10|>=1><rsup|P><frac|\<gamma\><rsub|j>|\<varphi\><rsub|j>><around*|(|1-e<rsup|-\<varphi\><rsub|j>
    x<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>|)>>>>|<row|<cell|>|<cell|<with|font-base-size|8|=<big|sum><rsub|i=1><rsup|n>ln
    <around*|(|<frac|1|\<psi\><rsub|i>>+<big|sum><rsub|j=1><rsup|P>\<gamma\><rsub|j>
    B<rsub|j><around*|(|i|)>|)>-<around*|(|<frac|x<rsub|i>|\<psi\><rsub|i>>+<big|sum><rsub|j<with|font-base-size|10|>=1><rsup|P><frac|\<gamma\><rsub|j>|\<varphi\><rsub|j>><around*|(|1-e<rsup|-\<varphi\><rsub|j>
    x<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>|)>>>>>>>
  </equation>

  <subsubsection|Comparison of Hawkes-Exp vs ACD+Hawkes-Exp Model Fits>

  Now the Hawkes-Exp model of order 2 fit to the entire days worth of data on
  2012-11-30 for SPY on the INET exchange will be compared against the
  ACD+Hawkes-Exp hybrid model of Hawkes order 2 and ACD params
  <space|p=1,q=1>.

  <big-figure|<image|SPY-INET-2012-11-30-acdhawkes-2-1-1exp-qqplot.eps|6in|4in||>|QQ
  Plot of Hawkes-ACD-2-1-1 compensator vs Exponential(1) Distribution >

  <big-figure|<image|SPY-INET-2012-11-30-hawkes-2exp-qqplot.eps|6in|4in||>|QQ
  Plot of Hawkes-Exp-2 compensator vs Exponential(1) Distribution >

  <big-figure|<image|SPY-INET-2012-11-30-acdhawkes-2-1-1exp-probplot.eps|6in|4in||>|Probability
  Plot of Hawkes-ACD-2-1-1 compensator vs Exponential(1) Distribution >

  <big-figure|<image|SPY-INET-2012-11-30-hawkes-2exp-probplot.eps|6in|4in||>|Probability
  Plot of Hawkes-Exp-2 compensator vs Exponential(1) Distribution >

  From the looks of it, the ACD+Hawkes-Exp model is quite a bit worse than
  plain Hawkes-Exp, either that or I have made a mistake in deriving the
  hybrid model expressions. \ 

  <subsection|Multivariate Hawkes Models>

  Let <space|M\<in\>\<bbb-N\><rsup|\<ast\>>> and
  <space|<around*|{|<around*|(|t<rsub|i><rsup|m>|)>|}><rsub|m=1,\<ldots\>,M>>
  be an <space|M>-dimensional point process. The associated counting process
  will be denoted <space|N<rsub|t>=<around*|(|N<rsub|t><rsup|1>,\<ldots\>,N<rsub|t><rsup|M>|)>>.
  A multivariate Hawkes process<cite|hawkes1971spectra><cite|embrechts2011multivariate><cite|liniger2009multivariate>,
  compared with the univariate case in Equation
  (<reference|HawkesIntensity>), is defined with intensities
  <space|\<lambda\><rsup|m><around*|(|t|)>,m=1\<ldots\>M> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><rsup|m><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-s|)>>\<mathd\>N<rsub|s><rsup|n>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsup|><rsub|t<rsub|k><rsup|n>\<less\>t>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>><rsub|>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>><rsub|>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|k=0><rsup|N<rsub|t><rsup|n>-1>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    B<rsub|j><rsup|m,n><around*|(|N<rsub|t><rsup|n>|)>>>>>><label|mhi>
  </equation>

  where in this parameterization <space|\<kappa\>> is a vector which scales
  the baseline intensities, in this case, specified by piecewise polynomial
  splines (<reference|lambda0>). We can write
  <space|B<rsub|j><rsup|m,n><around*|(|i|)>> recursively\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<tabular|<tformat|<table|<row|<cell|<big|sum><rsup|i-1><rsub|k=0>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|=<around*|(|1+B<rsup|m,n><rsub|j><around*|(|i-1|)>|)>e<rsup|-\<beta\><rsup|m,n><rsub|j><around*|(|t-t<rsup|n><rsub|i><rsub|>|)>>>>>>>>>>>>
  </equation>

  In the simplest version with <space|P=1> and
  <space|\<lambda\><rsub|0><rsup|m><around*|(|t|)>=1> constant we have

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><rsup|m><around*|(|t|)>>|<cell|=\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|int><rsub|0><rsup|t>\<alpha\><rsup|m,n>e<rsup|-\<beta\><rsup|m,n><around*|(|t-s|)>>\<mathd\>N<rsub|s><rsup|n>
    >>|<row|<cell|>|<cell|=\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsup|N<rsub|t><rsup|n>-1><rsub|k=0>\<alpha\><rsup|m,n>e<rsup|-\<beta\><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M>\<alpha\><rsup|m,n><big|sum><rsup|N<rsub|t><rsup|n>-1><rsub|k=0>e<rsup|-\<beta\><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M>\<alpha\><rsup|m,n>
    B<rsub|1><rsup|m,n><around*|(|N<rsup|n><rsub|t>|)>>>>>><label|mhp1>
  </equation>

  Rewriting (<reference|mhp1>) in vectorial notion, we have

  <\equation>
    \<lambda\><around*|(|t|)>=\<kappa\>+<big|int><rsub|0><rsup|t>G<around*|(|t-s|)>\<mathd\>N<rsub|s>
  </equation>

  where

  <\equation>
    G<around*|(|t|)>=<around|(|\<alpha\><rsup|m,n>
    e<rsup|-\<beta\><rsup|m,n><around*|(|t-s|)>>|)><rsub|m,n=1\<ldots\>M>
  </equation>

  Assuming stationarity gives <space|E<around*|[|\<lambda\><around*|(|t|)>|]>=\<mu\>>
  a constant vector and thus\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>>|<cell|=<frac|\<kappa\>|I-<big|int><rsub|0><rsup|\<infty\>>G<around*|(|u|)>\<mathd\>u>>>|<row|<cell|>|<cell|=<frac|\<kappa\>|I-<around|(|<frac|\<alpha\><rsup|m,n>|\<beta\><rsup|m,n>>|)>>>>|<row|<cell|>|<cell|=<frac|\<kappa\>|I-\<Gamma\>>>>>>>
  </equation>

  A sufficient condition for a multivariate Hawkes process to be stationary
  is that the spectral radius of the branching matrix\ 

  <\equation>
    \<Gamma\>=<big|int><rsub|0><rsup|\<infty\>>G<around*|(|s|)>\<mathd\>s=<frac|\<alpha\><rsup|m,n>|\<beta\><rsup|m,n>>
  </equation>

  be strictly less than 1. The spectral radius of the matrix <space|G> is
  defined as

  <\equation>
    \<rho\>*<around*|(|G|)>=max<rsub|a\<in\>\<cal-S\><around*|(|G|)>><around*|\||a|\|>
  </equation>

  where <space|\<cal-S\><around*|(|G|)>> denotes the set of eigenvalues of
  <space|G>.\ 

  <subsubsection|The Compensator>

  The compensator of the <space|m>-th coordinate of a multivariate Hawkes
  process between two consecutive events <space|t<rsub|i-1><rsup|m>> and
  <space|t<rsub|i><rsup|m>> of type <space|m>, compared with the univariate
  case in Equation (<reference|hc>), is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsup|n><rsub|k>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsup|n><rsub|t<rsup|m><rsub|i>>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsup|n><rsub|k>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i-1><rsup|m>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsup|n><rsub|t<rsub|i-1><rsup|m>>-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsup|<wide|N|\<breve\>><rsup|n><rsub|t<rsub|i><rsup|m>>-1><rsub|k=<wide|N|\<breve\>><rsup|n><rsub|t<rsub|i-1><rsup|m>>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>>>><label|lhm>
  </equation>

  To save a considerable amount of computational complexity, note that we
  have the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>>>>
  </equation>

  and rewrite (<reference|lhm>) as

  <\equation>
    <with|font-base-size|8|<tabular|<tformat|<table|<row|<cell|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>|<cell|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsub|t<rsub|k><rsup|n>\<less\>s>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsub|k><rsup|n>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>|]>>>|<row|<cell|>|<cell|<with|font-base-size|7|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s>>>|<row|<cell|>|<cell|<with|font-base-size|6|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\><around*|(|<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i-1><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>|]>>>>>>><label|mhl>>
  </equation>

  where we have the initial conditions <space|A<rsub|j><rsup|m,n><around*|(|0|)>=0>.

  <subsubsection|Log-Likelihood>

  The log-likelihood of the multivariate Hawkes process can be computed as
  the sum of the log-likelihoods for each coordinate. Let

  <\equation>
    ln \<cal-L\><around*|(|<around*|{|t<rsub|i>|}><rsub|i=1,\<ldots\>,N<rsup|><rsub|T>>|)>=<big|sum><rsub|m=1><rsup|M>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>
  </equation>

  where each term is defined by

  <\equation>
    <with|mode|text|>ln\<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>=<big|int><rsub|0><rsup|T><around*|(|1-\<lambda\><rsup|m><around*|(|s|)>|)>\<mathd\>s+<big|int><rsub|0><rsup|T>ln\<lambda\><rsup|m><around*|(|s|)>\<mathd\>N<rsup|m><rsub|s>
  </equation>

  which in this case can be written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|=T-\<Lambda\><rsup|m><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|N<rsub|T><rsup|>>z<rsub|i><rsup|m>
    ln<around*|(|\<lambda\><rsub|0><rsup|m><around*|(|t<rsub|i>|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i>>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i>-t<rsub|k><rsup|n>|)>>|)><label|llmvh>>>|<row|<cell|>|<cell|=T-\<Lambda\><rsup|m><around*|(|0,T|)>+<big|sum><rsub|i=1><rsup|N<rsub|T><rsup|m>>
    ln<around*|(|\<lambda\><rsub|0><rsup|m><around*|(|t<rsub|i><rsup|m>|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsup|m><rsub|i>>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>>>>>>
  </equation>

  where again <space|t<rsub|N<rsub|T><rsup|>>=T> and

  <\equation>
    z<rsub|i><rsup|m>=<choice|<tformat|<table|<row|<cell|1>|<cell|event
    t<rsub|i> of type m>>|<row|<cell|0>|<cell|otherwise>>>>>
  </equation>

  and

  <\equation>
    \<Lambda\><rsup|m><around*|(|0,T|)>=<big|int><rsub|0><rsup|T>\<lambda\><rsub|><rsup|m><around*|(|t|)>\<mathd\>t=<big|sum><rsub|i=1><rsup|N<rsub|T><rsup|m>>\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>
  </equation>

  where <space|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>
  is given by (<reference|mhl>). Similiar to to the one-dimensional case, we
  have the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|j><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=<choice|<tformat|<table|<row|<cell|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>R<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>|<cell|if
    m\<neq\>n>>|<row|<cell|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>*<around*|(|1+R<rsub|j><rsup|m,n><around*|(|i-1|)>|)>>|<cell|if
    m=n>>>>>>>>>>
  </equation>

  so that (<reference|llmvh>) can be rewritten as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|=T-\<kappa\><rsup|m><big|int><rsub|0><rsup|T>\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<mathd\>t-\<ldots\>>>|<row|<cell|>|<cell|\<ldots\><with|font-base-size|6|-<big|sum><rsub|i=1><rsup|N<rsup|m><rsub|T>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>|]>+\<ldots\>>>>|<row|<cell|>|<cell|\<ldots\>+<big|sum><rsub|<rsup|i=1>><rsup|N<rsup|m><rsub|T>>ln<around*|(|\<lambda\><rsub|0><rsup|m><around*|(|t<rsub|i><rsup|m>|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    R<rsub|j><rsup|m,n><around*|(|i|)>|)>>>>>>
  </equation>

  with initial conditions <space|R<rsub|j><rsup|m,n><around*|(|0|)>=0> and
  <space|A<rsub|j><rsup|m,n><around*|(|0|)>=0> where <space|T=t<rsub|N>>
  where <space|N> is the number of observations, <space|M> is the number of
  dimensions, and <space|P> is the order of the model. Again, <space|T> can
  be dropped from the equation for the purposes of optimization. According to\ 

  <subsubsection|Projection of the Next Occurance Time ><label|multivarPred>

  The next occurance time of the <space|m><math|n>-th dimension of a
  multivariate Hawkes process having the usual exponential kernel can be
  predicted in the same way as the univariate process in Section
  (<reference|univarPred>), by solving for the unknown <space|t<rsub|n+1>> in
  the equation

  <\equation>
    <around*|{|t<rsub|n+1><rsup|m>:\<varepsilon\>=\<Lambda\><rsup|m><around*|(|t<rsub|n><rsup|m>,t<rsub|n+1><rsup|m>|)>=<big|int><rsub|t<rsup|m><rsub|n>><rsup|t<rsup|m><rsub|n+1>>\<lambda\><rsup|m><around*|(|s;\<frak-F\><rsub|s>|)>\<mathd\>s<label|mp>|}>
  </equation>

  where <space|\<Lambda\><rsup|m><around*|(|t<rsub|n><rsup|m>,t<rsub|n+1><rsup|m>|)>>
  is the compensator from Equation (<reference|lhm>)<space|> and
  <space|\<frak-F\><rsub|s>> is the filtration up to time <space|s> and the
  parameters of <space|\<lambda\><rsup|m>> are fixed. As is the case for the
  univariate Hawkes process, the idea is to average over all possible
  realizations of <space|\<varepsilon\>> (of which there are an uncountable
  infinity) weighted according to an exponential unit distribution. Another
  idea for more accurate prediction is to model the deviation of the
  generalized residuals from a true exponential distribution and then include
  the predicted error when calculating this expectation.\ 

  Let the most recent arrival time of the pooled and <space|m>-th processes
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

  count the number of points occuring in the <space|n>-th dimension before
  the most recent point of the <space|m>-th dimension and

  <\equation>
    <wide|N|\<breve\>><around*|(|t<rsub|j><rsup|m>\<less\>t<rsub|k><rsup|n>|)>
  </equation>

  then the next arrival time for a given value of the exponential random
  variable <space|\<varepsilon\>> of the <space|m>-th dimension of a
  multivariate Hawkes process having the standard exponential kernel is found
  by solving for the real root of\ 

  <\equation>
    <with|font-base-size|9|\<varphi\><rsub|m><around*|(|x<around*|(|\<varepsilon\>|)>;\<cal-F\><rsub|T>|)>=>\<tau\><rsub|m><around*|(|x,\<varepsilon\>|)>+<big|sum><rsub|l=1><rsup|P><big|sum><rsub|i=1><rsup|M>\<phi\><rsub|m,i,l>
    <big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|T<rsub|m>><rsup|i>><around*|(|\<sigma\><rsub|m,i,l,k><around*|(|x,x|)>-\<sigma\><rsub|m,i,l,k><around*|(|x,T<rsub|m>|)>|)><label|mc>
  </equation>

  which is similiar to the univariate case

  <\equation>
    <with|font-base-size|10|<with|font-base-size|10|\<varphi\><rsub|P><around*|(|x<around*|(|\<varepsilon\>|)>|)>=><tabular|<tformat|<table|<row|<cell|<with|font-base-size|10|\<tau\><around*|(|x,\<varepsilon\>|)>+<big|sum><rsub|j=1><rsup|P>\<phi\><rsub|j>
    <big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|T>><around*|(|\<sigma\><rsub|j,k><around*|(|x,x|)>-\<sigma\><rsub|j,k><around*|(|x,T|)>|)>><with|font-base-size|10|<rsup|>>>>>>>>
  </equation>

  where

  <\equation>
    \<cal-F\><rsub|T>=<around*|{|\<kappa\><rsub|\<ldots\>>,\<alpha\><rsub|\<ldots\>>,\<beta\><rsub|\<ldots\>>,t<rsup|1><rsub|0>\<ldots\>t<rsup|1><rsub|N<rsup|1>>\<leqslant\>T,\<ldots\>,t<rsup|m><rsub|0>\<ldots\>t<rsup|m><rsub|N<rsup|m>>\<leqslant\>T,\<ldots\>,t<rsup|M><rsub|0>\<ldots\>t<rsup|M><rsub|N<rsup|M>>\<leqslant\>T|}>
  </equation>

  is the filtration up to time <space|T>, to be interpreted as the set of
  available information, here denoting fitted parameters and observed arrival
  times of all dimensions, and where\ 

  <\equation>
    \<tau\><rsub|m><around*|(|x,\<varepsilon\>|)>=<around*|(|<around*|(|x-T<rsub|m>|)>\<kappa\><rsub|m>-\<varepsilon\>|)>\<upsilon\><rsub|m>\<eta\><rsub|m><around*|(|x|)>
  </equation>

  <\equation>
    \<eta\><rsub|m><with|font-base-size|10|<around*|(|x|)>=e<rsup|<around*|(|x+
    T<rsub|m>|)><big|sum><rsub|j=1><rsup|P><big|sum><rsub|n=1><rsup|M>\<beta\><rsub|m,n,j>>>
  </equation>

  can be seen to be similiar to the univariate equations
  <space|\<tau\><around*|(|x,\<varepsilon\>|)>=<around*|(|<around*|(|x-T|)>\<kappa\>-\<varepsilon\>|)>\<upsilon\>\<eta\><around*|(|x|)>>
  and <space|\<eta\><with|font-base-size|10|<around*|(|x|)>=e<rsup|<around*|(|x+T|)><big|sum><rsub|k=1><rsup|P>\<beta\><rsub|k>>>>
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

  For comparison, the univariate case is Equation (<reference|uc>) where

  <\equation>
    \<sigma\><rsub|m,k><around*|(|x,a|)>=e<rsup|<around*|(|a+t<rsub|k>|)>\<beta\><rsub|m><rsub|>+<around*|(|x+T|)><below|<big|sum><rsub|j=1><rsup|P>|j\<neq\>m>\<beta\><rsub|j>>=e<rsup|<big|sum><rsub|j=1><rsup|P>\<beta\><rsub|j><choice|<tformat|<table|<row|<cell|a+t<rsub|k><rsub|>>|<cell|j=m>>|<row|<cell|x+T>|<cell|j\<neq\>m>>>>>>
  </equation>

  <section|Numerical Methods>

  <subsection|The Nelder-Mead Algorithm>

  The Nelder-Mead simplex algorithm<cite|dennis1987optimization> was used to
  optimize the likelihood expressions given above.\ 

  <subsubsection|Starting Points for Optimizing the Hawkes Process of Order
  <space|P>>

  A starting point for the optimization of a Hawkes process of order
  <space|P> with an \Pexact\Q unconditional intensity was chosen as the most
  reasonable starting point, but it is by no means claimed to be the best.
  Let <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> be the interval between
  consecutive arrival times as in the ACD model (<reference|acd>). Then set
  the initial value of <space|\<lambda\><rsub|0>> to
  <space|<frac|0.5|E<around*|[|x<rsub|i>|]>>>,
  <space|\<alpha\><rsub|1\<ldots\>P>=<frac|1|P>> and
  <space|\<beta\><rsub|1\<ldots\>P>=2>. This gives an unconditional mean of
  <space|E<around*|[|x<rsub|i>|]>> for these parameters used as a starting
  point for the Nelder-Mead algorithm.\ 

  <section|Examples>

  <subsection|Millisecond Resolution Trade Sequences>

  The source data has resolution of milliseconds but the data is transformed
  prior to estimation by dividing each time by <space|1000> so that the unit
  of time is seconds. Also, trades occuring at the same price within 2ms of
  each other are dropped from the analysis. Further work will be done to find
  the optimal level of time aggregation, ideally the data would be
  timestamped with nanosecond resolution and this will be done in the future.\ 

  <subsubsection|Adjusting for the Deterministic Daily Intensity Variation>

  It is a well known fact that arrival rates(and the closely related
  volatility) have daily \Pseasonal\Q or \Pdiurnal\Q patterns where trading
  activity peaks after open and before close and has a low around the middle
  of the day known as the \Plunchtime effect\Q. In order to account for this
  we will fit a cubic spline with 14 knot points spaced every 30 minutes,
  including the opening and closing times of <space|t=0> and
  <space|t=6.5\<times\>60\<times\>60=23400> respectively since <space|t> has
  units of seconds. Let the adjusted durations be defined

  <\equation>
    <wide|x|~><rsub|i>=\<phi\><around*|(|t<rsub|i>|)>x<rsub|i>
  </equation>

  where <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> is the unadjusted duration
  and <space|\<phi\><around*|(|t<rsub|i>|)>> is a (piecewise polynomial)
  cubic spline with knot points at <space|t<around*|(|z j|)>> with values
  given by <space|P<rsub|j>>

  <\equation>
    P<rsub|j>=<frac|1|<around*|(|N<rsub|t<around*|(|z
    j|)>+w>-N<rsub|t*<around*|(|z j|)>-w>|)>><big|sum><rsub|i=N<rsub|t*<around*|(|z
    j|)>-w>><rsup|N<rsub|t<around*|(|z j|)>+w>> <frac|1|x<rsub|i>> for
    j=0\<ldots\>13
  </equation>

  where <space|z=60\<times\>30=1800> is the number of seconds in a half-hour
  and <space|j=0\<ldots\><around*|(|6.5*\<times\>2|)>>. The first and last
  knots have a \Pwindow\Q of 30-minutes whereas the interior knot points have
  a window of 1 hour looking forward and backward in time 30-minutes, the
  first knot point only looks forward and the last knot point only looks
  backward. This gives us the \Pdeterministic baseline intensity\Q which is a
  piecewise polynomial cubic spline function whose exact form is not
  mentioned here since it is not the focus of the paper.\ 

  <\equation>
    \<lambda\><rsub|0><around*|(|t|)>=f<around*|(|t
    ,P<rsub|0>,\<ldots\>,P<rsub|j>|)><label|lambda0>
  </equation>

  The following figure shows the \Pdeterministic part\Q of the intensity
  estimated for SPY on 2012-11-30 for INET, BATS, and ARCA.

  <big-figure|<image|SPY_INET_BATS_ARCA_deterministic_intensity_2012-11-30.eps|6in|4in||>|<space|Interpolating
  spline \<phi\><around*|(|t|)>> for SPY on 2012-11-30>

  <subsubsection|Univarate Hawkes model fit to SPY (SPDR S&P 500 ETF Trust)>

  Consider these parameter estimates for the (univariate) Hawkes model of
  various orders fitted to data generated by trades of the symbol SPY traded
  on the NASDAQ on Nov 30th, 2012. The unconditional sample mean intensity
  for this symbol on this day on this exchange was 0.8882491159065832 trades
  per second where the number of samples is <space|n=20787>. The data
  presented here has not been \Pdeseasonalized', the analysis with
  deterministic diurnal variation accounted for will be presented in the next
  section. As can be seen, <space|P=6> provides the best likelihood but a
  more rigorous method to choose P would be to use some information criterion
  like Bayes or Akaike to decide the order <space|P>. \ Error bars are not
  provided, but presumably they could be estimated with derivative
  information. Note that the closer <space|E<around*|[|\<lambda\><around*|(|t|)>|]>>
  to 0.8882491159065832 and <space|E<around*|[|\<Lambda\><rsup|>|]>> and
  <space|Var<around*|[|\<Lambda\>|]>> to <space|1.0> the better, since
  <space|\<Lambda\>> should be exponentially distributed with mean <space|1>
  by design and for a Poisson process the mean and variance are equal. The
  next thing to check is that the <space|\<Lambda\>> series is not
  autocorrelated.\ 

  <\big-table>
    \;

    <\equation*>
      <with|font-base-size|10|<block|<tformat|<cwith|1|1|1|-1|cell-halign|c>|<table|<row|<cell|P>|<cell|\<kappa\>>|<cell|\<alpha\><rsub|1\<ldots\>P>>|<cell|\<beta\><rsub|1\<ldots\>P>>|<cell|ln
      \<cal-L\><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|E<around*|[|\<Lambda\><rsup|>|]>>|<cell|Var<around*|[|\<Lambda\>|]>>>|<row|<cell|1>|<cell|0.502711246>|<cell|19.66948678>|<cell|45.315830024>|<cell|-3504.24543>|<cell|0.88826610>|<cell|
      0.9999990>|<cell|1.8638729>>|<row|<cell|2>|<cell|0.179395347>|<cell|<tabular|<tformat|<table|<row|<cell|23.8186109>>|<row|<cell|0.09959041>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|61.07892017>>|<row|<cell|0.243158578>>>>>>|<cell|
      -1288.3557>|<cell|0.89489310>|<cell|
      0.9999972>|<cell|1.1880598>>|<row|<cell|3>|<cell|
      0.179558266>|<cell|<tabular|<tformat|<table|<row|<cell|0.08621919>>|<row|<cell|0.22766134>>|<row|<cell|28.5616786>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|0.219020402>>|<row|<cell|45.23233626>>|<row|<cell|55.87754150>>>>>>|<cell|
      -1586.7082>|<cell|1.99153298>|<cell|1.11040384>|<cell|1.24678422>>|<row|<cell|4>|<cell|0.178874698>|<cell|<tabular|<tformat|<table|<row|<cell|0.09893214>>|<row|<cell|0.18481509>>|<row|<cell|11.0305006>>|<row|<cell|12.5980362>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|0.241418546>>|<row|<cell|
      50.59817301>>|<row|<cell|66.99771955>>|<row|<cell|57.05863369>>>>>>|<cell|-1283.76240>|<cell|0.88938728>|<cell|0.99874524>|<cell|
      1.1871400>>|<row|<cell|5<rsup|>>|<cell|0.153072454>|<cell|<tabular|<tformat|<table|<row|<cell|8.017991269>>|<row|<cell|0.000000005>>|<row|<cell|18.28544127>>|<row|<cell|1.615965008>>|<row|<cell|0.060456987>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|68.68917670>>|<row|<cell|79.55782766>>|<row|<cell|83.46583667>>|<row|<cell|14.45235850>>|<row|<cell|0.151551338>>>>>>|<cell|-1051.97938>|<cell|0.99747221>|<cell|1.01670503>|<cell|1.16016527>>|<row|<cell|6<rsup|>>|<cell|0.132054503>|<cell|<tabular|<tformat|<table|<row|<cell|0.532479235>>|<row|<cell|0.034373403>>|<row|<cell|13.04953708>>|<row|<cell|4.208599107>>|<row|<cell|7.090279453>>|<row|<cell|2.291178834>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|4.108969054>>|<row|<cell|0.092093459>>|<row|<cell|84.86207394>>|<row|<cell|81.71142685>>|<row|<cell|67.23003519>>|<row|<cell|56.20297618>>>>>>|<cell|
      -991.14436>|<cell|0.90660986>|<cell| 1.00006670>|<cell|1.12981528>>>>>>
    </equation*>
  </big-table|Parameters and statistics for model fitted to data without
  diurnal adjustments>

  <\big-table>
    \;

    <\equation*>
      <with|font-base-size|10|<block|<tformat|<cwith|1|1|1|-1|cell-halign|c>|<table|<row|<cell|P>|<cell|\<kappa\>>|<cell|\<alpha\><rsub|1\<ldots\>P>>|<cell|\<beta\><rsub|1\<ldots\>P>>|<cell|ln
      \<cal-L\><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|E<around*|[|\<Lambda\><rsup|>|]>>|<cell|Var<around*|[|\<Lambda\>|]>>>|<row|<cell|1>|<cell|0.5796428053>|<cell|20.7816860009>|<cell|49.181292797>|<cell|
      -2565.16186>|<cell|>|<cell| 1.000005090>|<cell|
      1.64713115>>|<row|<cell|2>|<cell|0.2972951255>|<cell|<tabular|<tformat|<table|<row|<cell|24.336309087>>|<row|<cell|0.1366737439>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|63.30799040>>|<row|<cell|0.426958321>>>>>>|<cell|
      -1147.38872>|<cell|>|<cell| 1.000002078>|<cell|1.15682329>>|<row|<cell|3>|<cell|0.3105850108>|<cell|<tabular|<tformat|<table|<row|<cell|29.625207375>>|<row|<cell|0.0000000101>>|<row|<cell|0.1200815585>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|58.78427931>>|<row|<cell|32.16156796>>|<row|<cell|0.405484625>>>>>>|<cell|-1422.551267>|<cell|>|<cell|
      1.108843464>|<cell|1.23286963>>|<row|<cell|4>|<cell|0.5627834858>|<cell|<tabular|<tformat|<table|<row|<cell|0.0000000264>>|<row|<cell|6.4766935751>>|<row|<cell|14.656872968>>|<row|<cell|1.8317154168>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|40.62190533>>|<row|<cell|49.10661802>>|<row|<cell|60.00475526>>|<row|<cell|21.39853548>>>>>>|<cell|
      -2364.699597>|<cell|>|<cell| 1.022407180>|<cell|
      1.59177967>>|<row|<cell|5<rsup|>>|<cell|0.5506638255>|<cell|<tabular|<tformat|<table|<row|<cell|0.0725319843>>|<row|<cell|0.0507855259>>|<row|<cell|6.8528913938>>|<row|<cell|15.032951777>>|<row|<cell|2.0993068921>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|26.86479506>>|<row|<cell|81.58572968>>|<row|<cell|81.58572968>>|<row|<cell|60.25583954>>|<row|<cell|17.30297034>>>>>>|<cell|
      -2152.462512>|<cell|>|<cell|1.011487836>|<cell|1.53515842>>|<row|<cell|6<rsup|>>|<cell|0.5362685399>|<cell|<tabular|<tformat|<table|<row|<cell|12.459351335>>|<row|<cell|8.2747228669>>|<row|<cell|0.0000000201>>|<row|<cell|2.7582137937>>|<row|<cell|0.0041661767>>|<row|<cell|1.9821090294>>>>>>|<cell|<tabular|<tformat|<table|<row|<cell|77.72815398>>|<row|<cell|69.01934786>>|<row|<cell|53.74869710>>|<row|<cell|47.94942161>>|<row|<cell|42.42839207>>|<row|<cell|13.72571940>>>>>>|<cell|
      -1997.336098>|<cell|>|<cell|1.016450670>|<cell|1.48640060>>>>>>
    </equation*>
  </big-table|Parameters and statistics for model fitted to data with diurnal
  adjustments>

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P1.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P2.eps|3in|2in||>>>|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P3.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P4.eps|3in|2in||>>>|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P5.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-P6.eps|3in|2in||>>>>>>|Autocorrelations
  of <space|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>> for
  <space|P=1\<ldots\>6> without diurnal adjustments>

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P1.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P2.eps|3in|2in||>>>|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P3.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P4.eps|3in|2in||>>>|<row|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P5.eps|3in|2in||>>|<cell|<image|SPY-INET-2012-11-30-LambdaAutocorr-interp-P6.eps|3in|2in||>>>>>>|Autocorrelations
  of <space|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>> for
  <space|P=1\<ldots\>6> with diurnal adjustments>

  As can be seen by visually inspecting the autocorrelations, all of the
  residual series are pretty-much acceptable *without* diurnal adjustments
  except for <space|P=1> with still had significant leftover autocorrelation.
  Strangely, it seems that inclusion of the diurnal adjustment significantly
  worsens the model fit in nearly all cases. I am tempted to suspect
  something wrong with the code.

  <\big-figure>
    <image|SPY-OCT-22-2012-price.eps|6in|4in||>
  </big-figure|Price history for SPY traded on INET on Oct 22nd, 2012>

  <\big-figure>
    <image|SPY-OCT-22-2012-Hawkes1.eps|6in|4in||>
  <|big-figure>
    <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> in blue and
    <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=1|}>>
    in green
  </big-figure>

  <big-figure|<image|SPY-OCT-22-2012-Hawkes6.eps||||>|<space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>>
  in blue and <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=6|}>>
  in green>

  <big-figure|<image|SPY-OCT-22-2012-Hawkes6-zoomed.eps||||>|Zoomed in view
  of <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> in blue and
  <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=6|}>> in
  green>

  <subsubsection|Multivariate SPY Data for 2012-08-14><label|mspy>

  Consider a 5-dimensional multivariate Hawkes model of order <space|P=1> fit
  to data for SPY from 3 exchanges, INET, BATS, and ARCA on 2012-08-14. Both
  INET and BATS distinguish buys from sells whereas ARCA does not, hence 5
  dimensional, 2 dimensions each for INET and BATS and 1 dimension for ARCA
  which will naturally have twice as high a rate as that for buys and sells
  considered seperately. The 5 dimensions are organized as follows:

  <\equation>
    <block|<tformat|<table|<row|<cell|BATS Buys>|<cell|BATS Sells>|<cell|INET
    Buys>|<cell|INET Sells>|<cell|ARCA Trades>>>>>
  </equation>

  <big-figure|<image|SPY-2012-08-14-Multidimcompensator.eps|6in|4in||>|>

  We say trades for ARCA because the type sent from the data broker is
  Unknown, indiciating that it is unknown whether it is a buyer or seller
  initiated trade. We have the following parameter estimates where \Plarge\Q
  values of <space|\<alpha\>> (\<gtr\>0.1) are highlighted in bold.\ 

  <\equation>
    \<lambda\>=<matrix|<tformat|<table|<row|<cell|0.25380789517348
    >>|<row|<cell|0.269289236349466 >>|<row|<cell|0.221292886522613
    >>|<row|<cell|0.158954542395839 >>|<row|<cell|0.371572853723448>>>>>
  </equation>

  <\equation>
    \<alpha\>=<matrix|<tformat|<table|<row|<cell|4.3514\<times\>10<rsup|-9>>|<cell|
    0.011879 >|<cell|<with|space-font-series|bold|0.2648
    >>|<cell|1.917\<times\>10<rsup|-8> >|<cell|<with|space-font-series|bold|0.10771>>>|<row|<cell|0.021881
    >|<cell|2.6164\<times\>10<rsup|-8> >|<cell|2.5725\<times\>10<rsup|-8>
    >|<cell|0.024946 >|<cell|<with|space-font-series|bold|0.25138>>>|<row|<cell|<with|space-font-series|bold|0.29092>>|<cell|<with|space-font-series|bold|
    0.51715>>|<cell|1.1254\<times\>10<rsup|-8>>|<cell|0.0029919>|<cell|0.004607>>|<row|<cell|0.0041449>|<cell|<with|space-font-series|bold|0.52852>>|<cell|0.018077>|<cell|3.2535\<times\>10<rsup|-9>>|<cell|0.0237>>|<row|<cell|0.021501>|<cell|<with|space-font-series|bold|0.71358>>|<cell|<with|space-font-series|bold|1.0954>>|<cell|<with|space-font-series|bold|0.15264>>|<cell|4.1222\<times\>10<rsup|-9>>>>>>
  </equation>

  <\equation>
    \<beta\>=<matrix|<tformat|<table|<row|<cell|1.0954>|<cell|10.803>|<cell|16.665>|<cell|20.188>|<cell|
    9.6059>>|<row|<cell| 5.6238>|<cell|11.558>|<cell|16.721>|<cell|18.304>|<cell|7.9016>>|<row|<cell|7.8125>|<cell|15.299>|<cell|16.431>|<cell|14.702>|<cell|6.6458>>|<row|<cell|8.3083>|<cell|
    15.758>|<cell|17.749>|<cell|12.953>|<cell|3.1621>>|<row|<cell|9.4264>|<cell|
    16.369>|<cell|19.303>|<cell|11.071>|<cell|2.8302>>>>>
  </equation>

  with a log-likelihood score of \ 39714.1497.

  <subsubsection|Multivariate SPY Data for 2012-11-19>

  Consider the same symbol, SPY, as a 5-dimensional Hawkes process as in
  <reference|mspy>, for a different day, on 2012-11-19, estimated with order
  <space|P=2> for a total of 105 parameters. <space|\<alpha\><rsub|j>>
  coefficients that are <space|\<gtr\>0.1> are highlighted in bold. The
  parameters listed below resulted in a log-likelihood value of 36543.8529.
  An interesting pattern emerges in the <space|\<beta\>> coefficients where
  it takes on some approximate stair-step pattern ranging from <space|2> to
  22. This might be indicitative of some fixed-frequency algorithms operating
  across the different exchanges at approximate 1-second intervals.\ 

  <\equation>
    \<lambda\>=<matrix|<tformat|<table|<row|<cell|0.113371928486215301>>|<row|<cell|0.116069526955243113>>|<row|<cell|0.120010488406567112>>|<row|<cell|0.140864383337674315>>|<row|<cell|0.236370243964866722>>>>>
  </equation>

  <\equation>
    <with|font-base-size|7|\<alpha\><rsub|1>=<matrix|<tformat|<table|<row|<cell|0.000000400520039>|<cell|0.000743243048280>|<cell|0.0730760324025721>|<cell|0.0235425002925593>|<cell|<with|space-font-series|bold|0.14994903109>>>|<row|<cell|0.000836306407254>|<cell|0.000048087752871>|<cell|0.0009983197029208>|<cell|<with|space-font-series|bold|0.36091325418001>>|<cell|0.0303494022034>>|<row|<cell|0.000007657273830>|<cell|0.008293393618634>|<cell|0.0000346485386433>|<cell|<with|space-font-series|bold|0.55279157046563>>|<cell|0.0303324666473>>|<row|<cell|0.000000051209296>|<cell|0.044218944305554>|<cell|0.0165858723488658>|<cell|0.0002898699267899>|<cell|<with|space-font-series|bold|0.12041188377>>>|<row|<cell|0.000343063367497>|<cell|0.019728025120072>|<cell|<with|space-font-series|bold|0.22664219457110>>|<cell|<with|space-font-series|bold|0.20883023885464>>|<cell|0.0002187148763>>>>>>
  </equation>

  <with|font-base-size|10|<\equation>
    <with|font-base-size|7|\<alpha\><rsub|2>=<matrix|<tformat|<table|<row|<cell|0.0247169438667>|<cell|0.045938324942878493>|<cell|<with|space-font-series|bold|0.52035195378729>>|<cell|0.0015976654768>|<cell|0.0219865625857849>>|<row|<cell|<with|space-font-series|bold|0.10369500283>>|<cell|0.000000961851428240>|<cell|0.0058603752158104>|<cell|<with|space-font-series|bold|0.17159388407>>|<cell|0.0001956826269151>>|<row|<cell|0.0619247685514>|<cell|0.005680420895898976>|<cell|0.0000041940337011>|<cell|0.0009132788022>|<cell|0.0161550464515489>>|<row|<cell|0.0073308612563>|<cell|<with|space-font-series|bold|0.3760898786954499>>|<cell|0.0078995090167169>|<cell|0.0000971358022>|<cell|0.0022020712790430>>|<row|<cell|<with|space-font-series|bold|0.37860663035>>|<cell|<with|space-font-series|bold|0.8648532461379836><with|space-font-series|bold|>>|<cell|0.0096939577784123>|<cell|<with|space-font-series|bold|0.23909856627>>|<cell|0.0000001318796171>>>>>>
  </equation>>

  <\equation>
    <with|font-base-size|7|\<beta\><rsub|1>=<matrix|<tformat|<table|<row|<cell|2.02691486662775>|<cell|4.58853278669795>|<cell|9.21516653991608>|<cell|14.2039223554899>|<cell|17.7230908440328108>|<cell|>>|<row|<cell|2.30228990848878>|<cell|5.70815142794409>|<cell|9.75920981324501>|<cell|15.0047495693597>|<cell|17.1640776964259771>|<cell|>>|<row|<cell|2.71360844613891>|<cell|6.97390906252072>|<cell|10.9112224210093>|<cell|16.3935104902520>|<cell|17.3801721025480269>|<cell|>>|<row|<cell|3.18861359927744>|<cell|6.93702281997507>|<cell|12.0261860231254>|<cell|17.5228876305459>|<cell|17.8876296984556440>|<cell|>>|<row|<cell|3.95262799649030>|<cell|7.76155541730819>|<cell|13.5039942724633>|<cell|17.3549525971848>|<cell|18.0730780733303966>|<cell|>>>>>>
  </equation>

  <\equation>
    <with|font-base-size|7|\<beta\><rsub|2>=<matrix|<tformat|<table|<row|<cell|19.6811983441165>|<cell|20.56326127197891>|<cell|18.53440853276660>|<cell|11.10183435325997>|<cell|5.955287687038747>>|<row|<cell|20.2253306600591>|<cell|21.39051471260508>|<cell|16.97184115533537>|<cell|9.548598696946248>|<cell|5.459761230875715>>|<row|<cell|20.2208259457254>|<cell|22.20704300748698>|<cell|17.88989095276187>|<cell|8.724870367131993>|<cell|4.215302773261564>>|<row|<cell|19.7356631996375>|<cell|21.67330389603866>|<cell|15.76838788843381>|<cell|7.534795006501931>|<cell|3.517163899772246>>|<row|<cell|20.2972304557004>|<cell|19.06667927692781>|<cell|13.19618799557176>|<cell|6.812943703872132>|<cell|2.825437512911523>>>>>>
  </equation>

  \;

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|20>
      <bibitem*|1><label|bib-bowsher2007modelling>C.G.<nbsp>Bowsher.<newblock>
      Modelling security market events in continuous time: intensity based,
      multivariate point process models.<newblock>
      <with|font-shape|italic|Journal of Econometrics>, 141(2):876\U912,
      2007.<newblock>

      <bibitem*|2><label|bib-cai2007model>Y.<nbsp>Cai, B.<nbsp>Kim,
      M.<nbsp>Leduc, K.<nbsp>Szczegot, Y.<nbsp>Yixiao<localize| and
      >M.<nbsp>Zamfir.<newblock> A model for intraday volatility.<newblock>
      <with|font-shape|italic|>, , 2007.<newblock>

      <bibitem*|3><label|bib-chavez2012high>V.<nbsp>Chavez-Demoulin<localize|
      and >JA<nbsp>McGill.<newblock> High-frequency financial data modeling
      using hawkes processes.<newblock> <with|font-shape|italic|Journal of
      Banking & Finance>, , 2012.<newblock>

      <bibitem*|4><label|bib-lambertw>R. M.<nbsp>Corless, G. H.<nbsp>Gonnet,
      D. E. G.<nbsp>Hare, D. J.<nbsp>Jeffrey<localize| and >D.
      E.<nbsp>Knuth.<newblock> On the lambert w function.<newblock>
      <with|font-shape|italic|Advances in Computational Mathematics>,
      5(1):329\U359, Dec 1996.<newblock>

      <bibitem*|5><label|bib-dennis1987optimization>JE<nbsp>Dennis<localize|
      and >D.J.<nbsp>Woods.<newblock> Optimization on microcomputers: the
      nelder-mead simplex algorithm.<newblock> <with|font-shape|italic|New
      Computing Environments: Microcomputers in Large-Scale Computing>,
      :116\U122, 1987.<newblock>

      <bibitem*|6><label|bib-embrechts2011multivariate>P.<nbsp>Embrechts,
      T.<nbsp>Liniger<localize| and >L.<nbsp>Lin.<newblock> Multivariate
      hawkes processes: an application to financial data.<newblock>
      <with|font-shape|italic|Journal of Applied Probability>, 48:367\U378,
      2011.<newblock>

      <bibitem*|7><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83\U90,
      1971.<newblock>

      <bibitem*|8><label|bib-hautsch2011econometrics>N.<nbsp>Hautsch.<newblock>
      <with|font-shape|italic|Econometrics of financial high-frequency
      data>.<newblock> Springer, 2011.<newblock>

      <bibitem*|9><label|bib-karr>A.<nbsp>Karr.<newblock>
      <with|font-shape|italic|Point processes and their statistical
      inference>, <localize|volume><nbsp>7.<newblock> CRC, 1991.<newblock>

      <bibitem*|10><label|bib-li1>Paul<nbsp>Koosis.<newblock>
      <with|font-shape|italic|The logarithmic integral I>.<newblock>
      Cambridge University Press, 1988.<newblock>

      <bibitem*|11><label|bib-liniger2009multivariate>T.J.<nbsp>Liniger.<newblock>
      <with|font-shape|italic|Multivariate Hawkes Processes>.<newblock>
      <localize|PhD thesis>, Swiss Federal Institute Of Technology Zurich,
      2009.<newblock>

      <bibitem*|12><label|bib-appa>F.<nbsp>Lorenzen.<newblock>
      <with|font-shape|italic|Analysis of Order Clustering Using High
      Frequency Data: A Point Process Approach>.<newblock> <localize|PhD
      thesis>, Tilburg School of Economics and Management, Finance
      Department, August 2012.<newblock>

      <bibitem*|13><label|bib-ogata1981lewis>Y.<nbsp>Ogata.<newblock> On
      lewis' simulation method for point processes.<newblock>
      <with|font-shape|italic|Information Theory, IEEE Transactions on>,
      27(1):23\U31, 1981.<newblock>

      <bibitem*|14><label|bib-ozaki1979maximum>T.<nbsp>Ozaki.<newblock>
      Maximum likelihood estimation of hawkes' self-exciting point
      processes.<newblock> <with|font-shape|italic|Annals of the Institute of
      Statistical Mathematics>, 31(1):145\U155, 1979.<newblock>

      <bibitem*|15><label|bib-generalizedHawkes>T.<nbsp>Ozaki<localize| and
      >H.<nbsp>Akaike.<newblock> On a generalized parameteric model for
      hawkes' self-exciting point processes.<newblock>
      <with|font-shape|italic|Institute of Statistical Mathematics Res.
      Memo>, 149, 1979.<newblock>

      <bibitem*|16><label|bib-hypergeometricRepresentation>Kelly<nbsp>Roach.<newblock>
      Hypergeometric function representations.<newblock> <localize|In
      ><with|font-shape|italic|International Symposium on Symbolic and
      Algebraic Computation>, <localize|pages >301\U308. 1996.<newblock>

      <bibitem*|17><label|bib-lambertwss>Donald E. Knuth<nbsp>Robert M.
      Corless, David J. Jeffrey.<newblock> A sequence of series for the
      lambert w function.<newblock> <localize|In
      ><with|font-shape|italic|International Symposium on Symbolic and
      Algebraic Computation>, <localize|pages >197\U204. 1997.<newblock>

      <bibitem*|18><label|bib-shek2010modeling>H.<nbsp>Shek.<newblock>
      Modeling high frequency market order dynamics using self-excited point
      process.<newblock> <with|font-shape|italic|Available at SSRN 1668160>,
      , 2010.<newblock>

      <bibitem*|19><label|bib-hawkes-finance>Ioane Muni<nbsp>Toke.<newblock>
      An introduction to hawkes processes with applications to
      finance.<newblock> <with|font-shape|italic|>,
      http://fiquant.mas.ecp.fr/ioane_files/HawkesCourseSlides.pdf.<newblock>

      <bibitem*|20><label|bib-wiseman1994quantum>HM<nbsp>Wiseman.<newblock>
      Quantum theory of continuous feedback.<newblock>
      <with|font-shape|italic|Physical Review A>, 49(3):2133, 1994.<newblock>
    </bib-list>
  </bibliography>

  <section|Appendix>

  <subsection|The Lambert W Function <with|mode|space|W(k,x)>><label|lambertW>

  The Lambert W function <cite|lambertw><cite|lambertwss> is the inverse of
  <space|x e<rsup|x>> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W(z)>|<cell|={x:x
    e<rsup|x>=z}>>|<row|<cell|>|<cell|=W(0,z)>>|<row|<cell|>|<cell|=1+(ln(z)-1)
    exp<left|(><frac|i|2 \<pi\>><big|int><rsub|0><rsup|\<infty\>><frac|1|x+1>
    ln<left|(><frac|x-i \<pi\>-ln(x)+ln(z)|x+i
    \<pi\>-ln(x)+ln(z)><right|)><space|-0.25spc>\<mathd\>x<right|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|\<infty\>><frac|(-k)<rsup|k-1>
    z<rsup|k>|k!>>>>>> <label|linv>
  </equation>

  where <space|W(a,z)\<forall\>a\<in\>\<bbb-Z\>,z\<nin\>{0,-e<rsup|-1>}> is\ 

  <\equation>
    <with|font-base-size|9|<tabular|<tformat|<table|<row|<cell|W(a,z)>|<cell|=1+(2
    i \<pi\> a+ln(<with|font-base-size|9|>z)-1) exp<left|(><frac|i|2
    \<pi\>><big|int><rsub|0><rsup|\<infty\>><frac|1|x+1>
    ln<left|(><frac|x+<left|(>2<space|0.25spc>a-1<right|)>i \<pi\> -ln
    <left|(>x<right|)>+ln <left|(>z<right|)>|x+<left|(>2<space|0.25spc>a+1<right|)>i
    \<pi\>-ln <left|(>x<right|)>+ln <left|(>z<right|)>><right|)><space|-0.25spc>\<mathd\>x<right|)>>>>>><label|lambertw>>
  </equation>

  A generaliztion of (<reference|linv>) is solved by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|{x:x
    b<rsup|x>=z}>|<cell|=<frac|W(ln(b) z)|ln(b)>>>>>>
  </equation>

  The W function satisifes several identities\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W(z)
    e<rsup|W(z)>>|<cell|=z>|<cell|>>|<row|<cell|W(z
    ln(z))>|<cell|=ln(z)>|<cell|\<forall\>z\<less\>1>>|<row|<cell|\|W(z)\|>|<cell|=W(\|z\|)>|<cell|>>|<row|<cell|e<rsup|n
    W(z)>>|<cell|=z<rsup|n> W(z)<rsup|-n>
    >|<cell|>>|<row|<cell|ln(W(n,z))>|<cell|=ln(z)-W(n,z)+2 i \<pi\>
    n>|<cell|>>|<row|<cell|W<left|(>-<frac|ln(z)|z><right|)>>|<cell|=-ln(z)>|<cell|\<forall\>z\<in\>[0,e]>>|<row|<cell|<frac|W(-ln(z))|-ln(z)>>|<cell|=z<rsup|z<rsup|z<rsup|z<rsup|.<rsup|.<rsup|.>>>>>>>|<cell|>>>>>
  </equation>

  where <space|n\<in\>\<bbb-Z\>>. Some special values are\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W<left|(>-1,-e<rsup|-1><right|)>>|<cell|=-1>|<cell|>>|<row|<cell|W(-e<rsup|-1>)>|<cell|=-1>|<cell|>>|<row|<cell|W(e)>|<cell|=1>|<cell|>>|<row|<cell|W(0)>|<cell|=0>|<cell|>>|<row|<cell|W(\<infty\>)>|<cell|=
    \<infty\>>|<cell|>>|<row|<cell|W(-\<infty\>)>|<cell|= \<infty\>+i
    \<pi\>>|<cell|>>|<row|<cell|W<left|(>-<frac|\<pi\>|2><right|)>>|<cell|=<frac|i
    \<pi\>|2>>|<cell|>>|<row|<cell|W<left|(>-ln(<sqrt|2>)<right|)>>|<cell|=-ln(2)>|<cell|>>|<row|<cell|W<left|(>-1,-ln(<sqrt|2>)<right|)>>|<cell|=-2
    ln(2)>|<cell|>>>>>
  </equation>

  We also have the limit

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|a\<rightarrow\>\<pm\>\<infty\>><frac|W(a,x)|a>>|<cell|=2
    \<pi\> i>>>>>
  </equation>

  and differential\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<frac|\<mathd\>|\<mathd\>
    z>W(a,f(z))>|<cell|>|<cell|=<frac|W(a,f(z)) <frac|\<mathd\>|\<mathd\>
    z>f(z)|f(z) (1+W(a,f(z)))>>>>>>
  </equation>

  as well as the obvious integral

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|1>W<left|(>-<frac|ln(x)|x><right|)>\<mathd\>x>|<cell|=<big|int><rsub|0><rsup|1>-ln(x)\<mathd\>x=1>>>>>
  </equation>

  Let us define, for the sake of brevity, the function

  <with|font-base-size|9|<\equation>
    <tabular|<tformat|<table|<row|<cell|W<rsub|ln>(z)>|<cell|=W<left|(>-1,-<frac|ln(z)|z><right|)>>>|<row|<cell|>|<cell|=1+<left|(>ln<left|(>-<frac|ln(z)|z><right|)>-1-2
    \<pi\> i<right|)> exp<left|(><frac|i|2 \<pi\>
    ><big|int><rsub|0><rsup|\<infty\>><frac|1|x+1> ln<left|(><frac|x-3 i
    \<pi\> -ln <left|(>x<right|)>+ln<left|(>-<frac|ln(z)|z><right|)>|x- i
    \<pi\> -ln <left|(>x<right|)>+ln<left|(>-<frac|ln(z)|z><right|)>><right|)><space|-0.25spc>\<mathd\>x<right|)>>>>>>
  </equation>>

  <big-figure|<image|lw1.eps|15cm|12cm||>|<space|W<left|(>-<frac|ln(x)|x><right|)>=-ln(x)>
  and <space|W<rsub|ln>(x)=W<left|(>-1,-<frac|ln(x)|x><right|)>>>

  Then we have the limits

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|x\<rightarrow\>-\<infty\>>W<rsub|ln>(x)>|<cell|=0>>|<row|<cell|lim<rsub|x\<rightarrow\>+\<infty\>>W<rsub|ln>(x)>|<cell|=-\<infty\>>>>>>
  </equation>

  and

  <\equation>
    Im<left|(>W<rsub|ln>(x)<right|)>=<choice|<tformat|<table|<row|<cell|-\<pi\>>|<cell|-\<infty\>\<less\>x\<less\>0>>|<row|<cell|\<ldots\>>|<cell|
    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 0\<leqslant\>x\<leqslant\>1>>|<row|<cell|0>|<cell|
    \ \ \ \ \ \ \ \ \ \ \ \ \ \ 1\<less\>x\<less\>\<infty\>>>>>>
  </equation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W<rsub|ln>(x)>|<cell|=-ln(x)>|<cell|\<forall\>x\<nin\>[0,e]>>>>>
  </equation>

  The root of <with|mode|space|Re<left|(>W<rsub|ln>(x)<right|)>> is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<left|{>x:Re<left|(>W<rsub|ln>(x))=0<right|}>>|<cell|={-x:<left|(>x<rsup|2><right|)><rsup|<with|font-base-size|12|<frac|1|x>>>=e<rsup|3
    \<pi\>>}>>|<row|<cell|>|<cell|=<frac|2 |3 > \<pi\> \ W<left|(><frac|3|2>
    \<pi\><right|)>>>|<row|<cell|>|<cell|\<cong\>0.27441063190284810044\<ldots\>>>>>><label|wlrr>
  </equation>

  where the imaginary part of the value at the root of the real part of
  <space|W<rsub|ln>(z)> is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W<rsub|ln><left|(><frac|2 |3 > \<pi\>
    \ W<left|(><frac|3|2> \<pi\><right|)><right|)>>|<cell|=W<left|(>-1,-<frac|ln<left|(><frac|2|3>
    \<pi\> W<left|(><frac|3|2> \<pi\><right|)><right|)>|<frac|2|3> \<pi\>
    W<left|(><frac|3|2>\<pi\><right|)>><right|)>>>|<row|<cell|>|<cell|=W<left|(>-1,<frac|3
    \<pi\>|2><right|)>>>|<row|<cell|>|<cell|=<frac|3 \<pi\>
    i|2>>>|<row|<cell|>|<cell|\<cong\>i 4.712388980384689857\<ldots\>>>>>>
  </equation>

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
    <associate|A|<tuple|24|5>>
    <associate|B|<tuple|28|?>>
    <associate|Bj|<tuple|20|5>>
    <associate|E|<tuple|5|2>>
    <associate|Etn1|<tuple|68|11>>
    <associate|HawkesIntensity|<tuple|14|4>>
    <associate|P1inverse|<tuple|41|8>>
    <associate|P1pred|<tuple|45|9>>
    <associate|S|<tuple|10|3>>
    <associate|acd|<tuple|17|4>>
    <associate|acdcomp|<tuple|20|5>>
    <associate|acdll|<tuple|23|5>>
    <associate|acdpsi|<tuple|21|5>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|1.3.1|8>>
    <associate|auto-11|<tuple|1.3.2|8>>
    <associate|auto-12|<tuple|1.3.3|9>>
    <associate|auto-13|<tuple|1|11>>
    <associate|auto-14|<tuple|1.4|12>>
    <associate|auto-15|<tuple|1.4.1|12>>
    <associate|auto-16|<tuple|1.4.2|13>>
    <associate|auto-17|<tuple|1.4.3|15>>
    <associate|auto-18|<tuple|1.4.4|18>>
    <associate|auto-19|<tuple|1.5|19>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-20|<tuple|2|20>>
    <associate|auto-21|<tuple|3|20>>
    <associate|auto-22|<tuple|4|21>>
    <associate|auto-23|<tuple|5|21>>
    <associate|auto-24|<tuple|6|22>>
    <associate|auto-25|<tuple|7|22>>
    <associate|auto-26|<tuple|1|23>>
    <associate|auto-27|<tuple|1.6|23>>
    <associate|auto-28|<tuple|1.6.1|24>>
    <associate|auto-29|<tuple|8|25>>
    <associate|auto-3|<tuple|1.1.1|3>>
    <associate|auto-30|<tuple|9|25>>
    <associate|auto-31|<tuple|10|26>>
    <associate|auto-32|<tuple|11|26>>
    <associate|auto-33|<tuple|1.7|27>>
    <associate|auto-34|<tuple|1.7.1|28>>
    <associate|auto-35|<tuple|1.7.2|29>>
    <associate|auto-36|<tuple|1.7.3|30>>
    <associate|auto-37|<tuple|2|31>>
    <associate|auto-38|<tuple|2.1|31>>
    <associate|auto-39|<tuple|2.1.1|31>>
    <associate|auto-4|<tuple|1.2|3>>
    <associate|auto-40|<tuple|3|31>>
    <associate|auto-41|<tuple|3.1|31>>
    <associate|auto-42|<tuple|3.1.1|31>>
    <associate|auto-43|<tuple|12|32>>
    <associate|auto-44|<tuple|3.1.2|32>>
    <associate|auto-45|<tuple|2|33>>
    <associate|auto-46|<tuple|3|33>>
    <associate|auto-47|<tuple|13|34>>
    <associate|auto-48|<tuple|14|35>>
    <associate|auto-49|<tuple|15|36>>
    <associate|auto-5|<tuple|1.2.1|3>>
    <associate|auto-50|<tuple|16|37>>
    <associate|auto-51|<tuple|17|37>>
    <associate|auto-52|<tuple|18|37>>
    <associate|auto-53|<tuple|3.1.3|37>>
    <associate|auto-54|<tuple|19|38>>
    <associate|auto-55|<tuple|3.1.4|38>>
    <associate|auto-56|<tuple|168|39>>
    <associate|auto-57|<tuple|4|40>>
    <associate|auto-58|<tuple|4.1|40>>
    <associate|auto-59|<tuple|20|41>>
    <associate|auto-6|<tuple|1.2.2|6>>
    <associate|auto-60|<tuple|4|43>>
    <associate|auto-61|<tuple|4.1|43>>
    <associate|auto-62|<tuple|21|44>>
    <associate|auto-7|<tuple|1.2.3|6>>
    <associate|auto-8|<tuple|1.2.4|7>>
    <associate|auto-9|<tuple|1.3|7>>
    <associate|bib-aci|<tuple|12|18>>
    <associate|bib-appa|<tuple|12|39>>
    <associate|bib-bauwens2009modelling|<tuple|1|18>>
    <associate|bib-bowsher2007modelling|<tuple|1|39>>
    <associate|bib-cai2007model|<tuple|2|39>>
    <associate|bib-chavez2012high|<tuple|3|39>>
    <associate|bib-dennis1987optimization|<tuple|5|39>>
    <associate|bib-embrechts2011multivariate|<tuple|6|39>>
    <associate|bib-engle1998autoregressive|<tuple|7|39>>
    <associate|bib-generalizedHawkes|<tuple|15|39>>
    <associate|bib-hautsch2011econometrics|<tuple|8|39>>
    <associate|bib-hawkes-finance|<tuple|19|40>>
    <associate|bib-hawkes1971spectra|<tuple|7|39>>
    <associate|bib-hypergeometricRepresentation|<tuple|16|39>>
    <associate|bib-karr|<tuple|9|39>>
    <associate|bib-kwok2008diagnostic|<tuple|7|18>>
    <associate|bib-lambertw|<tuple|4|39>>
    <associate|bib-lambertwss|<tuple|17|40>>
    <associate|bib-li1|<tuple|10|39>>
    <associate|bib-liniger2009multivariate|<tuple|11|39>>
    <associate|bib-ogata1978asymptotic|<tuple|14|39>>
    <associate|bib-ogata1981lewis|<tuple|13|39>>
    <associate|bib-ozaki1979maximum|<tuple|14|39>>
    <associate|bib-shek2010modeling|<tuple|18|40>>
    <associate|bib-vr-W|<tuple|22|43>>
    <associate|bib-wiseman1994quantum|<tuple|20|40>>
    <associate|compensator|<tuple|8|3>>
    <associate|exp|<tuple|15|4>>
    <associate|gr|<tuple|9|3>>
    <associate|hawkesll|<tuple|34|7>>
    <associate|hc|<tuple|23|5>>
    <associate|hes|<tuple|16|4>>
    <associate|hll|<tuple|121|24>>
    <associate|hm|<tuple|22|5>>
    <associate|hmm|<tuple|116|23>>
    <associate|hs|<tuple|21|5>>
    <associate|hwc|<tuple|89|15>>
    <associate|incompleteGamma|<tuple|104|17>>
    <associate|kappa|<tuple|27|6>>
    <associate|lambda0|<tuple|159|32>>
    <associate|lambertW|<tuple|4.1|40>>
    <associate|lambertW6|<tuple|48|9>>
    <associate|lambertw|<tuple|170|40>>
    <associate|lhm|<tuple|133|28>>
    <associate|linv|<tuple|169|40>>
    <associate|llmvh|<tuple|138|29>>
    <associate|mc|<tuple|148|30>>
    <associate|mhi|<tuple|125|27>>
    <associate|mhl|<tuple|135|29>>
    <associate|mhp1|<tuple|127|27>>
    <associate|mp|<tuple|143|30>>
    <associate|mspy|<tuple|3.1.3|37>>
    <associate|multivarPred|<tuple|1.7.3|30>>
    <associate|phi|<tuple|29|5>>
    <associate|prediction|<tuple|51|9>>
    <associate|table1|<tuple|1|23>>
    <associate|uc|<tuple|55|10>>
    <associate|univarPred|<tuple|1.3|7>>
    <associate|up|<tuple|35|7>>
    <associate|wacdll|<tuple|27|6>>
    <associate|wlrr|<tuple|181|42>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hautsch2011econometrics

      bowsher2007modelling

      karr

      hawkes-finance

      hawkes1971spectra

      shek2010modeling

      chavez2012high

      hautsch2011econometrics

      ozaki1979maximum

      ogata1981lewis

      wiseman1994quantum

      li1

      vr-W

      ogata1981lewis

      generalizedHawkes

      ogata1981lewis

      appa

      hypergeometricRepresentation

      cai2007model

      hawkes1971spectra

      embrechts2011multivariate

      liniger2009multivariate

      dennis1987optimization

      lambertw

      lambertwss
    </associate>
    <\associate|figure>
      <tuple|normal|Graph of the Newton iteration with <space|P=3> and
      <space|n=4> having parameters <space|<around*|{|\<kappa\>=0.2,\<varepsilon\>=0.9,\<alpha\>=<around*|(|0.12,0.34,0.6|)>,\<beta\>=<around*|(|1.34,1.75,0.9|)>,t=<around*|(|0.5,1.3,3.4,6.4,7|)>|}>>
      is shown below.|<pageref|auto-13>>

      <tuple|normal|Probability plot for Hawkes-Exp Order 2 fit vs
      Exponential(1) distribution|<pageref|auto-20>>

      <tuple|normal|Probability plot for Hawkes-Weibull Order 2 fit vs
      Exponential(1) distribution|<pageref|auto-21>>

      <tuple|normal|Probability plot for Hawkes-Hyperbolic Order 2 fit vs
      Exponential(1) distribution|<pageref|auto-22>>

      <tuple|normal|Quantiles of exponential Distribution vs Hawkes-Exp Order
      2 fit|<pageref|auto-23>>

      <tuple|normal|Quantiles of exponential Distribution vs Hawkes-Weibull
      Order 2 fit|<pageref|auto-24>>

      <tuple|normal|Quantiles of exponential Distribution vs
      Hawkes-Hyperbolic Order 2 fit|<pageref|auto-25>>

      <tuple|normal|QQ Plot of Hawkes-ACD-2-1-1 compensator vs Exponential(1)
      Distribution |<pageref|auto-29>>

      <tuple|normal|QQ Plot of Hawkes-Exp-2 compensator vs Exponential(1)
      Distribution |<pageref|auto-30>>

      <tuple|normal|Probability Plot of Hawkes-ACD-2-1-1 compensator vs
      Exponential(1) Distribution |<pageref|auto-31>>

      <tuple|normal|Probability Plot of Hawkes-Exp-2 compensator vs
      Exponential(1) Distribution |<pageref|auto-32>>

      <tuple|normal|<space|Interpolating spline \<phi\><around*|(|t|)>> for
      SPY on 2012-11-30|<pageref|auto-43>>

      <tuple|normal|Autocorrelations of <space|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>
      for <space|P=1\<ldots\>6> without diurnal
      adjustments|<pageref|auto-47>>

      <tuple|normal|Autocorrelations of <space|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>
      for <space|P=1\<ldots\>6> with diurnal adjustments|<pageref|auto-48>>

      <tuple|normal|Price history for SPY traded on INET on Oct 22nd,
      2012|<pageref|auto-49>>

      <\tuple|normal>
        <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> in blue and
        <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=1|}>>
        in green
      </tuple|<pageref|auto-50>>

      <tuple|normal|<space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>> in blue and
      <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=6|}>>
      in green|<pageref|auto-51>>

      <tuple|normal|Zoomed in view of <space|x<rsub|i>=t<rsub|i>-t<rsub|i-1>>
      in blue and <space|<around*|{|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>:P=6|}>>
      in green|<pageref|auto-52>>

      <tuple|normal||<pageref|auto-54>>

      <tuple|normal|<space|W<left|(>-<frac|ln(x)|x><right|)>=-ln(x)> and
      <space|W<rsub|ln>(x)=W<left|(>-1,-<frac|ln(x)|x><right|)>>|<pageref|auto-59>>
    </associate>
    <\associate|table>
      <tuple|normal||<pageref|auto-26>>

      <tuple|normal|Parameters and statistics for model fitted to data
      without diurnal adjustments|<pageref|auto-45>>

      <tuple|normal|Parameters and statistics for model fitted to data with
      diurnal adjustments|<pageref|auto-46>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Defintions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1.<space|2spc>Point Processes and
      Intensities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1.<space|2spc>Stochastic Integrals
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2.<space|2spc>The Hawkes Process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.1.<space|2spc>Linear Self-Exciting
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.2.2.<space|2spc>The Hawkes(1) Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.3.<space|2spc>Maximum Likelihood
      Estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.2.4.<space|2spc>The Hawkes Process in
      Quantum Theory <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.3.<space|2spc>Predicting When The Next
      Event Of A Process Will Occur <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.3.1.<space|2spc>Predicting White Noise
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|1.3.2.<space|2spc>The case of P=1 and the
      Lambert W Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|2tab>|1.3.3.<space|2spc>The Case of Any Order
      <space|P=n> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|1.4.<space|2spc>Alternative Kernels for the
      Hawkes Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|1.4.1.<space|2spc>A Generalized Exponential
      Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|1.4.2.<space|2spc>The Hawkes Process Having
      a Weibull Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|1.4.3.<space|2spc>The Hawkes Process Having
      a Gamma Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|2tab>|1.4.4.<space|2spc>A Hyperbolic Kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|1.5.<space|2spc>Assessing Goodness of Fit
      with Graphical Methods <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|1.6.<space|2spc>Combining the ACD and
      Hawkes Models <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|2tab>|1.6.1.<space|2spc>Comparison of Hawkes-Exp
      vs ACD+Hawkes-Exp Model Fits <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|1.7.<space|2spc>Multivariate Hawkes Models
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|2tab>|1.7.1.<space|2spc>The Compensator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|2tab>|1.7.2.<space|2spc>Log-Likelihood
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|2tab>|1.7.3.<space|2spc>Projection of the Next
      Occurance Time \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.<space|2spc>Numerical
      Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1.<space|2spc>The Nelder-Mead Algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|2tab>|2.1.1.<space|2spc>Starting Points for
      Optimizing the Hawkes Process of Order <space|P>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1.<space|2spc>Millisecond Resolution
      Trade Sequences <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|2tab>|3.1.1.<space|2spc>Adjusting for the
      Deterministic Daily Intensity Variation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|2tab>|3.1.2.<space|2spc>Univarate Hawkes model
      fit to SPY (SPDR S&P 500 ETF Trust)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      <with|par-left|<quote|2tab>|3.1.3.<space|2spc>Multivariate SPY Data for
      2012-08-14 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|2tab>|3.1.4.<space|2spc>Multivariate SPY Data for
      2012-11-19 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1.<space|2spc>The Lambert W Function
      <with|mode|<quote|space>|W(k,x)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>
    </associate>
  </collection>
</auxiliary>
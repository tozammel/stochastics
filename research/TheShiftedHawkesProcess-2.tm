<TeXmacs|1.99.2>

<style|<tuple|amsart|american>>

<\body>
  <em|>

  <\doc-data|<doc-title|Some Notes on The Hawkes
  Process.>|<doc-author|<\author-data|<author-name|\<less\>stephenc@nym.hush.com\<gtr\>>>
    \;
  </author-data>>>
    \;
  <|doc-data>
    \;
  <|doc-data>
    \;
  <|doc-data>
    \;
  </doc-data>

  The Hawkes process is studied as a model of point processes. Point
  processes are also called jump processes or 'pure jump' processes
  sometimes. Closed-form log-likelihood expressions are given for the
  (exponential) uni-variate and multivariate Hawkes process of finite order
  <math|P> such that there are <math|2 P> variables
  <math|<around*|{|\<alpha\><rsub|1>,\<ldots\>,\<alpha\><rsub|P>,\<beta\><rsub|1>.,\<ldots\>,\<beta\><rsub|p>|}>>
  specifying the kernel of the process. When <math|P=1> (at least) there is a
  closed-form expression predicting the expected time until next occurrence
  of a point of a Hawkes process, specified as an infinite integral over a
  Lambert W function of the history of the proc

  <section|Stuff:The Theory of Point Processes>

  <subsection|Terminology and Whatnot>

  Consider a (simple) <math|K>-dimensional <em|multivariate point process>\ 

  <\equation>
    F<rsub|t>=<big|cup><rsub|k=1><rsup|K>F<rsup|k><rsub|t>
  </equation>

  where <math|t<rsub|0><rsup|k>\<less\>t<rsub|1><rsup|k>\<less\>t<rsub|2><rsup|k>\<less\>
  \<ldots\>\<less\>t<rsub|i><rsup|k>\<less\> \<ldots\>> and

  <\equation>
    F<rsup|k><rsub|n>=<big|cup><rsub|n=1><rsup|N<rsup|k><rsub|t>>t<rsup|k><rsub|n>
  </equation>

  and where <math|N<rsup|k><rsub|t>> denotes the <em|counting process>
  associated with the <math|k>-th point process which is simply the number of
  events of P which have occurred by time <math|t>. At time <math|t>, the
  most recent arrival time will be denoted
  <math|t<rsub|N<rsup|k><rsub|t>><rsup|k>>. A process is said to be
  <em|simple> if no points occur at the same time, that is, there are no
  zero-length durations. The right-continuous(cadlag) counting
  process<cite-detail|hautsch2011econometrics|4.1.1.2> can be represented as
  a sum of Heaviside step functions <math|\<theta\><around*|(|t|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|t\<less\>0>>|<row|<cell|1>|<cell|t\<geqslant\>0>>>>>>

  <\equation>
    N<rsup|k><rsub|t>=<big|sum><rsub|t<rsub|i><rsup|k>\<leqslant\>t><rsup|>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>
  </equation>

  The counting function(process) jumps at the occurrence of each point and
  its value is the number of points occurring up to the point in time of the
  jump, inclusively. The left-continuous counting function does not include
  the time of the most recent jump, it counts the number of events occurring
  <em|before> t and is denoted by

  <\equation>
    <wide|N|\<breve\>><rsup|k><rsub|t>=<big|sum><rsub|t<rsub|i><rsup|k>\<less\>t>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>
  </equation>

  when <math|N> is a simple counting process, that is, there are no events
  occuring at the same time.\ 

  <subsection|The (Conditional) Intensity Function
  <math|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsup|><rsub|t>|)>>>

  The <em|conditional intensity function> gives the conditional probability
  per unit time that an event of type <math|k> occurs in the next instant
  given the filtration <math|F<rsub|t>=<big|cup><rsub|k=1><rsup|K><around*|{|t<rsup|k><rsub|i>|}>>
  which is the set of all event times, regardless of type/dimension, in the
  process preceeding the current time <math|t>

  <\equation>
    \<lambda\><rsup|k><around*|(|t<mid|\|>F<rsup|><rsub|t>|)>=lim<rsub|\<Delta\>t\<rightarrow\>0><frac|Pr<around*|(|N<rsup|k><rsub|t+\<Delta\>t>-N<rsup|k><rsub|t>\<gtr\>0<mid|\|>F<rsub|t>|)>|\<Delta\>t>
  </equation>

  For small values of <math|\<Delta\>t> we have

  <\equation>
    \<lambda\><rsup|k><around*|(|t<mid|\|>F<rsup|><rsub|t>|)>\<Delta\>t=E<around*|(|N<rsub|t+\<Delta\>t><rsup|k>-N<rsup|k><rsub|t><mid|\|>F<rsub|t>|)>+o<around*|(|\<Delta\>t|)>
  </equation>

  such that the expectation\ 

  <\equation>
    E<around*|(|<around*|(|N<rsup|k><rsub|t+\<Delta\>t>-N<rsup|k><rsub|t>|)>-\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<Delta\>t|)>=o<around*|(|\<Delta\>t|)>
    <label|E>
  </equation>

  becomes uncorrelated with respect to the past of <math|F<rsub|t>> as
  <math|\<Delta\>t\<rightarrow\>0>. That is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|E<around*|(|lim<rsub|\<Delta\>t\<rightarrow\>0><around*|[|<big|sum><rsub|j=1><rsup|<frac|<around*|(|u-s<rsub|>|)>|\<Delta\>t>><around*|(|N<rsup|k><rsub|u+j\<Delta\>t>-N<rsub|s+<around*|(|j-1|)>\<Delta\>t><rsup|k>|)>-\<lambda\><rsup|k><around*|(|s+j\<Delta\>t<mid|\|>F<rsub|t>|)>\<Delta\>t|]>|)>>>|<row|<cell|=E<around*|(|<around*|(|N<rsub|u><rsup|k>-N<rsup|k><rsub|s<rsub|>>|)>-lim<rsub|\<Delta\>t\<rightarrow\>0><around*|[|<big|sum><rsub|j=1><rsup|<frac|*<around*|(|u-s|)>|\<Delta\>t>>\<lambda\><rsup|k><around*|(|j\<Delta\>t<mid|\|>F<rsub|t>|)>\<Delta\>t|]>|)>>>|<row|<cell|=E<around*|(|<around*|(|N<rsup|k><rsub|u>-N<rsup|k><rsub|s<rsub|>>|)>-<big|int><rsub|s<rsub|>><rsup|u>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t|)>>>|<row|<cell|=E<around*|(|<around*|(|N<rsup|k><rsub|u>-N<rsup|k><rsub|s<rsub|>>|)>-<around*|(|N<rsup|k><rsub|u>-N<rsup|k><rsub|s<rsub|>>|)>|)>>>|<row|<cell|=0>>>>>
  </equation>

  since

  <\equation>
    E<around*|(|<big|int><rsub|s><rsup|u>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t|)>=N<rsup|k><rsub|u>-N<rsup|k><rsub|s>
  </equation>

  <subsection|The Compensator(aka Dual Predictble Projection) of a Point
  Process>

  The integrated intensity function is known as the <em|compensator>, or more
  precisely, the <em|<math|F<rsub|t>>-compensator> and will be denoted by

  <\equation>
    \<Lambda\><rsup|k><around*|(|s<rsub|0>,s<rsub|1>|)>=<big|int><rsub|s<rsub|0>><rsup|s<rsub|1>>\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>\<mathd\>t<label|compensator>
  </equation>

  \;

  Let <math|x<rsub|k>=t<rsub|i><rsup|k>-t<rsub|i-1><rsup|k>> denote the time
  interval, or duration, between the <math|i>-th and
  <math|<around*|(|i-1|)>>-th arrival times. The
  <math|F<rsub|t>>-<em|conditional survivor function> for the <math|k>-th
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

  and <math|<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>> is an i.i.d.
  exponential random variable with unit mean and variance. Since
  <math|E<around*|(|<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>|)>=1> the
  random variable\ 

  <\equation>
    \<cal-E\><rsub|N<around*|(|t|)>><rsup|k>=1-<wide|\<cal-E\>|~><rsub|N<around*|(|t|)>>
  </equation>

  has zero mean and \ unit variance. Positive values of
  <math|\<cal-E\><rsub|N<around*|(|t|)>>> indicate that the path of
  conditional intensity function <math|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>>
  under-predicted the number of events in the time interval and negative
  values of <math|\<cal-E\><rsub|N<around*|(|t|)>>> indicate that
  <math|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsub|t>|)>> over-predicted
  the number of events in the interval. \ In this way, (<reference|gr>) can
  be interpreted as a generalized residual. The <em|backwards recurrence
  time> given by

  <\equation>
    U<rsub|t><rsup|k>=t-t<rsub|N<rsub|t><rsup|k>>
  </equation>

  increases linearly with jumps back to 0 at each new point.\ 

  <subsubsection|Stochastic Integrals>

  The <em|stochastic Stieltjes integral><cite-detail|bowsher2007modelling|2.1><cite-detail|karr|2.2>
  of a measurable process, having either locally bounded or non-negative
  sample paths, <math|X<around*|(|t|)>> with respect to <math|N<rsup|k>>
  exists and for each <math|t> we have

  <\equation>
    <big|int><rsub|<around*|(|0,t|]>>X<around*|(|s|)>\<mathd\>N<rsup|k><rsub|s>=<big|sum><rsub|i\<geqslant\>1>\<theta\><around*|(|t-t<rsub|i><rsup|k>|)>X<around*|(|t<rsub|i><rsup|k>|)>
  </equation>

  <subsection|Palm Distributions>

  \ <cite-detail|karr|1.7>

  <subsection|Random Integral Equations>

  <cite|RandomIntegralEquations>

  <section|Hawkes Processes>

  <subsection|The (Standard) Exponential Hawkes Process of Arbitrary Order>

  A uni-variate linear self-exciting counting process <math|N<rsub|t>> is one
  that can be expressed as\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|-\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>><label|HawkesIntensity>
  </equation>

  where <math|\<lambda\><rsub|0><around*|(|t|)>> is a deterministic base
  intensity, see (<reference|lambda0>). <cite|hawkes-finance><cite|hawkes1971spectra><cite|shek2010modeling><cite|chavez2012high><cite-detail|hautsch2011econometrics|11.3>
  Here, \ <math|\<nu\>:\<bbb-R\><rsub|+>\<rightarrow\>\<bbb-R\><rsub|+>> is a
  kernel function which expresses the positive influence of past events
  <math|t<rsub|i>> on the current value of the intensity process, and
  <math|\<kappa\>> is a scaling factor for the baseline intensity
  <math|\<lambda\><rsub|0><around*|(|t|)>>. For comparison with the
  multivariate case see Equation (<reference|mhi>). The astute observer might
  notice that Equation (<reference|HawkesIntensity>) is strikingly similar to
  a nonlinear Volterra integral of the second kind. <cite|nvs>

  <\equation>
    \<lambda\><around*|(|t|)>=<big|int><rsub|0><rsup|t>f<around*|(|t-s|)>g<around*|(|u<around*|(|s|)>|)>\<mathd\>s
  </equation>

  The shifted Hawkes process of order <math|P> is a defined by the
  exponential kernel

  <\equation>
    \<nu\><around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<theta\><around*|(|t-\<tau\><rsub|j>|)>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> <around*|(|t-\<tau\><rsub|j>|)>><label|exp>
  </equation>

  The intensity of the exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<theta\><around*|(|<around*|(|t-s|)>-\<tau\><rsub|j>|)>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|<around*|(|t-s|)>-\<tau\>|)>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>\<theta\><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\><rsub|j>|)>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>\<theta\><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\><rsub|j>|)>
    e<rsup|-\<beta\><rsub|j><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  where <math|B<rsub|j><around*|(|i|)>> is given recursively by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i-1>\<theta\><around*|(|<around*|(|t<rsub|i>-t<rsub|k>|)>-\<tau\>|)>
    e<rsup|-\<beta\><rsub|j><around*|(|<around*|(|t<rsub|i>-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|><big|sum><rsub|k=1><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)>><rsub|>*<around*|(|1+<big|sum><rsub|k=1><rsup|i-2>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1><rsub|>|)>><around*|(|1+B<rsub|j><around*|(|i-1|)>|)>>>>>><label|Bj>
    FIXME
  </equation>

  since <math| e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|i-1>|)>>=e<rsup|-\<beta\><rsub|j>0>=e<rsup|-0>=1>.
  A uni-variate Hawkes process is stationary if the branching ratio is less
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
    \<theta\>e<rsup|-\<beta\><rsub|j><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<lambda\><rsub|0><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|1-e<rsup|-\<beta\><rsub|j>\<Delta\>t<rsub|i>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|hc>
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
  equation. This fact probably can be proven rigorously by means of the
  modular group and corresponding functional equations.

  <subsection|Prediction of the Next Occurrence Time><label|univarPred>

  The next occurrence time of a point process, given the most recent time of
  occurrence of a point of a process, can be predicted by solving for the
  unknown time <math|t<rsub|n+1>> when <math|<around*|{|t<rsub|n>|}>> is a
  sequence of event times. Likewise, the most recently occurrence

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|\<Lambda\><rsub|prev><around*|(|t<rsub|n>,\<delta\>|)>=<around*|{|t<rsub|n-1>:\<Lambda\><around*|(|t<rsub|n-1>,t<rsub|n>|)>=\<delta\>|}>>>|<row|<cell|\<Lambda\><rsub|next><around*|(|t<rsub|n>,\<delta\>|)>=<around*|{|t<rsub|n+1>:\<Lambda\><around*|(|t<rsub|n>,t<rsub|n+1>|)>=\<delta\>|}>>>>>><label|up>
  </equation>

  where

  <\equation>
    \<Lambda\><around*|(|t<rsub|n>,t<rsub|n+1>|)>=<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>>\<lambda\><around*|(|s;\<frak-F\><rsub|s>|)>\<mathd\>s
  </equation>

  where <math|><math|\<frak-F\><rsub|s>> is the <math|\<sigma\>>-algebra
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
  times is the <em|constellation> of the process, which changes with the
  arrival of each event(the increasing <math|\<sigma\>>-algebra filtration),
  and has somewhat of a multiverse interpretation if thought about from a
  physical context.

  <subsubsection|The case when P=1 and the Lambert W Function>

  The Hawkes process of order <math|P=1> is a defined by the exponential
  kernel

  <\equation>
    \<nu\><around*|(|t|)>=<rsup|>\<alpha\><rsub|> e<rsup|-\<beta\><rsub|>
    t><label|exp>
  </equation>

  The intensity of the exponential Hawkes process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t>\<theta\><around*|(|<around*|(|t-s|)>-\<tau\>|)>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|<around*|(|t-s|)>-\<tau\>|)>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsub|k=1><rsup|<wide|N|\<breve\>><rsup|><rsub|t>>\<theta\><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+<big|sum><rsup|<wide|N|\<breve\>><rsup|><rsub|t>><rsub|k=1>\<theta\><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>\<alpha\><rsub|>
    e<rsup|-\<beta\><rsub|><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+\<alpha\><rsub|><big|sum><rsub|k=1><rsup|<wide|N|\<breve\>><rsup|><rsub|t>>
    \<theta\><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>e<rsup|-\<beta\><rsub|><around*|(|<around*|(|t-t<rsub|k>|)>-\<tau\>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><around*|(|t|)>\<kappa\>+\<alpha\><rsub|
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
  equation. This fact probably can be proven rigorously by means of the
  modular group and corresponding functional equations.

  \;

  The simplest case occurs when the baseline intensity
  <math|\<lambda\><rsub|0><around*|(|t|)>=1> is constant unity and <math|P=1>
  where we have

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

  then the expected time of the next point can be obtained by integrating out
  the (unit exponentiallly distributed) <math|\<varepsilon\>> in some manner

  <\equation>
    <with|font-base-size|14|\<Lambda\><rsub|><rsup|-1><around*|(|\<varepsilon\>;\<alpha\><rsub|>,\<beta\><rsub|>,F<rsub|t>|)>=<tabular|<tformat|<table|<row|<cell|<frac|<tabular|<tformat|<table|<row|<cell|a<rsub|n>
    t<rsub|n> >>>>>|A<rsub|1><around*|(|n|)>>\<cdot\>e<rsup|-\<beta\><rsub|>t<rsub|n>>+>>|<row|<cell|<frac|a<rsub|n>|\<beta\><rsub|>
    A<rsub|1><around*|(|n|)>>\<cdot\>e<rsup|-\<beta\><rsub|>t<rsub|n>>
    W<around*|(|<frac|\<alpha\><rsub|> |\<kappa\>>A<rsub|1><around*|(|n|)>\<cdot\>e<rsup|<frac|\<alpha\><rsub|>b<rsub|n>-\<beta\><rsub|>\<varepsilon\>|\<kappa\>>>|)>+>>|<row|<cell|<frac|e<rsup|-\<beta\><rsub|>t<rsub|n>>|\<kappa\>
    A<rsub|1><around*|(|n|)>><around*|(|a<rsub|n>
    \<varepsilon\>-<frac|\<alpha\><rsub|>|\<beta\><rsub|>>
    c<rsub|n>|)>>>>>><label|P1pred>>
  </equation>

  where <math|\<kappa\>> is the baseline constant in
  <math|\<lambda\><around*|(|t|)>=\<kappa\>+<big|sum><rsub|t<rsub|i>\<less\>t>\<alpha\>
  e<rsup|-\<beta\> <around*|(|t-t<rsub|i>|)>>> from Formula
  (<reference|Hawkes1>) and <math|F<rsub|t>=<around*|{|t<rsub|0>,\<ldots\>,t<rsub|N<rsub|t>>|}>>
  is the filtration of event times that have occured up until the present
  time <math|t>. The recursive equations with initial conditions
  <math|<wide|b|^><around*|(|0|)>=1> and <math|<wide|d|^><around*|(|0|)>=e<rsup|\<beta\><rsub|>t<rsub|0>>>
  are

  <\equation>
    <wide|a|^><around*|(|n|)>=<wide|a|^><around*|(|n-1|)>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+1
  </equation>

  <\equation>
    <wide|b|^><around*|(|n|)>=<wide|b|^><around*|(|n-1|)>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+1
  </equation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|c|^><around*|(|n|)>>|<cell|=<wide|c|^><around*|(|n-1|)>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+e<rsup|\<beta\><rsub|>t<rsub|n>>+2<big|sum><rsub|k=1><rsup|n-1>e<rsup|\<beta\><rsub|>t<rsub|k>>>>|<row|<cell|>|<cell|=<wide|c|^><around*|(|n-1|)>e<rsup|-\<beta\><rsub|>\<Delta\>t<rsub|n>>+e<rsup|\<beta\><rsub|>t<rsub|n>>+2
    <wide|a|^><around*|(|n-1|)>>>>>>
  </equation>

  It would be nice to have expressions like this involving the Lambert W
  function for <math|P\<gtr\>1> but neither Maple nor Mathematica were able
  to find any solutions in terms of ``known'' functions for <math|P\<gtr\>1>.
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

  Fatou's lemma can probably be invoked so that the order of the limit and
  the integral in Equation (<reference|Etn1>) can be exchanged, with perhaps
  the introduction of another function, which of course would greatly reduce
  the computational complexity of the equation. The sequence of functions is
  known as a Newton sequence <cite-detail|RandomIntegralEquations|3.3p118>
  There is also the limit

  <\equation>
    <tabular|<tformat|<table|<row|<cell|lim<rsub|x\<rightarrow\>\<infty\>><frac|\<varphi\><rsub|P><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>|\<varphi\><rsub|P><rprime|'><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>>>|<cell|=lim<rsub|x\<rightarrow\>\<infty\>><frac|\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,0|)>|\<upsilon\><around*|(|\<kappa\>\<eta\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>|)>+\<tau\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,\<varepsilon\>|)>|)>+\<rho\><around*|(|x<rsub|i><around*|(|\<varepsilon\>|)>,1|)>>>>|<row|<cell|>|<cell|=<frac|1|\<mu\>>>>>>>
  </equation>

  <subsection|Predictaction of the Expected Number of Events Any Given Time
  From Now>

  Instead of seeking the expected point in time of the next point of a
  process, \ the expected number of events given any time from now whatsoever
  can be calculated by integrating out <math|\<varepsilon\>> since the
  process which is adapted to the compensator will be closer to being a unit
  rate Poisson process the closer the parameters are to being correct and the
  model actually being a good model of the phemenona it is being applied to.
  Let <math|F<rsub|t>> be all points up until now, let\ 

  <\equation*>
    E<around*|(|t<rsub|n+1>|)>=<big|int><rsub|0><rsup|\<infty\>>\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;\<alpha\>,\<beta\>,F<rsub|T>|)>e<rsup|-\<varepsilon\>>\<mathd\>\<varepsilon\>
  </equation*>

  then iterate the process, by proceeding as if the next point of the process
  will occur at the predicted time, simply append the expectation to the
  current state vector, and project the next point, repeating the process as
  fast ast the computer will go until some sufficient stopping criteria is
  met (probably time relative to some chosen local timescale). A counting
  function that counts the points of this projected event time sequence would
  be readily available as a result.

  <big-figure|TODO|Plot <math|\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;\<alpha\>,\<beta\>,F<rsub|T>|)>>
  for some data and parameters as a function of <math|\<varepsilon\>>>

  <section|Multivariate Hawkes Models>

  Let <math|M\<in\>\<bbb-N\><rsup|\<ast\>>> and
  <math|<around*|{|<around*|(|t<rsub|i><rsup|m>|)>|}><rsub|m=1,\<ldots\>,M>>
  be an <math|M>-dimensional point process. The associated counting process
  will be denoted <math|N<rsub|t>=<around*|(|N<rsub|t><rsup|1>,\<ldots\>,N<rsub|t><rsup|M>|)>>.
  A multivariate Hawkes process<cite|hawkes1971spectra><cite|embrechts2011multivariate><cite|liniger2009multivariate>,
  compared with the uni-variate case in Equation
  (<reference|HawkesIntensity>), is defined with intensities
  <math|\<lambda\><rsup|m><around*|(|t|)>,m=1\<ldots\>M> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><rsup|m><around*|(|t|)>>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-s|)>>\<mathd\>N<rsub|s><rsup|n>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsup|><rsub|t<rsub|k><rsup|n>\<less\>t>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>><rsub|>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>><rsub|>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n><big|sum><rsub|k=0><rsup|N<rsub|t><rsup|n>-1>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|0><rsup|m><around*|(|t|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    B<rsub|j><rsup|m,n><around*|(|N<rsub|t><rsup|n>|)>>>>>><label|mhi>
  </equation>

  where in this parametrization <math|\<kappa\>> is a vector which scales the
  baseline intensities, in this case, specified by piece-wise polynomial
  splines (<reference|lambda0>). We can write
  <math|B<rsub|j><rsup|m,n><around*|(|i|)>> recursively\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<tabular|<tformat|<table|<row|<cell|<big|sum><rsup|i-1><rsub|k=0>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t-t<rsub|k><rsup|n>|)>>>>|<row|<cell|=<around*|(|1+B<rsup|m,n><rsub|j><around*|(|i-1|)>|)>e<rsup|-\<beta\><rsup|m,n><rsub|j><around*|(|t-t<rsup|n><rsub|i><rsub|>|)>>>>>>>>>>>>
  </equation>

  In the simplest version with <math|P=1> and
  <math|\<lambda\><rsub|0><rsup|m><around*|(|t|)>=1> constant we have

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

  Assuming stationarity gives <math|E<around*|[|\<lambda\><around*|(|t|)>|]>=\<mu\>>
  a constant vector and thus\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>>|<cell|=<frac|\<kappa\>|I-<big|int><rsub|0><rsup|\<infty\>>G<around*|(|u|)>\<mathd\>u>>>|<row|<cell|>|<cell|=<frac|\<kappa\>|I-<around|(|<frac|\<alpha\><rsup|m,n>|\<beta\><rsup|m,n>>|)>>>>|<row|<cell|>|<cell|=<frac|\<kappa\>|I-\<Gamma\>>>>>>>
  </equation>

  A sufficient condition for a multivariate Hawkes process to be stationary
  is that the spectral radius of the branching matrix\ 

  <\equation>
    \<Gamma\>=<big|int><rsub|0><rsup|\<infty\>>G<around*|(|s|)>\<mathd\>s=<frac|\<alpha\><rsup|m,n>|\<beta\><rsup|m,n>>
  </equation>

  be strictly less than 1. The spectral radius of the matrix <math|G> is
  defined as

  <\equation>
    \<rho\>*<around*|(|G|)>=max<rsub|a\<in\>\<cal-S\><around*|(|G|)>><around*|\||a|\|>
  </equation>

  where <math|\<cal-S\><around*|(|G|)>> denotes the set of eigenvalues of
  <math|G>.\ 

  <subsection|The Compensator, aka, the Dual-Predictable Projection>

  The compensator of the <math|m>-th coordinate of a multivariate Hawkes
  process between two consecutive events <math|t<rsub|i-1><rsup|m>> and
  <math|t<rsub|i><rsup|m>> of type <math|m>, compared with the uni-variate
  case in Equation (<reference|hc>), is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsup|n><rsub|k>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsup|n><rsub|t<rsup|m><rsub|i>>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,
    n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsup|n><rsub|k>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i-1><rsup|m>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsup|><rsub|n,t<rsub|m,i-1><rsup|>>-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsup|<wide|N|\<breve\>><rsup|n><rsub|t<rsub|i><rsup|m>>-1><rsub|k=<wide|N|\<breve\>><rsup|n><rsub|t<rsub|i-1><rsup|m>>><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around|[|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|]>>>>>><label|lhm>
  </equation>

  Due to the self-similiarity of the process, there is a recursion relation
  that can be written

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>>>>
  </equation>

  so that (<reference|lhm>) can be transformed into

  <\equation>
    <with|font-base-size|8|<tabular|<tformat|<table|<row|<cell|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>|<cell|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsub|t<rsub|k><rsup|n>\<less\>s>\<alpha\><rsub|j><rsup|m,n>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|s-t<rsub|k><rsup|n>|)>>\<mathd\>s>>|<row|<cell|>|<cell|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s>>|<row|<cell|>|<cell|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>|]>>>|<row|<cell|>|<cell|<with|font-base-size|7|=\<kappa\><rsup|m><big|int><rsub|t<rsub|i-1><rsup|m>><rsup|t<rsub|i><rsup|m>>\<lambda\><rsub|0><rsup|m><around*|(|s|)>\<mathd\>s>>>|<row|<cell|>|<cell|<with|font-base-size|6|+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\><around*|(|<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|i-1><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i-1><rsup|m>-t<rsub|k><rsup|n>|)>>|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>|)>|]>>>>>>><label|mhl>>
  </equation>

  where we have the initial conditions <math|A<rsub|j><rsup|m,n><around*|(|0|)>=0>.

  <subsubsection|The Exact Log-Likelihood>

  A general multivariate point process's logarithmic likelihood can be
  expressed as<cite|memip>

  <\equation*>
    <tabular*|<tformat|<twith|table-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|\<cal-L\><around*|(|\<Theta\>|)>>|<cell|=<big|sum><rsub|c=1><rsup|d><around*|(|<big|sum><rsub|i=1><rsup|n<rsub|c>>ln<around*|(|\<lambda\><rsub|u<rsub|i><rsup|c>><around*|(|t<rsub|i><rsup|c>|)>|)>-<big|sum><rsub|u=1><rsup|U><big|int><rsub|0><rsup|T<rsub|c>>\<lambda\><rsub|u><around*|(|t|)>\<mathd\>t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|c=1><rsup|d><around*|(|<big|sum><rsub|i=1><rsup|n<rsub|c>>ln<around|[|\<mu\><rsub|u<rsub|i><rsup|c>><around*|(|t<rsub|i><rsup|c>|)>+<big|sum><rsub|t<rsub|j><rsup|c>\<less\>t><rsup|U><around|\<nobracket\>|g<rsub|u<rsub|i><rsup|c>
    u<rsub|j><rsup|c>><around*|(|t<rsub|i><rsup|c>-t<rsub|j><rsup|c>|\<nobracket\>>|)>|]>-T<rsub|c><big|sum><rsub|u=1><rsup|U>\<mu\><rsub|u>-<big|sum><rsub|u=1><rsup|U><big|sum><rsub|j=1><rsup|n<rsub|c>><big|int><rsub|0><rsup|T<rsub|c>-t<rsub|j>>g<rsub|u,u<rsub|j><rsup|c>><around*|(|s|)>\<mathd\>s|)>>>>>>
  </equation*>

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

  where again <math|t<rsub|N<rsub|T><rsup|>>=T> and

  <\equation>
    z<rsub|i><rsup|m>=<choice|<tformat|<table|<row|<cell|1>|<cell|event
    t<rsub|i> of type m>>|<row|<cell|0>|<cell|otherwise>>>>>
  </equation>

  and

  <\equation>
    \<Lambda\><rsup|m><around*|(|0,T|)>=<big|int><rsub|0><rsup|T>\<lambda\><rsub|><rsup|m><around*|(|t|)>\<mathd\>t=<big|sum><rsub|i=1><rsup|N<rsub|T><rsup|m>>\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>
  </equation>

  where <math|\<Lambda\><rsup|m><around*|(|t<rsub|i-1><rsup|m>,t<rsub|i><rsup|m>|)>>
  is given by (<reference|mhl>). Similar to to the one-dimensional case, we
  have the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|j><rsup|m,n><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k><rsup|n>\<less\>t<rsub|j><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>>|<row|<cell|>|<cell|=<choice|<tformat|<table|<row|<cell|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>R<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|t<rsub|i-1><rsup|m>\<leqslant\>t<rsub|k><rsup|n>\<less\>t<rsub|i><rsup|m>>e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|k><rsup|n>|)>>>|<cell|if
    m\<neq\>n>>|<row|<cell|e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>*<around*|(|1+R<rsub|j><rsup|m,n><around*|(|i-1|)>|)>>|<cell|if
    m=n>>>>>>>>>>
  </equation>

  so that (<reference|llmvh>) can be rewritten as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|=T-\<kappa\><rsub|m><big|int><rsub|0><rsup|T>\<lambda\><rsub|m,0><rsup|><around*|(|t|)>\<mathd\>t-\<ldots\>>>|<row|<cell|>|<cell|\<ldots\><with|font-base-size|6|-<big|sum><rsub|i=1><rsup|N<rsup|m><rsub|T>><big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|i><rsup|m>-t<rsub|i-1><rsup|m>|)>>|)>\<times\>A<rsub|j><rsup|m,n><around*|(|i-1|)>+<big|sum><rsub|<with|font-base-size|8|>t<rsub|m,i-1><rsup|>\<leqslant\>t<rsub|n,k><rsup|>\<less\><rsub|>t<rsub|m,i><rsup|>><around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|t<rsub|m,i>-t<rsub|n,k><rsup|>|)>>|)>|]>+\<ldots\>>>>|<row|<cell|>|<cell|\<ldots\>+<big|sum><rsub|<rsup|i=1>><rsup|N<rsub|m,T>>ln<around*|(|\<lambda\><rsub|m,0><around*|(|t<rsub|m,i><rsup|>|)>\<kappa\><rsub|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    R<rsub|j><rsup|m,n><around*|(|i|)>|)>>>>>><label|llmvh2>
  </equation>

  with initial conditions <math|R<rsub|j><rsup|m,n><around*|(|0|)>=0> and
  <math|A<rsub|j><rsup|m,n><around*|(|0|)>=0> where <math|T=t<rsub|N>> where
  <math|N> is the number of observations, <math|M> is the number of
  dimensions, and <math|P> is the order of the model. Again, <math|T> can be
  dropped from the equation for the purposes of optimization. Actually,
  Krzysztof Herman pointed out, via personal correspondence, that
  <math|Formula>(<reference|llmvh2>) can be simplified to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|=T-\<kappa\><rsub|m><big|int><rsub|0><rsup|T>\<lambda\><rsub|m,0><around*|(|t|)>\<mathd\>t-<big|sum><rsub|n=1><rsup|M><big|sum><rsub|i=1><rsup|N<rsup|><rsub|T>><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|T-t<rsub|i>|)>>|)>|]>+>>|<row|<cell|>|<cell|\<ldots\>+<big|sum><rsub|<rsup|i=1>><rsup|N<rsup|m><rsub|T>>ln<around*|(|\<lambda\><rsub|m,0><around*|(|t<rsub|i><rsup|m>|)>\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    R<rsub|j><rsup|m,n><around*|(|i|)>|)>>>>>><label|llmvh3>
  </equation>

  \ since the integrated intensity function has the feature that

  <\equation>
    \<Lambda\><around*|(|0,t<rsub|N>|)>=<big|sum><rsub|i=1><rsup|N>\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>
  </equation>

  In the case of constant baseline intensity
  <math|\<lambda\><rsub|m,0><around*|(|t|)>=1> , Formula (<reference|llmvh3>)
  simplifies to

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<with|mode|text|>ln
    \<cal-L\><rsup|m><around*|(|<around*|{|t<rsub|i>|}>|)>>|<cell|=T-\<kappa\><rsub|m>T-<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P><big|sum><rsub|i=1><rsup|N<rsub|m,T>><frac|\<alpha\><rsub|j><rsup|m,n>|\<beta\><rsub|j><rsup|m,n>><around*|[|<around|(|1-e<rsup|-\<beta\><rsub|j><rsup|m,n><around*|(|T-t<rsub|i>|)>>|)>|]>+>>|<row|<cell|>|<cell|\<ldots\>+<big|sum><rsub|<rsup|i=1>><rsup|N<rsub|m,T><rsup|>>ln<around*|(|\<kappa\><rsup|m>+<big|sum><rsub|n=1><rsup|M><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><rsup|m,n>
    R<rsub|j><rsup|m,n><around*|(|i|)>|)>>>>>>
  </equation>

  <subsubsection|MEMIP>

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

  <section|TODO>

  <subsection|Links To Monstrous Moonshine (aka The Friendly Giant)>

  <subsubsection|Jacobian Variety>

  TODO: Jacobian Variety <cite-detail|MonsterMoonshine|2.1.4p123>

  <subsection|Motivic Cohomology>

  <subsubsection|Numerical Motives>

  TODO: <cite|NumericalMotives92> Motives, numerical equivalence, and
  semi-simplicity.

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|18>
      <bibitem*|1><label|bib-bowsher2007modelling>C.G.<nbsp>Bowsher.<newblock>
      Modelling security market events in continuous time: intensity based,
      multivariate point process models.<newblock>
      <with|font-shape|italic|Journal of Econometrics>, 141(2):876--912,
      2007.<newblock>

      <bibitem*|2><label|bib-RandomIntegralEquations>A.T.<nbsp>Bharucha-Reid.<newblock>
      <with|font-shape|italic|Random Integral Equations>,
      <localize|volume><nbsp>96<localize| of
      ><with|font-shape|italic|Mathematics in Science and
      Engineering>.<newblock> Academic Press, 1972.<newblock>

      <bibitem*|3><label|bib-chavez2012high>V.<nbsp>Chavez-Demoulin<localize|
      and >JA<nbsp>McGill.<newblock> High-frequency financial data modeling
      using hawkes processes.<newblock> <with|font-shape|italic|Journal of
      Banking & Finance>, , 2012.<newblock>

      <bibitem*|4><label|bib-lambertw>R. M.<nbsp>Corless, G. H.<nbsp>Gonnet,
      D. E. G.<nbsp>Hare, D. J.<nbsp>Jeffrey<localize| and >D.
      E.<nbsp>Knuth.<newblock> On the lambert w function.<newblock>
      <with|font-shape|italic|Advances in Computational Mathematics>,
      5(1):329--359, Dec 1996.<newblock>

      <bibitem*|5><label|bib-embrechts2011multivariate>P.<nbsp>Embrechts,
      T.<nbsp>Liniger<localize| and >L.<nbsp>Lin.<newblock> Multivariate
      hawkes processes: an application to financial data.<newblock>
      <with|font-shape|italic|Journal of Applied Probability>, 48:367--378,
      2011.<newblock>

      <bibitem*|6><label|bib-MonsterMoonshine>Terry<nbsp>Gannon.<newblock>
      <with|font-shape|italic|Moonshine Beyond the Monster: The Bridge
      Connecting Algebra, Modular Forms, and Physics>.<newblock> Cambridge
      University Press, Cambridge Monographs on Mathematical Physics,
      2006.<newblock>

      <bibitem*|7><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83--90,
      1971.<newblock>

      <bibitem*|8><label|bib-hautsch2011econometrics>N.<nbsp>Hautsch.<newblock>
      <with|font-shape|italic|Econometrics of financial high-frequency
      data>.<newblock> Springer, 2011.<newblock>

      <bibitem*|9><label|bib-NumericalMotives92>Uwe<nbsp>Jannsen.<newblock>
      Motives, numerical equivalence, and semi-simplicity.<newblock>
      <with|font-shape|italic|Inventiones Mathematicae>, 107:447,
      1992.<newblock>

      <bibitem*|10><label|bib-karr>A.<nbsp>Karr.<newblock>
      <with|font-shape|italic|Point processes and their statistical
      inference>, <localize|volume><nbsp>7.<newblock> CRC, 1991.<newblock>

      <bibitem*|11><label|bib-memip>R.<nbsp>Lemonnier<localize| and
      >N.<nbsp>Vayatis.<newblock> Nonparametric Markovian Learning of
      Triggering Kernels for Mutually Exciting and Mutually Inhibiting
      Multivariate Hawkes Processes.<newblock> <with|font-shape|italic|ArXiv
      e-prints>, , may 2014.<newblock>

      <bibitem*|12><label|bib-liniger2009multivariate>T.J.<nbsp>Liniger.<newblock>
      <with|font-shape|italic|Multivariate Hawkes Processes>.<newblock>
      <localize|PhD thesis>, Swiss Federal Institute Of Technology Zurich,
      2009.<newblock>

      <bibitem*|13><label|bib-nvs>Tomasz<nbsp>Maªolepszy.<newblock> Nonlinear
      volterra integral equations and the schroder functional
      equation.<newblock> <with|font-shape|italic|Nonlinear Analysis: Theory,
      Methods & Applications>, 74(2):424--432, 2011.<newblock>

      <bibitem*|14><label|bib-ogata1981lewis>Y.<nbsp>Ogata.<newblock> On
      lewis' simulation method for point processes.<newblock>
      <with|font-shape|italic|Information Theory, IEEE Transactions on>,
      27(1):23--31, 1981.<newblock>

      <bibitem*|15><label|bib-ozaki1979maximum>T.<nbsp>Ozaki.<newblock>
      Maximum likelihood estimation of hawkes' self-exciting point
      processes.<newblock> <with|font-shape|italic|Annals of the Institute of
      Statistical Mathematics>, 31(1):145--155, 1979.<newblock>

      <bibitem*|16><label|bib-lambertwss>Donald E. Knuth<nbsp>Robert M.
      Corless, David J. Jeffrey.<newblock> A sequence of series for the
      lambert w function.<newblock> <localize|In
      ><with|font-shape|italic|International Symposium on Symbolic and
      Algebraic Computation>, <localize|pages >197--204. 1997.<newblock>

      <bibitem*|17><label|bib-shek2010modeling>H.<nbsp>Shek.<newblock>
      Modeling high frequency market order dynamics using self-excited point
      process.<newblock> <with|font-shape|italic|Available at SSRN 1668160>,
      , 2010.<newblock>

      <bibitem*|18><label|bib-hawkes-finance>Ioane Muni<nbsp>Toke.<newblock>
      An introduction to hawkes processes with applications to
      finance.<newblock> <with|font-shape|italic|???>,
      http://fiquant.mas.ecp.fr/ioane_files/HawkesCourseSlides.pdf,
      2012.<newblock>
    </bib-list>
  </bibliography>

  <section|Appendix>

  <subsection|The Lambert W Function <with|mode|math|W(k,x)>><label|lambertW>

  The Lambert W function <cite|lambertw><cite|lambertwss> is the inverse of
  <math|x e<rsup|x>> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W(z)>|<cell|={x:x
    e<rsup|x>=z}>>|<row|<cell|>|<cell|=W(0,z)>>|<row|<cell|>|<cell|=1+(ln(z)-1)
    exp<left|(><frac|i|2 \<pi\>><big|int><rsub|0><rsup|\<infty\>><frac|1|x+1>
    ln<left|(><frac|x-i \<pi\>-ln(x)+ln(z)|x+i
    \<pi\>-ln(x)+ln(z)><right|)><space|-0.25spc>\<mathd\>x<right|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|\<infty\>><frac|(-k)<rsup|k-1>
    z<rsup|k>|k!>>>>>> <label|linv>
  </equation>

  where <math|W(a,z)\<forall\>a\<in\>\<bbb-Z\>,z\<nin\>{0,-e<rsup|-1>}> is\ 

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

  where <math|n\<in\>\<bbb-Z\>>. Some special values are\ 

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
    <associate|A|<tuple|39|7>>
    <associate|B|<tuple|28|?>>
    <associate|Bj|<tuple|20|3>>
    <associate|E|<tuple|7|1>>
    <associate|Etn1|<tuple|77|11>>
    <associate|Hawkes1|<tuple|48|8>>
    <associate|HawkesIntensity|<tuple|16|3>>
    <associate|P1inverse|<tuple|42|8>>
    <associate|P1pred|<tuple|53|9>>
    <associate|S|<tuple|12|2>>
    <associate|acd|<tuple|?|2>>
    <associate|acdcomp|<tuple|20|5>>
    <associate|acdll|<tuple|23|5>>
    <associate|acdpsi|<tuple|21|5>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|2.1.1|5>>
    <associate|auto-11|<tuple|2.2|6>>
    <associate|auto-12|<tuple|2.2.1|6>>
    <associate|auto-13|<tuple|2.2.2|8>>
    <associate|auto-14|<tuple|2.2.3|10>>
    <associate|auto-15|<tuple|2.3|11>>
    <associate|auto-16|<tuple|1|12>>
    <associate|auto-17|<tuple|3|12>>
    <associate|auto-18|<tuple|3.1|13>>
    <associate|auto-19|<tuple|3.1.1|14>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|3.1.2|15>>
    <associate|auto-21|<tuple|3.1.3|15>>
    <associate|auto-22|<tuple|4|16>>
    <associate|auto-23|<tuple|4.1|16>>
    <associate|auto-24|<tuple|4.1.1|16>>
    <associate|auto-25|<tuple|4.2|16>>
    <associate|auto-26|<tuple|4.2.1|16>>
    <associate|auto-27|<tuple|4.2.1|16>>
    <associate|auto-28|<tuple|5|17>>
    <associate|auto-29|<tuple|5.1|17>>
    <associate|auto-3|<tuple|1.2|1>>
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
    <associate|auto-4|<tuple|1.3|2>>
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
    <associate|auto-5|<tuple|1.3.1|2>>
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
    <associate|auto-6|<tuple|1.4|2>>
    <associate|auto-60|<tuple|5.1|41>>
    <associate|auto-61|<tuple|20|42>>
    <associate|auto-62|<tuple|5|43>>
    <associate|auto-63|<tuple|5.1|43>>
    <associate|auto-64|<tuple|21|44>>
    <associate|auto-7|<tuple|1.5|3>>
    <associate|auto-8|<tuple|2|3>>
    <associate|auto-9|<tuple|2.1|3>>
    <associate|bib-MonsterMoonshine|<tuple|6|17>>
    <associate|bib-NumericalMotives92|<tuple|9|17>>
    <associate|bib-Paiva08reproducingkernel|<tuple|15|17>>
    <associate|bib-RandomIntegralEquations|<tuple|2|17>>
    <associate|bib-aci|<tuple|12|18>>
    <associate|bib-appa|<tuple|13|17>>
    <associate|bib-bauwens2009modelling|<tuple|1|18>>
    <associate|bib-bowsher2007modelling|<tuple|1|16>>
    <associate|bib-cai2007model|<tuple|2|36>>
    <associate|bib-chavez2012high|<tuple|3|17>>
    <associate|bib-dennis1987optimization|<tuple|4|22>>
    <associate|bib-dm|<tuple|6|14>>
    <associate|bib-embrechts2011multivariate|<tuple|5|17>>
    <associate|bib-engle1998autoregressive|<tuple|8|40>>
    <associate|bib-generalizedHawkes|<tuple|17|15>>
    <associate|bib-hautsch2011econometrics|<tuple|8|17>>
    <associate|bib-hawkes-finance|<tuple|18|17>>
    <associate|bib-hawkes1971spectra|<tuple|7|17>>
    <associate|bib-hfmm|<tuple|8|14>>
    <associate|bib-hypergeometricRepresentation|<tuple|19|17>>
    <associate|bib-intro2pp|<tuple|5|14>>
    <associate|bib-karr|<tuple|10|17>>
    <associate|bib-kwok2008diagnostic|<tuple|7|18>>
    <associate|bib-lambertw|<tuple|4|17>>
    <associate|bib-lambertwss|<tuple|16|17>>
    <associate|bib-liniger2009multivariate|<tuple|12|17>>
    <associate|bib-memip|<tuple|11|17>>
    <associate|bib-nvs|<tuple|13|17>>
    <associate|bib-ogata1978asymptotic|<tuple|15|40>>
    <associate|bib-ogata1981lewis|<tuple|14|17>>
    <associate|bib-osd|<tuple|5|14>>
    <associate|bib-ozaki1979maximum|<tuple|15|17>>
    <associate|bib-shek2010modeling|<tuple|17|17>>
    <associate|bib-sp|<tuple|13|14>>
    <associate|bib-vr-W|<tuple|24|24>>
    <associate|bib-wiseman1994quantum|<tuple|19|15>>
    <associate|compensator|<tuple|10|2>>
    <associate|exp|<tuple|34|6>>
    <associate|gr|<tuple|11|2>>
    <associate|hawkesll|<tuple|47|8>>
    <associate|hc|<tuple|38|7>>
    <associate|hes|<tuple|17|4>>
    <associate|hll|<tuple|122|25>>
    <associate|hm|<tuple|37|6>>
    <associate|hmm|<tuple|117|24>>
    <associate|hs|<tuple|36|6>>
    <associate|hwc|<tuple|87|14>>
    <associate|incompleteGamma|<tuple|102|17>>
    <associate|kappa|<tuple|42|7>>
    <associate|lambda0|<tuple|150|29>>
    <associate|lambertW|<tuple|5.1|17>>
    <associate|lambertW6|<tuple|57|9>>
    <associate|lambertw|<tuple|115|17>>
    <associate|lhm|<tuple|87|13>>
    <associate|linv|<tuple|114|17>>
    <associate|llmvh|<tuple|92|14>>
    <associate|llmvh2|<tuple|96|15>>
    <associate|llmvh3|<tuple|97|15>>
    <associate|mc|<tuple|105|16>>
    <associate|mhi|<tuple|79|12>>
    <associate|mhl|<tuple|89|14>>
    <associate|mhp1|<tuple|81|12>>
    <associate|mp|<tuple|100|15>>
    <associate|mspy|<tuple|4.1.3|34>>
    <associate|multivarPred|<tuple|3.1.3|15>>
    <associate|phi|<tuple|29|5>>
    <associate|prediction|<tuple|60|10>>
    <associate|table1|<tuple|1|23>>
    <associate|uc|<tuple|64|10>>
    <associate|univarPred|<tuple|2.2|6>>
    <associate|up|<tuple|32|6>>
    <associate|wacdll|<tuple|27|6>>
    <associate|wlrr|<tuple|157|30>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hautsch2011econometrics

      bowsher2007modelling

      karr

      karr

      RandomIntegralEquations

      hawkes-finance

      hawkes1971spectra

      shek2010modeling

      chavez2012high

      hautsch2011econometrics

      nvs

      ozaki1979maximum

      ogata1981lewis

      ozaki1979maximum

      ogata1981lewis

      vr-W

      RandomIntegralEquations

      hawkes1971spectra

      embrechts2011multivariate

      liniger2009multivariate

      memip

      MonsterMoonshine

      NumericalMotives92

      lambertw

      lambertwss
    </associate>
    <\associate|figure>
      <tuple|normal|Plot <with|mode|<quote|math>|\<Lambda\><rsup|-1><around*|(|\<varepsilon\>;\<alpha\>,\<beta\>,F<rsub|T>|)>>
      for some data and parameters as a function of
      <with|mode|<quote|math>|\<varepsilon\>>|<pageref|auto-16>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Stuff:The
      Theory of Point Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1.<space|2spc>Terminology and Whatnot
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2.<space|2spc>The (Conditional) Intensity
      Function <with|mode|<quote|math>|\<lambda\><rsup|k><around*|(|t<mid|\|>F<rsup|><rsub|t>|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3.<space|2spc>The Compensator(aka Dual
      Predictble Projection) of a Point Process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.3.1.<space|2spc>Stochastic Integrals
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.4.<space|2spc>Palm Distributions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.5.<space|2spc>Random Integral Equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.<space|2spc>Hawkes
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1.<space|2spc>The (Standard) Exponential
      Hawkes Process of Arbitrary Order <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|2.1.1.<space|2spc>Maximum Likelihood
      Estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|2.2.<space|2spc>Prediction of the Next
      Occurrence Time <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|2tab>|2.2.1.<space|2spc>The case when P=1 and the
      Lambert W Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|2tab>|2.2.2.<space|2spc>Maximum Likelihood
      Estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|2tab>|2.2.3.<space|2spc>The Case of Any Order
      <with|mode|<quote|math>|P=n> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.3.<space|2spc>Predictaction of the
      Expected Number of Events Any Given Time From Now
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.<space|2spc>Multivariate
      Hawkes Models> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1.<space|2spc>The Compensator, aka, the
      Dual-Predictable Projection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|3.1.1.<space|2spc>The Exact Log-Likelihood
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|3.1.2.<space|2spc>MEMIP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|3.1.3.<space|2spc>Prediction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.<space|2spc>TODO>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1.<space|2spc>Links To Monstrous
      Moonshine (aka The Friendly Giant) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|2tab>|4.1.1.<space|2spc>Jacobian Variety
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|4.2.<space|2spc>Motivic Cohomology
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|2tab>|4.2.1.<space|2spc>Numerical Motives
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1.<space|2spc>The Lambert W Function
      <with|mode|<quote|math>|W(k,x)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>
    </associate>
  </collection>
</auxiliary>
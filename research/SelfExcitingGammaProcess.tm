<TeXmacs|1.99.2>

<style|generic>

<\body>
  <subsection|The Hawkes-gamma Process of integer order>

  A uni-variate linear self-exciting point process <math|N<rsub|t>> is one
  that can be expressed as\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|t>\<nu\><around*|(|t-s|)>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|k>\<less\>t>\<nu\><around*|(|t-t<rsub|k>|)>>>>>><label|HawkesIntensity>
  </equation>

  <cite|hawkes-finance><cite|hawkes1971spectra><cite|shek2010modeling><cite|chavez2012high><cite-detail|hautsch2011econometrics|11.3>
  Here, \ <math|\<nu\>:\<bbb-R\><rsub|+>\<rightarrow\>\<bbb-R\><rsub|+>> is a
  kernel function which expresses the positive influence of past events
  <math|t<rsub|i>> on the current value of the intensity process, and
  <math|\<kappa\>> is a scaling factor for the baseline intensity
  <math|\<mu\><around*|(|t|)>>.. \ The Hawkes-Gamma process of order <math|P>
  is a defined by the gamma kernel (which includes the standard exponential
  kernel by setting <math|\<gamma\>=1>).

  <\equation>
    <with|font-base-size|12|\<nu\><around*|(|t|)><label|exp>=<big|sum><rsub|j=1><rsup|P><with|font-base-size|16|\<alpha\><rsub|j>
    t<rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j>
    t<rsup|\<gamma\><rsub|j>>>>|\<nu\><around*|(|t|)><label|exp>=<big|sum><rsub|j=1><rsup|P><with|font-base-size|16|\<alpha\><rsub|j>
    t<rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j>
    t<rsup|\<gamma\><rsub|j>>>>>
  </equation>

  The intensity of the Hawkes-gamma process is written as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<lambda\><around*|(|t|)>>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|int><rsub|0><rsup|t><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|t-s|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-s|)><rsup|\<gamma\><rsub|j>>>\<mathd\>N<rsub|s>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>\<alpha\><rsub|j>
    <around*|(|t-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|<wide|N|\<breve\>><rsub|t>>
    <around*|(|t-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>>>|<row|<cell|>|<cell|=\<mu\><around*|(|t|)>\<kappa\>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>>>>>>
  </equation>

  where <math|B<rsub|j><around*|(|i|)>> has the self-similiar recursive form
  (independent of \<alpha\>)

  let

  <\equation*>
    b<rsub|j,k><around*|(||)>
  </equation*>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|><around*|(|j,i|)>>|<cell|=<big|sum><rsub|k=1><rsup|i>
    <around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|<with|font-series|bold|t<rsub|i>-t<rsub|k>>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i<rsub|-1>>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>>><rsub|><big|sum><rsub|k=1><rsup|i><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|<with|font-series|bold|t<rsub|i-1>-t<rsub|i>>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i<rsub|-1>>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>>><rsub|><big|sum><rsub|k=1><rsup|i-1><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|<with|font-series|bold|t<rsub|i-1>-t<rsub|i>>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i<rsub|-1>>|)><rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>-1>><rsub|>*<around*|(|1+<big|sum><rsub|k=1><rsup|i-2><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|i<rsub|-1>>|)><rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1><rsub|>|)>><around*|(|1+B<rsub|j><around*|(|i-1|)>|)>>>>>><label|Bj>
  </equation>

  since <math| e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|i-1>|)>>=e<rsup|-\<beta\><rsub|j>0>=e<rsup|-0>=1>.
  A uni-variate Hawkes process is stationary if the branching ratio is less
  than one.

  <\equation>
    <big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>\<less\>1<label|hs>
  </equation>

  If a Hawkes process is stationary then the unconditional mean is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\>=E<around*|[|\<lambda\><around*|(|t|)>|]>>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-E<around*|[|\<nu\><around*|(|t|)>|]>>>>|<row|<cell|>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>\<mathd\>t>>>|<row|<cell|>|<cell|=<frac|E<around*|[|\<mu\><around*|(|t|)>|]>|1-<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>>>>>>>><label|hm>
  </equation>

  where <math|E<around*|(|*\<cdummy\>|)>> is the Lebesgue integral over the
  positive real axis. For consecutive events, the dual-predictable projection
  is expressed (<reference|compensator>)

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around*|(|t<rsub|i-1>,t<rsub|i>|)>>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<lambda\><around*|(|t|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>><around*|(|\<nu\><around*|(|t|)>+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j
    >B<rsub|j><around*|(|N<rsub|t>|)>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><big|sum><rsub|k=0><rsup|i-1>
    <big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>e<rsup|-\<beta\><rsub|j><around*|(|t-t<rsub|k>|)>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t-t<rsub|k>|)>\<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|k=0><rsup|i-1><big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>><around*|(|e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i-1>-t<rsub|k>|)>>-e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>>\<nu\><around*|(|s|)>\<mathd\>s+<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>
    \<gamma\><rsub|j>><around*|(|1-<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>>>|)>A<rsub|j><around*|(|i-1|)>>>>>><label|hc>
  </equation>

  compared with the multivariate compensator in Equation
  (<reference|lhm>)where there is the recursion

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|j><around*|(|i|)>>|<cell|=<big|sum><rsub|t<rsub|k>\<leqslant\>t<rsub|i>><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=<around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1><big|sum><rsub|k=0><rsup|i-1>e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|k>|)><rsup|\<gamma\><rsub|j>>>>>|<row|<cell|>|<cell|=1+<around*|(|t<rsub|i>-t<rsub|i-1>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j><around*|(|t<rsub|i>-t<rsub|-1>|)><rsup|\<gamma\><rsub|j>-1>>A<rsub|j><around*|(|i-1|)>>>>>><label|A>
  </equation>

  with <math|A<rsub|j><around*|(|0|)>=0> since the integral of the
  gamma-exponential kernel (<reference|exp>) is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>\<nu\><around*|(|t|)>\<mathd\>t>|<cell|=<big|int><rsub|t<rsub|i-1><rsup|>><rsup|t<rsub|i>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j><around*|(|t-t<rsub|k>|)><rsup|\<gamma\><rsub|j>-1>
    e<rsup|-\<beta\><rsub|j> <around*|(|t-t<rsub|k>|)><rsup|\<gamma\><rsub|j>>>\<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|\<beta\><rsub|j>
    \<gamma\><rsub|j>> <around*|(|t<rsub|i><rsup|\<gamma\><rsub|j>-1>
    e<rsup|><rsup|-\<beta\><rsub|j> t<rsub|i><rsup|\<gamma\><rsub|j>>>-t<rsub|i-1><rsup|\<gamma\><rsub|j>-1>e<rsup|-\<beta\><rsub|j>t<rsub|i-1><rsup|\<gamma\><rsub|j>>>|)>>>>>>
  </equation>

  \ 

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|5>
      <bibitem*|1><label|bib-chavez2012high>V.<nbsp>Chavez-Demoulin<localize|
      and >JA<nbsp>McGill.<newblock> High-frequency financial data modeling
      using hawkes processes.<newblock> <with|font-shape|italic|Journal of
      Banking & Finance>, , 2012.<newblock>

      <bibitem*|2><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83--90,
      1971.<newblock>

      <bibitem*|3><label|bib-hautsch2011econometrics>N.<nbsp>Hautsch.<newblock>
      <with|font-shape|italic|Econometrics of financial high-frequency
      data>.<newblock> Springer, 2011.<newblock>

      <bibitem*|4><label|bib-shek2010modeling>H.<nbsp>Shek.<newblock>
      Modeling high frequency market order dynamics using self-excited point
      process.<newblock> <with|font-shape|italic|Available at SSRN 1668160>,
      , 2010.<newblock>

      <bibitem*|5><label|bib-hawkes-finance>Ioane Muni<nbsp>Toke.<newblock>
      An introduction to hawkes processes with applications to
      finance.<newblock> <with|font-shape|italic|???>,
      http://fiquant.mas.ecp.fr/ioane_files/HawkesCourseSlides.pdf,
      2012.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|A|<tuple|8|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|Bj|<tuple|4|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|HawkesIntensity|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-1|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|9|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-chavez2012high|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-hautsch2011econometrics|<tuple|3|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-hawkes-finance|<tuple|5|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-hawkes1971spectra|<tuple|2|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-shek2010modeling|<tuple|4|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|exp|<tuple|2|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|hc|<tuple|7|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|hm|<tuple|6|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|hs|<tuple|5|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|kappa|<tuple|11|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
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
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>The Hawkes-gamma Process of
      integer order <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
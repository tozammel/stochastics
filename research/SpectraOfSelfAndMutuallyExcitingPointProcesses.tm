<TeXmacs|1.99.2>

<style|generic>

<\body>
  As in <cite|hawkes1971spectra>, let <math|N<around*|(|t|)>> represent the
  cumulative number of events of before time <math|t>\ 

  <\equation>
    \<lambda\><around*|(|t|)>=<frac|E<around*|{|\<mathd\>N<around*|(|t|)>|}>|\<mathd\>t>
  </equation>

  \ and <math|\<mu\><rsub|N><around*|(|t|)>> be the associated covariance
  density of the stochastic continuous-time counting function
  <math|N<around*|(|t|)>> given by

  <\equation>
    \<mu\><rsub|N><around*|(|\<tau\>|)>=<frac|E<around*|{|\<mathd\>N<around*|(|t+\<tau\>|)>\<mathd\>N<around*|(|t|)>|}>|\<mathd\>t<rsup|2>>-<frac|E<around*|{|\<mathd\>N<around*|(|t|)><rsup|2>|}>|\<mathd\>t<rsup|2>>=<frac|E<around*|{|\<mathd\>N<around*|(|t+\<tau\>|)>\<mathd\>N<around*|(|t|)>|}>|\<mathd\>t<rsup|2>>-\<lambda\><around*|(|t|)><rsup|2><label|covar0>
  </equation>

  which satifies the time-reflection relations

  <\equation>
    \<mu\><around*|(|\<tau\>|)>=<choice|<tformat|<table|<row|<cell|\<mu\><around*|(|-\<tau\>|)>>|<cell|\<tau\>\<less\>0>>|<row|<cell|\<infty\>>|<cell|\<tau\>=0>>|<row|<cell|\<mu\><around*|(|\<tau\>|)>>|<cell|\<tau\>\<gtr\>0>>>>>
  </equation>

  with the additional natural condition that point process is simple

  <\equation>
    E<around*|{|\<mathd\>N<around*|(|t|)><rsup|2>|}>=E<around*|{|\<mathd\>N<around*|(|t|)>|}>
  </equation>

  meaning that events do not occur more than once per instant, so that the
  complete covariance density is

  <\equation>
    \<mu\><rsup|<around*|(|c|)>><around*|(|\<tau\>|)>=\<lambda\>
    \<delta\><around*|(|\<tau\>|)>+\<mu\><around*|(|\<tau\>|)><label|covar1>
  </equation>

  and where <math|\<delta\><around*|(|t|)>> is the Dirac delta function and
  <math|\<mu\><around*|(|\<tau\>|)>> is continuous in the neighborhod of the
  origin

  <\equation>
    lim<rsub|\<tau\>\<rightarrow\>0<rsup|\<upl\>>>\<mu\><around*|(|\<tau\>|)>=lim<rsub|\<tau\>\<rightarrow\>0<rsup|->>\<mu\><around*|(|\<tau\>|)>
  </equation>

  The complete spectral density for <math|N<around*|(|t|)>> is defined by\ 

  <\equation>
    f<around*|(|\<omega\>|)>=<frac|1|2 \<pi\>><big|int><rsup|\<infty\>><rsub|-\<infty\>>e<rsup|-i
    \<tau\> w>\<mu\><rsup|<around*|(|c|)>><around*|(|\<tau\>|)>\<mathd\>\<tau\>=<frac|1|2
    \<pi\>><around*|{|\<lambda\>+<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i
    \<tau\> \<omega\>>\<mu\><around*|(|\<tau\>|)>\<mathd\>\<tau\>|}><label|sd1>
  </equation>

  The \ multi-dimensional version of the above is denoted by
  <math|N<rsub|i><around*|(|t|)>> where <math|i,j\<in\><around*|{|1\<ldots\>k|}>>
  and whose covariance densities are related by

  <\equation>
    \<mu\><rsub|N<rsub|i j>><around*|(|t,\<tau\>|)>=<frac|E<around*|{|\<mathd\>N<rsub|i><around*|(|t+\<tau\>|)>\<mathd\>N<rsub|j><around*|(|t|)>|}>|\<mathd\>t<rsup|2>>-\<lambda\><rsub|i><around*|(|t|)>\<lambda\><rsub|j><around*|(|t|)>
  </equation>

  where

  <\equation>
    \<lambda\><rsub|i><around*|(|t|)>=<frac|E<around*|{|\<mathd\>N<rsub|i><around*|(|t|)>|}>|\<mathd\>t>
  </equation>

  which satisfies

  <\equation>
    \<mu\><rsub|N<rsub|r s>><around*|(|\<tau\>|)>=<choice|<tformat|<table|<row|<cell|\<mu\><rsub|s
    r><around*|(|-\<tau\>|)>>|<cell|\<tau\>\<less\>0>>|<row|<cell|\<infty\>>|<cell|\<tau\>=0>>|<row|<cell|\<mu\><rsub|r
    s><around*|(|\<tau\>|)>>|<cell|\<tau\>\<gtr\>0>>>>>
  </equation>

  so that (<reference|covar1>) transforms to

  <\equation>
    \<mu\><rsub|N<rsub|r s>><rsup|<around*|(|c|)>><around*|(|\<tau\>|)>=
    \<delta\><around*|(|\<tau\>|)>diag<around*|(|\<Lambda\><around*|(|\<tau\>|)>|)>+\<mu\><around*|(|\<tau\>|)>
  </equation>

  so that the its associated self-adjoint (Hermitian) spectral density matrix
  can be expressed similiarly to (<reference|sd1>) \ as

  <\equation>
    F<rsub|N<rsub|r s>><around*|(|\<omega\>|)>=<frac|1|2
    \<pi\>><around*|{|diag<around*|(|\<Lambda\><around*|(|\<omega\>|)>|)>+<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i
    \<tau\> \<omega\>>\<mu\><rsub|N<rsub|r
    s>><around*|(|\<tau\>|)>\<mathd\>\<tau\>|}>
  </equation>

  By (<reference|covar1>) and time-refelection symmetry it can be seen that
  <math|\<mu\><around*|(|\<tau\>|)>> can be re-expressed as the combination
  of two integrals\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<mu\><around*|(|\<tau\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<tau\>>f<around*|(|\<tau\>-v|)>\<mu\><rsup|<around*|(|c|)>><around*|(|v|)>\<mathd\>v>>|<row|<cell|>|<cell|=\<lambda\>
    g<around*|(|\<tau\>|)>+<big|int><rsub|-\<infty\>><rsup|\<tau\>>f<around*|(|\<tau\>-v|)>\<mu\><around*|(|v|)>\<mathd\>v>>|<row|<cell|>|<cell|=\<lambda\>
    g<around*|(|\<tau\>|)>+<big|int><rsub|0><rsup|\<infty\>>f<around*|(|\<tau\>+v|)>\<mu\><around*|(|v|)>\<mathd\>v+<big|int><rsub|0><rsup|\<tau\>>f<around*|(|\<tau\>-v|)>\<mu\><around*|(|v|)>\<mathd\>v>>>>>
  </equation>

  The process <math|\<Lambda\><around*|(|t|)>> when considered to be
  self-exciting can be expressed as

  <\equation>
    <text|>\<Lambda\><around*|(|t|)>=\<nu\>+<big|int><rsub|-\<infty\>><rsup|t>g<around*|(|t-u|)>\<mathd\>N<around*|(|u|)><label|se1>
  </equation>

  then, conditional upon the process being stationary, that is, its largest
  eigenvector being no greater than, but possibly being exactly equal to,
  unity(1), the average intensity (due to ergodicity) is

  <\equation>
    \<lambda\>=E<around*|{|\<Lambda\><around*|(|t|)>|}><math|=\<nu\>+\<lambda\><big|int><rsup|t><rsub|-\<infty\>>g<around*|(|t-u|)>\<mathd\>u>=<frac|\<nu\>|1-<big|int><rsub|0><rsup|\<infty\>>g<around*|(|v|)>\<mathd\>v>
  </equation>

  \;

  NOTE: <with|font-shape|italic|This is the part where the standard
  exponential recursions are derived. The task is to do the same, with the
  exponential powerlaw approximation kernel methods.> The 'standard
  exponential kernel' is the one defined by

  <\equation>
    g<around*|(|t|)>=<big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t><label|sek>
  </equation>

  The Laplace transform of <math|g<around*|(|t|)>>, denoted
  <math|\<cal-L\><rsub|g><around*|(|s|)>>, is defined

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<cal-L\><rsub|g><around*|(|s|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>g<around*|(|t|)>e<rsup|-t
    s> \<mathd\>t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=1><rsup|P>\<alpha\><rsub|j>
    e<rsup|-\<beta\><rsub|j> t>e<rsup|-t s>
    \<mathd\>t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|P><frac|\<alpha\><rsub|j>|s+\<beta\><rsub|j>>>>>>>
  </equation>

  It's probably worth mentioning the reference to Poisson measues in
  <cite-detail|spit|5.3> and the fact that in
  <cite-detail|MonsterMoonshine|2.2.3> it is mentioned that the Fourier
  transform of the 'Gaussian' <math|e<rsup|-t x<rsup|2>>> is (essentially)
  itself is probably related to the fact that the intensity function of the
  Hawkes process having kernel (<reference|sek>) has an autocovariance
  function which is essential equal to itself, that is, it has the exact same
  functional form. TODO: See <cite-detail|intro2ppV2|12.8> and use the
  notions of scale-invariance and self-similarity. In
  <cite-detail|hawkes1971spectra|Sec.3>\ 

  \ 

  <\equation>
    <\text>
      \;
    </text>
  </equation>

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|4>
      <bibitem*|1><label|bib-intro2ppV2>D.J.<nbsp>Daley<localize| and
      >D.<nbsp>Vere-Jones.<newblock> <with|font-shape|italic|An Introduction
      to the Theory of Point Processes, Volume II: General Theory and
      Structure>.<newblock> Probability and Its Applications. Springer,
      2008.<newblock>

      <bibitem*|2><label|bib-MonsterMoonshine>Terry Gannon.<newblock>
      <with|font-shape|italic|Moonshine Beyond the Monster: The Bridge
      Connecting Algebra, Modular Forms, and Physics>.<newblock> Cambridge
      University Press, Cambridge Monographs on Mathematical Physics,
      2006.<newblock>

      <bibitem*|3><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83--90,
      1971.<newblock>

      <bibitem*|4><label|bib-spit>M.M. Rao.<newblock>
      <with|font-shape|italic|Stochastic Processes: Inference Theory>,
      <localize|volume> 508<localize| of ><with|font-shape|italic|Mathematics
      and its Applications>.<newblock> Kluwer Academic Press, jan
      2000.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|18|2>>
    <associate|bib-MonsterMoonshine|<tuple|2|2>>
    <associate|bib-hawkes1971spectra|<tuple|3|2>>
    <associate|bib-intro2ppV2|<tuple|1|2>>
    <associate|bib-spit|<tuple|4|2>>
    <associate|covar0|<tuple|2|1>>
    <associate|covar1|<tuple|5|1>>
    <associate|sd1|<tuple|7|1>>
    <associate|se1|<tuple|14|2>>
    <associate|sek|<tuple|16|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hawkes1971spectra

      spit

      MonsterMoonshine

      intro2ppV2

      hawkes1971spectra
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
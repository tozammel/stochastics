<TeXmacs|1.99.2>

<style|generic>

<\body>
  \;

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

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|4>
      <bibitem*|1><label|bib-embrechts2011multivariate>P.<nbsp>Embrechts,
      T.<nbsp>Liniger<localize|, and >L.<nbsp>Lin.<newblock> Multivariate
      hawkes processes: an application to financial data.<newblock>
      <with|font-shape|italic|Journal of Applied Probability>, 48:367--378,
      2011.<newblock>

      <bibitem*|2><label|bib-hawkes1971spectra>A.G.<nbsp>Hawkes.<newblock>
      Spectra of some self-exciting and mutually exciting point
      processes.<newblock> <with|font-shape|italic|Biometrika>, 58(1):83--90,
      1971.<newblock>

      <bibitem*|3><label|bib-memip>R.<nbsp>Lemonnier<localize| and
      >N.<nbsp>Vayatis.<newblock> Nonparametric Markovian Learning of
      Triggering Kernels for Mutually Exciting and Mutually Inhibiting
      Multivariate Hawkes Processes.<newblock> <with|font-shape|italic|ArXiv
      e-prints>, may 2014.<newblock>

      <bibitem*|4><label|bib-liniger2009multivariate>T.J.<nbsp>Liniger.<newblock>
      <with|font-shape|italic|Multivariate Hawkes Processes>.<newblock>
      <localize|PhD thesis>, Swiss Federal Institute Of Technology Zurich,
      2009.<newblock>
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
    <associate|auto-1|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|1.1|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|1.1.1|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|21|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-embrechts2011multivariate|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-hawkes1971spectra|<tuple|2|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-liniger2009multivariate|<tuple|4|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-memip|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lhm|<tuple|9|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|llmvh|<tuple|14|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|llmvh2|<tuple|18|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|llmvh3|<tuple|19|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|mhi|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|mhl|<tuple|11|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|mhp1|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hawkes1971spectra

      embrechts2011multivariate

      liniger2009multivariate

      memip
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Multivariate
      Hawkes Models> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Compensator, aka, the
      Dual-Predictable Projection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>The Exact Log-Likelihood
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
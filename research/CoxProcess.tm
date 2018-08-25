<TeXmacs|1.99.3>

<style|article>

<\body>
  Following <cite|cpid>, let

  <\equation*>
    \<lambda\><rsub|t>=\<lambda\><rsub|0> e<rsup|-\<beta\>
    t>+<big|sum><rsub|i=1><rsup|M<rsub|t>>Y<rsub|t>
    e<rsup|-\<beta\><around*|(|t-S<rsub|i>|)>>
  </equation*>

  where

  <\itemize>
    <item><math|\<lambda\><rsub|0>> is the <em|initial value> of
    <math|\<lambda\><rsub|t>>

    <item><math|Y<rsub|i>> is a sequence of i.i.d. non-negative random
    variables distributed according to distribution function
    \ <math|G<around*|(|y|)>\<forall\>y\<gtr\>0> on the positive half-line,
    being such that its expected value at any given instant is<space|1em>
    <math|E<around*|[|Y<rsub|t><rsub|>|]>=\<mu\>>

    <item><math|S<rsub|i>> is a sequence of event times of a Poisson process
    <math|M<rsub|t>> with constant intensity <math|\<rho\>>

    <item><math|\<beta\>> is the rate of exponential intensity decrease
  </itemize>

  the infinitesimal generator <math|A \<cdummy\>f<around*|(|\<Lambda\>,\<lambda\>,t|)>>
  of the process <math|<around*|(|\<#39B\><rsub|t>,\<lambda\><rsub|t>,t|)>>
  acting on a function <math|f<around*|(|\<Lambda\>,\<lambda\>,t|)>\<in\>Dom<around*|(|A|)>>
  is given by

  <\equation>
    A f<around*|(|\<Lambda\>,\<lambda\>,t|)>=<frac|\<partial\>f|\<partial\>t>+\<lambda\><frac|\<partial\>f|\<partial\>\<Lambda\>>-\<beta\>\<lambda\><frac|\<partial\>f|\<partial\>\<lambda\>>+\<rho\><around*|(|<big|int><rsub|0><rsup|\<infty\>>f<around*|(|\<Lambda\>,\<lambda\>+y,t|)>\<mathd\>G<around*|(|y|)>-f<around*|(|\<Lambda\>,\<lambda\>,t|)>|)>
  </equation>

  Sufficient conditions for <math|f> being in the domain of <math|A> is that
  <math|f> be differentiable with respect to its arguments
  <math|\<Lambda\>,\<lambda\>,t> for all values and that\ 

  <\equation>
    <around*|\||<big|int><rsub|0><rsup|\<infty\>>f<around*|(|\<Lambda\>,\<lambda\>+y,t|)>\<mathd\>G<around*|(|y|)>-f<around*|(|\<Lambda\>,\<lambda\>,t|)>|\|>\<less\>\<infty\>\<forall\>\<Lambda\>,\<lambda\>,t
  </equation>

  <subsubsection|A Suitable Martingale for the Probability Generating
  Function>

  To find the probability generating function<cite-detail|intro2pp|p.10>, let
  us first identify a suitable martingale. Let <math|W<rsub|t>=\<beta\>
  \<Lambda\><rsub|t>+\<lambda\><rsub|t>> and
  <math|Z<rsub|t>=\<lambda\><rsub|t> e<rsup|\<beta\> t>> then the
  infinitesimal generator <math|A \<cdummy\>f<around*|(|W<rsub|t>,Z<rsub|t>,t|)>>
  of the process <math|<around*|(|W<rsub|t>,Z<rsub|t>,t|)>> acting on a
  function <math| f<around*|(|w<rsub|>,z,t|)>\<in\>Dom<around*|(|A|)>> is
  given by

  <\equation>
    A \<cdummy\>f<around*|(|w,z,t|)>=<frac|\<mathd\>|\<mathd\>t>f<around*|(|w,z,t|)>+\<rho\><around*|[|<big|int><rsub|0><rsup|\<infty\>>f<around*|(|w+y,z+y
    e<rsup|\<beta\> t>,t|)>\<mathd\>G<around*|(|y|)>-f<around*|(|w,z,t|)>|]>
  </equation>

  This is closely releated to the fact a <math|C<rsup|2>> function <math|f>
  acting on a 2-dimensional Wiener process is a martingale if and only if its
  \ Laplacian vanishes, that is, <math|\<Delta\>f<around*|(|t|)>=<frac|\<mathd\>|\<mathd\>t<rsup|2>>f<around*|(|t|)>=0>,
  i.e., \ it must be harmonic. <cite-detail|sde|Example 8.5.9> Now, the
  <math|C<rsup|2>> function <math|h<around*|(|t|)>> implicitly defined by\ 

  <\equation>
    <wide|h|\<dot\>><around*|(|t|)>-\<rho\><around*|(|1-<wide|g|^><around*|(|a+b
    e<rsup|\<beta\> t>|)>|)>h<around*|(|t|)>=0
  </equation>

  where <math|<wide|h|\<dot\>><around*|(|t|)>=<frac|\<mathd\>|\<mathd\>t>h<around*|(|t|)>><math|>
  has a solution of the form

  <\equation>
    h<around*|(|t|)>=K e<rsup|\<rho\><big|int><rsub|0><rsup|t><around*|(|1-<wide|g|^><around*|(|a+b
    e<rsup|\<beta\> s>|)>|)>\<mathd\>s>
  </equation>

  where <math|K> is an arbitrary constant and
  <math|<wide|g|^><around*|(|x|)>=<big|int><rsub|0><rsup|t>e<rsup|-x
  y>\<mathd\>G<around*|(|y|)>\<forall\>t\<gtr\>0> is the Laplace
  transform<cite|tlt>. Therefore, let <math|a> and <math|b> be such that
  <math|a\<geqslant\>0> and <math|b\<geqslant\>-a e<rsup|-\<beta\>u>> where
  <math|u> is a time greater than <math|t> to which <math|\<Lambda\><rsub|t>>
  and <math|\<lambda\><rsub|t>> evolve towards then it can be shown that

  <\equation>
    e<rsup|-a \<beta\>\<Lambda\><rsub|t>> e<rsup|-<around*|(|a+b
    e<rsup|\<beta\> t>|)>\<lambda\><rsub|t>>
    e<rsup|\<rho\><big|int><rsub|0><rsup|t><around*|(|1-<wide|g|^><around*|(|a+b
    e<rsup|\<beta\> s>|)>|)>\<mathd\>s>
  </equation>

  is martingale<cite-detail|karr|1.2><cite-detail|intro2pp|Proposition
  6.2.II>.

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|5>
      <bibitem*|1><label|bib-tlt>Richard<nbsp>E.<nbsp>Bellman<localize| and
      >Robert<nbsp>S.<nbsp>Roth.<newblock> <with|font-shape|italic|The
      Laplace Transform>, <localize|volume><nbsp>3<localize| of
      ><with|font-shape|italic|Series in Applied Mathematics>.<newblock>
      World Scientific, 1984.<newblock>

      <bibitem*|2><label|bib-cpid>Angelos Dassios<localize| and >Jiwook
      Jang.<newblock> The distribution of the interval between events of a
      cox process with shot noise intensity.<newblock>
      <with|font-shape|italic|Journal of Applied Mathematics and Stochastic
      Analysis>, 2008(367170):14, 2008.<newblock>

      <bibitem*|3><label|bib-intro2pp>D.J.<nbsp>Daley<localize| and
      >D.<nbsp>Vere-Jones.<newblock> <with|font-shape|italic|An Introduction
      to the Theory of Point Processes, Volume I: Elementary Theory and
      Methods>.<newblock> Springer, 2005.<newblock>

      <bibitem*|4><label|bib-karr>A.<nbsp>Karr.<newblock>
      <with|font-shape|italic|Point processes and their statistical
      inference>, <localize|volume><nbsp>7.<newblock> CRC, 1991.<newblock>

      <bibitem*|5><label|bib-sde>Bernt Øksendal.<newblock>
      <with|font-shape|italic|Stochastic Differential Equations: An
      Introduction With Applications>.<newblock> Springer, 6th corrected
      2013<localize| edition>, 1985.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|8>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|6|1>>
    <associate|auto-3|<tuple|6|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-cpid|<tuple|2|1>>
    <associate|bib-intro2pp|<tuple|3|?>>
    <associate|bib-karr|<tuple|4|?>>
    <associate|bib-sde|<tuple|5|?>>
    <associate|bib-tlt|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cpid

      intro2pp

      sde

      tlt

      karr

      intro2pp
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>A Suitable Martingale for the
      Probability Generating Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
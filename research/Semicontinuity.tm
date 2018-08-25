<TeXmacs|1.99.3>

<style|generic>

<\body>
  <doc-data|<doc-title|The Existence and Uniqueness of A Solution To An
  Infinite Sequence of Transcendental Equations Enumerating The Imaginary
  Parts Of The Roots Of The Riemann Zeta Function On The Upper Half
  Plane>|<doc-author|<\author-data|<author-name|Stephen Crowley
  \<less\>stephenc@nym.hush.com\<gtr\>>>
    \;

    \;

    \;
  </author-data>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Definitions
    and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Pointwise Derivatives: The Jacobian
    Vector and Hessian Matrix <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Semicontinuity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc><with|mode|math|\<pm\>\<Gamma\>>-Convergence
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Definitions and Notation>

  <subsection|Pointwise Derivatives: The Jacobian Vector and Hessian Matrix>

  Let <math|u\<in\>C<rsup|0><around*|(|\<Omega\>|)>> and
  <math|x\<in\>\<Omega\><wide*|\<subset\>|\<wide-bar\>>\<bbb-R\><rsup|n>>
  then <math|u> is said to be twice differentiable at <math|x> if there
  exists a Jacobian (vector-valued function also known as the gradient)
  <math|D u<around*|(|x|)>=p\<in\>\<bbb-R\><rsup|n>> of <math|u> at <math|x>
  and a Hessian (matrix-valued function )
  <math|D<rsup|2>u<around*|(|x|)>=X\<in\>\<bbb-S\><around*|(|n|)>> of
  <math|u> at <math|x> such that

  <\equation>
    u<around*|(|x+z|)>=u<around*|(|x|)>+p\<cdot\>
    z+<frac|X:z\<otimes\>z|2>+o<around*|(|<around*|\||z|\|><rsup|2>|)>
  </equation>

  as <math|z\<rightarrow\>0>. <\footnote>
    The operator \P<math|\<cdot\>>\Q denotes the Euclidean inner product in
    <math|\<bbb-R\><rsup|n>>
  </footnote> Similiarly, it is said that <math|u> is once differentiable at
  <math|x> when

  <\equation>
    u<around*|(|x+z|)>=u<around*|(|x|)>+p\<cdot\>z+o<around*|(|<around*|\||z|\|>|)>
  </equation>

  as <math|z\<rightarrow\>0> so that <math|p=D u<around*|(|x|)>>.
  <cite-detail|livflpde|Ch.2 Def.1 p.20>

  <subsection|Semicontinuity>

  The spaces of semicontinous set-functions on
  <math|\<Omega\><wide*|\<subset\>|\<wide-bar\>>\<bbb-R\><rsup|n>> are
  denoted

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|USC<around*|(|\<Omega\>|)>>|<cell|the
    space of upper semicontinuous functions
    \<Omega\>\<rightarrow\>\<bbb-R\>>>|<row|<cell|LSC<around*|(|\<Omega\>|)>>|<cell|the
    space of lower semicontinous function
    \<Omega\>\<rightarrow\>\<bbb-R\>>>|<row|<cell|BUSC<around*|(|\<Omega\>|)>>|<cell|the
    space of bounded upper semicontinous functions
    \<Omega\>\<rightarrow\>\<bbb-R\>>>|<row|<cell|BLSC<around*|(|\<Omega\>|)>>|<cell|the
    space of bounded lower semicontinous functions
    \<Omega\>\<rightarrow\>\<bbb-R\>>>>>>
  </equation>

  where <math|u<around*|(|x|)>> is upper semicontinous and written
  <math|u<around*|(|x|)>\<in\>USC<around*|(|\<Omega\>|)>> if there exists a
  value of <math|\<delta\>> such that\ 

  <\equation>
    f<around*|(|y|)>\<less\>f<around*|(|y|)>+\<varepsilon\>\<forall\>y\<in\>E\<cap\>B<around*|(|x\<comma\>\<delta\>|)>
    and any x\<in\>E and \<varepsilon\>\<gtr\>0
  </equation>

  or equivalently

  <\equation>
    limsup<rsub|y\<rightarrow\>x> u<around*|(|y|)>\<leqslant\>u<around*|(|x|)>\<forall\>x\<in\>E
  </equation>

  and likewise <math|u<around*|(|x|)>> is written
  <math|u<around*|(|x|)>\<in\>LSC<around*|(|\<Omega\>|)>> if it is lower
  semicontinuous, e.g, \ there exists a value of <math|\<delta\>> such that\ 

  <\equation>
    f<around*|(|y|)>\<less\>f<around*|(|y|)>-\<varepsilon\>\<forall\>y\<in\>E\<cap\>B<around*|(|x\<comma\>\<delta\>|)>
    and any x\<in\>E and \<varepsilon\>\<gtr\>0
  </equation>

  or equivalently that

  <\equation>
    liminf<rsub|y\<rightarrow\>x> u<around*|(|y|)>\<geqslant\>u<around*|(|x|)>\<forall\>x\<in\>E
  </equation>

  <cite-detail|ocvshjb|V.1p.286><cite-detail|livflpde|Ch.3 Def.7 p.43>

  <subsubsection|<math|\<pm\>\<Gamma\>>-Convergence>

  It is said that <math|u<rsub|m>> \ \Pplus-Gamma converges\Q to <math|u> on
  <math|\<Omega\>> and is written

  <\equation>
    u<rsub|m><above|\<longrightarrow\>|+\<Gamma\>>u as
    m\<rightarrow\>\<infty\>
  </equation>

  when for any sequence <math|x<rsub|m>\<rightarrow\>\<infty\>> as
  <math|m\<rightarrow\>\<infty\>>\ 

  <\equation>
    liminf<rsub|m\<rightarrow\>\<infty\>>
    u<rsub|m><around*|(|x<rsub|m>|)>\<geqslant\>u<around*|(|x|)>
  </equation>

  and there exists a sequence\ 

  <\equation>
    lim<rsub|m\<rightarrow\>\<infty\>> u<rsub|m><around*|(|<wide|x|^><rsub|m>|)>=u<around*|(|x|)><text|>
  </equation>

  and likewise said that <math|u<rsub|m>> \Pminus-Gamma converges\Q to u on
  <math|\<Omega\>> when <math|-u<rsub|m>> \Pplus-Gamma converges\Q to
  <math|-u> and is written

  <\equation>
    u<rsub|m><above|\<longrightarrow\>|-\<Gamma\>>u as
    m\<rightarrow\>\<infty\>
  </equation>

  when for any sequence <math|x<rsub|m>\<rightarrow\>\<infty\>> as
  <math|m\<rightarrow\>\<infty\>>\ 

  <\equation>
    limsup<rsub|m\<rightarrow\>\<infty\>>
    u<rsub|m><around*|(|x<rsub|m>|)>\<leqslant\>u<around*|(|x|)>
  </equation>

  and there exists a sequence\ 

  <\equation>
    lim<rsub|m\<rightarrow\>\<infty\>> u<rsub|m><around*|(|<wide|x|^><rsub|m>|)>=u<around*|(|x|)><text|>
  </equation>

  The phrasing \Pplus-Gamma converges\Q and \Pminus-Gamma\Q converges comes
  from <cite-detail|livflpde|Ch.3 Def.7 p.43> which works but it would sound
  better to say that <math|u<rsub|m>> converges to <math|u> from above and
  <math|u<rsub|m>> converges to <math|u> from below and therefore this
  language and phrasing will be used without risk of confusion. An essential
  feature is that the Hessian exists even at points of discontinuity where
  the Jacobian does not.

  <\theorem>
    The successive approximation algorithm described in <cite|scsa> proves
    that the sequence of imaginary parts of the roots of the Riemann zeta
    function in the upper half-plane enumerated by <math|y<rsub|n>>
    <cite|z0t> is unique and exists because <math|y<rsub|n>> is the foci of
    the holomorphic flow defined by logarithmic derivative of the Riemann
    zeta function and therefore the flows in the region of the foci always
    conerge either from above or below, e.g. \ <math|>
    <math|y<rsub|n,m><above|\<longrightarrow\>|-\<Gamma\>>y<rsub|n> or
    \ y<rsub|n,m><above|\<longrightarrow\>|+\<Gamma\><rsub|>>y<rsub|n>> as
    <math|m\<rightarrow\>\<infty\>> where <math|y<rsub|n,m>> is the
    França-LeClair iteration <cite-detail|z0t|Appendix A>\ 
  </theorem>

  <\proof>
    Something involving the Riemann-Sobolev-Newton(RSH) iteration.
    <cite-detail|rzNewtonFlow|Appendix A>
  </proof>

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|5>
      <bibitem*|1><label|bib-ocvshjb>Martino Bardi<localize| and >Italo
      Capuzzo-Dolcetta.<newblock> <with|font-shape|italic|Optimal Control and
      Viscosity Solutions of Hamilton-Jacobi-Bellman Equations (Systems &
      Control: Foundations & Applications)>.<newblock> Birkhäuser Boston,
      1<localize| edition>, dec 1997.<newblock>

      <bibitem*|2><label|bib-z0t>André<nbsp>LeClair Guilherme
      França.<newblock> Transcendental equations satisfied by the individual
      zeros of riemann \<zeta\>, dirichlet and modular l-functions.<newblock>
      <with|font-shape|italic|Communications in Number Theory and Physics>,
      2015.<newblock>

      <bibitem*|3><label|bib-livflpde>N.<nbsp>Katzourakis.<newblock>
      <with|font-shape|italic|An Introduction To Viscosity Solutions for
      Fully Nonlinear PDE with Applications to Calculus of Variations in
      L\<infty\>>.<newblock> SpringerBriefs in Mathematics. Springer
      International Publishing, 2014.<newblock>

      <bibitem*|4><label|bib-scsa>K.<nbsp>Krishna M.H. Chang.<newblock> A
      successive approximation algorithm for stochastic control
      problems.<newblock> <with|font-shape|italic|Applied Mathematics and
      Computation>, 18(2):155\U165, Feb. 1986.<newblock>

      <bibitem*|5><label|bib-rzNewtonFlow>J<nbsp>W Neuberger, C Feiler, H
      Maier<localize|, and >W<nbsp>P Schleich.<newblock> Newton flow of the
      riemann zeta function: separatrices control the appearance of
      zeros.<newblock> <with|font-shape|italic|New Journal of Physics>,
      16(10):103023, 2014.<newblock>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.2.1|2>>
    <associate|auto-5|<tuple|1|2>>
    <associate|bib-livflpde|<tuple|3|3>>
    <associate|bib-ocvshjb|<tuple|1|2>>
    <associate|bib-rzNewtonFlow|<tuple|5|?>>
    <associate|bib-scsa|<tuple|4|3>>
    <associate|bib-z0t|<tuple|2|3>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|ocvshjb|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      livflpde

      ocvshjb

      livflpde

      livflpde

      scsa

      z0t

      z0t

      rzNewtonFlow
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definitions
      and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Pointwise Derivatives: The
      Jacobian Vector and Hessian Matrix <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Semicontinuity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc><with|mode|<quote|math>|\<pm\>\<Gamma\>>-Convergence
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
<TeXmacs|1.99.3>

<style|article>

<\body>
  <\doc-data|<doc-title|Stochastic Optimal
  Control>|<doc-author|<author-data|<\author-affiliation>
    <date|>
  </author-affiliation>>>>
    \;
  </doc-data>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Optimal
    Stochastic Control Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Wiener Process: Brownian Motion/White
    Noise Derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|2tab|1.1.1<space|2spc>The <with|mode|math|It<wide|o|^>>
    Process: Integrated Wiener Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.2<space|2spc>The Hamilton-Jacobi-Bellman Equation
    for Controlled Markov Diffusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.3<space|2spc>Viscosity Solutions of the HJB
    Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|1.3.1<space|2spc>Finite Difference Approximations to
    HJB Equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.4<space|2spc>The Stochastic Principle of Optimality
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|1.4.1<space|2spc>Definitions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|2tab|1.4.2<space|2spc>Adjoint Equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>An
    Iterative Method To Solve Stochastic Optimal Control Problems>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>The Chang-Krishna Successive
    Approximation Algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|2tab|2.1.1<space|2spc>A Verification Theorem for the
    Dynamic Programming of Controlled Diffusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|2tab|2.1.2<space|2spc><with|mode|math|V<rsup|\<mu\>><around*|(|s,x|)>>
    Is The Unique Solution To A Boundary Value Problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|2tab|2.1.3<space|2spc>A Recurrently Defined Sequence of
    Controls <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.2<space|2spc>An Example: The Guilbaud-Pham Market
    Making Model <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>
  </table-of-contents>

  \;

  <section|Optimal Stochastic Control Theory>

  <subsection|Wiener Process: Brownian Motion/White Noise Derivative>

  <cite-detail|RandomIntegralEquations|Ch7 p.218>

  <subsubsection|The <math|It<wide|o|^>> Process: Integrated Wiener Process>

  An <math|It<wide|o|^>> process <math|x<around*|(|t,\<omega\>|)>\<in\>\<bbb-R\>>
  is an integrated Wiener process specified by the <math|It<wide|o|^>> random
  integral equation

  <\equation>
    x<around*|(|t,\<omega\>|)>=x<rsub|0><around*|(|\<omega\>|)>+<big|int><rsub|t<rsub|0>><rsup|t>a<around*|(|\<tau\>,x<around*|(|t,\<omega\>|)>|)>\<mathd\>\<tau\>+<big|int><rsub|t<rsub|0>><rsup|t>b<around*|(|\<tau\>,x<around*|(|\<tau\>,w|)>|)>\<mathd\>w<around*|(|\<tau\>,w|)>
  </equation>

  which is the integral formulation of the random differential equation

  <\equation>
    \<mathd\>x<around*|(|t,\<omega\>|)>=a<around*|(|t,x|)>\<mathd\>t+b<around*|(|t,x|)>\<mathd\>w<around*|(|t,\<omega\>|)><label|irde>
  </equation>

  where <math|w<around*|(|t,\<omega\>|)>> is a Wiener process.
  <cite-detail|RandomIntegralEquations|Ch7 p.218> If
  <math|b<around*|(|t,x|)>=0> then (<reference|irde>) becomes a determinstic
  first-order differential equation with random initial condition
  <math|x<rsub|0>\<in\>\<bbb-R\>>.\ 

  <subsection|The Hamilton-Jacobi-Bellman Equation for Controlled Markov
  Diffusions>

  <\definition>
    (Admissible Feedback Control Laws)

    A feedback control law

    <\equation>
      u<around*|(|t,x|)>=\<mu\><rsup|><around*|(|t,x|)>
    </equation>

    is said to be admissible if <math|\<mu\>> is a Borel measurable function
    and\ 

    <\enumerate-alpha>
      <item>there exists a Brownian motion
      <math|<around*|(|B<around*|(|t|)>,F<around*|(|t|)>|)>\<forall\>t\<geqslant\>0>
      having a solution <math|<around*|{|X<rsup|\<mu\>><around*|(|t|)>:s\<leqslant\>t\<leqslant\>T|}>>
      unique in probability law on <math|<around*|(|\<Omega\>,F,P|)>> that
      satisfies the SDE

      <\equation>
        \<mathd\>X<around*|(|t|)>=f<rsup|\<mu\>><around*|(|t,X<around*|(|t|)>|)>\<mathd\>t+\<sigma\><around*|(|t,X<around*|(|t|)>|)>\<mathd\>B<around*|(|t|)>\<forall\>s\<leqslant\>t\<leqslant\>T<label|ac>
      </equation>

      with initial value

      <\equation>
        X<around*|(|s|)>=x
      </equation>

      where <math|f<rsup|\<mu\>><around*|(|t,X<around*|(|t|)>|)>=f<around*|(|t,X<around*|(|t|)>,\<mu\><around*|(|t,X<around*|(|t|)>|)>|)>>.

      <item>The expected value of the moments of the solution
      <math|E<rsub|s,x><around*|\||X<rsup|\<mu\>><around*|(|t|)>|\|>> are
      bounded \ 

      <\equation>
        E<rsub|s,x><around*|{|<big|int><rsub|s><rsup|T><around*|\||\<mu\><around*|(|t,X<rsup|\<mu\>><around*|(|t|)>|)>|\|><rsup|k>\<mathd\>t|}>\<less\>\<infty\>\<forall\>k\<gtr\>0,t\<in\><around*|[|s,T|]>
      </equation>
    </enumerate-alpha>
  </definition>

  An important note about the notation of an expectation such as
  <math|E<rsub|s,x>>; in an expression such as this one, it means the
  expectation with respect to the integral of the measure over time <math|t>
  given initial time <math|s> and value <math|x>.\ 

  <subsection|The (Second-Order) Hamilton-Jacobi-Bellman(HJB) Equation>

  The Hamilton-Jacobi-Bellman(HJB) equation is a <math|2>-nd order partial
  differential equation

  <\equation>
    V<around*|(|t,x|)>=\<cal-H\><around*|(|t,x,D<rsub|x>
    V<around*|(|t,x|)>,D<rsub|x><rsup|2> V<around*|(|t,x|)>|)>
  </equation>

  where <math|D<rsub|x>=<frac|\<mathd\>|\<mathd\>x>> and
  <math|D<rsub|x><rsup|2>=<frac|\<mathd\>|\<mathd\>x<rsup|2>>> are first and
  second order differential operators called the Jacobians and Hessians
  respectively and being, in the scalar case of <math|k=1>, a scalar and a
  vector, whereas for <math|k\<gtr\>1> is a vector and symmetric non-negative
  definite matrix respectively. <cite-detail|cmpvs|IV.3 p.155> Let
  <math|\<cal-S\><rsub|+><rsup|n>> denote the set of symmetric positive
  semi-definite <math|n\<times\>n> matrices <math|A=<around*|(|A<rsub|i
  j>|)>\<forall\>i,j=1\<ldots\>n> and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|a=\<#3C3\>
    \<#3C3\><rprime|'>=a<around*|(|t,x,v|)>>|<cell|=<choice|<tformat|<table|<row|<cell|\<sigma\><around*|(|t,x,v|)><rsup|2>>|<cell|n=1>>|<row|<cell|\<sigma\><around*|(|t,x,v|)>
    \<sigma\><rprime|'><around*|(|t,x,v|)>>|<cell|n\<gtr\>1>>>>>>>>>><label|spsd>
  </equation>

  \ \ where <math|f<around*|(|t,x,v|)>,\<sigma\><around*|(|t,x,v|)>\<in\>C<rsup|1><around*|(|<wide|Q<rsup|>|\<bar\>><rsub|0>|)>>,
  <math|<wide|Q<rsup|>|\<bar\>><rsub|0>> is the closure of <math|Q<rsub|o>>,
  and <math|C<rsup|1>> is the space of at-least once differentiable functions
  then\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|tr a A>|<cell|=tr
    a<around*|(|t,x,v|)> A=tr A a<around*|(|t,x,v|)>>|<cell|=<choice|<tformat|<table|<row|<cell|A
    a<around*|(|t,x,v|)>>|<cell|n=1>>|<row|<cell|<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n>A<rsub|i
    j> a<rsub|i j><around*|(|t,x,v|)>>|<cell|n\<gtr\>1>>>>>>>>>><label|diffop>
    </equation>

  Now, for <math|<around*|(|t,x|)>\<in\><wide|Q|\<bar\>><rsub|0>> ,
  <math|p\<in\>\<bbb-R\><rsup|n>>, <math|A\<in\>\<cal-S\><rsub|+><rsup|n>>
  the Hamiltonian <math|V<around*|(|t,x|)>> can be articulated by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|V<around*|(|t,x|)>>|<cell|=sup<rsub|v\<in\>U><around*|[|-p\<cdot\>f<around*|(|t,x,v|)>*-<frac|tr
    A a<around*|(|t,x,v|)> |2>-L<around*|(|t,x,v|)>|]>>>|<row|<cell|>|<cell|\<cong\>\<cal-H\><around*|(|t,x,p,A|)>>>>>>
  </equation>

  where <math|L<around*|(|t,x,v|)>> is some continuous function satisifing
  the polynomial growth conditions

  <\equation>
    <around*|\||L<around*|(|t,x,v|)>\<leqslant\>C<around*|(|1+<around*|\||x|\|><rsup|k>+<around*|\||v|\|><rsup|k>|)>|\|><label|L>
  </equation>

  for some suitable constants <math|C> and <math|k>. Note that the time
  <math|t> does not appear on the right-hand side of the
  inequality.<space|1em>This effectively says that

  <\equation>
    p\<cong\>D<rsub|x> V<around*|(|t,x|)>
  </equation>

  and

  <\equation>
    A\<cong\>D<rsub|x><rsup|2> V<around*|(|t,x|)>
  </equation>

  When <math|U> is compact the supremum is always obtained and thus can be
  replaced equivalently with the the maximum value operator in this
  situation.\ 

  <\definition>
    The (2nd order) Hamilton-Jacobi-Bellman (HJB) equation which defines the
    value function <math|V<around*|(|t,x|)>> is given by

    <\equation>
      <frac|\<partial\>|\<partial\>t>V<around*|(|t,x|)>=\<cal-H\><around*|(|t,x,<frac|\<partial\>|\<partial\>x>V<around*|(|t,x|)>,<frac|\<partial\><rsup|2>|\<partial\>x<rsup|2>>V<around*|(|t,x|)>|)>\<forall\><around*|(|t,x<rsub|>|)>\<in\>Q<label|HJB>
    </equation>

    <cite-detail|schjb|Ch2.4 p.62 and Ch3.3p.182><cite-detail|cmpvs|IV.3
    p.156 and IX.3 p.324>
  </definition>

  Let <math|\<cal-S\><rsub|+><rsup|n>> be the set of symmetric non-negative
  definite <math|n\<times\>n> matrices <math|A=<around*|(|A<rsub|i j>|)>> and
  <math|a<around*|(|t,x,v|)>=\<sigma\>\<sigma\><rprime|'>> so that

  <\equation>
    tr a<around*|(|t,x,v|)> A=<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n>a<rsub|i
    j> A<rsub|i j>
  </equation>

  and

  <\equation>
    \<cal-H\><around*|(|t,x,p,A|)>=<around*|\<\|\|\>|-b<around*|(|t,x,v|)>\<cdot\>p-<frac|tr
    a<around*|(|t,x,v|)> A|2>-L<around*|(|t,x,v|)>|\<\|\|\>><rsub|\<infty\>,U>
  </equation>

  By introducing the differential operator <cite-detail|dsoc|5.5 p.123>

  <\equation>
    \<cal-A\><around*|(|t,x,u|)>\<Phi\><around*|(|t,x|)>=<frac|1|2><big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n>a<rsub|i
    j><frac|\<partial\><rsup|2>\<Phi\><around*|(|t,x|)>|\<partial\>x<rsub|i><around*|(|t|)>
    \<partial\>x<rsub|j><around*|(|t|)>><big|sum><rsub|i=1><rsup|n>b<rsub|i><around*|(|t,x|)><frac|\<partial\>\<Phi\><around*|(|t,x|)>|\<partial\>x<rsub|i><around*|(|t|)>><label|DO>
  </equation>

  \ the HJB equation (<reference|HJB>) can also be written\ 

  <\equation>
    <frac|\<partial\>|\<partial\>t>J<around*|(|t,x|)>=-max<rsub|u\<in\>U>
    <around*|[|L<around*|(|t,x,u|)>+\<cal-A\><around*|(|t,x,u|)>J<around*|(|t,x|)>|]>
  </equation>

  <cite|hjbsa>

  \;

  <subsection|Viscosity Solutions of the HJB Equation>

  Solutions to the viscosity approximation of the exact HJB equation
  correspond to probabilistic solutions of the exact HJB equations. To see
  this, let <math|\<varepsilon\>\<gtr\>0,x\<in\>\<bbb-R\><rsup|n>> then
  define the viscosity approximation of the HJB equation by

  <\equation>
    \<lambda\> u<rsup|\<varepsilon\>>+sup<rsub|a\<in\>A><around*|{|-f<around*|(|x,a|)>\<cdot\>D
    u<rsup|\<varepsilon\>>-\<ell\><around*|(|x,a|)>|}>=\<varepsilon\>\<Delta\>u<rsup|\<varepsilon\>>\<forall\>
  </equation>

  where <math|\<Delta\>f<around*|(|x|)>> is the Laplacian of <math|f> (its
  \ second partial derivative or a vector thereof if
  <math|dim<around*|(|x|)>\<gtr\>1>)\ 

  <\equation>
    \<Delta\>f<around*|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=<big|sum><rsub|i=1><rsup|n><frac|\<partial\><rsup|2>|\<partial\><rsup|>x<rsub|i><rsup|2>>f<around*|(|x|)>
  </equation>

  then define the stochastic differential equation

  <\equation>
    <around*|{|\<mathd\>y<around*|(|t|)>=f<around*|(|y<around*|(|t|)>,\<alpha\><around*|(|t|)>|)>\<mathd\>t+<sqrt|2\<varepsilon\>>\<mathd\>w<around*|(|t|)>:y<around*|(|0,\<cdot\>|)>=x|}><label|hjbvs>
  </equation>

  where <math|w<around*|(|t|)>=w<around*|(|t,1|)>> is a standard(normalized)
  Wiener process then the value function <math|v<rsup|\<varepsilon\>>>\ 

  <\equation>
    v<rsup|\<varepsilon\>><around*|(|x<around*|(|t|)>|)>=inf
    E<rsub|x><big|int><rsub|0><rsup|\<infty\>>\<ell\><around*|(|y<rsub|x><rsup|\<varepsilon\>><around*|(|t|)>,\<alpha\><around*|(|t|)>|)>e<rsup|-\<lambda\>t>\<mathd\>t
  </equation>

  which corresponds to an unbounded horizon problem where an optimal control
  over the trajectories of (<reference|hjbvs>) \ any
  'random<space|1em>perturbation' of the state equations of the
  (deterministic!) 'infinite horizon discounted regulator' \ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<tabular|<tformat|<table|<row|<cell|y<rprime|'><around*|(|t|)>>|<cell|=>|<cell|f<around*|(|y<around*|(|t|)>,\<alpha\><around*|(|t|)>|)>>>|<row|<cell|y<around*|(|y|)>>|<cell|=>|<cell|x>>>>>\<forall\>t\<gtr\>0>>>>>
  </equation>

  where the control <math|\<alpha\><around*|(|t|)>> is any measurable
  function from <math|t\<in\><around*|[|0,\<infty\>|]>\<rightarrow\>A> and
  <math|A> is the the control space. The limiting procedure to actually
  construct the probabilistic solutions of the exact HJB equation is outlined
  in <cite-detail|ocvshjb|1.8 p.20>.\ 

  <subsubsection|Finite Difference Approximations to HJB Equations>

  Consider a time step <math|h\<gtr\>0> and a spatial step
  <math|\<delta\>\<gtr\>0> satisfying the inequality

  <\equation>
    h<around*|[|a<around*|(|x,v|)>+\<delta\><around*|\||f<around*|(|x,v|)>|\|>|]>\<leqslant\>\<delta\><rsup|2>
  </equation>

  TODO: ...\ 

  <subsection|The Stochastic Principle of Optimality >

  <subsubsection|Definitions>

  <\definition>
    (Performance/Cost Functional) The performance functional measures the
    cost/energy of the controls <math|u>

    <\equation>
      J<around*|(|*u<around*|(|\<cdot\>|)>|)>=<big|int><rsub|0><rsup|T>f<around*|(|t,x<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>t+h<around*|(|x<around*|(|T|)>|)>
    </equation>

    where <math|f:<around*|[|0,T|]>\<times\>\<bbb-R\>*<rsup|n>\<times\>U\<rightarrow\>\<bbb-R\>>
    can be interpreted as a running cost and
    <math|h:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>> as a stopping cost.
    <cite-detail|schjb|2.2 p.54>

    \;
  </definition>

  <\definition>
    (Optimal Pair) An optimal state trajectory\ 

    <\equation>
      <wide|x|\<bar\>><around*|(|\<cdot\>|)>=<wide|x|\<bar\>><around*|(|\<cdot\>;<wide|u|\<bar\>><around*|(||)>|)>
    </equation>

    along with an optimal control

    <\equation>
      <wide|u|\<bar\>><around*|(|\<cdot\>|)>
    </equation>

    is called an optimal pair\ 

    <\equation>
      <around*|(|<wide|x|\<bar\>><around*|(|\<cdot\>|)>,<wide|u|\<bar\>><around*|(|\<cdot\>|)>|)>\<in\>\<bbb-R\><rsup|n>\<times\>\<cal-V\><rsub|ad><around*|[|0,T|]>
    </equation>

    where <math|\<cal-V\><rsub|ad><around*|[|0,T|]>> is the set of all
    admissible controls.<math|> \ \ <cite-detail|schjb|2.2 p.54>
  </definition>

  <subsubsection|Adjoint Equations>

  <cite-detail|schjb|3.1 p.115>

  <section|An Iterative Method To Solve Stochastic Optimal Control Problems>

  In <cite|scsa> a method to calculate a sequence of control functions
  <math|<wide|u|\<bar\>><rsub|n><around*|(|t|)>*=<wide|\<mu\>|\<bar\>><rsub|n><around*|(|t,X<around*|(|r|)>|)>>
  which comes arbitrarily close to being the limiting optimal control
  function of the stochastic differential equation

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|\<mathd\>X<around*|(|t|)>=f<around*|(|t,X<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>t+\<sigma\><around*|(|t,X<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>B<around*|(|t|)>>>>>><label|sdce>
  </equation>

  \ is derived by setting up the equations to calculate the optimal control

  <\equation>
    <wide|u|\<bar\>><around*|(|t|)>=<wide|\<mu\>|\<bar\>><around*|(|t,X<around*|(|t|)>|)>=lim<rsub|n\<rightarrow\>\<infty\>><wide|\<mu\>|\<bar\>><rsub|n><rsup|><around*|(|t,X<around*|(|t|)>|)>
  </equation>

  that \ minimizes the cost/energy functional

  <\equation>
    <tabular|<tformat|<table|<row|<cell|J<around*|(|t,x,\<mu\>|)>=E<rsub|t,x><around*|{|g<around*|(|T,X<rsup|\<mu\>><around*|(|T|)>|)>+<big|int><rsub|t><rsup|T>l<around*|(|s,X<rsup|\<mu\>><around*|(|s|)>,\<mu\><around*|(|s,X<rsup|\<mu\>><around*|(|s|)>|)>|)>\<mathd\>s|}><label|Josc>>>>>>
  </equation>

  among the set of all admissible feedback control law functions
  <math|<wide|u|\<bar\>><around*|(|t|)>> where <math|E<rsub|,x>> is the
  conditional expectation operator corresponding to the conditional
  probability measure

  <\equation>
    P<rsub|s,x><around*|(|\<cdot\>|)>:\<cal-F\>\<rightarrow\><around*|[|0,1|]>\<forall\>0\<leqslant\>s\<leqslant\>T,x\<in\>G
  </equation>

  where <math|<around*|(|\<Omega\>,\<cal-F\>,P|)>> is a complete (Polish)
  probability space and\ 

  <\equation>
    <around*|{|X<rsup|\<mu\>><around*|(|t|)>:t\<geqslant\>s|}>
  </equation>

  is the solution process of (<reference|sdce>) corresponding to the control

  <\equation>
    u<rsup|\<ast\>><rsub|n><around*|(|t|)>*=\<mu\><rsub|n><rsup|\<ast\>><around*|(|t,X<around*|(|r|)>|)>
  </equation>

  given initial conditions <math|<around*|(|s,x<around*|(|s|)>|)>>. In the
  more recent article <cite|hjbsa>, the solution is extended so that the
  control <math|u<around*|(|t|)>> enters into both the drift and diffision
  terms so that the SDE to solve becomes

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|\<mathd\>X<around*|(|t|)>=f<around*|(|t,X<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>t+\<sigma\><around*|(|t,X<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>B<around*|(|t|)>>>>>>
  </equation>

  In <cite|hjbsa>, (<reference|sdce>) is extended so that the control also
  enters into the diffusion term of the SDE(stochastic differential equation)\ 

  <subsection|The Chang-Krishna Successive Approximation Algorithm>

  <subsubsection|A Verification Theorem for the Dynamic Programming of
  Controlled Diffusions>

  Let <math|W<around*|(|s,x|)>\<in\>C<rsub|p><rsup|1,2><around*|(|Q|)>\<forall\><around*|(|s,x|)>\<in\>Q>
  be a solution of the dynamic programming equation

  <\equation>
    <tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<cell|W<rsub|s>+min<rsub|v\<in\>U><around*|[|A<rsup|v><around*|(|s|)>W+l<rsup|v><around*|(|s,x|)>|]>>|<cell|=0>>|<row|<cell|W<around*|(|s,x|)>>|<cell|=g<around*|(|s,x|)>>>>>>
  </equation>

  which is continuous on the closure <math|<wide|Q|\<bar\>>>, then

  <\equation>
    W<around*|(|s,x|)>\<leqslant\>J<around*|(|s,x,\<mu\>|)>\<forall\>\<mu\>\<in\>\<cal-V\><rsub|ad><around*|[|0,T|]>,
  </equation>

  and if <math|\<mu\><rsup|\<ast\>>\<in\>\<cal-V\><rsub|ad><around*|[|0,T|]>>
  satisfies

  <\equation>
    A<rsup|\<mu\><rsup|\<ast\>>><around*|(|s|)>W+l<rsup|\<mu\><rsup|\<ast\>>><around*|(|s,x|)>=min<rsub|v\<in\>U><around*|[|A<rsup|v><around*|(|s|)>W+l<around*|(|s,x,v|)>|]>
  </equation>

  then

  <\equation>
    <tabular|<tformat|<table|<row|<cell|W<around*|(|s,x|)>>|<cell|=J<around*|(|s,x,\<mu\><rsup|\<ast\>>|)>>>|<row|<cell|>|<cell|=V<rsup|v><around*|(|s,x|)>-V<rsup|\<mu\>><around*|(|s,x|)>\<leqslant\>0>>>>>
  </equation>

  where <math|V<rsup|\<mu\>>> and <math|V<rsup|v>\<in\>C<rsub|p><rsup|1,2><around*|(|<wide|Q|\<bar\>>|)>>
  be solutions to (<math|<reference|BVP>>) then

  <\equation>
    V<rsub|t><rsup|\<mu\>>+A<rsup|\<mu\>><around*|(|t|)>V<rsup|\<mu\>>+l<rsup|\<mu\>>=V<rsub|t><rsup|v>+min<rsub|v\<in\>U><around*|{|A<rsup|v><around*|(|t|)>V<rsup|v>+l<rsup|v>|}><label|OV>
  </equation>

  implies that <math|V<rsup|\<mu\>>\<geqslant\>V<rsup|v>> on Q thus
  <math|\<mu\><rsup|\<ast\>>> is an optimal feedback control law and
  <math|W<around*|(|s,x|)>> is its corresponding (optimal) value.
  <cite-detail|dsoc|VI.4 p.159><cite-detail|scsa|Theorem 2.2>

  <subsubsection|<math|V<rsup|\<mu\>><around*|(|s,x|)>> Is The Unique
  Solution To A Boundary Value Problem>

  The boundary value problem

  <\equation>
    <tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<cell|<frac|\<partial\>|\<partial\>s>V<rsub|><around*|(|s,x|)>+A<rsup|\<mu\>><around*|(|s|)>V<around*|(|s,x|)>+l<rsup|\<mu\>><around*|(|s,x|)>>|<cell|=0>>|<row|<cell|V<around*|(|s,x|)>>|<cell|=g<around*|(|s,x|)>>>>>><label|BVP>
  </equation>

  corresponding to <math|\<mu\>\<in\>\<cal-V\><rsub|ad><around*|[|0,T|]>> is
  solved by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|V<rsup|\<mu\>><around*|(|s,x|)>>|<cell|=J<around*|(|s,x,\<mu\>|)>\<in\>C<rsub|p><rsup|1,2><around*|(|<wide|Q|\<bar\>>|)>>>|<row|<cell|>|<cell|=E<rsub|s,x><around*|{|g<around*|(|T,X<rsup|\<mu\>><around*|(|T|)>|)>+<big|int><rsub|s><rsup|T>l<rsup|\<mu\>><around*|(|t,X<rsup|\<mu\>><around*|(|t|)>|)>\<mathd\>t|}>>>>>>
  </equation>

  where <math|<wide|Q|\<bar\>>> is the closure of <math|Q>.
  <cite-detail|scsa|Lemma 3.1>

  <subsubsection|A Recurrently Defined Sequence of Controls>

  Choose an arbitrary <math|v<rsub|0>\<in\>U> and let <math|V<rsup|0>> be the
  solution of the boundary value equation (<reference|BVP>) corresponding to
  <math|\<mu\><rsup|0>=v<rsub|0>> then define a recurrent sequence of
  admissible feedback control laws by

  <\equation>
    A<rsup|\<mu\><rsub|n>><around*|(|t|)>V<rsup|n-1>+l<rsup|\<mu\><rsub|n>>=min<rsub|v\<in\>U><around*|{|A<rsup|v><around*|(|t|)>V<rsup|n-1>+l<rsup|v>|}>\<forall\>n\<geqslant\>1
  </equation>

  where <math|V<rsup|n>\<in\>C<rsub|p><rsup|1,2><around*|(|<wide|Q|\<bar\>>|)>>
  is the solution of (<reference|BVP>) corresponding to
  <math|\<mu\><rsub|n>\<in\>\<cal-V\><rsub|ad><around*|[|0,T|]>> then the
  sequence of controls <math|\<mu\><rsub|n>> converges to the optimal
  feedback control law <math|\<mu\><rsup|\<ast\>><around*|(|t,x|)>> and
  <math|V<rsup|\<ast\>><around*|(|t,x|)>> is the optimal value of the control
  problem

  <\equation>
    lim<rsub|n\<rightarrow\>\<infty\>>\<mu\><rsub|n>=\<mu\><rsup|<rsup|*<around*|\<nobracket\>|\<ast\>|\<nobracket\>>>>
  </equation>

  <\equation>
    lim<rsub|n\<rightarrow\>\<infty\>>V<rsup|n><around*|(|t,x|)>\<longequal\>V<rsup|\<ast\>><around*|(|t,x|)>
  </equation>

  Let

  <\equation>
    W<rsup|n><around*|(|t,x|)>=V<rsup|n><around*|(|t,x|)>-V<rsup|n-1><around*|(|t,x|)>
  </equation>

  <math|\<forall\>n\<geqslant\>1> then by ... ***under construction***

  <subsection|An Example: The Guilbaud-Pham Market Making(GPMM) Model>

  In the context context of HJB solutions,the Guilbaud-Pham market making
  model(GPMM) <cite|gpmm> \ constitutes an optimal stochastic control problem
  defined a mixed regular/impulse regime swithing jump-diffusion on a
  5-dimensional state space <math|x\<in\>\<bbb-R\><rsup|5>> defined by

  <\equation>
    x<rsub|t>=<around*|(|t,X<rsub|t>,Y<rsub|t>,P<rsub|t>,S<rsub|t>|)>\<in\>\<bbb-R\><rsup|5>\<forall\>t\<in\><around*|[|0,T|]>
  </equation>

  so that the value function is written\ 

  <\equation>
    v<around*|(|x<rsub|t>|)>=sup<rsub|\<alpha\>\<in\>\<cal-A\>>E<rsub|x<rsub|t>><around*|[|U<around*|(|L<around*|(|x<rsub|t>|)>|)>-\<gamma\><big|int><rsub|0><rsup|T>g<around*|(|Y<rsub|t>|)>\<mathd\>t|]>
  </equation>

  where\ 

  <\equation>
    L<around*|(|x<rsub|t>|)>=X<rsub|t>+Y<rsub|t>
    P<rsub|t>-<around*|\||Y<rsub|t>|\|> <frac|S<rsub|t>|2>-\<varepsilon\>
  </equation>

  so that (<reference|Josc>) becomes

  <\equation>
    <tabular|<tformat|<table|<row|<cell|J<around*|(|x<rsub|t>|)>>|<cell|=E<rsub|x<rsub|t>><around*|[|U<around*|(|L<around*|(|x<rsub|t>|)>|)>-\<gamma\><big|int><rsub|0><rsup|T>g<around*|(|Y<rsub|t>|)>\<mathd\>t|]>>>|<row|<cell|>|<cell|=E<rsub|x<rsub|t>><around*|[|U<around*|(|X<rsub|t>+Y<rsub|t>
    P<rsub|t>-<around*|\||Y<rsub|t>|\|> <frac|S<rsub|t>|2>-\<varepsilon\>|)>-\<gamma\><big|int><rsub|0><rsup|T>g<around*|(|Y<rsub|t>|)>\<mathd\>t|]><label|Jxt>>>>>>
  </equation>

  <big-table|<math|<tabular|<tformat|<table|<row|<cell|<wide*|variable|\<wide-underbrace\>>>|<cell|<wide*|description
  of the process|\<wide-underbrace\>>>>|<row|<cell|X<rsub|t>>|<cell|<tabular|<tformat|<table|<row|<cell|balance/cash
  level/value>>|<row|<cell|the difference between the totals >>|<row|<cell|of
  the credit and debit sides of an account>>>>>>>|<row|<cell|Y<rsub|t>>|<cell|inventory
  level>>|<row|<cell|P<rsub|t>>|<cell|midprice
  >>|<row|<cell|S<rsub|t>>|<cell|spread>>|<row|<cell|>|<cell|>>|<row|<cell|U<around*|(|v|)>>|<cell|utility
  function>>|<row|<cell|g<around*|(|y|)>>|<cell|inventory variation
  measure>>|<row|<cell|>|<cell|>>|<row|<cell|\<varepsilon\>>|<cell|fixed
  transaction fee>>|<row|<cell|\<gamma\>>|<cell|inventory variation
  multiplier>>>>>>|<label|state>The State Variables, Functional Forms, and
  Parameters of the Model>

  <subsubsection|Specialization to the Mean-Variance Case>

  In this instance, <math|P<rsub|t>> is assumed a martingale, the utility is
  the identity function <math|U<around*|(|X<rsub|t>|)>=X<rsub|t>> and the
  quadratic creteria <math|g<around*|(|Y<rsub|t>|)>=Y<rsub|t><rsup|2>> is
  singled out so that (<math|<reference|Jxt>>) can be expressed as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|J<around*|(|x<rsub|t>|)>>|<cell|=E<rsub|x<rsub|t>><around*|[|U<around*|(|L<around*|(|x<rsub|t>|)>|)>-\<gamma\><big|int><rsub|0><rsup|T>g<around*|(|Y<rsub|t>|)>\<mathd\>t|]>>>|<row|<cell|>|<cell|=E<rsub|x<rsub|t>><around*|[|X<rsub|t>+Y<rsub|t>
    P<rsub|t>-<around*|\||Y<rsub|t>|\|> <frac|S<rsub|t>|2>-\<varepsilon\>-\<gamma\><big|int><rsub|0><rsup|T>Y<rsub|t><rsup|2>\<mathd\>t|]><label|Jxt>>>>>>
  </equation>

  \;

  <\bibliography|bib|tm-alpha|references.bib>
    <\bib-list|8>
      <bibitem*|11><label|bib-gpmm>F.<nbsp>Guilbaud<localize| and
      >H.<nbsp>Pham.<newblock> Optimal High Frequency Trading with limit and
      market orders.<newblock> <with|font-shape|italic|ArXiv e-prints>, jun
      2011.<newblock>

      <bibitem*|BC97><label|bib-ocvshjb>Martino Bardi<localize| and >Italo
      Capuzzo-Dolcetta.<newblock> <with|font-shape|italic|Optimal Control and
      Viscosity Solutions of Hamilton-Jacobi-Bellman Equations (Systems &
      Control: Foundations & Applications)>.<newblock> Birkauser Boston,
      1<localize| edition>, 1997.<newblock>

      <bibitem*|Bha72><label|bib-RandomIntegralEquations>A.T.<nbsp>Bharucha-Reid.<newblock>
      <with|font-shape|italic|Random Integral Equations>,
      <localize|volume><nbsp>96<localize| of
      ><with|font-shape|italic|Mathematics in Science and
      Engineering>.<newblock> Academic Press, 1972.<newblock>

      <bibitem*|CK86><label|bib-scsa>M.H.<nbsp>Chang<localize| and
      >K.<nbsp>Krishna.<newblock> A successive approximation algorithm for
      stochastic control problems.<newblock> <with|font-shape|italic|Applied
      Mathematics and Computation>, 18(2):155\U165, Feb. 1986.<newblock>

      <bibitem*|FR75><label|bib-dsoc>W.H.<nbsp>Fleming<localize| and
      >R.W.<nbsp>Rishel.<newblock> <with|font-shape|italic|Deterministic and
      stochastic optimal control>.<newblock> Applications of mathematics.
      Springer-Verlag, 1975.<newblock>

      <bibitem*|FS06><label|bib-cmpvs>W.H.<nbsp>Fleming<localize| and
      >H.M.<nbsp>Soner.<newblock> <with|font-shape|italic|Controlled Markov
      Processes and Viscosity Solutions>.<newblock> Stochastic Modelling and
      Applied Probability. Springer New York, 2006.<newblock>

      <bibitem*|PHG05><label|bib-hjbsa>Helfried Peyrl, Florian
      Herzon<localize|, and >Hans<nbsp>P.<nbsp>Geering.<newblock> Numerical
      solution of the hamilton-jacobi-bellman equation for stochastic optimal
      control.<newblock> <with|font-shape|italic|WSEAS International
      Conference on Dynamical Systems and Control, Venice Italy, Nov. 2-4>,
      2005.<newblock>

      <bibitem*|YZ99><label|bib-schjb>Jiongmin Yong<localize| and
      >Xun<nbsp>Yu Zhou.<newblock> <with|font-shape|italic|Stochastic
      Controls: Hamiltonian Systems and HJB Equations>.<newblock>
      <localize|Number><nbsp>43<localize| in >Applications of Mathematics:
      Stochastic Modelling and Applied Probability. Springer, 1999.<newblock>
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
    <associate|BVP|<tuple|41|4>>
    <associate|DO|<tuple|17|2>>
    <associate|HJB|<tuple|14|2>>
    <associate|Josc|<tuple|31|4>>
    <associate|Jxt|<tuple|51|?>>
    <associate|L|<tuple|11|?>>
    <associate|OV|<tuple|40|4>>
    <associate|ac|<tuple|4|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.5.2|3>>
    <associate|auto-11|<tuple|2|4>>
    <associate|auto-12|<tuple|2.1|4>>
    <associate|auto-13|<tuple|2.1.1|4>>
    <associate|auto-14|<tuple|2.1.2|5>>
    <associate|auto-15|<tuple|2.1.3|5>>
    <associate|auto-16|<tuple|2.2|5>>
    <associate|auto-17|<tuple|1|6>>
    <associate|auto-18|<tuple|2.2.1|?>>
    <associate|auto-19|<tuple|51|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|2.2.2|?>>
    <associate|auto-3|<tuple|1.1.1|1>>
    <associate|auto-4|<tuple|1.2|1>>
    <associate|auto-5|<tuple|1.3|2>>
    <associate|auto-6|<tuple|1.4|3>>
    <associate|auto-7|<tuple|1.4.1|3>>
    <associate|auto-8|<tuple|1.5|3>>
    <associate|auto-9|<tuple|1.5.1|3>>
    <associate|bib-RandomIntegralEquations|<tuple|Bha72|6>>
    <associate|bib-cmpvs|<tuple|FS06|6>>
    <associate|bib-dsoc|<tuple|FR75|6>>
    <associate|bib-gpmm|<tuple|11|6>>
    <associate|bib-hjbsa|<tuple|PHG05|6>>
    <associate|bib-nmsh|<tuple|Pat13|3>>
    <associate|bib-ocvshjb|<tuple|BC97|6>>
    <associate|bib-schjb|<tuple|YZ99|6>>
    <associate|bib-scsa|<tuple|CK86|6>>
    <associate|diffop|<tuple|9|?>>
    <associate|firstHeading|<tuple|3|?>>
    <associate|footnote-1|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|footnr-1|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|hjbvs|<tuple|21|2>>
    <associate|irde|<tuple|2|1>>
    <associate|sdce|<tuple|29|3>>
    <associate|spsd|<tuple|8|?>>
    <associate|state|<tuple|1|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      RandomIntegralEquations

      RandomIntegralEquations

      cmpvs

      schjb

      cmpvs

      dsoc

      hjbsa

      ocvshjb

      schjb

      schjb

      schjb

      scsa

      hjbsa

      hjbsa

      dsoc

      scsa

      scsa

      gpmm
    </associate>
    <\associate|table>
      <tuple|normal|The State Variables, Functional Forms, and Parameters of
      the Model|<pageref|auto-17>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Optimal
      Stochastic Control Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Wiener Process: Brownian
      Motion/White Noise Derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>The
      <with|mode|<quote|math>|It<wide|o|^>> Process: Integrated Wiener
      Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Hamilton-Jacobi-Bellman
      Equation for Controlled Markov Diffusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>The (Second-Order)
      Hamilton-Jacobi-Bellman(HJB) Equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Viscosity Solutions of the
      HJB Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.4.1<space|2spc>Finite Difference
      Approximations to HJB Equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>The Stochastic Principle of
      Optimality \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|1.5.1<space|2spc>Definitions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.5.2<space|2spc>Adjoint Equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>An
      Iterative Method To Solve Stochastic Optimal Control Problems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The Chang-Krishna Successive
      Approximation Algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>A Verification Theorem for
      the Dynamic Programming of Controlled Diffusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|2tab>|2.1.2<space|2spc><with|mode|<quote|math>|V<rsup|\<mu\>><around*|(|s,x|)>>
      Is The Unique Solution To A Boundary Value Problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|2.1.3<space|2spc>A Recurrently Defined
      Sequence of Controls <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>An Example: The
      Guilbaud-Pham Market Making(GPMM) Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|2.2.1<space|2spc>Specialization to the
      Mean-Variance Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
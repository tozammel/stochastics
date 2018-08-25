<TeXmacs|1.99.3>

<style|generic>

<\body>
  \;

  <\algorithm>
    <cite|vihjb> (The Variational Iteration Method)

    <\enumerate-numeric>
      <item>Minimize the Hamiltonian <math|H<around*|(|t,x,v,V<rsub|x>|)>> to
      derive a control law of the form

      <\equation>
        u<rsup|\<ast\>><around*|(|t|)>=\<psi\><around*|(|t,x,<frac|\<partial\>|\<partial\>x>V<around*|(|t,x|)>|)><label|controlaw>
      </equation>

      <item>Let <math|n=0> and form <math|V<rsub|0><around*|(|t,x|)>> to
      compute the optimal control <math|u> and its corresponding trajectories
      <math|x<around*|(|t|)>> and <math|J<rsub|0><around*|(|t|)>>

      <item>Derive the Hamilton-Jacobi-Bellman equations corresponding to the
      optimal controls

      <\equation>
        <wide|x|\<dot\>><around*|(|t|)>=f<around*|(|t,x<around*|(|t|)>,u<around*|(|t|)>|)>
        <label|oc1>
      </equation>

      <\equation>
        x<around*|(|t<rsub|0>|)>=x<rsub|0>
      </equation>

      <\equation>
        J<around*|(|x<rsub|0>,u<around*|(|t|)>|)>=\<phi\><around*|(|t<rsub|1>,x<around*|(|t<rsub|1>|)>|)>+<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>L<around*|(|t,x<around*|(|t|)>,u<around*|(|t|)>|)>\<mathd\>t
      </equation>

      <item>Let <math|n\<rightarrow\>n+1> and solve the nonlinear equation

      <\equation>
        <choice|<tformat|<table|<row|<cell|V<rsub|t>+V<rsub|x>
        f<around*|(|t,x<around*|(|t|)>,\<psi\>|)>+L<around*|(|t,x<around*|(|t|)>,\<psi\>|)>=0>>|<row|<cell|V<around*|(|t<rsub|1>,x<rsub|1>|)>=\<phi\><around*|(|t<rsub|1>,x<rsub|1>|)>>>>>>
      </equation>

      using the variational iteration method to obtain the expression for the
      value function (the function itself, not just its value at a point!)
      <math|V<around*|(|t,x|)>> and substitute it into
      (<reference|controlaw>) to form the optimal control
      <math|u<rsup|\<ast\>><around*|(|t|)>>

      <item>Substitute the optimal control
      <math|u<rsup|\<ast\>><around*|(|t|)>> formed in the previous step
      into<space|1em><math|<wide|x|\<dot\>><around*|(|t|)>=f<around*|(|t,x<around*|(|t|)>,u<around*|(|t|)>|)>
      > with initial value <math|x<around*|(|t<rsub|0>|)>=x<rsub|0>> to
      obtain the optimal trajectory <math|x<rsup|\<ast\>><around*|(|t|)>> and
      score function <math|J<rsub|n><around*|(|t|)>>

      <item>If <math|<around*|\||J<rsub|n-1>-J<rsub|n>|\|>\<less\>\<epsilon\>>
      then <math|J=J<rsub|n>> and the calculation is finished\ 
    </enumerate-numeric>
  </algorithm>

  <\bibliography|bib|tm-alpha|references.bib>
    <\bib-list|4>
      <bibitem*|BMM12><label|bib-ocvi>Samira Berkani, Farida
      Manseur<localize|, and >Ahmed Maidi.<newblock> Optimal control based on
      the variational iteration method.<newblock>
      <with|font-shape|italic|Computers & Mathematics with Applications>,
      64(4):604\U610, 2012.<newblock>

      <bibitem*|CK86><label|bib-scsa>M.H.<nbsp>Chang<localize| and
      >K.<nbsp>Krishna.<newblock> A successive approximation algorithm for
      stochastic control problems.<newblock> <with|font-shape|italic|Applied
      Mathematics and Computation>, 18(2):155\U165, Feb. 1986.<newblock>

      <bibitem*|KDK13><label|bib-vihjb>B.<nbsp>Kafash,
      A.<nbsp>Delavarkhalafi<localize|, and >S.M.<nbsp>Karbassi.<newblock>
      Application of variational iteration method for
      hamilton\Ujacobi\Ubellman equations.<newblock>
      <with|font-shape|italic|Applied Mathematical Modelling>,
      37(6):3917\U3928, 2013.<newblock>

      <bibitem*|PHG05><label|bib-hjbsa>Helfried Peyrl, Florian
      Herzon<localize|, and >Hans<nbsp>P.<nbsp>Geering.<newblock> Numerical
      solution of the hamilton-jacobi-bellman equation for stochastic optimal
      control.<newblock> <with|font-shape|italic|WSEAS International
      Conference on Dynamical Systems and Control, Venice Italy, Nov. 2-4>,
      2005.<newblock>
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
    <associate|Hede|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-1|<tuple|6|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|6|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-hjbsa|<tuple|PHG05|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-ocvi|<tuple|BMM12|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-scsa|<tuple|CK86|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-vihjb|<tuple|KDK13|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|controlaw|<tuple|3|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|oc1|<tuple|4|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ocvi

      vihjb

      scsa

      hjbsa

      vihjb
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Calculating
      <with|mode|<quote|math>|\<phi\><rsub|i><around*|(|t,y|)>> With The
      Varitional Iteration Method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
<TeXmacs|1.99.3>

<style|generic>

<\body>
  The Riesz-Fejer Theorem. <cite-detail|li1|G.3p54>

  If <math|F<around*|(|x|)>\<geqslant\>0\<forall\>x\<in\>\<bbb-R\>> is an
  entire exponential function with

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log<rsup|+><around*|(|F<around*|(|x|)>|)>|1+x<rsup|2>>\<mathd\>x\<less\>\<infty\>
  </equation>

  then there also exists an entire exponential function
  <math|f<around*|(|x|)>> without zeros in the upper half-plane
  <math|\<frak-I\><around*|(|x|)>\<gtr\>0>
  (<math|\<frak-I\>\<cong\>Im,>imaginary part) such that

  <\equation>
    <text|>F<around*|(|x|)>=f<around*|(|x|)>\<cdot\><wide|f<around*|(|x|)>|\<bar\>>=<around*|\||f<around*|(|x|)>|\|><rsup|2>\<forall\>x\<in\>\<bbb-R\>
  </equation>

  <\bibliography|bib|tm-plain|references.bib>
    <\bib-list|1>
      <bibitem*|1><label|bib-li1>Paul Koosis.<newblock>
      <with|font-shape|italic|The logarithmic integral I>.<newblock>
      Cambridge University Press, 1988.<newblock>
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
    <associate|auto-1|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-li1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      li1
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
<TeXmacs|1.99.3>

<style|generic>

<\body>
  As in <cite-detail|cmpvs|IX.3>, for any function <math|W<around*|(|t,x|)>>,
  the <math|1>-st order forward and backward (alternatively left and right)
  difference quotients (in the 'space'-like variable <math|x>) defined by

  <\equation>
    \<Delta\><rsub|x><rsup|+>W<around*|(|t,\<delta\>|)>=<frac|W<around*|(|t,x+\<delta\>|)>-W<around*|(|t,x|)>|\<delta\>>
  </equation>

  <\equation>
    \<Delta\><rsub|x><rsup|->W<around*|(|t,\<delta\>|)>=<frac|W<around*|(|t,x|)>-W<around*|(|t,x-\<delta\>|)>|\<delta\>>
  </equation>

  and the <math|2>-nd order difference quotient (also in the 'space'-like
  variable <math|x>) by

  <\equation>
    \<Delta\><rsub|x><rsup|2>W<around*|(|t,\<delta\>|)>=<frac|W<around*|(|t,x+\<delta\>|)>+W<around*|(|t,x-\<delta\>|)>-2
    W<around*|(|t,x|)>|\<delta\><rsup|2>>
  </equation>

  \;

  and then define a similiar functional of the
  <math|<rprime|'>time<rprime|'>>-like variable <math|t>

  <\equation>
    \<Delta\><rsub|t><rsup|->W<around*|(|t,h|)>=<frac|W<around*|(|t,x|)>-W<around*|(|t-h,x|)>|h>
  </equation>

  <\bibliography|bib|tm-siam|references.bib>
    <\bib-list|1>
      <bibitem*|1><label|bib-cmpvs><with|font-shape|small-caps|W.<nbsp>Fleming><localize|
      and ><with|font-shape|small-caps|H.<nbsp>Soner>,
      <with|font-shape|italic|Controlled Markov Processes and Viscosity
      Solutions>, Stochastic Modelling and Applied Probability, Springer New
      York, 2006.<newblock>
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
    <associate|auto-1|<tuple|4|?|../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-cmpvs|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cmpvs
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
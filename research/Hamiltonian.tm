<TeXmacs|1.99.3>

<style|generic>

<\body>
  <doc-data|<doc-title|The Hamiltonian>|<doc-author|<author-data|<author-name|SC>|<\author-affiliation>
    <date>
  </author-affiliation>>>>

  The Hamilton of an optimal stochastic control problem can be written in the
  form

  <\equation>
    H<around*|(|t,x,p,M|)>=sup<rsub|a\<in\>\<cal-A\>><around*|[|b<around*|(|x,a|)>\<cdot\>p+<frac|\<sigma\><around*|(|x,a|)>\<sigma\><rprime|'><around*|(|x,a|)>M|2>+f<around*|(|t,x,a|)>|]>
  </equation>

  which, in the case that that the control set is a single initial value
  scalar <math|\<cal-A\>=<around*|{|a<rsub|0>|}>>, the HJB equation

  <\equation>
    -<frac|\<partial\>|\<partial\>t>v<around*|(|t,x|)>-H<around*|(|t,x,<frac|\<partial\>|\<partial\>x>v<around*|(|t,x|)>,<frac|\<partial\>|\<partial\>x<rsup|2>>v<around*|(|t,x|)>|)>=0
  </equation>

  reduces to the Cauchy (initial-value) problem

  <\equation>
    -<frac|\<partial\>|\<partial\>t>v<around*|(|t,x|)>-\<cal-L\><rsup|a<rsub|0>>v<around*|(|t,x|)>=f<around*|(|t,x,a<rsub|0>|)>
  </equation>

  <cite-detail|pham61|3.4.1>

  <\bibliography|bib|tm-alpha|references.bib>
    <\bib-list|1>
      <bibitem*|Pha09><label|bib-pham61>Huyên Pham.<newblock>
      <with|font-shape|italic|Continuous-time Stochastic Control and
      Optimization with Financial Applications>.<newblock>
      <localize|Number><nbsp>61<localize| in >Stochastic Modelling and
      Applied Probabilty. Springer, 2009.<newblock>
    </bib-list>
  </bibliography>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|3|?|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-pham61|<tuple|Pha09|?|../.TeXmacs/texts/scratch/no_name_4.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      pham61
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
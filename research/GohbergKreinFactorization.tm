<TeXmacs|1.99.3>

<style|generic>

<\body>
  <doc-data|<doc-title|The Gohberg-Krein Factorization
  Theorem>|<doc-author|<\author-data>
    \;
  <|author-data>
    \;

    \;
  </author-data>>>

  The following comes varbatim from <cite-detail|sft|9.1 p.225>

  <\definition>
    A chain is a family of orthogonal projectors\ 

    <\equation>
      \<pi\>=<around*|{|P|}>
    </equation>

    if for any distinct <math|P<rsub|1>,P<rsub|2>\<in\>\<pi\>> either
    <math|P<rsub|1>\<less\>P<rsub|2>> or <math|P<rsub|2>\<less\>P<rsub|1>>
    where <math|P<rsub|1>\<less\>P<rsub|2>> means
    <math|P<rsub|1>H\<subset\>P<rsub|2>H> that is <math|P<rsub|1>
    P<rsub|2>=P<rsub|2>P<rsub|1>=P<rsub|1>.> A bordered chain is a chain that
    contains 0 and the identity element <math|\<pi\>\<ni\>0,1>. A closed
    chain is a chain which coincides with its own closure.
  </definition>

  <\definition>
    A pair

    <\equation>
      <around*|(|P<rsup|->,P<rsup|+>|)>
    </equation>

    of orthogonal projectors in a closed chain <math|\<pi\>> with
    <math|P<rsup|->\<less\>P<rsup|+>> is called a gap of <math|\<pi\>> if
    <math|\<forall\>P\<in\>\<pi\>> either <math|P\<leqslant\>P<rsup|->> or
    <math|P\<geqslant\>P<rsup|+>> and the dimension of the gap
    <math|P<rsup|<rsub|+>>-P<rsup|->> is denoted\ 

    <\equation>
      dim<around*|[|P<rsup|+>H\<ominus\>P<rsup|->H|]>
    </equation>

    A bordered chain with one-dimensional gaps is called a maximal chain
    since it cannot be enlarged.\ 
  </definition>

  <\definition>
    An chain <math|\<pi\>> is an eigenchain of a bounded linear operator
    <math|A> on a seperable Hilbert space <math|H> if it satisfies

    <\equation>
      P A P=A P\<forall\>P\<in\>\<pi\>
    </equation>
  </definition>

  <\theorem>
    Let <math|\<pi\>> be a maximal chain, then the integrals

    <\equation>
      X<rsub|+>=<around*|(|m|)><big|int><rsub|\<pi\>><around*|(|1-P \ T
      P|)><rsup|-1>P T \<mathd\>P
    </equation>

    and

    <\equation>
      X<rsub|->=<around*|(|m|)><big|int><rsub|\<pi\>>\<mathd\>P T
      P<around*|(|1-P \ T P|)><rsup|-1>P\ 
    </equation>

    converge in norm for every element of <math|T\<in\>\<cal-L\><rsub|2>>
    such that

    <\equation>
      T=<around*|{|S:I-P S P is invertable|}>
    </equation>

    and the operator

    <\equation>
      A=<around*|(|I-T|)><rsup|-1>
    </equation>

    has a special factorization along <math|\<pi\>> with
    <math|D-I\<in\>\<cal-L\><rsub|2>>
  </theorem>

  where

  <\equation>
    D=I+<big|sum><rsub|j><around*|(|P<rsub|j><rsup|+>-P<rsub|j><rsup|->|)><around*|[|<around*|(|I-P<rsub|j><rsup|+>
    T P<rsup|+><rsub|j>|)><rsup|<rsup|-1>>-I|]><rsup|><around*|(|P<rsub|j><rsup|+>-P<rsub|j><rsup|->|)>
  </equation>

  where <math|<around*|{|<around*|(|P<rsub|j><rsup|->,P<rsub|j><rsup|+>|)>|}>>
  is the set of all gaps in the chain <math|\<pi\>>.

  \;

  <\bibliography|bib|tm-alpha|references.bib>
    <\bib-list|1>
      <bibitem*|Kal80><label|bib-sft>G.<nbsp>Kallianpur.<newblock>
      <with|font-shape|italic|Stochastic Filtering Theory>.<newblock>
      Applications of Mathematics. Springer-Verlag, 1980.<newblock>
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
    <associate|auto-1|<tuple|9|1|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-sft|<tuple|Kal80|1|../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      sft
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
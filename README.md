# A Rose for Emily

This uses constraint logic programming in Prolog to analyze the nonlinear timeline in Faulkner's story “A Rose for Emily”.

Burg, Boyle, & Lang (<a href="https://pdfs.semanticscholar.org/7fc2/ad493b034826f7773a44342b964bcf8b36f1.pdf">2000</a>) use the CLP(R) system, which was originally implemented as an add-on to Prolog.

My implementation updates their code with the more recent CLP(FD), included as a library in SWI-Prolog.

The main difference is that the original version uses real numbers, while my implementation uses integers.

However, some of their findings fail to replicate — notably, their dating of Emily's birth in 1850 and death in 1924.

## Code Outline
Events in the story are denoted by variables, e.g. Emily's birth is event K, and her death is A.

![Events in "A Rose for Emily"](/pics/emily-events.png)

We want to find out the range of years in which each event could have occurred.

Happily, the story has various intertemporal references, e.g. X occurred 6 years before Y.

We can encode these as constraints, in the form `Y - X = 6`.

![Intertemporal relations in "A Rose for Emily"](/pics/emily-constraints.png)

[Note: one of the original charts on p. 387 has a typo, mixing up E (stops lessons) with F (Colonel dies)]

The main body of code simply lists various constraints given throughout the story.

We can adjust the constraints by hand to test various hypotheses, e.g. that Emily died in 1924.

To run the program, load the file with Prolog and query: `emily([A,B,C,D,E,F,G,H,I,J,K,L,M,N]).`

## Results
<ul>
<li>Burg, Boyle, & Lang (2000: 385) conjecture that Emily died in 1924. However, this does not replicate: the latest year Emily could have died is 1923. So far, I haven't found an explanation for where this conflict comes from.</li>
  <ul>
  <li>If the inequality J > I is nonstrict, A=1924 is possible, but this contradicts the text: “she bought the rat poison, the arsenic…over a year after they had begun to say "Poor Emily"” (i.e. after she had started seeing Homer Barron).</li>
  <li>However, setting J ≥ I and A=1924 does not exactly replicate Burg, Boyle & Lang's (2000: 387) timeline in table 4.</li>
  </ul>
<li>A major controversy in the literature is whether Emily's taxes are remitted in the year of her father's death (C=H), or during her china-painting lessons (N ≤ C ≤ E); Burg, Boyle & Lang's (2000) program and ours confirm the latter.</li>
<li>As before, 1904 is inconsistent as the year when Emily's taxes are remitted.</li>
</ul>

## Possible Extensions
<ul>
<li>The original code has a function to list all possible orderings of events, which I can't manage to reproduce.</li>
<li>It would be helpful to visualize this as a collection of dials; move one and the rest move accordingly.</li>
<li>Conflicting interpretations of the story likely result from discontinuities (sudden jumps in the dials).</li>
<li>This method is applicable to any nonlinear storyline, as long as there are enough intertemporal references.</li>
<li>With a larger corpus of stories, it would be interesting to visualize how their simplexes look different.</li>
</ul>

## References
<ul>
<li>Faulkner, W. (<a href="http://xroads.virginia.edu/~drbr/wf_rose.html">1930</a>). “A Rose For Emily,” in Faulkner, W. (1950). <i>Collected Stories</i>. New York: Random House.</li>
<li>Burg, J., Boyle, A., & Lang, S.-D. (<a href="https://pdfs.semanticscholar.org/7fc2/ad493b034826f7773a44342b964bcf8b36f1.pdf">2000</a>). “Using Constraint Logic Programming to Analyze the Chronology in "A Rose for Emily".” <i>Computers and the Humanities</i> 34(4), pp. 377-92</li>
</ul>

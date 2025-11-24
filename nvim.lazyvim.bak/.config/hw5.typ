#import "@preview/cetz:0.4.2"

#align(center)[
  #title("250 Homework #5 (Fall 2025)")
  == Jenna Bates #footnote(numbering: "*")[Collaborated with Nobody.]
]
#v(12pt)

This assignment is due at 11:59 p.m. on Friday 21 November 2025, to be submitted on Gradescope. Late assignments (with penalty, unless excused) will be accepted until 11:59 p.m. on Saturday 22 November 2025, and not after. Please see the syllabus for more details on homework grading and late penalties. In particular, make sure that your submission confirms to the posted formatting.

All problems come from the textbook. For some of those problems, the versions written here provide more hints and/or specify more explicitly the structure required of the solutions.
test
See the Canvas Homework web page for detailed instructions on how to format solutions. Starting with this Homework, solutions that do not follow those formatting instructions will be returned for rewriting and resubmission with a small penalty. Also, when submitting to Gradescope, please do not forget to assign pages to problems.
test 

#pagebreak()

= Q1. P9.6.4 [10 pts]
Suppose $G$ is a connected undirected graph with a vertex $v$ such that removing $v$ from $G$ makes the remaining graph disconnected. Such a $v$ is called an *articulation point*.

#block[
  #set enum(numbering: "(a)")
  + Give a necessary and sufficient condition on the DFS tree of $G$ for the root node to be an articulation point.
  
  + Give a necessary and sufficient condition on any non-root node in a DFS tree of $G$ for it to be an articulation point.
]

#emph[
  Notes/Comments:

  + In this problem you are given an arbitrary DFS tree $T$ of graph $G$ rooted at an arbitrary vertex.
  
  + A correct solution must provide a clear justification (although a complete proof is not necessary) as to WHY your conditions are correct.
  
  + As noted in class every non-tree edge is a back-edge of the graph (relative to tree $T$).
  
  + Hint for (b). Since tree $T$ is directed DOWN from the root, for every node $v ,$ you can identify the vertices ABOVE $v$ in tree $T .$ \
    Your condition for whether a non-root vertex is an articulation point should use the concepts of \"above\" and \"below\" as well as that of \"back-edges\".
]

== Solution:
#block[
  #set enum(numbering: "(a)")
  
  + The root node $r$ of the tree is an articulation point of G iff $r$ has at least two children.
  
    If $r$ only has one child, removing $r$ leaves the connected component containing its child and descendents. The child becomes the new root of the remaining graph and it remains connected. If there are no children at all, it is just a singular node.
    
    However, if $r$ has at least 2 children, removing $r$ (which has no proper ancestors), any back edge that is in the subtree of its children will either terminate within that tree or at $r$. Since no back edge can exist between a node in the subtree rooted in $c_1$ AND in $c_2$ (because the common ancestor is $r$ and a path between them must use $r$), removing $r$ disconnects the subgraphs. This makes $r$ and articulation point. 

  + A non-root node $v$ is an articulation point in $G$ iff $v$ has at least one child such that no vertex in the subtree rooted at $c$ has a back edge connecting it to a proper ancestor of $v$.
  
    This is because if you take out a non-root vertex, the graph is basically divided into v's subtrees and the rest of the graph (which are all the nodes above $v$ ). If $v$ is an articulation point, taking it out would isolate at least one part of the graph that used to be connected to the rest through $v$. 
    
    The path that connects any node $u$ in the subtree that has a child of $v$, $c$, as the root, to the root of $G$, $r$, must pass through both $c$ and $v$. So, if we take out $v$, we need to ensure that there is a path that connects $u$ to a proper ancestor of $v$. This is only fulfilled by back edges since all non-tree edges are back edges. 
]

#pagebreak()

= Q2. P9.8.7 [10 pts]
Figure 9-15 shows a weighted undirected graph representing driving distances among eight cities in the northeastern United States. Carry out a uniform-cost search (with a closed list, recognizing previously seen nodes) to find the shortest path distance to Boston from each city $x$.

// #figure(image("9-15.png"))

Show the steps of your search. That is, at each step show what item has been taken off the priority queue and which items are put on.

The notation you should use is that, when processing node $u$ and putting its neighbor $v$ on the open list, what should be put on the list is the triple $(u, k(v), bold(v))$, where $k(v)$ is the key associated with node $v$ for that insertion.

After completion also draw the tree routed at Boston that shows, starting from Boston, a shortest driving distance path to every city.

== Solution:
```
(B, 0, -) goes on
(B, 0, -) comes off
(P, 51, B) (Au, 166, B) (Am, 95, B) (H, 102, B) (C, 68, B) goes on
(P, 51, B) comes off
(H, 125, P) goes on
(C, 68, B) comes off
(M, 185, C)(Am, 165, C) (Au, 231, C)  goes on
(Am, 95, B) comes off
(M, 248, Am) (Al, 196, Am) (H, 148, Am) goes on
(H, 102, B) comes off
(Al, 215, H) goes on
(H, 125, P) is discarded
(H, 148, Am) is discarded
(Am, 165, C) is discarded
(Au, 166, B) comes off
(M, 346, Au) goes on
(M, 185, C) comes off
(Al, 343, M) goes on
(Al, 196, Am) comes off
(Al, 215, H) is discarded
(Au, 231, C) is discarded
(M, 248, Am) is discarded
(Al, 343, M) is discarded
(M, 346, Au) is discarded
```

#align(center + horizon)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(content: (padding: .1))
    cetz.tree.tree(("B", "P", ("C", "M"), "H", ("Am", "Al"), "Au"))
  })
]

#pagebreak()



= Q3. P9.8.8 [10 pts]
Here is a single-step distance matrix for a weighted directed graph (shown in Figure 9-16) that indicates driving times among six locations in Massachusetts during Friday rush hour. The locations are Amherst (Amh), Hadley (Had), North Amherst (NAm), North Hadley (NHa), Northampton (Ntn), and Sunderland (Sun). An entry of – in the table indicates that there is no edge. (You may ignore the numbers next to each town name in Figure 9-16 - these will be used in Problem 9.9.7.)

// #figure(image("9-16.png"))
// #figure(image("table.png", width: 50%))

Use a uniform-cost search (with a closed list, recognizing previously seen nodes) to determine the fastest driving route from North Amherst to Northampton.

Show the steps of your search. That is, at each step show what item has been taken off the priority queue and which items are put on.

The notation you should use is that, when processing node $u$ and putting its neighbor $v$ on the open list, what should be put on the list is the triple \$( u, k(v), {\\bf v})\$, where $k (v)$ is the key associated with node $v$ for that insertion.

Also, show the associated path, i.e, through which cities, that achieves that fastest driving route from North Amherst to Northampton and state the driving time required for that path.

== Solution:

````
(NAm, 0, -) goes on
(NAm, 0, -) comes off
(NHa, 10, NAm) (Amh, 19, NAm) (Sun, 14, NAm) go on
(NHa, 10, NAm) comes off
(Had, 20, NHa) (Sun, 22, NHa) go on
(Sun, 14, NAm) comes off
(Ntn, 36, Sun) goes on
(Amh, 19, NAm) comes off
(Had, 34, Amh) goes on
(Had, 20, NHa) comes off
(Ntn, 50, Had) goes on
(Sun, 22, NHa) is discarded
(Had, 34, Amh) is discarded
(Ntn, 36, Sun) comes off
````
The best path is North Amherst $->$ Sunderland $->$ Northampton (takes 36 minutes).

#pagebreak()

= Q4. P9.9.7 [10 pts]
(a) Conduct an $A^*$ search of the weighted directed graph of Problem 9.8.8, with start node North Amherst and goal node Northampton.

Use the heuristic function $h$ defined by $ 
h("Ntn") &= &0,\
h("Had") &= &10,\
h("NHa") &= &16,\
h("Amh") &= &18,\
h("Sun") &= &18,\
h("NAm") &= &25. 
$ 
(This heuristic represents the time needed to drive to Northampton with no traffic. Figure 9-16 shows the heuristic value for each node, and the driving times are given in a table in Problem 9.8.8.)

Show the steps of your search. That is, at each step show what item has been taken off the priority queue and which items are put on.

The notation you should use is that, when processing node $u$ and putting its neighbor $v$ on the open list, what should be put on the list is the triple $(u, k(v) + h(v), bold(v))$, where $k(v)$ is the key associated with node $v$ for that insertion.

After completing the search, state explicitly what the shortest length path from North Amherst to Northampton is and the length of that path.

From the heuristic values we know that, without traffic, it was possible to drive from North Amherst to Northampton in 25 minutes. Can we determine, from the given information, whether that 25 minute path used the same route that you determined in part (a) of this problem?

Justify your answer. If the answer is yes, explain how you derived that. If the answer is no, a justification would be a possible assignment of driving times without traffic to the edges in the graph from Figure 9-16. Such an assignment would need two properties:

- The best-path distance from each node to Northampton must be the value given by the heuristic, and

- The best route from North Amherst to Northampton is different from the one you found in part (a).

#pagebreak()

== Solution:

#block[
  #set enum(numbering: "(a)")

+   ```

    (NAm, 25, -) goes on
    (NAm, 25, -) comes off
    (Amh, 37, NAm) (NHa, 26, NAm) (Sun, 32, NAm) goes on
    (NHa, 26, NAm) comes off
    (Had, 30, NHa) (Sun, 40, NHa) goes on
    (Had, 30, NHa) comes off
    (Amh, 50, Had) (Ntn, 50, Had) goes on
    (Sun, 32, NAm) comes off
    (Ntn, 36, Sun) goes on
    (Ntn, 36, Sun) comes off
  
    The best path is North Amherst $->$ Sunderland $->$ Northampton (takes 36 minutes).
```

+ We cannot determine that the 25 minute path that was used when there was no traffic is the same that was used in part (a) during rush hour traffic. The $A^*$ search used in part 1 found the shortest drive time during rush hour. Since the 36 minute time is significantly higher than the 25 minute time of the no-traffic route, we can see that there was significant impact by the traffic but we don't know if the optimal route itself is the same. Traffic is not uniform across the whole region so it will affect some roads and paths more than others. A route that is slightly longer in terms of distance might be way less affected by the rush hour traffic and end up being the fastest route during that time. We do not have access to the no-traffic edge costs.

=== Counter example: 

    We know the shortest rush-hour route is $P_(R) =$ NAm $->$ Sun $->$ Ntn. \
    Define $c_0(u,v)$ as the driving time cost without traffic.\
   $c_0(u,v)$ where the shortest no-traffic path, $P_N$ costs 25 minutes but $P_N != P_R$\

   Let's assign the following no-traffic edge costs (accounting for the required 25 minute shortest cost): 
   NAm $->$ NHa: 9\
   NHa $->$ Had: 6\
   Had $->$ Ntn: 10\
   NAm $->$ Sun: 10\
   Sun $->$ Ntn: 18\
   

  $P_N$ = Nam $->$ NHa $->$ Had $->$ Ntn $ = 25$ minutes
  The rush-hour optimal path $P_R$ = NAm $->$ Sun $->$ Ntn costs $10 + 18 = 28$ minutes without traffic. \

  $28 > 25$\

  Since the path that gives the minimum no-traffic time (25 minutes, NaM -> NHa -> Had -> Ntn) is different from the path that gives the minimum rush-hour time is different from the path that gives the minimum rush-hour time (36 minutes, NAm -> Sun ->Ntn)\ 
  
    
]


#pagebreak()

= Q5. P5.1.6 [10 pts]
Let $A$ be any finite alphabet. The language $A^(<= k)$ is defined to be the union $A^0 + A^1 + . . . + A^k$, the set of all strings over $A$ with length at most $k$. Prove by induction on all naturals $k$ that the languages $(nothing^* + A)^k$ and $A^(<= k)$ are equal.

_Note: Proving this requires proving both that $(nothing^* + A)^k subset.eq A^(<= k)$ and that $A^(<= k) subset.eq (nothing^* + A)^k.$_

== Solution:

Base Case: $k = 0$: To show $S^0 subset A^(<= 0)$, $S^0 = {lambda} and A^(<=0) = A^0 = {lambda}$\
${lambda} subset.eq {lambda} therefore P(0)$ 

Inductive Hypothesis: 

$u in S^n -> u in A^(<=n) therefore$ the length of $u$ is $abs(u) <= n$ by induction


#pagebreak()

= Q6. P5.2.4 [10 pts]
Construct a regular expression denoting the language of strings in ${ a, b }^*$ that have a number of $b$'s that is divisible by 3. \
_Note: For full marks, you must provide a justification as to why your answer is correct (A full proof is not necessary)._

== Solution:

A string that has exactly 3 'b's in the language (which can only use 'a's or 'b's), has any number of 'a's in between the three 'b's. This would be the regular expression $a^* b a^* b a^* b a^*$. However, if we want to have any number of 'b's that is divisible by three, we apply the Kleene star over the entire regular expression to get $(a^* b a^* b a^* b a^*)^*$, representing any number of repetitions of the previous expression.

Since the letter 'a' doesn't affect the count of 'b's, there can be any number of 'a's at any point in the string without affecting whether or not the number of 'b's is divisible by 3. 
Since the language also includes the empty string, which has 0 'b's, and 0 is divisible by 3, the entire string must have 0 or more of the $(a^* b a^* b a^* b a^*)$. 


#pagebreak()

= Q7. 5.4.7 [10 pts]
Prove that for any two languages $S$ and $T$, $(S T)^* S = S (T S)^*$.

Use induction on the definition of the Kleene star languages.

== Solution:

=== Inductive Hypothesis:
$P(i)$ is $(S T)^i S equiv S(T S)^i$ 

=== Base Case:
$i = 0$, $(S T)^0 S = lambda S = S$ and $S(T S)^0 = S lambda = S therefore P(0)$.

===  Inductive Step:
Assume $P(i)$ is true. \
Using the definition: $
  (S T)^(i+1) S \
    &= (S T)^i (S T) S &&"Definition" \
    &= (S T)^i S T S &&"Associative" \
    &= ((S T)^i S)(T S) &&"Associative" \
    &= S(T S)^i (T S) &&"Inductive hypothesis on" (S T)^i S \
    &= S(T S)^(i+1) &&"Definition"
$

#pagebreak()

= E.C. P9.10.10. Parts a-c [10 pts]
*Toads-and-Frogs* is a two-player game #footnote[This game, like several others in this section, comes from the book Winning Ways by Berlekamp, Conway, and Guy.] played on a finite one-dimensional array of squares, each of which may be occupied by a toad ($T$) or a frog ($F$).

Toads move to the left and frogs move to the right, either by moving into an adjacent vacant square or by jumping over a creature of the other kind into a vacant square. Unlike pegs in the Peg Jumping game, creatures that are jumped over remain in their squares.

The two players, Left and Right, alternate moves of toads and frogs respectively, until one player is unable to move and loses. For example, with starting position $F F F x x T T T$, Left must move to $F F F x T x T T$, Right must move to $F F x F T x T T$, and then Left has two possible moves, jumping to $F F T F x x T T$ or moving to $F F x F T T x T$.

#block[
  #set enum(numbering: "(a)")
  
  + Determine the winner of the game starting at $F F x T T$ under optimal play. (This is easy as no player ever has more than one choice.)

  + Determine the winner of the game starting at $F F x x T T$ under optimal play.

  + Determine the winner of the game starting at $F F x x x T T$ under optimal play.
]

#emph[
  Note: Your solutions must provide justifications as to why they are correct. \
  Note: Parts a and b are worth 5 points together. Easier. \
  Note: Part (c) is worth 5 points. Do NOT try (c) unless you have plenty of spare time.
]

== Solution:
#block[
  #set enum(numbering: "(a)")
  
  + Starting at $F F x T T$ under optimal play, the winner is Left. 
  This is the path:\
  1. $F F T x T$
  2. $F x T F T$
  3. $F T x F T$
  4. $x T F F T$
  5. $ T x F F T$
  6. No legal moves to the right -> Left wins\
The entire sequence here is forced moves and results in Right being unable to move. Left is the only possible winner here.
  
  + Starting at $F F x x T T$ under optimal play, the winner is Left.
  Path:
  1. $F F x T x T$
  2. $ F x F T x T $
  3. $F T x F x T$
  4. $x T F F x T$
  5. $T x F F x T$
  6. No legal moves for Right -> Left wins
  Left can force the sequence where Right is blocked by moving that initial move where $T_5 -> x_4$. If they make this choice and both players play optimally, Left wins.
  
  + Starting at $F F x x x T T$ under optimal play, the winner is Left

]

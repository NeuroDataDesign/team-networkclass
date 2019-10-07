# Fast Approximate Quadratic Programming for Graph Matching
JT Vogelstein, et al

* graph matching problem (GMP): Finding an alignment of vertices of two graphs to minimize the number of induced
edge disagreements (equivalent to QAP)
## QAP (Quadratic Assignment Problem)

* A = a <sub>u,v</sub>  , B = b <sub>u,v</sub> \in nxn space be two nxn real matrices 
* (QAP)  min trace(APB<sup>T</sup>P<sup>T</sup>)
          s.t. P is an nxn permutation matrix

## Relaxed QAP
* Since the feasible region of QAP is combinatorial, finding the global optimum in NP-hard
* Relax P to D, where D is the set of all nxn doubly stochastic matrices
* Difference is now that rather than all entries being 0 or 1, they only have to greater than 0. However, all row
and col sums must still be equal to 1.
* This yields the relaxed QAP (rQAP)
* (RQAP)  min trace(APB<sup>T</sup>P<sup>T</sup>)
          s.t. P is an nxn doubly stochastic matrix
          
## FAQ algorithm
* Algorithm has three steps:
1. Choose suitable initial condition
2. Find local solution to rQAP
3. Project back onto set of permutation matrices

* Require: Adjacency matrices A&B
* Output: P, estimated permutation matrix

Ensure: P^, an estimated permutation matrix
1. Choose an initialization, Po = nxn matrix where each entry is 1/n
2. while stopping criteria not met do
3. Compute the gradient of f at the current point via delF(P) = -APB<sup>T</sup> - A<sup>T</sup>P<sup>T</sup>B
4. Compute the direction Q(i) by the
Hungarian algorithm
* min trace(delf(P)<sup>T</sup> P)  s.t. P is an nxn doubly stochastic matrix
5. Compute the step size α(i) by solving
* min f(P + α(i)Q(i)) s.t. α is [0,1]
6. Update P(i) according to P(i+1) = P(i) + α(i)Q(i)
7. end while
8. Obtain P^ by solving Eq (11) via the Hungarian algorithm.

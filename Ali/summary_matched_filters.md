# Summary: Matched Filters for Noisy Induced Subgraph Detection
DL Sussman et al.

## Abstract
* The paper is concerned with the issue of two networks, both large but of different vertex numbers.
* An algorithm is proposed that centers and pads the adjacency matrix of the smaller network.
* Want to find the vertex correspondene between the two graphs

## 1 Introduction
* In neuroscience, different sized networks is an important topic when comparing brain networks in different species or individuals
* subgraph detection is also a subject of interest.
* when subgraphs aren't very large, tree searches and backtraining algorithms are common approaches.
* when subgraphs have >> 20 vertices, these approaches fail.
* these problems are subset of graph matching.
* An example is when two graphs have adjacency matrices A, B of equal, the graph matching problem (GMP) is NP-hard.
* A graph matching matched filer will be used to solve noisy induced subgraph problems

## 2 Background for Graph Matching
* The matched filter approach is different from subgraph isomporphism in that exact subgraph isomorphism finds an induced subgraph of the larger which is 
isomorphic to the larger graph.
* Our problem only seeks the closest induced subgraph, not the exact
* overall goal of this work is to find the specific vertices in a larger graph that correspond to those in a smaller graph
* It will be impossible if there are several copies in the larger graph
* tree-based GMP are guaranteed to find the exact solution, bur their computational scaling is very poor.
* "For the computational experiments in this manuscript we will rely on a
principled indefinite relaxation of the GMP constraints to the set of doubly stochastic matrices."
* This approach performs well in practice
* These approaches use seed vertices (a list of known correspondance between the two vertex sets)
* problem analyzed from viewpoint of ER moedl. The objective functions are based on topological considerations.
* the marginal probabilities of edges varies; the presence of an edge in one graph increase its conditional probabality in the other

## 3 Padding Approaches
* Three main schems: naive, centered, and oracle padding.
* naive will not be guaranteed, while centered and oracle are guaranteed to succeed (under mild model conditions).
* approach to computing is similar to that of the FAQ algorithm
* GMP consraints are relaxed and gradient descent is used
* computational complexity of each iteration is that of rectangular linear assignment

## 4 Experiments
*  effectiveness of graph matching matched filter demonstrated in both synthetic and real data settings.
* following scenarios used:
  * pairs of homogeneous CorrER graphs with varied uniform correlation
  * a planted partition model with goal to find dense partition 
  * heterogeneous model with different subgraph sampling schemes
  * Drosophila and Human connectomes
* without seeds very few vertices are matched correctly. 
* as number of seeds and correlations increase, the performance of the procedure becomes very good.
* for higher correlations and for 15 seeds, there is a substantial gap in objective function and matched vertices
* a gap in the objective function indicates the correct matching was likely found
* consider graphs from the random dot product graph (RDPG) model to better evaluate the performance 
* the max-angle subgraph is easier to discover than random subgraphs
* rank-one approximation eliminates degree based differences in vertices
* observe a gap in the objective function between solutions with less than 20
and more than 35 correct matches.
* used matched filter to locate  (K) cells in the fully reconstructed Drosophila mushroom body
*  overall best performance is achieved by using the rank-1 scheme followed by the rank-3
scheme
*  failed to observe the substantial gap between accurate and inaccurate solutions.
*  sorting according to the objective function value for the second match results in adverse behavior where lower objective functions result in poorer performance.
* 

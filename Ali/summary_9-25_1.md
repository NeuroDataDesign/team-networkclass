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

## Padding Approaches
* Three main schems: naive, centered, and oracle padding.
* naive will not be guaranteed, while centered and oracle are guaranteed to succeed (under mild model conditions).
* 

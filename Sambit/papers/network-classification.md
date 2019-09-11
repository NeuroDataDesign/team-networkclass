# Network Classification with Applications to Brain Connectomics

Authors: Joshua T. Vogelstein, William R. Gray, R. Jacob Vogelstein, and Carey E. Priebe

Link: <https://arxiv.org/pdf/1701.08140.pdf>

## Abstract

- purpose: Study classification of networks with labeled nodes
- existing approaches treat all edgeweights as a long vector or ignore network structure and focus on graph topology while ignoring edge weights
- propose method that uses edge weights as predictors, but incorporates network structure

## 1 - Introduction

- motivated by brain connectomics
- each unit is represented by own networks and nodes are labeled and shared across networks
- focus on functional connectivity (fMRI), specifically resting-state fMRI
  - allows to represent fMRI as single graph since time dimension can be averaged
- COBRE (54 schizo, 70 control), UMich (39 schizo, 40 control) were compared against
- parcellation is 264 ROIs deivided into 14 functional systems
- measured correlation by using marginal correlations between time series
- previous graph classification attempts
  - finds on subgraphs which is only possible computationally on small networks -> Setting tested on 20 nodes
  - define similarity measure between two networks on graph kernel -> not better than random guessing
  - reduce network to a global summary of measures like average degree, clustering coefficient, or average path length -> harm accuracy and don't identify local differences
  - classify large networks by treating edge weights as a "bag of features" -> Effectiveness depends on parcellation to define nodes, limited interatability based on edges
- network structure incorporation is better at classification and interatibility
- __GOAL OF PAPER:__ develop a high-dimensional network classifier that usese edge weights while respecting network structure

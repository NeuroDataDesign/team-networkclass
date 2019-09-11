# Summary
NETWORK CLASSIFICATION WITH APPLICATIONS TO BRAIN CONNECTOMICS, JD Arroyo-Relio, et. al
## Abstract
* Analyzing a sample of networks provides additional challenges to just a single network.
* Research has shown that brain networks representing connectivity between brain regions has potential to distinguish brain disorders
.
* Paper Goal: "design a classification method that
uses both the individual edge information and the network structure
of the data in a computationally efficient way, and that can produce a
parsimonious and interpretable representation of differences in brain
connectivity patterns between classes"
* Used data from fMRI in patients with schizophrenia.

## 1. Introduction
* Graphs in brain connectomics can be considered as the following: each patient has their own network, where each node represents a 
region of the brain (labelled and shared between patient/networks).
* Given a training set from multiple classes (ie diseases) with labeled nodes, what are the rules for predicting the classification of 
a given sample.
* connectivity in the brain is measured using fMRI, which measures BOLD signals at various location in the brain.
* Here, resting state fMRI data is used, for both the schizophrenic group and the healthy controls.
* graph nodes are chosen as ROI (regions of interest) in the brain.
* data organization: 264 ROI divided into 14 functional systems. A connectivity measure results in an edge, leading to a 264x264 
adjacency matrix.
* Two main approaches have been taken for classifying brain networks:
1.  reduce the network to its "global summary measures", which are then used as features for training. 
2.  treat edge
weights as a “bag of features”, vectorizing the unique elements of the adjacency matrix and ignoring the network nature of the data.

## 2. A framework for node selection in graph classification
### 2.1
* Graph Assumptions:
  * All graphs on same set of nodes
  * Graphs are undirected and contain no self loops
* Goal: predict a class label from the graph's adjacency matrix
* This is done by finding nodes and subnetworks with good discriminative power.
### 2.2
* using the group lasso penalty, we penalize the number of active nodes by treating all edges connected to one node as a group. Then
eliminating this group is equivalent to de-activating a node.
* By removing the symmetry contraint and using undirected graphs, the lasso is sparse solutions are not required, and more efficient
optimization algorithms can be used.
* An issue with this is each edge now corresponds to two different coefficients. This is solved by taking the average of the coefficients.

# Network Classification with Applications to Brain Connectomics - [(Link)](https://arxiv.org/abs/1701.08140)

Author: Jesús D. Arroyo-Relión, Daniel Kessler, Elizaveta Levina, Stephan F. Taylor (2017)

## Abstract
**Goal**
    
- Classify networks with labeled nodes
- Use both **(1)** the individual edge information and **(2)** the network structure
- (Application) Distinguish between various brain disorders
    - Should have different connectivity patterns

**Method**

1. Use edge weights as predictor
2. Encode network structure by using penalties

## 1. Introduction

**Data:**
- Resting-state fMRI data
- Averaged along the time dimension
- Schizophrenic patients vs Healthy controls
    - COBRE (Aine et al. 2017) + UMich data (internally)
- 264 ROIs --> 14 subsystem

**Method and Analysis**
- Connectivity measurement: rank-transformed and standardized marginal correlations. <span style="color:red">**(?)**</span>
- Penalize #nodes and #edges --> promote sparsity and preserve the network structure 

**Background Methods**

(large-scale classification)
1. Average the network's parameter (degree, path length etc.)
2. "Vectorizing the unique elements of the adjacency matrix" <span style="color:red">**(?)**</span>

## 2. The classifier and penalties

- Network = undirected graph = adjacency matrix
    
    <img src="http://latex.codecogs.com/gif.latex?A\in\mathbb{R}^{N\times\/N}">

- Binary classification in this paper

- Linear classifier

     <img src="http://latex.codecogs.com/gif.latex?\langle\/A,B\rangle">

     where <img src="http://latex.codecogs.com/gif.latex?B\in\mathbb{R}^{N\times\/N}"> "emphasize the network nature of the predictors" <span style="color:red">**(?)**</span> as the result of training

- Loss function: logistic loss function (need to review)

- Group lasso penalty: All edges connected to a node as a grou; eliminate group --> promote sparsity <span style="color:red">**(lp-norm?)**</span>
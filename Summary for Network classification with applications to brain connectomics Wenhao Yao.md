# Summary for network classification paper
##  KeyPoints

 - develop a high-dimensional network classifier that uses all the individual edge weights but also respects the network structure of the data and produces more interpretable results
 - sparsity penalties in the number of nodes, in addition to the usual sparsity penalties that encourage selection of edges. 
 -  good convex optimization 
 -  a detailed analysis of data from two fMRI studies of schizophrenia
 
 ## Introduction
 
		
 ### 1. Small scle network vs. Large scale network
 |method | drawbacks|
|--|--|
|patterns in the graphs  | only possible on small binary networks. |
|  graph kernels | fail due to curse of dimensions  |
| global summary measures| lose all local information|
|bag of features|limited to individual edge selection|
### 2. Dataset used
COBRE (54 schizophrenics and 70 controls)
UMich data (39 schizophrenics and 40 controls)
raw data :fMRI
264 ROIs divided into 14 functional brain systems (in the COBRE data, node 75 is missing)
adjacency matrix of size 264×264

## Framework for node selection in graph classification
### 1. A penalized graph classification approach


Loss function+regularization Penalty
![](https://lh3.googleusercontent.com/iE2kcjs_dAHFJwJuD_v7_F8Eez6t219sdQflEDKmOeLeyd07tkdAlxf-P7DRwnGc6JCEINSpY8E)
 
 
Loss function defn:
![enter image description here](https://lh3.googleusercontent.com/HPysJ62f1DfH4FeUOsdI6Se9VzRZFGwHdWaHhHvIRFj1-lHnfFAbpGMcfUgR8fQMPntdJlUzJQI)
### 2. Selecting nodes and edges through group lasso
defn: penalty
![enter image description here](https://lh3.googleusercontent.com/r95q6mdh-w48Vbo5ZZMdxUwNm8bUWgPA4LE_X1c5XwWKY7yKLh061NNwhqRxZ-RLh6LYrImSYL4)
with additional a ridge penalty term:
![enter image description here](https://lh3.googleusercontent.com/BJImD-zr76AW2Iow4mkrZHgig7V8uAS8wvSjcMAQJZzzWa4stpHE3eJkrfA-otyoXZ96SUSXHB8)
##  The optimization algorithm

 - accelerate proximal algorithms 
 -  alternating direction method of multipliers (ADMM).

use 2-accalerate proximal operator 
proximal operator :
![enter image description here](https://lh3.googleusercontent.com/Pey0dQ5OIxnmAkf7QhIJV4GjskOgUGnUGHHDlcCduj88aHGaaW_JUbz_YaNtZ7Zpl2n8XX0tkeM)
original2.1problem
![enter image description here](https://lh3.googleusercontent.com/R4WKfE5jUrNbx7rpRKfSei6I4OQ-u_piofu0gOwY6K6kcNJs4jKiCVMG1743WqIztAuEocOjbzc)
$\downarrow$
![enter image description here](https://lh3.googleusercontent.com/mRWZrFfgPXQjLQkoETGMEFVoPU9sT-CqR4XkenjFBRe7hAOz5EGvc20xzvnA6aApbRIW6FaosOE)
due to no close form:use ADMM for proximal solution of  penalty 2.2
![enter image description here](https://lh3.googleusercontent.com/5ZYDSHjyd4xvZyEID0WPe4rriiBvLBy4bkgZH7PmzCuPHLwQm2FNCjBDkXv4ELOYmWC8Fh72Ff8)
$\downarrow$
min:
![enter image description here](https://lh3.googleusercontent.com/ivlLvILjPzyOesZoIVSAgljeSLaSCH3sZeM7kTU83o_MsOBYwFjCuAtALccFAUIhWyMgxjhNz84)
Remark: easy to add new term to penalty
![enter image description here](https://lh3.googleusercontent.com/bhhG_lCwK6iwULPrTH_9ZgH-ILlrS76jIEzSyAYrxLpqLqOVCCxCi_PJmWeul5YsBYuWiu-owLU)
## Theory
Math proof of such assumption that the solution of the penalized problem can recover the correct subgraph corresponding to the set of non-zero coefficients, and give its rates of convergence.
##  Numerical results on simulated networks


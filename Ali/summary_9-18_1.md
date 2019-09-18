# Summary
NETWORK CLASSIFICATION WITH APPLICATIONS TO BRAIN CONNECTOMICS (3-5), JD Arroyo-Relio, et. al
## 3. The Optimization Algorithm
* algorithm is a combination of two approaches:
  * priximal algorithms: an algorithm for solving a convex optimization problem that uses the proximal operators of the objective terms.
  * alternating direction method of multipliers (ADMM)
* Main optimization difficulty from overlapping groups
* unclear whether sparsity is conserved in smoothing algorithms 
* main problem solved with proximal algorithm, solving the optimization problem by iteratively calculating the proximal operator for 
a descent direction
* ADMM makes it easy to incorporate penalties

## 4. Theory
* aim to show that the solution of penalized problem can recover the correct subgraph, and provide a rate of convergence.
* conditions depend on data and tuning parameters
* two main assumptions on the loss function:
  * restricted strong convexity
  * restriction on size of entries in loss Hessian between variables in active subgraph vs others
* the two assumptions can be replaced with bounds in probablilty in random designs

## 5. Numerical results on simulated networks
* evaluting the performance of the method through synthetic networks
* specifically assessing ability to identify predictive edges, classification accuracy, compare to benchmarks
* comparisons made using AUC of ROC curves for both edge and node selection
* " As the
proportion of active edges increases, methods that use network structure
improve their performance when only a subset of the nodes is active"
* increasing differentiating edges increase performance in all methods, but the papers algorithm performs best overall.

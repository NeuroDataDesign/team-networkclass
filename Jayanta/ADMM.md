# Distributed Optimization and Statistical Learning via the Alternating Direction Method of Multipliers [link](https://web.stanford.edu/~boyd/papers/pdf/admm_distr_stats.pdf)
----
* Here a review and background study of ADMM has been presented. The paper first discusses the precursor of ADMM such as dual ascent, dual decomposition, augmented Lagrangian and method of multiplier.

* Dual Ascent: Update the loss function variable and the Lagrange multiplier sequentially until convergence

* Dual Decomposition: Decompose the loss function as summation of function that depends on subvectors of the variable and update in a parallel way.

* Augmented Lagrangian and Method of Multiplier: Impose l-2 norm of the Lagrange function as constraint to facilitate better convergence

* ADMM: Combine the advantage of both dual decomposition and method of multiplier so that it can be executed parallely with robust solution. Multiple vaiants of ADMM such as varying Lagrange multiplier with each iteration, relaxing the update of second variable by using a weighted average of first variable in the update, changing the order of update. 

# Graph Independence Test ([link](https://arxiv.org/abs/1906.03661))
----
* An algorithm to test dependence between two graphs has been introduced and is verified on the structural connectomes and chemical synapse connectome of C. elegans.

* \rho - SBM model is used to measure the p-value

* The community assignment is done by doing GMM on the joint embedding of the two graphs' latent positions (similar to the cosie model from grspy)

* Permutation of edges within a block is done to estimate the distribution of the test statistic, and thereby, give a p-value

* correlation between two graphs is used as the test statistic, and can be measured either using induced metric from adjacency matrix or from Pearson correlation
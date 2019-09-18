# Network Classification ([link](https://arxiv.org/abs/1701.08140))
----
* This paper proposes a binary class graph classification approach

* This method calculates the weighted sum of all the edges connected to a node 

* The weights are calculated by minimising a logistic regression cost function that penalises high cost due to misclassification

* To avoid overfitting or underfitting and promote sparse solution l-2 and l-1 norm regularization is added
* Proximal algorithm along with ADMM has been used to find the global solution
* Separate ADMM was used to find the optimum bias b
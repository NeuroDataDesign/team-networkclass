# Decision Forests for Classification, Regression, Density Estimation, Manifold Learning, and Semi-Supervised Learning

Authors: A. Criminisi, J. Shotton, and E. Konukoglu

Link: <https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/decisionForests_MSR_TR_2011_114.pdf>

## Abstract

- propose single model for learning tasks
- demonstrate margin-maximizing properties
- intro density forests
- propose algorithms for sampling forest generating model
- introduce manifold forests
- propose new forest based algorithms for active learning

## 1 - Overview and scope

### 1.1 - A brief literature survey

- "C4.5" algorithm: trains optimal decision trees from data
  - (from wiki) C4.5 builds trees using information entropy, finds highest normalized information gain and splits on that attribute
- other work uses individual entities to yield greater accuracy
- random decision forest splits on random features rather than chosen ones
- RF samples training data by bagging

### 1.2 - Outline

- overview of paper

## 2 - The random decision forest model

- examples of machine learning tasks
  - classification: recognizing type of category
  - regression: predicting price of house as function of distance
  - learned density: detecting abonormalities in a medical scan under learned density
  - manifold learning: capturing intrinsic variability in size and shapes of brains
  - semisupervised: interactive image segmentation
  - active learning: learning general rule for detecting tumors in images
- __aim of chapter:__ present model of RF that tackles all these problems

### 2.1 - Background and notation

#### 2.1.1 - Decision tree basics

- tree is hierarchy of nodes and edges
- decision tree makes decisions

#### 2.1.2 - Mathematial notation

- features are selected from a subset of features of interest with function <img src="https://latex.codecogs.com/svg.latex?\inline&space;\phi(v)" title="\phi(v)" />

#### 2.1.3 - Training and teting decision trees

- leaf nodes contain a predictor (classifier or regressor) which associates an output (class label) to the input ___v___
- ![ie2] refers to training points reaching node 1, ![ie3] and ![ie4] are subsets left and right to children. In binary trees, ![ie5], ![ie6], ![ie7], and <var>S<sub>j</sub><sup>R</sup> = S<sub>2j+2</sub></var>
- ground truth labels are chosen to minimize and energy function
- randomness is injected during the training process, and deterministic once trees are fixed

#### 2.1.4 - Entropy and information gain

- Gain of information is computed using the following formula

### 2.2 - The decision forest model

## 3 - Classification forests

### 3.1 - Classification algorithms in the literature

### 3.2 - Specializing the decsion foret model for classification

### 3.3 - Effect of model parameters

### 3.4 - Maximum-margin properties

### 3.4 - Comparisons with alternative algorithms

### 3.5 - Comparisons with alternative algorithms

### 3.6 - Human body tracking in Microsoft Kinect for XBox 360

<!-- Equations -->
[ie2]: https://chart.apis.google.com/chart?cht=tx&chl=S_1
[ie3]: https://chart.apis.google.com/chart?cht=tx&chl=S_1^L
[ie4]: https://chart.apis.google.com/chart?cht=tx&chl=S_1^R
[ie5]: https://chart.apis.google.com/chart?cht=tx&chl=S_j=S_j^L{\cup}S_j^R
[ie6]: https://chart.apis.google.com/chart?cht=tx&chl=S_j^L{\cap}S_j^R=\emptyset
[ie7]: https://chart.apis.google.com/chart?cht=tx&chl=S_j^L=S_{2j%2B1}

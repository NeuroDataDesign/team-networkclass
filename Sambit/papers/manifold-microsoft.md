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
- __aim of chapter: present model of RF that tackles all these problems__

### 2.1 - Background and notation

#### 2.1.1 - Decision tree basics

- tree is hierarchy of nodes and edges
- decision tree makes decisions

#### 2.1.2 - Mathematial notation

- features are selected from a subset of features of interest with function <img src="https://latex.codecogs.com/svg.latex?\inline&space;\phi(\mathbf{v})" title="\phi(\mathbf{v})" />

#### 2.1.3 - Training and teting decision trees

- leaf nodes contain a predictor (classifier or regressor) which associates an output (class label) to the input <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{v}" title="\mathbf{v}" />
- <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_1" title="S_1" /> refers to training points reaching node 1, <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_1^L" title="S_1^L" /> and <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_1^R" title="S_1^R" /> are subsets left and right to children. In binary trees, <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_j&space;=&space;S_j^L&space;\cup&space;S_j^R" title="S_j = S_j^L \cup S_j^R" />, <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_j^L&space;\cap&space;S_j^R&space;=&space;\emptyset" title="S_j^L \cap S_j^R = \emptyset" />, <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_j^L=&space;S_{2j&plus;1}" title="S_j^L= S_{2j+1}" />, and <img src="https://latex.codecogs.com/svg.latex?\inline&space;S_j^R=&space;S_{2j&plus;2}" title="S_j^R= S_{2j+2}" />
- ground truth labels are chosen to minimize and energy function
- randomness is injected during the training process, and deterministic once trees are fixed

#### 2.1.4 - Entropy and information gain

- gain of information is computed using the following formula:

<div style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?I&space;=&space;H(S)&space;-&space;\sum_{i&space;\in&space;\{1,&space;2\}}&space;\frac{|S^j|}{|S|}&space;H(S^i)" title="I = H(S) - \sum_{i \in \{1, 2\}} \frac{|S^j|}{|S|} H(S^i)" /></div>

- the Shannon entropy is defined as

<center><img src="https://latex.codecogs.com/svg.latex?H(S)&space;=&space;-\sum_{c&space;\in&space;\mathcal{C}}&space;p(c)&space;\log(p(c))" title="H(S) = -\sum_{c \in \mathcal{C}} p(c) \log(p(c))" /></center>

- for continuous distributions, the differential entropy of a <img src="https://latex.codecogs.com/svg.latex?\inline&space;d" title="d" />-variate Gaussian is

<center><img src="https://latex.codecogs.com/svg.latex?H(S)&space;=&space;\frac{1}{2}&space;\log&space;\left((2&space;\pi&space;e)^d&space;|\Lambda&space;(S)&space;|&space;\right&space;)" title="H(S) = \frac{1}{2} \log \left((2 \pi e)^d |\Lambda (S) | \right )" /></center>

- fitting Gaussian to the data, large overlap is associated with low info gain and peakier Gaussians corresponds to high information gain.
- __summary: Cateogrical data - Split, calculate discreate probabilities, calculate information gain; Continuous data - Split, fit gaussian, calculate probabilities, calculate information gain__

### 2.2 - The decision forest model

#### 2.2.1 - The weak learner model

- each split node <img src="https://latex.codecogs.com/svg.latex?j" title="j" /> is associated with a binary split function

<center><img src="https://latex.codecogs.com/svg.latex?h(\mathbf{v},&space;\mathbf{\theta}_j)&space;\in&space;\{&space;0,&space;1&space;\}" title="h(\mathbf{v}, \mathbf{\theta}_j) \in \{ 0, 1 \}" /></center>

- the model parameters for are <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\theta}&space;=&space;(\mathbf{\phi},&space;\mathbf{\psi},&space;\mathbf{\tau})" title="\mathbf{\theta} = (\mathbf{\phi}, \mathbf{\psi}, \mathbf{\tau})" />
  - <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\psi}" title="\mathbf{\psi}" /> actually splits the data
  - <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\tau}" title="\mathbf{\tau}" /> captures thresholds for inequalities
  - <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\phi}" title="\mathbf{\phi}" /> selects the features out of <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{v}" title="\mathbf{v}" />
- Linear weak learner
  - given that <img src="https://latex.codecogs.com/svg.latex?[\cdot]" title="[\cdot]" /> is the indicator function, this model is

  <center><img src="https://latex.codecogs.com/svg.latex?h(\mathbf{v},&space;\mathbf{\theta}_j)&space;=&space;[\tau_1&space;>&space;\mathbf{\phi}(\mathbf{v})&space;\cdot&space;\mathbf{\psi}&space;>&space;\tau_2]" title="h(\mathbf{v}, \mathbf{\theta}_j) = [\tau_1 > \mathbf{\phi}(\mathbf{v}) \cdot \mathbf{\psi} > \tau_2]" /></center>

  - Stumps: Axis-aligned weak learners
- Nonlinear weak learner
  - Given that <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\psi}&space;\in&space;\mathbb{R}^{3&space;\times&space;3}" title="\mathbf{\psi} \in \mathbb{R}^{3 \times 3}" /> is a matrix representing the conic section, the conic section is

  <center><img src="https://latex.codecogs.com/svg.latex?h(\mathbf{v},&space;\mathbf{\theta}_j)&space;=&space;\left[&space;\tau_1&space;>&space;\mathbf{\phi}^\top(\mathbf{v})\,\mathbf{\psi}\,\mathbf{\phi}&space;(\mathbf{v})&space;>&space;\tau_2&space;\right]" title="h(\mathbf{v}, \mathbf{\theta}_j) = \left[ \tau_1 > \mathbf{\phi}^\top(\mathbf{v})\,\mathbf{\psi}\,\mathbf{\phi} (\mathbf{v}) > \tau_2 \right]" /></center>

  - The number of degrees of freedom of the weak learner influences forest generalization properties

#### 2.2.2 - The training objective  function

- If the information gain at the <img src="https://latex.codecogs.com/svg.latex?j^\mathrm{th}" title="j^\mathrm{th}" /> split node is <img src="https://latex.codecogs.com/svg.latex?\inline&space;I_j&space;=&space;I(S_j,&space;S_j^L,&space;S_j^R,&space;\mathbf{\theta}_j)" title="I_j = I(S_j, S_j^L, S_j^R, \mathbf{\theta}_j)" />, then the information gain objective function is maximized to compute the optimal spit. That is,

<center><img src="https://latex.codecogs.com/svg.latex?\mathbf{\theta}_j^*&space;=&space;\arg&space;\max_{\mathbf{\theta}_j}&space;I_j" title="\mathbf{\theta}_j^* = \arg \max_{\mathbf{\theta}_j} I_j" /></center>

#### 2.2.3 - The randomness model

- randomness is injected during the training phase via
  - bagging
  - randomized node optimization
- if <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathcal{T}" title="\mathcal{T}" /> is the set of all possible <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{\theta}" title="\mathbf{\theta}" /> when training the <img src="https://latex.codecogs.com/svg.latex?j^\mathrm{th}" title="j^\mathrm{th}" /> split node. Each split is optimized via

<center><img src="https://latex.codecogs.com/svg.latex?\mathbf{\theta}_j^*&space;=&space;\arg&space;\max_{\mathbf{\theta}_j&space;\in&space;\mathcal{T}_j}&space;I_j" title="\mathbf{\theta}_j^* = \arg \max_{\mathbf{\theta}_j \in \mathcal{T}_j} I_j" /></center>

- so, <img src="https://latex.codecogs.com/svg.latex?\inline&space;\rho" title="\rho" /> is introduced where <img src="https://latex.codecogs.com/svg.latex?\inline&space;\rho&space;=&space;|\mathcal{T}_j|" title="\rho = |\mathcal{T}_j|" />. Here, <img src="https://latex.codecogs.com/svg.latex?\inline&space;\rho&space;=&space;|\mathcal{T}|" title="\rho = |\mathcal{T}|" /> indicates that all the trees are identical and <img src="https://latex.codecogs.com/svg.latex?\inline&space;\rho&space;=&space;1" title="\rho = 1" /> means there is no randomness in the system.

#### 2.2.4 - The leaf prediction model

- the probabilitic leaf predictor model for the <img src="https://latex.codecogs.com/svg.latex?\inline&space;t^\mathrm{th}" title="t^\mathrm{th}" /> tree is <img src="https://latex.codecogs.com/svg.latex?\inline&space;p_t(c|\mathbf{v})" title="p_t(c|\mathbf{v})" />. In regression, the output is continuous and the leaf predictor model is a posterior of the desired continuous variable. In classification trees, it is a point estimate instead.

#### 2.2.5 - The ensemble model

- tree testing is done in parallel
- in classification, forest prediction is a simple averaging operation:

<center><img src="https://latex.codecogs.com/svg.latex?p(c|\mathbf{v})&space;=&space;\frac{1}{T}&space;\sum_{t=1}^T&space;p_t(c|\mathbf{v})" title="p(c|\mathbf{v}) = \frac{1}{T} \sum_{t=1}^T p_t(c|\mathbf{v})" /></center>

- or, given a partition function <img src="https://latex.codecogs.com/svg.latex?\inline&space;Z" title="Z" />, multiply tree outputs (even though trees are not statistically independent):

<center><img src="https://latex.codecogs.com/svg.latex?p(c|\mathbf{v})&space;=&space;\frac{1}{Z}&space;\prod_{t=1}^T&space;p_t(c|\mathbf{v})" title="p(c|\mathbf{v}) = \frac{1}{Z} \prod_{t=1}^T p_t(c|\mathbf{v})" /></center>

- both averaging and taking the product are heavily influenced by most confident, most informative trees

#### 2.2.6 - Stopping criteria

- hard limit (depth of trees hyper-parameter)
- minimum information gain
- too few points in a class

#### Summary of key model parameters

- parameters that most influence decision forest are
  - the forest size <img src="https://latex.codecogs.com/svg.latex?\inline&space;T" title="T" />
  - the maximium allowed tree depth <img src="https://latex.codecogs.com/svg.latex?\inline&space;D" title="D" />
  - the amount of randomness (controlled by <img src="https://latex.codecogs.com/svg.latex?\inline&space;\rho" title="\rho" />) and its type
  - the choice of weak learner model
  - the training objective function
  - the choise of features
- these parameters affect accuracy of its confidence (forest predictive accuracy) and computational efficiency
- very deep trees lead to overfitting

## 3 - Classification forests

### 3.1 - Classification algorithms in the literature

- SVM is most commonly used as it guarantees maximium-margin separation
- boosting builds strong classifiers from linear combination (like Adaboost)
- neither extend to multiclass problems
- classification forests show good generalization, even with high dimensional data

### 3.2 - Specializing the decsion foret model for classification

- the classification problem can be summarized as previously stated

### 3.3 - Effect of model parameters

#### 3.3.1 - The effect of the forest size on generalization

- suppose shallow trees (<img src="https://latex.codecogs.com/svg.latex?\inline&space;D=2" title="D=2" />)
- increasing forest size from <img src="https://latex.codecogs.com/svg.latex?\inline&space;T=1" title="T=1" /> to <img src="https://latex.codecogs.com/svg.latex?\inline&space;T=200" title="T=200" /> produces smoother posteriors

#### 3.3.2 - Multiple classes and training noises

- decision trees are better than SVM or boosting because it can handle both binary and multi-class problems

#### 3.3.3 - "Sloppy" labels and the effect of the tree depth

- tree depth increases overall prediction confidence
- large values of <img src="https://latex.codecogs.com/svg.latex?\inline&space;D" title="D" /> tend to overfitting
- values of <img src="https://latex.codecogs.com/svg.latex?\inline&space;D" title="D" /> is a function of the problem complexity

#### 3.3.4 - The effect of the weak learner

- for a fixed weak learner, increasing <img src="https://latex.codecogs.com/svg.latex?\inline&space;D" title="D" /> increases the confidence of the output
- axis alignned tests are efficient to compute so the choice of accuracy and efficency are a tradeoff

#### 3.3.5 - The effect of randomness

- larger randomness reduces blocky artifacts of axis-aligned weak learner but redduces overall confidence.
- however, larger weak learners have a higher associated parameter space

### 3.4 - Maximum-margin properties

- formally, consider weak learners to be vertical lines only for a two class problem, _i.e._

<center><img src="https://latex.codecogs.com/svg.latex?\inline&space;h(\mathbf{v},&space;\mathbf{\theta}_j)&space;=&space;\left[&space;\phi(\mathbf{v})&space;>&space;\tau&space;\right&space;]&space;\quad&space;\mathrm{with}&space;\quad&space;\phi(\mathbf{v})&space;=&space;x_1" title="h(\mathbf{v}, \mathbf{\theta}_j) = \left[ \phi(\mathbf{v}) > \tau \right ] \quad \mathrm{with} \quad \phi(\mathbf{v}) = x_1" /></center>

- the optimal separting line at position <img src="https://latex.codecogs.com/svg.latex?\inline&space;\tau^*" title="\tau^*" /> is

<center><img src="https://latex.codecogs.com/svg.latex?\tau^*&space;=&space;\arg&space;\min_\tau&space;|p(c&space;=&space;c_1\,|\,x_1&space;=&space;\tau)&space;-&space;p(c&space;=&space;c_2\,|\,x_1&space;=&space;\tau)|" title="\tau^* = \arg \min_\tau |p(c = c_1\,|\,x_1 = \tau) - p(c = c_2\,|\,x_1 = \tau)|" /></center>

### 3.4 - Comparisons with alternative algorithms

### 3.5 - Comparisons with alternative algorithms

### 3.6 - Human body tracking in Microsoft Kinect for XBox 360

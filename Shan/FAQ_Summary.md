#  Fast Approximate Quadratic Programming for Graph matching , Jovo, et al.    
<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0121002>   
## Application Background: analyzing connectomes   
* diagnose neurological diseases via comparing brain images     

## Problems:   
** (Precondition: A,B are adjacency matrix) **  
### Quadratic Assignment Problems(QAP)   
* Minimize trace(APB'P')    

### Relaxed Quadratic Assignment Problems(rQAP)   
* Also Minimize trace(APB'P'), but it is not necessaruly convex    

### Graph Matching(GM)   
* Minimize ||A-PBP'||
* Turns out to be minimize -trace(APB'P')


### Fast Apporximate QAP Algorithm(GAQ)     
This is a fast algorithm for approximately matching very large graphs.     

* Choose a suitable initial position.
* Find a local solution to rQAP.
* Project back onto the set of permutation matrices.   


#### ? There are already Matlab implementation of FAQ. Other algorithms are in C. Can we use it?

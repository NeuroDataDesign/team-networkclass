#' probabilities.
#' @param nMembers The number of nodes in each block.
#'
#' @export
#' @return A matrix of Bernoulli covariates with a block probability structure.
#' @examples

#' simBernCovar(covProbMat,nMembers)
import numpy as np

def simBernCovar(covProbMat, nMembers):
	nBlocks = covProbMat.shape[0]
	nCov    = covProbMat.shape[1]
	p=0
	for j in range(nCov-1,-1,-1):
		q = 0
		for i in range(nBlocks-1,-1,-1):
			covTemp = simBernSparseVec(nMembers[i],covProbMat[i,j]).reshape(nMembers[i],1)
			if q==0:
				adjCol = covTemp
				q=q+1
			else:
				adjCol = np.vstack((covTemp,adjCol))
		if p==0:
			adjMat = adjCol
			p=p+1
		else:
			adjMat = np.hstack((adjCol,adjMat))
	return adjMat

def simBernSparseVec(nElem,p):
	if p == 0:
		return np.zeros((1,nElem))
	expNumOnes = nElem*p
	sdNumOnes = np.sqrt(nElem*p*(1-p))
	oneIntervals = np.random.negative_binomial(1,p,int(expNumOnes + round(3*sdNumOnes))) + 1
	oneIndices = oneIntervals.cumsum()
	while max(oneIndices) < (nElem-1):
		oneIndices = [oneIndices, max(oneIndices) + np.random.negative_binomial(1, 1, p) + 1]
	oneIndices = oneIndices[oneIndices <= (nElem-1)]
	tmp = np.zeros((1,nElem)).flatten('F')
	tmp[oneIndices] = 1
	return tmp
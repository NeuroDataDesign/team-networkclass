A <- rbind(c(0, 90, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
           c(90, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0),
           c(10, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0),
           c(0, 23, 0, 0, 0, 88, 0, 0, 0, 0, 0, 0),
           c(0, 0, 43, 0, 0, 0, 26, 0, 0, 0, 0, 0),
           c(0, 0, 0, 88, 0, 0, 0, 16, 0, 0, 0, 0),
           c(0, 0, 0, 0, 26, 0, 0, 0, 1, 0, 0, 0),
           c(0, 0, 0, 0, 0, 16, 0, 0, 0, 96, 0, 0),
           c(0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 29, 0),
           c(0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 37),
           c(0, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0),
           c(0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0))
B <- rbind(c(0, 36, 54, 26, 59, 72, 9, 34, 79, 17, 46, 95),
           c(36, 0, 73, 35, 90, 58, 30, 78, 35, 44, 79, 36),
           c(54, 73, 0, 21, 10, 97, 58, 66, 69, 61, 54, 63),
           c(26, 35, 21, 0, 93, 12, 46, 40, 37, 48, 68, 85),
           c(59, 90, 10, 93, 0, 64, 5, 29, 76, 16, 5, 76),
           c(72, 58, 97, 12, 64, 0, 96, 55, 38, 54, 0, 34),
           c(9, 30, 58, 46, 5, 96, 0, 83, 35, 11, 56, 37),
           c(34, 78, 66, 40, 29, 55, 83, 0, 44, 12, 15, 80),
           c(79, 35, 69, 37, 76, 38, 35, 44, 0, 64, 39, 33),
           c(17, 44, 61, 48, 16, 54, 11, 12, 64, 0, 70, 86),
           c(46, 79, 54, 68, 5, 0, 56, 15, 39, 70, 0, 18),
           c(95, 36, 63, 85, 76, 34, 37, 80, 33, 86, 18, 0))
fw <- graph_match_FW(-A,B,start='convex')
P <- matrix(fw$P, nrow=12,ncol=12)
sum(diag(t(A)%*%P%*%B%*%t(P)))

convex <- graph_match_convex(-A,B)
P <- matrix(convex$P, nrow=12,ncol=12)
sum(diag(t(A)%*%P%*%B%*%t(P)))

rhos <- seq(from = 0.85, to = 1.0, by = 0.01)
ratios <- c()
m <- 5
for (i in 1:length(rhos))
  {
  rho <- rhos[i]
  s <- 0
  for(x in 1:m)
    {
    n <- 100
    lamda <- matrix(runif(n*n, 0.1, 0.9),nrow = n, ncol = n)
    rho_m <- matrix(rep(rho,n*n),nrow=n,ncol=n)
    bpairs <- sample_correlated_ieg_pair(n,lamda,rho_m)
    g1 <- bpairs$graph1
    g2 <- bpairs$graph2
    shuffle <- sample(n)
    g1_s <- g1[shuffle,shuffle]
    g2_s <- g2[shuffle,shuffle]
    #fw <- graph_match_FW(g1,g2_s)
    fw2 <- graph_match_FW(g1_s,g2,start = "bari")
    #match_ratio(order(shuffle, decreasing = TRUE),fw$corr$corr_B,n)
    s <- s + match_ratio(shuffle,fw2$corr$corr_B,n)
    }
  ratios <- c(ratios, s/m)
  }

plot(rhos,ratios)
lines(rhos,ratios)

rho <- .97
n <- 100
lamda <- matrix(runif(n*n, 0.1, 0.9),nrow = n, ncol = n)
rhos <- matrix(rep(rho,n*n),nrow=n,ncol=n)
bpairs <- sample_correlated_ieg_pair(n,lamda,rhos)
g1 <- bpairs$graph1
g2 <- bpairs$graph2
shuffle <- sample(n)
g1_s <- g1[shuffle,shuffle]
g2_s <- g2[shuffle,shuffle]
#fw <- graph_match_FW(g1,g2_s)
fw2 <- graph_match_FW(g1_s,g2, start="bari")
match_ratio(shuffle,fw2$corr$corr_B,n)


match_ratio <- function(v,w,n){
  length(which((v-w) == 0))/n
}
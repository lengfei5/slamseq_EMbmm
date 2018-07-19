######################################
######################################
## Section: test the actual distribution 
# one binomial distributin vs binomial mixture model
######################################
######################################
pe = 0.05
pc = 1
f = 0.9

pp = f*pc + (1-f)*pe
size = 20
n = 10000;
xx = rbinom(n, size=size, prob=pp)
#plot(density(xx, adjust = 2))

par(mfrow=c(1,3)) 

hist(xx, breaks = c(0:size))

library(MixtureInf)
rBinomMix = function(n, alpha, theta, size) 
{
  nindex = rmultinom(1, size=n, prob=alpha) 
  rbinom(n, size, rep(theta, nindex))
}

#n = 3000
#numTrials = 30
#trueNumComponents = 2
#alpha = rep(1/trueNumComponents, trueNumComponents)
#theta = seq(0.2, 0.8, length = trueNumComponents)

yy = rBinomMix(n, alpha = c(f, (1-f)), theta = c(pc, pe), size = size)

hist(yy, breaks = c(0:size))

x <- rmix.binom(n, alpha = c(f, (1-f)), theta = c(pc, pe), size = size)
hist(x, breaks = c(0:30))
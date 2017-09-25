#Open Library to access installed packages
library(knitr)
library(ggplot2)


#set seed to create random variable
set.seed(567)

#use provided sampling values to create simulation
lambda <- 0.2
n_sample <- 40 
sim <- 1000

#run simulation
sim_exponent <- matrix(rexp(sim*n_sample, rate=lambda), sim, n_sample)

# Mean of simulation
mean_Sim <- rowMeans(sim_exponent)

#create histogram
hist(mean_Sim, xlab="Means", ylab="Frequency", main="Simulation Mean Distribution", col="blue")

#sample mean
mean_sample<-mean(mean_Sim)

#theoretical Variance
Theoretical_mean<-1/lambda

#show histogram of means
hist(mean_sim, xlab="mean",main="Sample Variance/Theoretical Variance")
abline(v=mean_sample,col="green")
abline(v=Theoretical_mean,col="red")
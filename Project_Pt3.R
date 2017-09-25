#Show normal distribution
x <- seq(min(mean_Sim), max(mean_Sim), length=100)
y <- dnorm(xfit, mean=1/lambda, sd=(1/lambda/sqrt(n)))
hist(mean_Sim,breaks=n,prob=T,col="yellow",xlab = "Means",main="Distribution of Means",ylab="Frequency")
#density of distribution
lines(density(mean_Sim), lwd=3, col="red")
#Show Normal Distribution curve as well to show comparison
lines(x, y, pch=21, col="blue", lty=5)
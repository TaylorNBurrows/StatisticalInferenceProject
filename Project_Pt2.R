#Standard Deviation of the mean
std_dev<-sd(mean_Sim)
std_dev

##Theoritaical Std.Deviation
std_dev_th<- (1/lambda)/sqrt(n)
std_dev_th

##Variance of distribution
variance<-std_dev^2
variance

##Theoretical Variance
theo_Variance<-((1/lambda)*(1/sqrt(n)))^2
theo_Variance

# StatisticalInferenceProject
Course Project for Statistical Inference Coursera


---
Title: "Statistical Inference Course Project"
Author: "Taylor Burrows"
Date: "September 24, 2017"
---

# Statistical Inference Course Project
 
 Author: Taylor Burrows (09/24/2017)


### Description of Assignment

In this project you will investigate the exponential distribution in R and compare it with the Central Limit Theorem. The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. Set lambda = 0.2 for all of the simulations. You will investigate the distribution of averages of 40 exponentials. Note that you will need to do a thousand simulations.

Source: Course Project Instructions. 

### Simulations

The first step was to set up the simulations using R using the specified parameters. 

```{r, echo=FALSE, results='hide', warning=FALSE, message=FALSE}
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
```
![plot of chunk unnamed-chunk-1](/SimulationMeanDistribution.jpeg)

### Question 1: Show the sample mean and compare it to the theoretical mean of the distribution.
```{r, echo=FALSE, results='hide', warning=FALSE, message=FALSE}

# Mean of simulation
mean_Sim <- rowMeans(sim_exponent)

#create histogram
hist(mean_Sim, xlab="Means", ylab="Frequency", main="Simulation Mean Distribution", col="blue")

#sample mean
mean_sample<-mean(mean_Sim)

#theoretical mean
Theoretical_mean<-1/lambda

#show histogram of means
hist(mean_sim, xlab="mean",main="Sample Variance/Theoretical Variance")
abline(v=mean_sample,col="green")
abline(v=Theoretical_mean,col="red")
```
![plot of chunk unnamed-chunk-1](/ShowsMeans.jpeg)

#### Answer: The theoretical mean and the actual mean are very close shown in the code as well as the figure. 

### Question 2: Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
```{r, echo=FALSE, results='hide', warning=FALSE, message=FALSE}
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
```
#### Answer: The theoretical variance and the acutal variance are very close. 

### Question 3: Show that the distribution is approximately normal.
```{r, echo=FALSE, results='hide', warning=FALSE, message=FALSE}
#Show normal distribution
x <- seq(min(mean_Sim), max(mean_Sim), length=100)
y <- dnorm(xfit, mean=1/lambda, sd=(1/lambda/sqrt(n)))
hist(mean_Sim,breaks=n,prob=T,col="yellow",xlab = "Means",main="Distribution of Means",ylab="Frequency")

#density of distribution
lines(density(mean_Sim), lwd=3, col="red")

#Show Normal Distribution curve as well to show comparison
lines(x, y, pch=21, col="blue", lty=5)
```
![plot of chunk unnamed-chunk-1](/NormalDistribution.jpeg)
#### Answer: The distribution of means (red line) of the sampled exponential distributions appear to follow a normal distribution (dashed line) due to the Central Limit Theorem. The two lines showing distribution almost overlap, showing how close they are to each other. 



# Part Two: Basic Inferential Data Analysis Instructions


```{r, echo=FALSE, results='hide', warning=FALSE, message=FALSE}
# load the dataset
library(datasets)
data(ToothGrowth)
str(ToothGrowth)

#Perform Exploratory Data Analysis
str(ToothGrowth)
head(ToothGrowth)

#Summarize Datset
summary(ToothGrowth)
table(ToothGrowth$dose, ToothGrowth$supp)

## Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose.
t.test(len ~ supp, data = ToothGrowth)

#Create Subgroups
ToothGrowth.doses_0.5_1.0 <- subset (ToothGrowth, dose %in% c(0.5, 1.0)) 
ToothGrowth.doses_0.5_2.0 <- subset (ToothGrowth, dose %in% c(0.5, 2.0)) 
ToothGrowth.doses_1.0_2.0 <- subset (ToothGrowth, dose %in% c(1.0, 2.0)) 

t.test(len ~ dose, data = ToothGrowth.doses_0.5_1.0)
t.test(len ~ dose, data = ToothGrowth.doses_0.5_2.0)
t.test(len ~ dose, data = ToothGrowth.doses_1.0_2.0)

```
### Conclusion: Greater dose leads to greater tooth growth. 
### Assumptions: Dataset is the result of a random sampling. 

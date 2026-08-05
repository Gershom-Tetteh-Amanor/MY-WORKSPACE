# QUESTION 1A
# Package is a set of codes, function and data set that are build together for a specific function
# Types of packages:
# I. Actuarial package example FinancialMath
# II. Data manipulation packages example dplyr
# III. Simulation packages example actuar
# IV. Graphics and visualization package example ggplot 
# V. Time series  and forecasting packages example forecast
# VII. Statistical modeling packages example fitdistplus
# VIII. Machine learning packages example caret 




# QUESTION 1B
# THE STEPS INVOLVED
# I. Search for evt-0 on any web browser 
# II. Download the latest version
# III. Click on packages in r 
# IV. Then click on install and a drop up menu will appear then select package archive 
# v. click on browse to load the fill the click on install 
# vii. Make sure all the dependent packages are downloaded

# QUESTION 1C
# Loading my package
library(ReIns)

# Describing my help file output of the relns function
#?ExpQQ
#Computes the empirical quantiles of a data vector and the theoretical quantiles of the standard exponential distribution. These quantiles are then plotted in an exponential QQ-plot with the theoretical quantiles on the x-axis and the empirical quantiles on the y-axis.


# copying the function and modifuing it to get an output for a pareto quantile plot 
#ExpQQ
modify.pareto <- function (data) 
{
  X <- as.numeric(sort(data))
  n <- length(X)
  eqq.the <- -log(1 - (1:n)/(n + 1))
  eqq.emp <- log(X)
  plot(eqq.the, eqq.emp, type = "p", xlab = "Quantiles of pareto", 
       ylab = "log(X)")
}






# QUESTION 1D
# loading my package and data 
library(insuranceData)
data("AutoClaims")

# The sample
set.seed(123)
sample.1 <- AutoClaims[sample(row.names(AutoClaims),500),]

# the Quantile-Quantile Plot fot the modify pareto 
par(mfrow=c(1,2))
modify.pareto(sample.1$PAID)
ExpQQ(sample.1$PAID,main = "")


#comment 
# The exponential fit the claim paid more the pareto since there is a linear relationship between the Theoretical Quantile and Empirical Quantile

# QUESTION 2
library(mice)
data("windspeed")

# QUESTION 2A
# the descriptive statistics for the windspeed of malinhead
hist(windspeed$MalinHead, main = "",xlab = "wind speed",col = 1:12)

# the numeric measure for the windspeen of malinhead 
library(psych)
describe(windspeed$MalinHead)


# QUESTION 2B
log.likelihood.fun <- function(data.,parameters){
  shape <- parameters[1]
  scale <- parameters[2]
  log.likelihood <- sum(log(dweibull(x=data.,shape = shape,scale = scale)))
  return(-log.likelihood)
}


optim.<-optim(par=c(2,3), 
              fn=log.likelihood.fun , 
              method = "SANN",
              #lower = 0, 
              #upper = Inf,
              data= windspeed$MalinHead)

# Question 2c
hist(windspeed$MalinHead, main = "",xlab = "mean",freq = FALSE)
lines(x=sort(windspeed$MalinHead),
      y=dweibull(x=sort(windspeed$MalinHead),
                 shape =optim.$par[1],
                 scale = optim.$par[2] ),
      lwd=2,
      col="red")
# Question 2d

# Question 2e 
# The probability that a wind speed exceeds 95%
the.95th <- quantile(x= sort(windspeed$MalinHead), probs =0.95)
pweibull(q=the.95th,optim.$par[1],optim.$par[2],lower.tail = FALSE)

# the probability of the empirical exceedance probability 
sum(windspeed$MalinHead>the.95th)/length(windspeed$MalinHead)


# Qustion 2d 

#QUESTION 3
library(FinancialMath)
# QUESTION 3A
c <- c(80000,10000,10000,10000,20000,2000,2000,2000,2000,2000,0)
r <- c(0,0,0,0,12000,30000,40000,35000,25000,15000,8000)
net <- r-c
NPV(c[1],net[-1],times = 1:10,0.15)


# QUESTION 3B
npv. <- function(inti.invest,cashflow,rate,time){
  cal <- sum(cashflow/(1+rate)^time)-abs(inti.invest)
  return(cal)
}
npv.(80000,net[-1],0.15,1:10)

# QUESTION 3C 
# RM Group inc should not undertake this investment since the net present value of is negative


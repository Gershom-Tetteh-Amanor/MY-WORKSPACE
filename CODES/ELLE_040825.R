##### Assignment 
## Question 1
## Take the autoclaim data in package insurance 
## sample 200 observation
## fit the gamma distribution to your sample using the method of moment and mle
## Superimpose the density functions on histogram of your sample
## Comment on your results

## Question 2
## Re sample observations of the size n=200
# from your sample( so called Bootstrap)
## Find the MOM and MLE
## Repeat this 1000 times
## Find the MSE and Bias for the MOM and MLE estimators


### Question 1
# Mon Aug  4 16:21:33 2025 ------------------------------
### Loading the insurance Data package
library(insuranceData)

### Load the Autoclaims data into our R environment
data("AutoClaims")

set.seed(321)
Sampled_Autoclams <- AutoClaims[sample(x = 1:nrow(AutoClaims),size = 200,replace = FALSE),]


### Viewing few observations from the sampled data
head(Sampled_Autoclams)


### Moment Estimation
MOM <- function(data){
  alpha <- (mean(data)^2)/var(data)
  beta <- mean(data)/var(data)
  mom <- c(alpha,beta)
  names(mom) <- c("alpha","beta")
  return(mom)
}

Mom.estimates <- MOM(Sampled_Autoclams$PAID);Mom.estimates


### Maximum Likelihood
### Defining the likelihood function of gamma
Likelihood <- function(data,parameters){
  x <- data
  alpha <- parameters[1]
  beta <- parameters[2]
  f <- dgamma(x = Sampled_Autoclams$PAID,shape = alpha,rate = beta)
  f_x <- ((beta^alpha)/factorial(alpha-1))*(x^(alpha-1))*exp(-x*beta)
  loglik <- sum(log(f))
  return(-loglik)
}


### Loading the MASS package
library(MASS)
MLE_esimates <- optim(par = c(2,5),
                      fn = Likelihood,
                      method = "SANN",
                      data = Sampled_Autoclams$PAID);MLE_esimates

### Superimpose the density functions on histogram of your sample
### Histogram of the sampled data
hist(x = Sampled_Autoclams$PAID,
     freq = FALSE,
     main = NULL,
     xlab = "Amount paid to settle and close a claim")

### Fitting for the moment estimation
lines(x = sort(Sampled_Autoclams$PAID),
      y = dgamma(x = sort(Sampled_Autoclams$PAID),scale = Mom.estimates[1],shape = Mom.estimates[2]),
      col = "red",lwd = 2,lty = 1)


### Fitting for the mximum likelihood estimation
lines(x = sort(Sampled_Autoclams$PAID),
      y = dgamma(x = sort(Sampled_Autoclams$PAID),shape = MLE_esimates$par[1],rate = MLE_esimates$par[2]),
      col = "blue",lwd = 2,lty = 1)


legend("topright",
       legend = c("moment","mle"),
       col = c("red","blue"),
       lwd = c(2,2),
       lty = c(1,1))
### Comment


### Question 2
### Re sampling 200 observations from the Auto claims data
Samp <- AutoClaims[sample(x = 1:nrow(AutoClaims),size = 200, replace = TRUE),]
head(Samp)

### Defining a moment and mle function
MOM.MLE <- function(data){
  alpha <- 2
  mom <- mean(data)/var(data)
  mle <- alpha/mean(data)
  esti <- c(mom,mle)
  names(esti) <- c("mom","mle")
  return(esti)
}

### MOM and MLE estimates
MOM.MLE(Samp$PAID)


#### Obtaining 1000 samples
R <- 1000# the number of samples we want

Samp_1000 <- sapply(X = 1:R,
       FUN = function(i)sample(x = AutoClaims$PAID,size = 200,replace = FALSE))

### Applying the MOM MLE function to the simulated samples
Estimates <- apply(X = Samp_1000,
      MARGIN = 2,
      FUN = function(x)MOM.MLE(x))


### Defining the Bias and mse functions
theta <- 5
Bias_mse <- function(theta.hat){
  bias <- mean(theta.hat)-theta
  mse <- mean((theta.hat-theta)^2)
  biamse <- c(bias,mse)
  names(biamse) <- c("Bias","Mse")
  return(biamse)
}


apply(X = Estimates,
      MARGIN = 1,
      FUN = function(x)Bias_mse(x))


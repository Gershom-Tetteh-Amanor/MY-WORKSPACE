### Question 1

library(insuranceData)
data("AutoClaims")

### Sampling 200 observations
set.seed(321)
Autoclaim_sampled <- AutoClaims[sample(x = 1:nrow(AutoClaims),size = 200,replace = FALSE),]
head(Autoclaim_sampled)

### Fitting the gamma distribution
Estimates <- function(x, parameters)
{
  alpha <- parameters[1];beta <- parameters[2]
  
  Moment <- function(x)
  {
    alpha <- (mean(x)^2)/var(x)
    beta <- mean(x)/var(x)
    
    mom <- c(alpha,beta)
    names(mom) <- c("alpha","beta")
    return(mom)
  }
  moment <- Moment(x)
  
  log_likelihood <- function(x,parameters)
  {
    alpha <- parameters[1];beta <- parameters[2]
    log_like <- sum(log(dgamma(x,alpha,beta)))
    return(-log_like)
  }
  mle <- optim(par = c(alpha,beta),
               fn = log_likelihood,
               method = "SANN",
               x = x)
  Table <- data.frame(moment = moment,
                      mle = mle$par)
  return(Table)
}


fit_mom_mle <- Estimates(x = Autoclaim_sampled$PAID,
                         parameters = c(2,5));fit_mom_mle


### Fitting a density function 
hist(Autoclaim_sampled$PAID,
     main = "",
     xlab = "Amount paid to settle and close a claim ",
     freq = FALSE)

### for the moment estimation
mom.shape <- fit_mom_mle[1,1]
mom.rate <- fit_mom_mle[2,1]

lines(x = sort(Autoclaim_sampled$PAID),
      y = dgamma(x = sort(Autoclaim_sampled$PAID),
                 rate = mom.rate,
                 shape = mom.shape), col = "red")

### for the maximum likelihood estimation
mle.shape <- fit_mom_mle[1,2]
mle.rate <- fit_mom_mle[2,2]

lines(x = sort(Autoclaim_sampled$PAID),
      y = dgamma(x = sort(Autoclaim_sampled$PAID),
                 rate = mle.rate,
                 shape = mle.shape), col = "blue")

legend("topright", 
       legend = c("moment", "maximum likelihood"), 
       col = c("red","blue"),
       lwd = c(2,2))


### the moment estimate provides the best fit since the density curve of the moment estimate touches the histogram better than that of the maximum likelihood


### Question 2
samp <- sample(x = Autoclaim_sampled$PAID,size = 200,replace = TRUE)
head(samp)


"MOm.MLE" <- function(x)
{
  alpha <- 1
  n <- length(x)
  mom <- alpha/mean(x)
  MLE <- mean(x)/alpha
  est <- c(mom, MLE)
  names(est) <- c("Mom", "MLE")
  return(est)
}


MOm.MLE(samp)

#### Generating several samples
n <- 200; alpha <- 1; beta <- 2; R <- 1000
Msamp <- sapply(1:R,
                function(i)rgamma(n = n,shape = 1,rate = 2))


### Monti Carlo simulation
### 
### Compute the estimates using the function
parameters <- c(1,2)
par.est <- apply(Msamp,
                 2,
                 MOm.MLE)

### biase
BiaseMSE <- function(theta.hat ,theta)
{
  bias <- mean(theta.hat)-theta
  MSE <- mean((theta.hat-theta)^2)
  Tab <- data.frame(bias,MSE)
  return(Tab)
}

### compute bias / mse for each row
apply(par.est,
      MARGIN = 1,
      function(x)BiaseMSE(theta.hat = x, theta = beta))
      



library(survival)
# Example: time to event, and event status (1 for event, 0 for censored)
survival_object <- Surv(time = Aids2$death, event = Aids2$status)
##### Truncated exponential
### log likelihood

Trunc_exp <- function(x,x_0,parameters)
{
  mu <- parameters[1]; sigma <- parameters[2]
  loglikelihood <- function(x,parameters)
  {
    mu <- parameters[1]; sigma <- parameters[2]
    f_x <- (exp(-((x-mu)/sigma)))/(sigma*(1-exp((x_0-mu)/sigma)))
    loglik <- sum(log(f_x))
    return(-loglik)
  }
  
  
  mle <- optim(par = c(mu,sigma),
               fn = loglikelihood,
               method = "L-BFGS-B",
               hessian = TRUE,
               lower = c(-Inf,0),
               upper = c(Inf,Inf),
               x = x)
  return(mle)
}

Trunc_exp(x = 100:200,x_0 = 150,parameters = c(1,2))




# stepes for MSE and Biasedness
# 1. define the estimation function (moment, mle)
# 2. generate a set of observations and apply the estimations function to it
# 3. define a funtion for computing bias and mse
# 4. use the bias_mse function to compute the biasedness and mse of the estimates from (2) and make conclusions




################################################################################
###                              TRY                                        ###
################################################################################
### p,
                 2,
                 function(x)mom.mle_exp(x,0.5))


### Biasedness and MSEUsing the exponetial distribution
### moment and mles functuion
mom.mle_exp <- function(x,lambda)
{
  mom <- 1/mean(x)
  loglikelihood <- function(x,lambda)
  {
    loglik <- sum(log(dexp(x,rate = lambda)))
    return(-loglik)
  }
  mle <- optim(par = lambda,
               fn = loglikelihood,
               method = "Nelder-Mead",
               x = x)
estimates <- c(mom, mle$par)
names(estimates) <- c("Moment", "MLE")
return(estimates)
}


#### Generating sets of observations 
r <- 5; lambda <- 0.5;n <- 10
exp_samp <- sapply(1:r,
                  function(i)rexp(n = n,rate = lambda))


### Estimatin the parameters for the various sets of observations
par.est <- apply(exp_sam
bias_mse <- function(Theta.star,theta)
{
  bias <- mean(Theta.star) - theta
  mse <- mean(Theta.star - theta)^2
  est <- c(bias,mse)
  names(est) <- c("Bias","MSE")
  return(est)
}


### Comuting the biasedness and the mse of the estimates
apply(par.est,
      1,
      function(x)bias_mse(x,0.5))
?fitdistr
?dpois




############ moment and mle of  poisson distribution
mom_mle.pois <- function(x,lambda)
{
  moment <- mean(x)
  
  likelihood <- function(x,lambda)
  {
    loglike <- sum(dpois(x, lambda, log = T))
    return(-loglike)
  }
  mle <- optim(par = lambda,
        fn =likelihood,
        method = "Nelder-Mead",
        x = x)
  estimates <- c(moment,mle$par)
  names(estimates) <- c("mom","mle")
  return(estimates)
}

##### Generating sets of observations
r <- 5; lambda <- 0.5; n <- 12
samples_pois <- sapply(1:r,
                       function(i)rpois(n,lambda))

###### estimating the parameters for the various set of observations
est.par <- apply(samples_pois, 
                 2,
                 function(x)mom_mle.pois(x,0.5))

### wrting a function to compute the biasedness and mse 
Mse_bias.pois <- function(Theta.hat, theta)
{
  bias <- mean(Theta.hat)-theta
  Mse <- mean(Theta.hat - theta)^2
  estimate <- c(bias,Mse)
  names(estimate) <- c("Bias","Mse")
  return(estimate)
}

#### computing for the biasedness
apply(est.par,
      1,
      function(x)Mse_bias.pois(x,0.5))



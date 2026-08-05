t.exp.loglikelihood <- function(x,parameters)
{
  mu <- parameters[1];sd <- parameters[2]; x0 <- parameters[3]
  pdf <- exp(-(x-mu)/sd)/(sd*(1-exp((x0-mu)/sd)))
  loglik <- sum(log(pdf))
  return(-loglik)
}





x0 <- x[15]

t.exp.fit <- optim(par = c(2,3,x0),
                   fn = t.exp.loglikelihood,
                   method = "Nelder-Mead",
                   x = windspeed)




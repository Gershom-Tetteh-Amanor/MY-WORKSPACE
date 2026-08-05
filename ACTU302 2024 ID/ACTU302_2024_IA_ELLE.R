library(openxlsx)
Data <- read.xlsx("Raw dataset.xlsx")

windspeed <- na.omit(Data$μ)
sum(is.na(windspeed))

### (a). Descriptuve statiosyics
################################################################################
###                         DESCRIPTICVVVE STATISTICS                       ###
################################################################################
### Numeric
library(psych)
describe(windspeed)

### graphical
boxplot(windspeed,
        ylab= "Mean annual wind speed, μ, in m/s")

### Most of the wind speed recorded is more are more than 2m/s
### there are few extrem wind speed recorded above 5 m/s
### the average wind speed recorded is about 2 m/s

### (b). log-likelihood function
weibull_loglik <- function(x,parameters)
{
  α <- parameters[1]
  s <- parameters[2]
  
  log_lik <- sum(log(dweibull(x,shape = α,scale = s)))
  
  return(-log_lik)
}



### (c). Fiting the Weibull distribution to the sample data on wind speed
α <- 2
s <- 3
weibull.fit <- optim(par = c(α,s),
                     fn = weibull_loglik,
                     method = "Nelder-Mead",
                     x = windspeed);weibull.fit


### (d). Exceedance probabilities
alpha <- weibull.fit$par[1]
s <- weibull.fit$par[2]
exceedance.prob <- pweibull(q = 6,alpha,s, lower.tail = FALSE);exceedance.prob

emp.exceedance.prob <- sum(windspeed>6)/length(windspeed);emp.exceedance.prob

### the empirical exceedance probability is greater than the exceedance probability from the weibull distribution


#### (e). Compare the fit of the normal and the Weibull distriution to the wind speed by supperimposing these densities on the histogram of the average wind speed data
hist(windspeed,
     main  = "",
     xlab = "Mean annual wind speed, μ, in m/s",
     freq = FALSE)

### For normal
library(MASS)
norm.par <- fitdistr(x = windspeed,
         densfun = 'normal')
mu <- norm.par$estimate[1]
sd <- norm.par$estimate[2]
x <- sort(windspeed)

lines(x = x,
      y = dnorm(x = x,mean = mu,sd = sd),
      col = "blue",
      lty = 1,
      lwd = 2)

### for weibul
lines(x = x,
      y = dweibull(x = x, shape = alpha,scale = s),
      col = "red",
      lty = 2,
      lwd = 2)

legend("topright",
       legend = c("Normal","Weibull"),
       col = c("blue","red"),
       lty = c(1,2),
       lwd = c(2,2))

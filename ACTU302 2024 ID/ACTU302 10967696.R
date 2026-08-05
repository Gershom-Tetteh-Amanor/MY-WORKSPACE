library(openxlsx)
DAtaset <- read.xlsx("Raw dataset.xlsx")

head(DAtaset)

windspeed <- DAtaset$μ
head(windspeed)

#### checking for NA responses
sum(is.na(windspeed))

### removing NA responses
windspeed <- na.omit(windspeed)

### (a). Descriptive statistics 
library(psych)
describe(windspeed)

boxplot(windspeed,
        ylab = "Mean annual wind speed, μ, in m/s")

#### the average wind speed is about 2 m/s
#### there few extreme wind speed recorded
#### most of the wind sped recorded is greater than 2 m/s


################################################################################
###                   moment for gamma                                      ###
################################################################################
gammma_moment <- function(x)
{
  alpha <- mean(x)^2/var(x)
  beta <- mean(x)/var(x)
  mom <- c(alpha, beta)
  names(mom) <- c("alpha","beta")
  return(mom)
}

#### simulating observations from the gamma distribution with alpha = 2, beta = 3, size 100
samp <- rgamma(n = 100,
               shape = 2,
               rate = 3)
gammma_moment(samp)


### (b). log-likelihood function
weibul_likelihod <- function(x,parameters)
{
  alpha <- parameters[1]
  s <- parameters[2]
  loglikelihood <- sum(log(dweibull(x,shape =alpha,scale = s)))
  return(-loglikelihood)
}

### (c).Fit the Weibull distribution
weibull.fit <- optim(par = c(2,3),
                     fn = weibul_likelihod,
                     method = "Nelder-Mead",
                     x = windspeed)

weibull.fit


### (d). Exceedance probabilities
alpha <- weibull.fit$par[1]
s <- weibull.fit$par[2]
exceedance_prob <- pweibull(q = 6,shape = alpha,scale = s, lower.tail = FALSE)
exceedance_prob

### empirical exceedance probabilty
emp.exceedance_prob <- sum(windspeed>6)/length(windspeed)
exceedance_prob



### (e). Compare the fit of the normal and the Weibull distriution to the wind speed by supperimposing these densities on the histogram of the average wind speed data
hist(windspeed,
     xlab = "Mean annual wind speed, μ, in m/s",
     main = "",
     freq = FALSE)

### superimposing Normal distribution
library(MASS)
norm.pars <- fitdistr(x = windspeed,
         densfun = "normal")
mu <- norm.pars$estimate[1]
sd <- norm.pars$estimate[2]

# sorting the windspeed data
x <- sort(windspeed)
lines(x,
      y = dnorm(x,mean = mu,sd = sd),
      col = "red",lwd = 2,lty = 1)

### superimposing Weibull distribution
lines(x,
      y = dweibull(x=x,shape = alpha,scale = s),
      col = "blue",lwd = 2, lty  =2)


legend("topright",
       legend = c("Normal","Weibull"),
       col = c("red","blue"),
       lwd = c(2,2),
       lty = c(1,2))




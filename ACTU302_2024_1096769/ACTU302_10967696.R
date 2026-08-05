library(openxlsx)
Raw_data <- read.xlsx("Raw dataset.xlsx")
head(Raw_data)

### (a) 
windspeed <- na.omit(Raw_data$μ) 
summary(windspeed)

par(mar = c(4,4,1,1))
boxplot(windspeed,
        ylab = "Mean annual wind speed, μ, in m/s")

### the average wind speed recorded is about 2m/s ###
### most of the wind speed recorded is above 2 m/s ###
### few extreme wind speed recorded ###

### (b)
log_lik <- function(x, parameters)
{
  log_lik <- sum(log(dweibull(x, shape = parameters[1], scale = parameters[2])))
  
  return(-log_lik)
}


### (c)
Weibullfit <- optim(par = c(2,3),
                    fn = log_lik,
                    method ="L-BFGS-B",
                    x = windspeed)
Weibullfit  


### (d)
### exceedance probability ###
alpha <- Weibullfit$par[1]
s <- Weibullfit$par[2]

exceedance_prob <- pweibull(q = 6,
                            shape = alpha,
                            scale = s,
                            lower.tail = F)
exceedance_prob

### empirical probability ###
emp_exceedance_prob <- sum(windspeed>6)/length(windspeed)

emp_exceedance_prob

### (e)
hist(windspeed,
     main = "",
     freq = F)

#### for normal
library(MASS)
norm.par <- fitdistr(x = windspeed,densfun = "normal")

mu <- norm.par$estimate[1]
sd <- norm.par$estimate[2]

x <- sort(windspeed)
lines(x =x,
      y = dnorm(x, mean = mu, sd = sd),
      col = 2,
      lty = 1,
      lwd = 2)

### for weibull
lines(x =x,
      y = dweibull(x, shape = alpha, scale = s),
      col = "blue",
      lty = 2,
      lwd = 2)

legend("topright",
       legend = c("normal","weibull"),
       col = c(2,"blue"),
       lty = c(1,2),
       lwd = c(2,2))

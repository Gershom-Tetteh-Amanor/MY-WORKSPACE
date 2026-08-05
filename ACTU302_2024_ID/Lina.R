library(readxl)
Data <- read_excel("Raw dataset.xlsx")

### descriptive statistics ###
### a box plot is best for this dataset, to find outliers ###

boxplot(Data$μ, xlab = "WIND SPEED",
        main = "")
summary(Data$μ)

mle_weibull <- function(x,par)
{
  log_lik <- sum(dweibull(x, par[1], par[2],
                                         log = T))
  
  ### sum(log(dweibull(x, par[1], par[2]))) ###

  return(-log_lik)
}

windspeed <- as.numeric(na.omit(Data$μ))
library(MASS)

library(fitdistrplus)
weibull_estimates <- fitdist(windspeed,
                             "weibull")
### nlm(mle_weibull, c(5,1),x = windspeed) ###

### calculating exceedence probability ###
pweibull(q=6,
         weibull_estimates$estimate[1],
         weibull_estimates$estimate[2],
         lower.tail = FALSE)

### calculating empirical probability ###
### mean(windspeed >6) ###
length(windspeed[windspeed>6])/length(windspeed)

norm_estimate <- fitdist(windspeed, "norm")
mean(windspeed)
sd(windspeed)

hist(windspeed, 
     main = "",
     probability = T)
curve(dweibull(x, 
               weibull_estimates$estimate[1],
               weibull_estimates$estimate[2]),
               add = T,
               lty = 1,
               col = "green",
               lwd = 2)

curve(dnorm(x, 
            norm_estimate$estimate[1],
            norm_estimate$estimate[2]),
      add = T,
      lty = 2,
      col = "blue",
      lwd = 2)

## Goodness of fit test
gofstat(list(weibull_estimates,
             norm_estimate))

summary(weibull_estimates)


legend("topright",
       legend = c("Weibull", "Normal"),
       col = c("green","blue"),
       lwd = c(2,2))

### (a) reading the dataset into r
#install.packages("openxlsx")
library(openxlsx)
data <- read.xlsx("Raw dataset.xlsx")


### Displaying few observations
head(data)

windspeed <- data$μ
head(windspeed)

### Descriptive statistics
#install.packages("psych")
library(psych)
describe(windspeed)
hist(windspeed,
     main = "")


### (b) loglikelihood function
log_likelihood <- function(x,parameters)
{
  alpha <- parameters[1];s <- parameters[2]
  survival <- exp(-((x/s)^alpha))
  pdf <- (alpha*x^(alpha-1)/(s^alpha))*(exp(-((x/s)^alpha)))
  log_lik <- sum(log(pdf))
  return(-log_lik)
}



### (c) Fiting the Windspeed data to the Weibul distribution
### Taking off the NA responses from the windspeed
windspeed <- windspeed[!is.na(windspeed)]
mle <- optim(par = c(2,3),
             fn = log_likelihood,
             method = "Nelder-Mead",
             x = windspeed);mle


### (d)
alpha <- mle$par[1];s <- mle$par[2]
exceed_prob <- exp(-((6/s)^alpha))
emp_exceed_prob <- length(windspeed[windspeed>6])/length(windspeed)


### For normal
lines(x = sort(windspeed),
      pnorm(q = sort(windspeed),mean = mean(windspeed),sd = sqrt(var(windspeed))),
      lwd = 2,
      col = "red")

### for Weibil
density <- 1 - exp(-((sort(windspeed)/s)^alpha))
#lines(x = sort(windspeed,
#               y = density))                   

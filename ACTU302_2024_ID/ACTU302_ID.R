### (a). Descriptive statistics
### reading dataset into r
library(openxlsx)
data <-  read.xlsx("Raw dataset.xlsx")

#library(readxl)
#data <- read_excel("Raw dataset.xlsx")

# selecting the average wind speed variable
windspeed <- na.omit(data$μ)


summary(windspeed)
hist(windspeed,
     main = "",
     xlab = "Mean annual wind speed, μ, in m/s")

par(mar = c(4,4,1,1))
boxplot(windspeed,
        ylab = "Mean annual wind speed, μ, in m/s")


### (b) log-likelihood function
log_likelihood <- function(x,parameters)
{
  alpha <- parameters[1]; s <- parameters[2]
  pdf <- ((alpha*x^(alpha-1))/s^alpha)*exp(-(x/s)^alpha)
  log_like <- sum(log(pdf))
  return(-log_like)
}


### (c) Fitting the Weibull distribution to the sample data on wind speed.
weibull.fit <- optim(par = c(2,3),
                     fn = log_likelihood,
                     method = "Nelder-Mead",
                     x = windspeed);weibull.fit


### (d) Exceedance probabilities
alpha <- weibull.fit$par[1]
s <- weibull.fit$par[2]
pweibull(q =6,shape = alpha,scale = s,lower.tail = FALSE)

exceed.prob <- exp(-(6/s)^alpha)

emp_exceed.prob <- length(windspeed[windspeed>6])/length(windspeed)


### (e) supperimposing densities on the histogram of the average wind speed data
hist(windspeed,
     main = "",
     xlab = "Mean annual wind speed, μ, in m/s",
     freq = FALSE)

### for normal
x<- sort(windspeed)
lines(x,
      y = dnorm(x ,
                mean = mean(x),
                sd = sd(x)),
      col = "red",
      lwd = 2)



wei.density <- ((alpha*x^(alpha-1))/s^alpha)*exp(-(x/s)^alpha)
lines(x,
      y = wei.density,
      col = "blue",
      lwd = 2)

legend("topright",legend = c("Normal","Weibull"), col = c("red","blue"),lwd = c(2,2))

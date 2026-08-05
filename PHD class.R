# Fri Jun 12 13:11:10 2026 ------------------------------
### Probability Distribution

# d- density
# p - cdf
# q - quantile
# r - random variable


?rexp

## With the pexp, we can get the survivor
Data <- rexp(n = 100,
             rate = 0.5)

par(mar = c(4,4,1,1))
hist(Data,
     main = NULL,
     freq = FALSE)

pexp(q =4, rate = 0.5, lower.tail = TRUE) ### pdf
pexp(q =4, rate = 0.5, lower.tail = FALSE) ### survivor


dexp(x = 4, rate = 0.5, log = FALSE)


### Gamma
?rgamma

gData <- rgamma(n = 500,
       shape = 2, 
       rate = 0.2)
hist(gData, 
     main = "")


mean(gData)
var(gData)






#### Functions
### Density of exponential
Mydexp <- function(x,lambda) lambda*exp(-lambda*x)

Mydexp(x = 4, lambda = 0.5)


Mypexp <- function(lambda,x) 1-exp(-lambda*x)
pexp(q = 4, rate = 0.5)
Mypexp(lambda = 0.5, x = 4)


Myqexp <- function(lambda,p) (-1/lambda)*log(1-p)
qexp(p = 0.5, rate = 0.5)
Myqexp(lambda = 0.5,p = 0.5)



P <- runif(n = 5000)
edata <- Myqexp(lambda = 0.5, p = P)
hist(edata,main = NULL)


summary(edata)

### (1) b
### 1. search for the package on your browser
### 2. select the link provided by the R CRAN 
### 3. select archive and download the latest version to your drive
### 4. open the install button unfer the packages tab
### 5. select install from package archive
### 6. browse to the location of the packege and install
### 
### 
### 
###  (2)
library(ReIns)
?ExpQQ
### Computes the empirical quantiles of a data vector and the theoretical quantiles of the standard exponential distribution. These quantiles are then plotted in an exponential QQ-plot with the theoretical quantiles on the x-axis and the empirical quantiles on the y-axis.

##### modify expqq to get pareto ####
ExpQQ
my_pareto <- function (data, main = "pareto QQ-plot") 
{
  
  X <- as.numeric(sort(data))
  n <- length(X)
  eqq.the <- -log(1 - (1:n)/(n + 1))
  paretoqq.emp <- log(X)
  plot(eqq.the, eqq.emp, type = "p", xlab = "Quantiles of standard pareto", 
       ylab = "log (x)", main = main)
  
}


### (d) ###
library(insuranceData)
data(AutoClaims)
x <- AutoClaims[sample(nrow(AutoClaims),500),]

par(mfrow= c(1,2))
###ExpQQ
par(mar = c(4,4,1,1))
ExpQQ(x$PAID, main = "")



###ParetoQQ
par(mar = c(4,4,1,1))
my_pareto(x$PAID)



##### QUESTION (3) #####
library(FinancialMath)
cont <- c(80000,10000,10000,10000,20000,2000,2000,2000,2000,2000,0)
returns <- c(0,0,0,0,12000,30000,40000,35000,25000,15000,8000)

cashflow <- returns - cont

NPV(cf0 = cashflow[1], cf = cashflow[-1],times = 1:10, i = 0.15)

my_npv <- function(cf0,cf,times,i)
{
  cf0 = abs(cf0)
  pv = sum(cf/(1+i)^times)
  npv = pv - cf0
  return(npv)
}

my_npv(cf0 = cashflow[1], cf = cashflow[-1],times = 1:10, i = 0.15)





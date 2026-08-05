library(MASS)
data("Insurance")

### question 1
### (a) data structure
str(Insurance)

### (b). Descriptive statistics
library(skimr)
skim(Insurance)

boxplot(Insurance[,4:5])

### (c) random selection
library(dplyr)
library(sampling)
insurance <- Insurance
insurance$selected <- srswor(n = 50, N = length(Insurance$District))

samp <- filter(insurance,srswor==1) |>
  select(-length(insurance))
head(samp)

### (d) correlation coefficient
with(samp,cor(Claims,Holders))
#### strong relationship

### test for significance of the relationship at 10% level of significance
with(samp,
     cor.test(x = Claims, y = Holders,
              alternative = "two.sided",
              method = "pearson",
              conf.level = 0.10))
### since the estimate is within the confidence interval, we reject the null hypothesis, thus there is no significant relationship


### (e). 
with(samp,
     plot(x = Claims,
          y = Holders))




### question 2
### (a)
with(samp,
     boxplot(Claims~Age))

### (b). the descriptive statistics does not support equality in claims



### (c)
### Hypothesis
### Ho: the average claims per age category are equall
### H1: at least one of the average claims per age category is different  
anova <- aov(Claims~Age,data = samp)
summary(anova)

### Critical value - value 
qf(p = 0.05,df1 = 3,df2 = 46)

### since the F* = 11.1 is greater than the critical value, we reject the null hypothesis. thus we reject the claim that the average claims per age category are equall 




### (d) post hoc test
### using the Tukey's HSD
TukeyHSD(x = anova)







### question 3
### (a)
library(fitdistrplus)
mom.fit <- fitdist(data = samp$Claims,distr = "gamma", method = "mme")
mle.fit <- fitdist(data = samp$Claims,distr = "gamma", method = "mle")




gamma.loglikelihood <- function(x,parameters)
{
  loglik <- sum(dgamma(x,shape = parameters[1],rate = parameters[2],log = TRUE))
  return(-loglik)
}
mle.fi <- optim(par = )


### (b)
hist(x = samp$Claims,
     main = "",
     freq = FALSE,
     xlab = "Claims")
### for moment
mom.alpha <- mom.fit$estimate[1]
mom.beta <- mom.fit$estimate[2]
x <- sort(samp$Claims)
lines(x =x,
      y = dgamma(x =x, shape = mom.alpha,rate = mom.beta),
      col = "red",
      lty = 3,
      lwd = 2)






### question 4
### (a)
library(FinancialMath)
project_A <- c(NPV(cf0 = -10000,cf = c(12500,100,10,200,200), times = 1:5,i = 0.19),
  IRR(cf0 = -10000,cf = c(12500,100,10,200,200), times = 1:5))
names(project_A) <- c("NPV","IRR")
project_A

project_B <- c(NPV(cf0 = -10000,cf = c(-1000,0,100,200,20000),times = 1:5, i= 0.19),
               IRR(cf0 = -10000,cf = c(-1000,0,100,200,20000),times = 1:5))
names(project_B) <- c("NPV","IRR")
project_B



### (b) our function that computes the bpv
my_npv <- function(cf0,cf,times,i)
{
  cf0 <- abs(cf0)
  pv <- sum(cf/(1+i)^times)
  npv <- pv - cf0
  return(npv)
}


### (c)
project_A.new <- NPV(cf0 = -10000,cf = c(12500,100,10,200,200), times = 1:5,i = 0.19);project_A.new

project_B.new <- NPV(cf0 = -10000,cf = c(-1000,0,100,200,20000),times = 1:5, i= 0.19);project_B.new


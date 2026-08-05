#DEPARTMENT OF STATISTICS AND ACTUARIAL SCIENCE
#COLLEGE OF BASIC AND APPLIED SCIENCES
#UNIVERSITY OF GHANA
#ACTU 302: INTRODUCTION TO ACTUARIAL COMPUTING
#EXERCISE V

#Considering a random variable X which has a gamma distribution with parameters α and β.

### i. Writing our own function that will return the moment and maximum likelihood estimates of the parameters (α and β).

Estimates <- function(x, parameters)
{
  alpha <- parameters[1];beta <- parameters[2]

  Moment <- function(x)
  {
    alpha <- (mean(x)^2)/var(x)
    beta <- mean(x)/var(x)
    
    mom <- c(alpha,beta)
    names(mom) <- c("alpha","beta")
    return(mom)
  }
  moment <- Moment(x)
  
  log_likelihood <- function(x,parameters)
  {
    alpha <- parameters[1];beta <- parameters[2]
    log_like <- sum(log(dgamma(x,alpha,beta)))
    return(-log_like)
  }
  mle <- optim(par = c(alpha,beta),
               fn = log_likelihood,
               method = "L-BFGS-B",
               x = x)
  Table <- data.frame(moment = moment,
                      mle = mle$par)
  return(Table)
}


### ii. Simulating samples of different sizes to investigate the empirical consistency of the estimators.

# 10 samples
Estimates(x = rgamma(10,shape =1,rate = 2),parameters = c(1,2))

# 100 samples
Estimates(x = rgamma(100,1,2),parameters = c(1,2))

# 1000 samples
Estimates(x = rgamma(1000,1,rate = 2),parameters = c(1,2))

### iii. Fiting the Loss incurred in the AutoBi data from package InsuranceData with the gamma distribution using the two methods.
library(insuranceData)
data("AutoBi")

library(fitdistrplus)

# for the method of moment estimation
fitmme <- fitdist(data = AutoBi$LOSS, 
        distr = "gamma", 
        method = "mme",
       discrete = FALSE);fitmme

# for the method of maximum likelihood estimation
fitmle <- fitdist(data = AutoClaims$PAID,# AutoBi$LOSS, 
        distr = "gamma", 
        method = "mle",
        discrete = FALSE);fitmle

### iv. Superimposing the densities of the two methods on the histogram of the loss data. Which method provides a better fit? Explain.
hist(AutoBi$LOSS,
     main = "",
     xlab = "Loss incurred ",
     freq = FALSE)

### for the moment estimation
mme.shape <- (fitmme$estimate)[1]
mme.rate <- (fitmme$estimate)[2]

lines(x = sort(AutoBi$LOSS),
      y = dgamma(x = sort(AutoBi$LOSS),
                 rate = mme.rate,
                 shape = mme.shape), col = "red")

### for the maximum likelihood estimation
mle.shape <- (fitmle$estimate)[1]
mle.rate <- (fitmle$estimate)[2]

lines(x = sort(AutoBi$LOSS),
      y = dgamma(x = sort(AutoBi$LOSS),
                 rate = mle.rate,
                 shape = mle.shape), col = "blue")

legend("topright", legend = c("moment", "maximum likelihood"), col = c("red","blue"),lwd = c(2,2))

### v. Computing the probability of recording losses greater than 95th, 99th and 99.9th percentiles of the data using the estimates of the parameters from (iii). 
### Check these values with the relative exceedance frequencies from the data and comment on the results.

### computing the quantiles (95th, 99th and 99.9th) of the LOSS in the AutoBi data
quantiles <- quantile(AutoBi$LOSS,probs = c(0.95,0.99,0.999))

### For moment estimation
pgamma(quantiles,rate = mme.rate, shape = mme.shape,lower.tail = F)

### For maximum  likelihood estimation
pgamma(quantiles,rate = mle.rate, shape = mle.shape,lower.tail = F)

#### computing the exceedance probability for the data
exceedance_prob <- c()
for(i in 1:3){exceedance_prob[i] <- sum(AutoBi$LOSS>quantiles[i])/length(AutoBi$LOSS)}
names(exceedance_prob) <- c("95%","99%","99.9");exceedance_prob




srswor<-srswor(300,length(Ghana_2021PHC_EA_Frame$`Region Code`))
Ghana_2021PHC_EA_Frame$srswor<-srswor(300,length(Ghana_2021PHC_EA_Frame$`Region Code`))

# filtering out only the selected samples by srswor
sample_srswor<-Ghana_2021PHC_EA_Frame%>%filter(srswor==1)





read.table("https://lstat.kuleuven.be/Wiley/
Data/desmoin.txt")


install.packages(
  c("arrow", "babynames", "curl", "duckdb", "gapminder",
    "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman",
    "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins",
    "repurrrsive", "tidymodels", "writexl")
)


library(insuranceData)
data("AutoBi")
fada <- na.omit(AutoBi)
library(writexl)
write_xlsx(fada,path = "myfile.xlxs")





















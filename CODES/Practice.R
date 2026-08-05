# UNIVERSITY OF GHANA

# DEPARTMENT OF STATISTICS AND ACTUARIAL SCIENCE ACTU 302: INTRODUCTION TO ACTUARIAL COMPUTING(3 CREDITS)


# EXERCISE I
# Study the functions ExpQQ and ParetoQQ in the R package ReIns.
# i. What does the functions, ExpQQ and ParetoQQ, outputs show? Explain.
#### loading the Re\Ins package
library(ReIns)

?ExpQQ
# Exponential quantile plot (ExpQQ) Computes the empirical quantiles of a data vector and the theoretical quantiles of the standard exponential distribution. These quantiles are then plotted in an exponential QQ-plot with the theoretical quantiles on the x-axis and the empirical quantiles on the y-axis.


?ParetoQQ
# Pareto quantile plotComputes the empirical quantiles of the log-transform of a data vector and the theoretical quantiles of the standard exponential distribution. These quantiles are then plotted in a Pareto QQ-plot with the theoretical quantiles on the x-axis and the empirical quantiles on the y-axis.



# ii. Generate a number of observations from the normal distribution with mean 20 and variance 4. Use the functions in (i) to plot these data. Repeat this exercise but in this case make sure there is no title in your plots.

## Generating observations from the norm distrbyution with paramerees 20,4 (sd = 2)
# r for generating random observations
# d pdf
# p cdf
# q quantile

# generayting 100 observation
set.seed(123
         );Norm_sam <- rnorm(n =100,
                              mean = 20,
                                sd = sqrt(4))

head(Norm_sam) # first 6 observtions
tail(Norm_sam) # last 6 observations
par(mfrow = c(1,3))
ExpQQ(Norm_sam)
ParetoQQ(Norm_sam)
LognormalQQ(Norm_sam)
### The lognormal_QQ plot seem to fit the data best since 

# repeating the exx but without tittles
par(mfrow = c(1,3))
ExpQQ(Norm_sam, main = "")
ParetoQQ(Norm_sam, main = "")
LognormalQQ(Norm_sam, main = "")



# iii. Look for the cummulative distribution functions of the exponential and Pareto distributions. Invert these functions to obtain the quantile functions for each distribution.






# iv. Write your own functions based on (iii) to obtain the plots in (ii) and compare them.
Akrofi.exp <- function(y,lambda)
{
  y <- sort(y)
  n <- length(y)
  p <- (1:n)/(n+1)
  x <- -(1/lambda)*log(1-p)
  plot(x,y)
}
Akrofi.exp(Norm_sam,2)




#v. Simulate 100 observations from the exponential distribution with mean 4. Use your functions in (iv) to obtain plots of this data. Comment of the fit of these distributions to the data.


#vi. The Society of Actuaries (SOA) Group Medical Insurance data studied in Minkah et al. (2021) and can be found at https://lstat.kuleuven.be/Wiley/Data/soa.txt. Read the data into R and download the paper. Reproduce the plots concerning the claims data on the left panel Figure 10 Minkah et al. (2021, pg. 16) and left panel of # Figure 11 Minkah et al. (2021, pg. 17). Comment on the fit of these distributions to the data
#References
#Minkah, R., de Wet, T., and Ghosh, A. (2021). Robust estimation of Pareto-type tail index through an exponential regression model. Communications in Statistics - Theory and Methods, pages 1–21.





read.table("https://lstat.kuleuven.be/Wiley/Data/desmoin.txt)


library(datasets)
data("chickwts")
head(chickwts)


par(mar = c(4,4,1,1))
### a. Histogram of weight
hist(x = chickwts$weight,
     main = NULL,
     xlab = "chick weight",
     col = "green",
     breaks = 20)

### Bar chart
feed_tab <- table(chickwts$feed)
feed_tab

barplot(feed_tab,
        xlab = "Feed Types",
        ylab = "Number of Chicks",
        col = rainbow(6))


### c.pie chart
par(mar = c(1,1,1,1))
pie(feed_tab)


### d. stem-and-leaf plot
stem(chickwts$weight)


### e. side by side boxplot of feed types
par(mar = c(4,4,1,1))
weight<-chickwts$weight
feed<-chickwts$feed
boxplot(weight~feed,col=2:8)




### Q5
head(mtcars)
fivenum(summary(mtcars$mpg))
summary(mtcars$mpg)[-4]


### b.
### IQr
IQR(mtcars$mpg)
var(mtcars$mpg)


library(dplyr)
mtcars |> 
  select(mpg) |> 
  summarise(Iqr = IQR(mpg),
            Variance = var(mpg),
            `Std. Deviation` = sd(mpg),
            `COV` = (sd(mpg)/mean(mpg)*100)) 



### c. skewness 
library(e1071)
skewness(mtcars$mpg)
kurtosis(mtcars$mpg)    



### d.scatterplot matrix for mpg, hp,wt and disp
par(ma)
mtcars |> 
  select(mpg,hp,wt,disp) |> 
  pairs(col = "brown")



mtcars |> 
  group_by(cyl) |> 
  summarise(Mean = mean(mpg),
            Median = median(mpg),
            SD = sd(mpg))



Corr_scatter <- function(X,Y, color="turquoise",xlab = "X",ylab = "Y"){
  plot(X,Y,
       col = color,
       xlab = xlab,
       ylab = ylab)
  r <- paste("The correlation coefficient of X and Y is ", cor(X,Y))
  return(r)
}


Weigh <- c(60,68,70,79,63,58,65,55)
Height <- c(1.78,1.56,1.88,1.54,1.55,1.34,1.99,1.80)


Corr_scatter(X = Weigh,
             Y = Height,
             color = "brown")


#### ASSIGNMENT 
#### write a function to compute
#### a. pearson
#### b. Kendal
#### c. spearman and put them in data frame

X <- c(15,12,19,19,11)
Y <- c(2,18,19,21,14)


C <- 0
D <- 0
t <- 0
tx <- 0
ty <- 0
n <- length(X)




for(i in 1:(n-1)){
  for(j in (i + 1):n){
    if(X[i] < X[j] & Y[i] < Y[j]){
      C <- C + 1
    } else if(X[i] > X[j] & Y[i] > Y[j]){
      C <-C + 1
    } else if(X[i] < X[j] & Y[i] > Y[j]){
      D <- D + 1
    } else if(X[i] > X[j] & Y[i] < Y[j]){
      D <- D + 1
    } else{
      t <- t + 1
      
      if(X[i] == X[j]){
        tx <- tx + 1
      }
      
      if(Y[i] == Y[j]){
        ty <- ty + 1
      }
    }
  }
}



KT <- (C-D)/sqrt((n*(n - 1)/2 - tx) * (n*(n - 1)/2 - ty))



#### We are wring a function that finds the moment estimates for:
### a. poisson distribution
mom_pois <- function(data){
  ## if x~pois(lambda)
  ## E(x) = lambda
  lambda_hat = mean(data)
  return(lambda_hat)
}

pois_data <- rpois(n = 1000,
                   lambda = 1)


mom_pois(pois_data)


### b. Exponential distribution
mom_exp <- function(data){
  ### If x~exp(lambda)
  ### then E(X) = 1/lambda
  ### this implies that
  ### x_bar = 1/lambda
  ### Thus lambda_hat = 1/x_bar
  x_bar <- mean(data)
  lambda_hat <- 1/x_bar
  return(lambda_hat)
  
}


### Simulating some observations from the exponential distribution
exp_data <- rexp(n = 100,
                 rate = 1)

mom_exp(exp_data)


### c. Gamma distribution
mom_gamma <- function(data){
  alpha_hat <- mean(data)^2/var(data)
  beta_hat <- mean(data)/var(data)
  estimates <- c(alpha_hat,beta_hat)
  names(estimates) <- c("alpha","beta")
  return(estimates)
}


### Simulating observations from the gamma distribution
set.seed(104)
gamma_data <- rgamma(n = 100,
                     shape = 1,
                     rate = 2)
par(mar = c(4,4,1,1))
hist(gamma_data)



mom_gamma(gamma_data)



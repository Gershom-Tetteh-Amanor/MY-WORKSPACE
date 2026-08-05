# Tue May 14 13:58:44 2024 ------------------------------------------------
###########################################################################
###          Installing packages from the r cran archive               ####
###                                                                    ####
###########################################################################        
### dependencies = true implies you're interested in the either dependency else you're not

### Installing packages no more on r cran (zelifg)
### now there some dependencies so you need to install them first
### search for the package name on your browser
### tap on the package name link provided by the CRAN
### tap on the archive link to see the various version/ updates of the package
### select the latest update and download 
### install the package using the path of the downloaded package

### ALTERNATIVELY
### if the package is on the github repository, 
### install the "remotes" package from the cran
### 

### Obtaining data or functions from a package
### 1. load the package using library function
### 2. 

library(AER)
?BankWages
data("BankWages")
# Bankwages cannot just be loaded without the data function
?anorexia # Error because the required package is not loaded
??anorexia # Search through all the installed packages

### Attaching a data from a package
### We use the data function
data("BankWages")



###########################################################################
###                          DATA STRUCTURES                            ###
###########################################################################

### 1. VECTOR: one dimensional which takes one data types
### 2. MATRIX : contains only one data types, two dimensional
### 3. DATAFRAME : can contain different data types, two dimensional
### 2 and 3 are the same in terms of structure
### 4. LIST: can contain other data structures and one dimensional

 
#############################################################################
###                              DATA TYPES                               ###
##################################################################### ######
### 1. Numeric
### 2. Character
### 3. Missing data (NA)
### 4. Logical (TRUE/FALSE)
### 5. Factor: Nominal and ordinal
### 6. Date and Time



### 1. VECTOR
# we use the concatenation function, "c" to create a vector in r
Age <- c(28,18,23,20,21)
Religion <- c("christian","muslim","traditionalist","other","christian")
Weight <- c(70,150,65,85,92)
Height <- c(1.65,1.71,1.82,1.79,1.54)
None <- c(NA,NA)
T_F_Data <- c(FALSE,TRUE,T,F,T)
10:1 # Numbers from 10 to 1 in steps of 1
rep(3,10) # Repete 3 10 times
seq(from=1,to=100,by=10) # sequence from 1 to 100 in steps of 10 

matrix(c(Age,Weight,Height),ncol = 3,nrow = 5)


### 2.MATRIX
### we use the matrix function
### or the cbind if we specifically wants to combine vectors column-wise to form a matrix
### or the rbind if we specifically wants to combine vectors row-wise to form a matrix
Data <- 1:18
?matrix
MAt.DAta <- matrix(data = Data, nrow = 3, ncol = 6, byrow = FALSE)
MAt.DAta <- matrix(data = Data, nrow = 3, ncol = 6, byrow = TRUE)
### if byrow is TRUE, then the vector will be coerced row-wise else column-wise (by default)
cbind(Age,Weight,Height) # each vector is a column
rbind(Age,Weight,Height) # each vector is a row


### 3. DATAFRAMES
rbind(Age,Weight,Height,Religion)
# Now everything has been changed to character.... that's why we use data/frame function
# since rbind is for matrix and matrices takes only one data type

Df.Data <- data.frame(Age,Weight,Height,Religion)


### 4. LIST
mylist <- list(Numeric = Age,Character = Religion,Matrix = MAt.DAta, Dataframe = Df.Data)


### Retrieving or subscription of observations from data structures
### 1. vectors
Age[3]
Religion[3]

### Using the object names
names(Age) <- LETTERS[1:5]
Age["C"]

### 2. Matrix and data frames
### You have rows and columns
MAt.DAta[2,3]
MAt.DAta[2,];MAt.DAta[2,1:6]

## For taking observations for a variable (column)
Df.Data$Age


### 4. LIst
# just as vectors
mylist[1] # comes as a list
mylist$Numeric  #comes


# Fri May 17 13:59:45 2024 ----------------------------------------------------
###############################################################################
###                        DATA STRUCTURES                                 ####
###############################################################################

?state.x77
str(state.x77)
is.matrix(state.x77)
is.data.frame(state.x77)



library(MASS)
?anorexia
str(anorexia)
is.matrix(anorexia)
is.data.frame(anorexia)


###############################################################################
###                   READING DATA INTO R                                  ####
###############################################################################
### 1. EXCEL
### a. Using the import button under the environment
### b. Using functions from packages like read.csv, read.table, read_xlsx, read.excel
anorexia
Data <- read.table(file.choose())
Data <- read.table(file="myanorexia.txt",header=FALSE)


# Thu May 23 11:54:47 2024 ----------------------------------------------------
###############################################################################
###                      DESCRIPTIVE STATISTICS                            ####
###############################################################################
### QUALITATIVE DATA
### FREQUENCY TABLES (FOR CATEGORICAL AND NOMINAL)
library(MASS)
Insurance$District # Categorical with nominal scale
table(Insurance$District) ### Frequency table

Insurance$Group #Ordinal scale
table(Insurance$Group) ### Frequency table

Insurance$Age #Ordinal scale
table(Insurance$Age) ### Frequency table


### GRAPHICAL
### PIE CHART
cats
sex.freq <- table(cats$Sex)
pie(sex.freq) ## pie chart for describing categorical data
### Margins of plot
par(mar=c(2,2,0.5,0.1))
pie(sex.freq)
library(plotrix)
pie3D(sex.freq,explode = 0.5) ### 3-D pie plot


### BAR CHAT
barplot(sex.freq,
        col= c("#bf1090","#bbf120"),
        horiz = F,
        density = NULL,
        beside=T,
        angle=30)





#### QUANTITVE DATA
#### HISTOGRAM
?hist
par(mar=c(4,4,0.1,0.1))
hist(cats$Hwt,
     xlab= "Heart Weight",
     main="",
     col=c("#bbf001","#bff","#bbf","#bf1111","#fbb"))


### STEM AND LEAF  PLOT
stem(cats$Hwt)


### BOX AND WHISKER PLOT
?boxplot
boxplot(cats$Hwt,col="#bf0101")

### SIDE BY SIDE BOXPLOT
boxplot(Hwt~Sex,data=cats,col=c("#bf1","#bbf"))
colnames(cats)


### SCATTER PLOT
plot(cats)
plot(x = anorexia$Prewt,
     y = anorexia$Postwt,
     xlab = "Pre weight (kg)",
     ylab = "Post weight (kg)")

### ASSIGNMENTS
### 1. interpret the graphs
### 2. video on side by side plots





### USING GGPLOT
library(ggplot2)
library(MASS)
?ggplot
ggplot(data = anorexia, mapping = aes(x = Prewt,
                                      y = Treat)) + 
         geom_boxplot(aes(fill =Treat),
                      show.legend = T) + 
  theme_minimal()



ggplot(data = anorexia, mapping = aes(x = Prewt,
                                      y = Treat)) + 
  geom_boxplot(aes(colour = Treat),
               show.legend = F) + 
  theme_minimal()



# Sun May 26 11:28:19 2024 ------------------------------
### Histogram
library(MASS)
?anorexia
?Cars93
str(Cars93)

### Frequency Histogram
hist(x=Cars93$Price,
     main=NULL,
     xlab = 'Price',
     col = rainbow(7))

### Frequency Histogram with breaks
hist(x=Cars93$Price,
     main=NULL,
     xlab = 'Price',
     col = rainbow(7),
     breaks = 10)

### Relative Frequency Histogram
hist(x=Cars93$Price,
     main=NULL,
     xlab = 'Price',
     col = rainbow(7),
     freq = FALSE)

### Adding frequency polygon or density curves
?density
plot(density(x=Cars93$Price,
             bw=2),
     main = "",
     xlab = "price of cars")


### superimposing frequency polygon or density curves on histogram
lines(density(x=Cars93$Price,
              bw=6),col='red')

### STEM AND LEAF 
?stem
stem(Cars93$Price)
stem(x=Cars93$MPG.highway)
hist(x=Cars93$MPG.highway,
     breaks = 7,
     main = "",
     xlab = 'price')

### Box plot
# inner lower fence = Q1 - 1.5IQR
# inner upper fence = Q3 + 1.5IQR
# outer lower = Q1 - 3IQR
# outer upper = Q3 + 3IQR
# Any observation beyond your inner fence is a mild outlier
# Any observation beyond your outer fence is an extreme outlier


?boxplot
# boxplot for price of cars
boxplot(Cars93$Price,
        ylab = 'Price of cars',
        col = '#bff010')


# MPG.city
boxplot(Cars93$MPG.city,
        ylab = 'MPG for city',
        col = '#bff')

### Two or more variables
head(anorexia) # show few (6) observations of the data

### for the numerical data
boxplot(anorexia[,-1],
        ylab = 'Weights of Females',
        xlab = 'weighing time',
        col = rainbow(2))
### Interpretation
### generally, the postwt gain more weight than Prewt
### prewt is slightly symmetric while postwt is right skewed


### Side by side box plots (for a particular variable, usually numeric conditioned on other variable, usually qualitative)
### for Postwt
boxplot(Postwt~Treat, data = anorexia,
        xlab = 'treatment type',
        ylab = 'post weight',
        col = c('red','white','blue'))


?InsectSprays
head(InsectSprays)
boxplot(count~spray,
        data=InsectSprays,
        col = rainbow(6),
        ylab = 'count of insects',
        xlab = 'spray')



# Thu May 30 12:05:02 2024 ------------------------------
### Descriptive statistics
library(psych,MASS)
?describe
?anorexia
describe(anorexia[,-1])
# trimmed means takes care of extreme values (outliers ) 25% to the lower and 25% to the upper
### explain the difference between SD and SE
### Standard deviation reflects variability within a sample, while the standard error estimates the variability across samples of a population.




################################################################################
###                                   FUNCTIONS                              ###
################################################################################
# functions takes input(s) [arguments] and produce outputs
# TYPES
# a. Inbuilt functions: c(), describe(), plot()
# b. User defined functions
 
### Each function may takes in some argument(S) and may produce output(s)


#### User Defined Syntax
# function_Name <- function(
#   argument(s))
#   {
#   BODY
#   return(output)
#   }


# write a function that takes in two arguments (numeric vectors), (X,Y), plots and computes the correlation coefficient

mycor <- function(x,y)
{
 par(mar=c(4,4,1,1))
   plot(x,y,
       xla= names(x),
       ylab = names(y),
       main = NULL)
   
   ####### computing the correlation
   n <- length(x)
   d <- rank(x)-rank(y)  ### difference in ranks
   r <- 1-(6*sum(d^2))/(n^2*(n-1))
   
   return(r)
}

library(MASS)
mycor(x=anorexia$Prewt,y=anorexia$Postwt)

#### ASSIGNMENT 
#### write a function to compute
#### CGPA, Grading
#### a. pearson
#### b. Kendal
#### c. spearman and put them in data frame

## a function that ask for users scores and credit hours and returns the grading , grade point and GPA
GPA <- function()
{ # creating an empty dataframe with three user input variables
  scores <- data.frame(
    Course_Code = character(),
    marks = numeric(), 
    credit_Hours = numeric()
  )
  # editing the dataframe by keying in user values
  score <- edit(scores)
  
  # Defining some vectors
  mrks <- as.vector(score$marks)
  credit <- as.vector(score$credit_Hours)
  Grade <- c()
  GPT <- c()
  
  
  for(i in 1:length(mrks)){
    if(mrks[i]> 100)
    {
      grade <- 'N/A'
      gpt <- 0*(credit[i])
    }
    else if(mrks[i] >= 80)
    {
      grade <- "A"
      gpt <- 4.0*(credit[i])
    }
    else if(mrks[i] >= 75)
    {
      grade <- "B+"
      gpt <- 3.5*(credit[i])
    }else if(mrks[i] >= 70)
    {
      grade <- "B"
      gpt <- 3.0*(credit[i])
    }else if(mrks[i] >= 65)
    {
      grade <- "C+"
      gpt <- 2.5*(credit[i])
    }else if(mrks[i] >= 60)
    {
      grade <- "C"
      gpt <- 2.0*(credit[i])
    }else if(mrks[i] >= 55)
    {
      grade <- "D+"
      gpt <- 1.5*(credit[i])
    }else if(mrks[i] >= 50)
    {
      grade <- "D"
      gpt <- 1.0*(credit[i])
    }else if(mrks[i] >= 45)
    {
      grade <- "E"
      gpt <- 0.5*(credit[i])
    }else if(mrks[i] >= 0)
    {
      grade <- "F"
      gpt <- 0.0*(credit[i])
    }
    else if(mrks[i]<0){
      grade <- 'N/A'
      gpt <- 0*(credit[i])
    }
    
    Grade[i] <- grade
    GPT[i] <- gpt
  }
  
  ### calculation for the CGPA
  ### removing the credits fro F
  credit.taken <- credit
  for(i in 1:length(GPT))
  {
    if(GPT[i]==0.0)
    {
      credit.taken[i] <- 0
    }
  }
  CCT <- sum(credit.taken) # cumulative credit taking
  CGPT <- sum(GPT) # Cumulative grade point taken
  
  gpa <- round(CGPT/CCT,2)
  GPA <- c(gpa, rep(x=' ', times = length(mrks)-1))
  
  return(data.frame('Course Code' = score$Course_Code,'Marks (%)' = mrks,'Credit Hours' = credit, 'Grade' = Grade,'Grade Point' = GPT, 'GPA' = GPA))
}

GPA()





################################################################################
###               MODIFYING AN INBUILT FUNCTION IN R                         ###
################################################################################

### call the function without the parenthesis
describe

### copy the function code from your console to your scripts and edit
my_describe<- function (x, na.rm = TRUE, interp = FALSE, skew = TRUE, ranges = TRUE, 
          trim = 0.1, type = 3, check = TRUE, fast = NULL, quant = NULL, 
          IQR = FALSE, omit = FALSE, data = NULL, size = 50) 
{
  if (inherits(x, "formula")) {
    ps <- fparse(x)
    if (missing(data)) {
      x <- get(ps$y)
      group <- x[, ps$x]
    }
    else {
      x <- data[ps$y]
      group <- data[ps$x]
    }
    describeBy(x, group = group, na.rm = na.rm, interp = interp, 
               skew = skew, ranges = ranges, trim = trim, type = type, 
               check = check, fast = fast, quant = quant, IQR = IQR, 
               omit = omit, data = data)
  }
  else {
    cl <- match.call()
    valid <- function(x) {
      sum(!is.na(x))
    }
    if (!na.rm) 
      x <- na.omit(x)
    if (is.null(fast)) {
      if (prod(dim(x)) > 10^7) {
        fast <- TRUE
      }
      else {
        fast <- FALSE
      }
    }
    nvar <- NCOL(x)
    v.names <- colnames(x)
    if (nvar < size) {
      result <- describe(x = x, na.rm = na.rm, interp = interp, 
                           skew = skew, ranges = ranges, trim = trim, type = type, 
                           check = check, fast = fast, quant = quant, IQR = IQR, 
                           omit = omit, data = data)
    }
    else {
      n.steps <- ceiling(nvar/size)
      short <- function(i) {
        loweri <- (i - 1) * size + 1
        upperi <- min(i * size, nvar)
        res <- describe.1(x = x[, loweri:upperi], na.rm = na.rm, 
                          interp = interp, skew = skew, ranges = ranges, 
                          trim = trim, type = type, check = check, fast = fast, 
                          quant = quant, IQR = IQR, omit = omit, data = data)
        return(res)
      }
      result <- mcmapply(short, c(1:n.steps))
      n.result <- NROW(result)
      names.result <- rownames(result)
      temp <- NULL
      for (i in 1:NCOL(result)) {
        tt <- matrix(unlist(result[, i]), ncol = n.result)
        temp <- rbind(temp, tt)
      }
      colnames(temp) <- names.result
      temp[, 1] <- 1:nvar
      rownames(temp) <- v.names
      result <- as.data.frame(temp)
    }
    class(result) <- c("psych", "Pdescribe", "data.frame")
    return(result)
  }
}


library(MASS)
my_describe(anorexia)




##### package : ReIns
library(ReIns)
?ExpQQ
ExpQQ(data = anorexia$Prewt)


##### ASSIGNMET
##### Go into the ExpQQ and ensure that
##### 1. No tittle of plot
##### 2. pareto is a special distribution for modelling large data
##### use the ExpQQ to achieve the pareto.

trace(ExpQQ, edit = TRUE)

my_pareto <- function (data, plot = TRUE, main = NULL) 
{
  X <- as.numeric(sort(data))
  n <- length(X)
  i <- 1:n
  eqq.the <- ((n+1)/(n+1-i))
  eqq.emp <- X
  plot(eqq.the, eqq.emp, type = "p", xlab = "Quantiles of standard pareto", 
           ylab = "X", main = main,col = rainbow(7))
}

library(MASS)
my_pareto(anorexia$Prewt)






trace(lm,edit =TRUE )

my_fun <-function (formula, data, subset, weights, na.action, method = "qr", 
                   model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
                   contrasts = NULL, offset, ...) 
{
  ret.x <- x
  ret.y <- y
  cl <- match.call()
  mf <- match.call(expand.dots = FALSE)
  m <- match(c("formula", "data", "subset", "weights", "na.action", 
               "offset"), names(mf), 0L)
  mf <- mf[c(1L, m)]
  mf$drop.unused.levels <- TRUE
  mf[[1L]] <- quote(stats::model.frame)
  mf <- eval(mf, parent.frame())
  if (method == "model.frame") 
    return(mf)
  else if (method != "qr") 
    warning(gettextf("method = '%s' is not supported. Using 'qr'", 
                     method), domain = NA)
  mt <- attr(mf, "terms")
  y <- model.response(mf, "numeric")
  w <- as.vector(model.weights(mf))
  if (!is.null(w) && !is.numeric(w)) 
    stop("'weights' must be a numeric vector")
  offset <- model.offset(mf)
  mlm <- is.matrix(y)
  ny <- if (mlm) 
    nrow(y)
  else length(y)
  if (!is.null(offset)) {
    if (!mlm) 
      offset <- as.vector(offset)
    if (NROW(offset) != ny) 
      stop(gettextf("number of offsets is %d, should equal %d (number of observations)", 
                    NROW(offset), ny), domain = NA)
  }
  if (is.empty.model(mt)) {
    x <- NULL
    z <- list(coefficients = if (mlm) matrix(NA_real_, 0, 
                                             ncol(y)) else numeric(), residuals = y, fitted.values = 0 * 
                y, weights = w, rank = 0L, df.residual = if (!is.null(w)) sum(w != 
                                                                                0) else ny)
    if (!is.null(offset)) {
      z$fitted.values <- offset
      z$residuals <- y - offset
    }
  }
  else {
    x <- model.matrix(mt, mf, contrasts)
    z <- if (is.null(w)) 
      lm.fit(x, y, offset = offset, singular.ok = singular.ok, 
             ...)
    else lm.wfit(x, y, w, offset = offset, singular.ok = singular.ok, 
                 ...)
  }
  class(z) <- c(if (mlm) "mlm", "lm")
  z$na.action <- attr(mf, "na.action")
  z$offset <- offset
  z$contrasts <- attr(x, "contrasts")
  z$xlevels <- .getXlevels(mt, mf)
  z$call <- cl
  z$terms <- mt
  if (model) 
    z$model <- mf
  if (ret.x) 
    z$x <- x
  if (ret.y) 
    z$y <- y
  if (!qr) 
    z$qr <- NULL
  z
}


my_fun(hp~mpg,data = mtcars)


# Thu June  6 12:26:10 2024 ------------------------------
### Ordering and sorting
### to generate random sample, we use the sample function
?sample
Data <- sample(x = 1:600, size = 10, replace = FALSE)
rank(Data) # for assigning ranking data

?sort
### Ascending order
sort(x = Data, decreasing = FALSE, na.last = NA) 
# for arranging data (numeric vector) in order


### Descending order
sort(x = Data, decreasing = TRUE, na.last = NA) 

# arranging a dataframe in order using the Age
Df.Data[order(Df.Data$Age),]

# arranging a dataframe in order using the Religion
Df.Data[order(Df.Data[,"Religion"]),]
Df.Data[order(Df.Data$Religion),]


# Fri Jun  7 13:45:28 2024 ------------------------------
### simulating observations from distributions
### Normal distributions
?rnorm
Norm <- rnorm(n=10000,mean = 0, sd=1)
hist(Norm)

### relative frequency
hist(Norm,
     freq = FALSE)
lines(density(x = (Norm),
            mean = 0,
            sd = 1),
      col = "red")





##########################################################
###                ALTERNATIVELY                      ###
##########################################################

hist((Norm),
     freq = FALSE)
lines( x = sort(Norm),
       y = dnorm(x = sort(Norm),
              mean = 0,
              sd = 1),
      col = "red",
      lwd = 2)

##########################################################
##########################################################






### simulate observation for gamma with n={10, 100,1000}, alpha = 2, beta = 3
?rgamma
Gamma1 <- rgamma(n=10, shape=2,  scale = 3)
hist(Gamma1)
mean(Gamma1)

Gamma2 <- rgamma(n=100, shape=2,  scale = 3)
hist(Gamma2)
mean(Gamma2)


Gamma3 <- rgamma(n=1000, shape=2,  scale = 3)
hist(Gamma3)
mean(Gamma3)

###########################################################
###                    PLAYING THINGS                   ###
###########################################################
### superimppossing the density on a relative frequency graph
hist(Gamma3,
     freq = FALSE,
     ylim = c(0,0.15))

lines(x = sort(Gamma3),
      y = dgamma(x = sort(Gamma3),
                 shape=2,  scale = 3),
      col = "red")
###########################################################
###########################################################


# try for all other distributions
# reason for simulating observation is to test models


# Thu Jun 13 12:45:57 2024 ------------------------------
html <- 'https://lstat.kuleuven.be/Wiley/Data/soa.txt'
H <- read.ftable(html)


### TUTORIAL
### EXERCISE 1
library(ReIns)
?ExpQQ
?ParetoQQ

### Insurance data
library(insuranceData)

data('AutoClaims')
?data

par(mar = c(4,4,1,1))
hist(AutoClaims$PAID, 
     main = '',
     xlab = 'Amount Paid')
# Large claims comes less frequently

# Relative Frequency
hist(AutoClaims$PAID, 
     main = '',
     xlab = 'Amount Paid',
     freq = FALSE,
     ylim = c(0,0.001))


# superimpossing relative frequency
lines(density(sort(AutoClaims$PAID)),
      col = "red")


par(mfrow = c(1,3))
# checking with exponential
ExpQQ(data=AutoClaims$PAID)
# there are 2 particular observations that different from the others

# with pareto
ParetoQQ(data = AutoClaims$PAID)
# there are 2 particular observations that different from the others


# ExpQQ fits more the lower claims compared to the the paretoQQ, but the insurance company is interested in the most claims

LognormalQQ(data = AutoClaims$PAID)
# the log normal seem better than the other 2


### RESEARCH: Robust Statistics


# Putting the plots on the same graph by dividing the plot area into 3 columns
par(mfrow=c(1,3))
par(mfcol=c(3,1)) #is an equivalent code
# then re-run all the 3 plots

### Modifying ExpQQ to produce paretoQQ output also
trace(ExpQQ,edit=T)
My_ExpQQparQQ <- function (data,plot = TRUE) 
{
  
  X <- as.numeric(sort(data)) # order statistics/ empirical quantile
  n <- length(X)
  eqq.the <- -log(1 - (1:n)/(n + 1))
  eqq.emp <- X
  pqq.emp <- log(X)
  
  plot(eqq.the, eqq.emp, type = "p", xlab = "Quantiles of standard exponential", 
       ylab = "X")
  
  plot(eqq.the,pqq.emp, type = "p", xlab = "Quantiles of standard Pareto", 
       ylab = "X")
  
  #return(list(eqq.the = eqq.the, eqq.emp = eqq.emp), plot = plot, 
  #add = FALSE)
}

par(mfrow=c(1,2))
library(insuranceData)
data("AutoClaims")
My_ExpQQparQQ(AutoClaims$PAID)




# Fri Jun 14 13:41:32 2024 ------------------------------
# Removing rows
# Filter Function
library(dplyr)
head(iris) # view 1st 6 observations
View(iris)
names(iris)

# supposed  we want to subset dataset with sepal length greater than  5 and sepal width greater than 3
iris %>%
  filter(Sepal.Length>5,
         Sepal.Width>3)

# Alternatively
iris |>
  filter(Sepal.Length>5,
         Sepal.Width>3)

# Alternatively 
filter(iris,Sepal.Length>5,
       Sepal.Width>3)

filter(iris,
       Species=='setosa')


# using the slicing, row selection
slice(iris,1:5)
slice(iris,c(1:5,7))


# mutate function , adding columns
mutate(iris,
       x = Sepal.Width/Petal.Length)


# Selecting columns using the select , selecting columns
select(iris,Species,Sepal.Length)
select(iris,c(Species,Sepal.Length))

# airquality data
head(airquality)

# command to remove the missing data
no.na <- na.omit(airquality)
sum(is.na(no.na))

# exercise 
filter(airquality,
       Ozone>15 & Day == 1 & Temp<70)


airquality %>%
  filter(Ozone>15 ,
         Day == 1 ,
         Temp<70)


airquality %>%
  slice(1:5) %>%
  mutate(Ozone=
           ifelse(is.na(Ozone),
                  mean(Ozone,na.rm = T),
                  Ozone))




mean(airquality$Ozone[1:4])

with(airquality,
     mean(Ozone[1:5], na.rm =T))


# Thu Jun 20 12:47:30 2024 ------------------------------


# generate 100 observations from gamma, shape = 2, scale = 5
Claim_size <- rgamma(n = 100, shape = 2, scale = 5)
par(mar = c(4,4,1,1))
hist(Claim_size,
     xlab = " Claim Sixe (GHs)",
     main = "",
     ylab = "Number of policyholders")

### How to write a project report in word


### Superimpose a vertical line
?abline
abline(v = 30, col = "red", lwd = 2)
abline(h = 30, col = "red", lwd = 2)


# Exceedance probability or survival probability
Empirical_exceedance.prob <- sum(Claim_size>=30)/length(Claim_size)*100 


### Cumulative distribution
CDF <- 100-Empirical_exceedance.prob

################################################################################
####                        METHODS OF ESTIMATION                            ###
################################################################################
# 1. Moment
##### Normal
mom.est <- function(x)
  {
  mom <- c(mean(x),var(x))
  names(mom)<-c("Mean "," Variance")
  return(mom)
}

sam.Norm <- rnorm(n = 10, mean=2, sd= 1)
mom.est(sam.Norm)


sam.Norm <- rnorm(n = 100000, mean=2, sd= 1)
mom.est(sam.Norm)


# write a function for the gamma distribution

 

### Maximum Likelihood 
### two ways: ML or user-defined

# Inbuilt : packages like; MASS, 
library(MASS)
?fitdistr
fitdistr(x = sam.Norm, densfun = "normal")


# fiting the data with log normal
fitdistr(x = sam.Norm[sam.Norm>0], densfun = "lognormal") # since the log of negative values is undefined

par(mfrow = c(1,2))
My_ExpQQparQQ(Claim_size)

# try  method of moment for gamma, normal, log normal, 
# you should be able to use pnorm, dgamma, pgamma, qgamma

Moment_gamma <- function(x)
{
  #if x~gamma(alpha, beta),
  # E(x) = alpha*beta
  # Var(x) alpha*beta^2
  alpha <- mean(x)^2/var(x)
  beta <- mean(x)/var(x)
  mom <- c(alpha,beta)
  names(mom) <- c("shape","rate")
  return(mom)
}
Moment_gamma(x = rgamma(n = 1000,shape = 2,rate = 5))


Moment_normal <- function(x)
{
  # if x~N(mu,sigma2)
  mu <- mean(x)
  sigma2 <- var(x)
  mom <- c(mu,sigma2)
  names(mom) <- c("mu","Vaeriance")
  return(mom)
}
Moment_normal(x = rnorm(n = 1000, mean = 20, sd= 2))


# from fitdistrplus package
#


# Thu June 27 11:47:29 2024 ------------------------------
### ##########################################################################
###                 WRITIG A FUNCTION TO COMPUTE MLE                      ####
##############################################################################
### Maximum Likelihood Estimation
### For poisson with parameter lambda
### (a). Write a function for the score function
### log.likelihood = sum(log(f(xi))
### return -log.likelihood

logLik <- function(Data, Lambda)
{
  lik <- -length(Data)*Lambda + log(Lambda)*sum(Data)#-sum(log(factorial(Data)))
  # the routines in r finds the minimum so we negate the function then find the minimum which is the maximum you wanted.
  # Note: R computes the minimum so we negate the likelihood
  return(-lik)
}



### (b) Pass the score function to an optimization routine
?optim
### General-purpose optimization based on Nelder–Mead, quasi-Newton and conjugate-gradient algorithms. It includes an option for box-constrained optimization and simulated annealing.
set.seed(132);Data <- rpois(n = 1000, lambda = 5)

MLE_Poisson <- optim(par = mean(Data), 
                     fn = logLik,
                    method = c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN",
                 "Brent"),
                    Data = Data)

mean(Data)
# the mean equals the mle produced

### Output
MLE_Poisson$par
MLE_Poisson$value


### Alternatively
Loglik_1 <- function(Data,Lambda)
{
  if (any(Data<0))
  {
    print("Data points cannot be less than zero")
  }else
  {
    pmf <- ((Lambda^Data)*exp(-Lambda))/(factorial(Data))
    score_function <- sum(log(pmf))
  }
  
  return(-score_function)
}

opt_log_lik_1 <- optim(par = mean(Data), 
                       fn = Loglik_1,
                       method = c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN","Brent"),
                       Data = Data)

### Alternatively {using a system defined function from the MASS package}
library(MASS)
fitdistr(x = Data,densfun = "poisson")

### Practical example using the AutoBi data from the insurance package
library(insuranceData)
data("AutoBi")
?AutoBi

### Fiting a poissin distribution to the AutoBi loss
fitdistr(x = AutoBi$LOSS,densfun = "poisson")



#### Using our function to fit 

MLE_Poisson_AutoBi <- optim(par = 1, fn = logLik,
                     method = c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN",
                                "Brent"),
                     Data = AutoBi$LOSS)

MLE_Poisson_AutoBi <- optim(par = 1, fn = logLik,
                     method = ("SANN"),
                     Data = AutoBi$LOSS)


### alternatively {using the density function of poisson in r}
MLE <- function(x,lambda)
{
  liklihood <- sum(log(dpois(x,lambda)))
  return(-liklihood)
}

MLE_Poisson_AutoBi <- optim(par = 1, fn = MLE,
                            method = ("SANN"),
                            x = AutoBi$LOSS)




#### MAXIMUM LIKELIHOOD ESTIMATION (FROM THE YOUTUBE VIDEO)
#### there are two methods
#### (a). using a package
#### eg. fitdistr in the MASS package
library(MASS)
?fitdistr
## simulating observations from the poisson distribution
Data1 <- rpois(n = 40, lambda = 5)
# ploting a histogram of the data to see how it looks
hist(Data1, main = "",freq = FALSE)


polygon(density(Data1,bw=1.5))
?polygon
lines(density(Data1),col="red",lwd = 5)

### ML Estimation for poisson
fitdistr(x = Data1, densfun = "poisson")


#### increasing the sample size to look at the law of large numbers
Data2 <- rpois(n = 4000, lambda = 5)
# ploting a histogram of the data to see how it looks
hist(Data1, main = "")


### ML Estimation for poisson
fitdistr(x = Data2, densfun = "poisson")



### using the fitdist function in the fitdistrplus package
library(fitdistrplus)
?fitdist

fit <- fitdist(data = Data1, distr = "pois", method = "mle", discrete = TRUE)
summary(fit)



#### User defined
# Two step process
# (i). declaring the log likelihood function
# write an r function for it

# format
#name <- function(pars, Data)
#{
 # log <- loglikelihood(function)
  #return(-log)
#}


### Normal distribution
?airquality
hist(airquality$Wind)
library(MASS)
fit.normal <- fitdistr(x = airquality$Wind,densfun = "normal")

?AIC
AIC(fit.normal)

fit.normal1 <- fitdist(data = airquality$Wind,distr = "norm",discrete = FALSE, method = "mle")



### our own
norm.lik <- function(pars,y)
{
  n <- length(y)
  mu <- pars[1]
  sigma2 <- pars[2]
  log <- -0.5*n*log(2*pi) - 0.5*n*log(sigma2)-(1/(2*sigma2))*sum((y-mu)^2)

return(-log)
  }

fit.norm <- optim(par=c(1,1),
                  fn = norm.lik,
                  method = "L-BFGS-B",
                  lower = c(-Inf,0),
                  upper = c(Inf,Inf),
                  hessian = TRUE,
                  y = airquality$Wind)


AIC.OWN <- function(k,loglik){2*k-2*loglik}
AIC.OWN(k=2,fit.norm$value)
# we are interested in the one with the minimum AIC

# obtaining the standard error when we write our own function for the mle
?optim
# we have to set the Hessian to true in the optim command, the inverse of the Hessian matrix will help us get the covariance matrix
Inverse_hessian <- solve(fit.norm$hessian)

# the diagonals are the variances so we take them and find the roots to get the standard errors

library(dplyr)
se <- diag(Inverse_hessian)|>
  sqrt()

Tab <- data.frame(Estimate = fit.norm$par,
                  "Standard Error" = se)
rownames(Tab) <- c('Mean','Varianc')
# we choose the one that give us the minimum se




Normal.like <- function(Parameters, X)
{
  mu <- Parameters[1]
  var <- Parameters[2]
  
  f_x <- (1/sqrt(2*var*pi)) * exp((-1/(2*var))*((X-mu)^2))
  loglik <- sum(log(f_x))
  return(-loglik)
}

MLE.NORM <- optim(par = c(1,1), 
                  fn = Normal.like,
                  method = "L-BFGS-B",
                  lower = c(-Inf,0), 
                  upper = c(Inf,Inf),
                   hessian = TRUE,
                  X = airquality$Wind)



Normal.like2 <- function(Parameters, X)
{
  mu <- Parameters[1]
  var <- Parameters[2]
  
  loglik <- sum(log(dnorm(X,mu,sqrt(var))))
  return(-loglik)
}


MLE.NORM2 <- optim(par = c(1,1), 
                  fn = Normal.like2,
                  method = "L-BFGS-B",
                  lower = c(-Inf,0), 
                  upper = c(Inf,Inf),
                  hessian = TRUE,
                  X = airquality$Wind)


### LIKELIHOOD FUNCTION FOR GAMMA
Gamma.Likelihood <- function(data, parameters)
{
  alpha <- parameters[1]
  beta <- parameters[2]
  pdf <- ((beta^alpha)/(factorial(alpha-1)))*(data^(alpha-1))*exp(-beta*data)
  loglik <- sum(log(pdf))
  return(-loglik)
}

MLE.GAMMA <- optim(par = c(2,1), 
                   fn = Gamma.Likelihood,
                   method = "L-BFGS-B",
                   lower = c(1,1), 
                   upper = c(Inf,Inf),
                   hessian = TRUE,
                   data = airquality$Wind)




# Fri Jun 28 13:40:40 2024 ------------------------------
### generate 100 observations from the uniform distribution
set.seed(77
         );y <- runif(n=100,0,1)

inverse.exp <- function(y,lambda =1)
{
  x <- -log(1-y)/lambda
  return(x)
}

inverse.exp(y)

library(ReIns)
ExpQQ(inverse.exp(y))


inverse.pareto <- function(y,alpha = 1,beta = 3)
{
  x <- (alpha)/((1-y)^(1/beta))
  return(x)
}

inverse.pareto(y)



y1 <- seq(0,10,0.01)
x1 <- rpois(100,5)
### from the optimisation from poisson
lambda <- MLE_Poisson[1]
hist(x1,probability=T)
curve(dpois(y,lambda),col = "red", add = T)




hist(cars$speed,freq=FALSE,main="")
lines(density(cars$speed,bw = 2.5),col="red",lwd=2)



# Thu July  4 11:48:02 2024 ------------------------------
##############################################################################
###                          SIMULATION STUDY                              ###
### ##########################################################################
### Recall estimation methods
### moment, MLE, Least Squares
### under the simulation study, we know the parameter and check which one estimates it better
### let X~N(10,2)
### we check which one, moment or mle is close to 2 in 
samp <- rnorm(n= 10,
              mean = 10,
              sd = sqrt(2))

par(mar = c(4,4,1,1))
hist(samp, 
     main = NULL)

"MOm.MLE" <- function(x)
{
  n <- length(x)
  mom <- var(x)
  MLE <- ((n-1)/n)*var(x)
  est <- c(mom, MLE)
  names(est) <- c("Mom", "MLE")
  return(est)
}

MOm.MLE(samp)

#### Generating several samples
n <- 10; mu <- 10; sigma2 <- 2; R <- 5
Msamp <- sapply(1:R,
                function(i)rnorm(n = n, mean = mu, sd = sqrt(sigma2)))


### Monte Carlo simulation
### 
### Compute the estimates using the function
par.est <- apply(Msamp,
      2,
      MOm.MLE)

### bias
BiaseMSE <- function(theta.hat ,theta)
{
  bias <- mean(theta.hat)-theta
  MSE <- mean((theta.hat-theta)^2)
  Tab <- data.frame(bias,MSE)
  return(Tab)
}

### compute bias / mse for each row
apply(par.est,
      MARGIN = 1,
      function(x)BiaseMSE(theta.hat = x, theta = sqrt(sigma2)))

##### Alternatively
res <- data.frame()
for(i in 1:2){res[i,1:2] <- BiaseMSE(theta.hat = par.est[i,],theta = sqrt(2))}




# Thu July 11 12:13:56 2024 ------------------------------
### package in actuarial science
### 1. Financial maths
library(FinancialMath)
?amort.period
### Solves for either the number of payments, the payment amount, or the amount of a loan. The payment amount, interest paid, principal paid, and balance of the loan are given for a specified period.
amort.period(Loan = 200, n = 12,pmt=NA,i= 0.1,ic=1,pf=12,t=1)

amort.period(Loan = NA,n = 12,pmt = 17.543109,i = 0.1,ic=1,pf = 12,t =1)



#### Net present value
#### Calculates the net present value for a series of cash flows, and provides a time diagram of the cash flows.
?NPV
NPV(cf0=100,cf=c(50,40),times=c(3,5),i=.01,plot = T) ## the npv is negative so the investment is not viable
NPV(cf0 = 1000, cf = c(500,200,-300,0,400), times = 1:5, i = 0.01,plot = T)


NPV(cf0=100,cf=50,times=3,i=.05)
NPV(cf0=100,cf=c(50,60,10,20),times=c(1,5,9,9),i=.045)

### IRR: Calculates internal rate of return for a series of cash flows, and provides a time diagram of the cash flows.
?IRR
par(mar = c(4,4,1,1,))
IRR(cf0=100,cf=c(50,40),times=c(3,5),plot = T)
IRR(cf0 = 1000, cf = c(500,200,-300,0,400), times = 1:5, plot = T) # since the IRR = 0.7134% is less than the rate we used in the NPV = 1.00%, we do not go in for the business 


###2. Actuar
library(actuar)
?actuar




### 3. ReIns
library(ReIns)
### for reinsurance



library(insuranceData)



#### 4. Life contingencies
library(lifecontingencies)



npv <- function(cf0,cf,times,i)
{
  cf0 <- abs(cf0)
  pv <- sum(cf/(1+i)^times)
  npv <- pv-cf0
 return(npv)
}

npv(cf0=100,cf=c(50,40),times=c(3,5),i=.01)
npv(cf0=100,cf=50,times=3,i=.05)
npv(cf0=100,cf=c(50,60,10,20),times=c(1,5,9,9),i=.045)
NPV(cf0=100,cf=c(50,40),times=c(3,5),i=.01,plot = T) ## the npv is negative so the

irr <- function(cf0,cf,times)
{
  irr <- exp((log(sum(cf)/cf0))/times)-1
  return(irr)
}



irr(cf0=100,cf=c(50,40),times=c(3,5))
irr(cf0 = 1000, cf = c(500,200,-300,0,400), times = 1:5)

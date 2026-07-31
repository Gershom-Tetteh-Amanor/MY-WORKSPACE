#basic R functions 
5%%4 # modulos
7%%2; 8%%3
#log() - the natural log, ln()
# default base = e
log(4)


# we can change it to different base of our choice
log(4,base=10); log(4, base=12); log(4,base=2); log(4, base=3); log(4,exp(1))


#?log()
# log10() - the normal log to the base 10
log10(4)
log2(4)# log base 2

#### Angles cos,sin and pi
cos(pi/2)
cos(pi)
sin((3*pi)/2)

##########################################################################
#########                  CEILLING AND FLOOR                   #########
##########################################################################
# ceiling is the nearest highest integer
# floor is the nearest lowest integer
floor(7.3) ; ceiling(7.3)

# some operations
0/0 
0*Inf
Inf^0
2^2
1/Inf
1/0;0*Inf


###############################################################################
#######
library(MASS)
anorexia
par(mfrow=c(2,2))
boxplot(anorexia,
        col=rainbow(6))
library(plotrix)
pie3D(table(anorexia$Postwt),explode=0)

a<-(1:20);a

library(datasets)
cars
head(cars)
tail(cars)
boxplot(cars,
        col=rainbow(6))
library(plotrix)
pie3D(table(cars$speed))

a<-(1:20);a


################################################################################
###        VECTORS          
################################################################################
date()
# vectors contains data of the same type
Age <- c(52,35,8,70)
Age
mean(Age)
sd(Age)
sum(Age)
(Age)^2
Age - 5
# when given names make sure it is related to what  your you are doing 
#or otherwise comment it out
# Age
# 2 + 5 - 3

2+5-3
# Creating a vector of Names
Names <- c("Eric","Teric","Peric","Zeric")
Names
noquote(Names)

# Creatinfg a vector of Logics
Logic <- c(TRUE, FALSE, T, F)
Logic

# CHECKING STRUCTURE  OF A VECTOR
str(Age)
str(Names)
str(Logic)

# alternative mode is also for checking the structures
mode(Age)
mode(Names)
mode(Logic)
noquote(mode(Logic))


# INDEXING
# we use a [] for indexing
# create a vector of income
Income <- c(100,1500,700,1500,2300)
Income
Income[3]
Income[2]
Income[4]

# Descriptive statistics
# 5 number summary
# Using fivenum()
S <- fivenum(Income)
S
# inter-quatile range
IQR <- S[4] - S[2]
IQR

Range <- S[5] - S[1]
Range
range(Income)
max(Income); min(Income)

Income[c(1,3,5)]
a <- c(1,3,5)
Income[a]

Income[-1]
Income[-3]
Income[-c(4,5)]
Income[c(-4,-5)]
Incomes <- c(Income,230);Incomes
Income[5]<-10000;Income 

Income[6]<-13000;Income
#q() # quit
#demo() # demo
#help() # help
#help.start() # html help
#licence() # distribution details
#contributors() # more details
#citation() # how to cite r or r packages
#q()
#amu<-read.csv(file = choose.files(), header = T)
#is.data.frame(amu)
#with(amu,barplot(WAGE))
#vec<-amu[,7]
#barplot(amu~amu[,7])
z<-c(1,2,3,4,5)
barplot(z)
#is.vector(vec)


##############################################################################
####            FACTORS                                                 ######
##############################################################################
# Vector made up of string characters
X<- c("F","F","M","F","M","M","M","F","F","M");X
y<- c(1,0,0,0,1,1,0,1,1,0);y
length(X); length(y)
str(X); str(y)
as.factor(y)
is.factor(y)
mean(X)
y<-factor(y)
is.factor(y)
mean(y)
X<- factor(X)
is.factor(X)
str(y);str(X)

###############################################################################
############      SEQUENCES                                              #####
###############################################################################
# (a) using colon
x<- 1:50; x
y<- 10:21;y

# using the sequence function

u<- seq(1,50,by=2);u
z <- seq(20,5,-2);z

# TABLING
tabx <- table(x); tabx
taby <- table(y); taby

# PROPORTIONS AND PERCENTAGES
# using prop.table
tabx2<-prop.table(tabx);tabx2
tabx2*100
par(mfrow=c(1,1))
# Pie chart
pie(tabx, col=c("#00ff00","#bff00f"))

# Contingency table
H <- c("L","L","S","A","L","S","A","A","S","L");H
length(H)

Ht<-table(X,H);Ht
Htp<- prop.table(Ht,1); Htp
Htp<- prop.table(Ht,2); Htp
round(Htp,2)
round(prop.table(Ht,2),2)*100

par(las=2)
# stacked bar plot
barplot(Htp,
        col=rainbow(3),
        main="BAR PLOT",
        xlab="HALL",
        ylab="GENDER")
par(mfrow=c(1,1))
# side by side barplot
barplot(Htp, beside=TRUE,
        col=rainbow(6),
        main="BAR PLOT",
        xlab="HALL",
        ylab="GENDER",
        legend=c(colnames(Htp)))#,rownames(Htp)))



par(mfrow=c(2, 2))
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls,
    main="Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep="")
pie(slices, labels=lbls2, col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")

library(plotrix)        
fan.plot(slices, labels=lbls2)

library(xlsx)
read.xlsx(file=choose.files)
??read.table()





x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3,
        names=c("4 cyl", "6 cyl", "8 cyl"),
        col="gold",
        main = " VIOPLOT IN R",
        lwd=3)

#import <- read.csv(file = "InsectSprays.csv",header=T)
#import

#import2 <- read.table(file = "studentData.txt",header = T)
#import2
#fan.plot(import2)





################################################################################
####                              MATRICES                                 ####
################################################################################
# contains data of the same type
# syntax = matrix(datata, nrows=m,ncols=n,byrow=T/F, ...)
k<-1:10
X <- matrix(k,nrow=2,ncol=5,byrow=T);X
Y <- matrix(k,nrow=2,ncol=5,byrow=F);Y
FF<-matrix(c(2,4,-1,5),2,2);FF


# NAMING ROWS AND COLUMNS 
TT <- matrix(1:25,5,5,
             dimnames = list(c("R1","R2","R3","R4","R5"),
                             c("C1","C2","C3","C4","C5")));TT
# Try
# create a matrix with the rows; 
# STAT 223,STAT 221,STAT 230 and rows
# ERIC, ZETRIC,TERIC
scores <- matrix(c(72,16,96,43,75,6,83,5,73),3,3,byrow=T,
                 dimnames=list(c("ERIC","ZERIC","TERIC"),
                               c("STAT 223","STAT 221","STAT 230"))
                 );scores            

STAT223 <- c(72,43,83)
STAT221 <- c(16,75,5)
STAT230 <- c(96,6,73)
dat <- data.frame(STAT223,STAT221,STAT230);dat

# Adding them one by one
SC <- matrix(c(STAT223,STAT221,STAT230),3,3);SC
rownames(SC)<-c("ERIC","ZERIC","TERIC");SC
colnames(SC) <- c("STAT 223","STAT 221","STAT 230");SC

# indexing in matrices
# using the [rowname/no,colname,no] for indexing 
SC[1,2]

SC[1,]==SC["ERIC",]
# return as matrix, we add drop=FALSE
SC[1,2,drop=FALSE]
is.matrix(SC[1,2,drop=FALSE])

Age <- c(17,20,31);Age
Weight <- c(70,83,145);Weight
rbind(Age,Weight)
cbind(Age,Weight)
rbind(STAT223,STAT221,STAT230)
bat <- data.frame(SC);bat
Gender <- c("M","F","M")
bat[,4] <-Gender 
bat


# assignment 
# inverse,decompose,transpose,

#########################################################################
####                           DATAFRAME                              ###
#########################################################################
# inbuilt data frames
#?mtcars
str(mtcars)
#View(mtcars) # displays the data set
names(mtcars) # Displays the variable names of the data frame
rownames(mtcars) # Row names of the data frame
head(mtcars);tail(mtcars) # 1st and last 6 rows
mtcars$mpg # selecting the variable mpg
mean(mtcars$mpg)
boxplot(mtcars$mpg,col="#cc700f")
plot(mtcars$mpg,mtcars$wt,col=rainbow(6),pch=1:100)
# To just specify a variable without calling the 
#data frame, we use the attach function
attach(mtcars)
mpg;wt;
detach(mtcars)
attach(mtcars)
mpg
plot(mpg,wt,col=1:100,pch=1:100)

# dependent~independent 
# for multiple independent variables
# y~x1+x2+x3+......
plot(mpg~wt)
# lm() linear model
plot(disp~mpg,col="red")
abline(lm(disp~mpg),lw=5,col="#ccff07")

# create the ff vectors
Dosage <- c(20,30,40,45,50);Dosage
DrugA <- c(16,20,27,40,60);DrugA
DrugB <- c(15,18,25,31,40);DrugB
Gender <- c(0,1,1,0,0);Gender
# 0 = male, 1 = female
Status <- c(1,2,2,1,2)
# 1 = dead, 2 = alive
Records <- data.frame(
  Dosage,DrugA,DrugB,Gender,Status)
#View(Records)
# converting Gender and status to their original data points
Tab <- table(Records$Gender,Records$Status)
barplot(Tab,col=c("#ff0000","#bb00fc"))
Records$Gender[Records$Gender==0]<-'Male'
Records$Gender[Records$Gender==1]<-'Female'
Records$Status[Records$Status==1]<-'Dead'
Records$Status[Records$Status==2]<-'Alive'
Tab
#View(Tab)
barplot(Tab,col=c("orange","blue"))
barplot(Tab,col=4:2)

# from the Pang Ten 
head(iris)
attach(iris)
plot(Petal.Length,Petal.Width)



#######################################################################
###                   GRAPHICS IN R                               ####
#######################################################################
# DATA VISSUALIZATION
# (1). Qualitative
# Data is categorical
# Data must be at least on the nominal scale or ordinal scale
# we use 
# (a) Barchart (b) pie chart
library(MASS) # Attaching the mass package
#View(Cars93)
# Creating a frequency table
Tab <- table(Cars93$AirBags);Tab
#?barplot
barplot(Tab,col=c("#00ff00","#ff0000","gold"),
        main="A SIMPLE BAR PLOT",
        xlab="AIRBAGS",
        ylab="FREQUNCY",
        ylim =c(0,50))

# Stacked Bar Chart
# We first create a contigency table
Tab2 <- table(Cars93$AirBags,Cars93$DriveTrain);Tab2
barplot(Tab2,col=rainbow(6),
        main="A STACKED BARPOLT",
        xlab="DRIVE TRAIN AND AIRBAGS",
        ylab="FREQUENCY",
        ylim=c(0,65))

# grouped Bar Chart
# We first create a contingency table
Tab2g <- table(Cars93$AirBags,Cars93$DriveTrain);Tab2g
barplot(Tab2g,col=rainbow(3),
        main="A STACKED BARPOLT",
        xlab="DRIVE TRAIN AND AIRBAGS",
        ylab="FREQUENCY",
        ylim=c(0,27),
        beside=T)

# Adding Legends to the plot
# using the legend function
legend("topleft", legend=rownames(Tab2g),fill=rainbow(3),
       title="DRIVE TRAIN", inset=1/200)



# PIE CHART
Tab3 <- table(Cars93$Type)
pie(Tab3,col=rainbow(6),
    main="A SIMPLE PIE CHART")

library(plotrix)
pie3D(Tab3,col=rainbow(6),
      main= "PIE 3D",
      lwd=10,labels=names(Tab3),
      explode=0.125);par(mar=c(1,1,1,1))



per <- round(Tab3/sum(Tab3)*100);per
labe.per <- paste(names(Tab3)," (", per,"%)",sep="");labe.per




########################################################
###       USER DEFINED FUNTIONS                 ########
########################################################
# structure(syntax)
# function_name <- function(arguments/parameters)
#{codes/ expressions
# return(....)}
# function to calculate the mean

Mean <- function(x)
{
  Sum <- sum(x)
  n <- length(x)
  m <- Sum/n
  return(m)
}
x <- c(1,2,3,4,5,2,3,4,5,4)
Mean(1:10)
Mean(x)
Ages <- c(19,24,19,23,25,26)
Mean(Ages)

# write a function to add  two numbers
Add <- function(x,y)
{
  add <- x+y
  return(add)
}
Add(2,1)


# Write a function to calculate the circumference of a circle
circum <- function(r)
{
  circ <- 2*pi*(r)
  return(circ)
}
circum(12)
circum(c(2,4,9,16))


#  Write a function to find the  sample variance deviation 
Var <- function(x)
{
  Mean <- mean(x)
  dif <- (x-Mean)
  sdif <- (dif)^2
  S2 <- sum(sdif)/(length(x)-1)
  return(S2)
}
Var(c(1,2,3,4,5))


#  Write a function to find the  sample variance deviation 
Std <- function(x)
{
  Mean <- mean(x)
  dif <- (x-Mean)
  sdif <- (dif)^2
  S <- sqrt(sum(sdif)/(length(x)-1))
  return(S)
}
Std(c(1,2,3,4,5))
var(c(1,2,3,4,5))
sd(c(1,2,3,4,5))


# Write a function to simulate the throwing of a die n times
Dice <- function(n) # where n is the number of times the dice is tossed
{
  throws <- sample(1:6,n,rep=T)
  freq.t <- table(throws)
  rel.freq <- freq.t/n
  barplot(rel.freq,col=rainbow(7),
          main = NULL)
  abline(h=1/6, col='black',lwd=5)
  return(rel.freq)
  }
Dice(4)

library(vioplot)
par(mar=c(1,2,2,1))
vioplot(c(-15,1,2,3,4,5,10),
        c(6,7,8,9,10),
        c(1,5,7,9,17),
        col=rainbow(3))  


###############################################################
###             IMPLEMENTING DECISSION TREE IN R            ### 
###############################################################
## DATA PARTITION
iris

set.seed(77) # Because we are gonna use a sample, we set the seed

# We wanna give 70% to training,30% to test set
split_data <- sample(2,nrow(iris),replace=T, prob=c(0.7,0.3)
                     );split_data
training_set <- iris[split_data==1,];training_set
testing_set <- iris[split_data==2,];testing_set
# We will use the party package to partition the model
library(party)
str(iris)#checking the structure of iris
# We gonna use the variable, species as the dependent variable

# We gonna use the function, ctree in the party package
Decission_Tree <- ctree(Species~., data=training_set
                        );Decission_Tree

plot(Decission_Tree)


# INTERPOLATION
# If the petal length <= 1.9, then there is a 100% chance 
#that our species is SETOSA
# OR
# The probability that the species is SETOSA, when the petal length is 
# less than or equal to 1.9 is 1

# to have i not as the bar plot, we do......
plot(Decission_Tree,type="simple")

# Using the sepal length as the dependent variable
Decission_Tree2 <- ctree(Sepal.Length~., data=training_set
);Decission_Tree2
par(mfrow=c(2,2))
plot(Decission_Tree2)
plot(Decission_Tree2,type="simple")#removing the box plot


Decission_Tree3 <- ctree(Sepal.Length~., data=training_set,
controls = ctree_control(mincriterion=0.9999,minsplit=20)
);Decission_Tree3
plot(Decission_Tree3,type='simple')


set.seed(77)
Data <- sample(2,nrow(iris),replace=T,
                   prob=c(0.7,0.3))
Train <- iris[Data==1,];Train
Tree <- ctree(Species~., data=iris)
Test <- iris[Data==2,];Test

## PREDICTION
str(iris)
predict(Tree,Train,type='prob')


## MISCLASSIFICATION 
# The confusion matrix
#To test the accuracy of our model, we need to construct
# the confusion matrix

## Confusion matrix
p1 <- predict(Tree,Train)
Tab <- table(Predicted=p1,Actual=Train$Species);Tab
# 31 of the observations were rightly classified as setosa
# 33 of the observations were rightly classified as versicolor
# 33 of the observations were rightly classified as verginica
# 3 of the observations were  classified as versicolor 
# when they actually belonged to the virginica species

## ACURRACY
sum(diag(Tab))/sum(Tab)*100
# our model is 96.0396% accurate in predicting the 
# the training data set

## Mis-classification
100-sum(diag(Tab))/sum(Tab)*100
# 3.960396% of our training data was mis-classified

0.5*log(80)+0.5*log(120)
(((110^0.5)-1)/0.5)*0.5 + 0.5*(((92^0.5)-1)/0.5)
((100^0.5-1)/0.5)*100/100
library(class)
?chisq.test


## Testing for population probabilities
## Case A. Tabulated data
x <- c(A = 20, B = 15, C = 25)
chisq.test(x)
chisq.test(as.table(x))             # the same
x <- c(89,37,30,28,2)
p <- c(40,20,20,15,5)
try(
chisq.test(x, p = p)                # gives an error
)
chisq.test(x, p = p, rescale.p = TRUE)
                                # works
p <- c(0.40,0.20,0.20,0.19,0.01)
                                # Expected count in category 5
                                # is 1.86 < 5 ==> chi square approx.
chisq.test(x, p = p)            #               maybe doubtful, but is ok!
chisq.test(x, p = p, simulate.p.value = TRUE)




#call.opt.obj <- bsmEU(spot = 100, strike = c(100, 110),
#                       time = 0.5, intRate = 0.05, costCarry = 0.05, sigma = 0.2,
#                       type = "call")
#call.opt.obj



#n.steps <- 5
#asset.tree <- opBinomTree(spot = 100, time = 0.5,
#                             intRate = 0.05, costCarry = 0.05-0.08, method = "multi",
#                             sigma = 0.2, steps = n.steps)
#values <- asset.tree$prices != 0
#plot(rep(1:(n.steps + 1), 1:(n.steps + 1)),
#        asset.tree$prices[values], xlab = "Step",
#        ylab = "Asset Price", labex = 2)
#text(rep(1:(n.steps + 1), 1:(n.steps + 1)),
#        asset.tree$prices[values] + 2,
#        round(asset.tree$prices[values], dig = 2))
#title(main = "Binomial Tree")

log(0,base=1)

plot(x= sample(1:10,5), y=sample(1:10,5), main= "Five random points",
     xlab="X values", ylab="Y values") 

plot(x= sample(1:10,5), y=sample(1:10,5), main= "Five random points", xlab="X values", ylab= "Y values") 
Euclidean <- function (X, Y){sqrt(sum((X-Y) ^2))}
Euclidean(c(1,3),c(2,3))

Cosine <- function(X,Y)
{
  xy <-sum(X*Y)
  mag_x <- sqrt(sum(X^2))
  mag_y <- sqrt(sum(Y^2))
  d <- xy/(mag_x*mag_y)
  return(d)
}
Cosine(c(3,2,0,5,0,0,0,2,0,0),c(1,0,0,0,0,0,0,1,0,2))

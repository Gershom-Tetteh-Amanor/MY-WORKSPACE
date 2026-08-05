###### Introduction ##################################
### 19th January, 2023
#####################################################
4+5

X<-4+5
## <- assignment statement

10*5->y

Z<-12-9

X
x #our object x is small lettered

#### Installing Packages


### Plotting
plot(1:10,pch=1:10,col=1:10)


### Help ##################################
############################################

?plot


###################################################
#### 26th January, 2023
###################################################
####### Data Structures ###########################

### 1. Vector

# How to create a vector in R

# a) c() function

Age<-c(18,19,17,20,21,19,20,18);Age
Religion<-c("Chr","Mos","Mos",
            "Tra","Mos","Chr",
            "Oth","Chr");Religion
Voted<-c(FALSE,F,T,TRUE,FALSE,T,
         F,T);Voted
Weight<-c(NA,75,85,79,65,50,67,81);Weight

## b) Sequence

  ## i) :
 1:50
 50:1
 
 ## ii
 ?seq

 seq(from = 1, to = 99, by = 2) # odd numbers
 seq(from=0,to=100,by=2)# even numbers
 
IDs<- seq(from = 0, to = 50,
     length.out = 8);IDs
 ## Rounding
 round(IDs,digits = 2)
 
 ## ii) rep()
 
 rep(1:3,4)
 
### naming Vectors
 
 names(Age)<-LETTERS[1:8];Age
 
 ## Referencing elements in a Vector
 
 # Age[Position of object(s)]
 Age[4]  ### Age of 4th Student
 
Age[4:6]  ### Age of 4th to 6th Student
Age[c(1:3,8)] # 1st to 3rd and 8th students


##############################
### 2. Matrices
## Creating Matrices

## a) matrix() function

## samples 12 observations randomly
## from 1 to 20

Data<-sample(x=1:20,size=12);Data
## To obtain same random values
## we use set.seed()

set.seed(100
         );Data<-sample(x=1:20,size=12);Data

## create a 3 by 4 matrix using matrix()
?matrix
mymat<-matrix(data = NA, nrow = 1,
              ncol = 1, byrow = FALSE,
              dimnames = NULL)

########################################
#### 2nd February, 2023
########################################
## c) Matrices

Weight<-sample(50:140,size=15)
Mat1<-matrix(data=Weight,ncol=3,
             byrow=T);Mat1
## Naming wows and columns of matrices

## rows
rownames(Mat1)<-c("Ama","Aku","Joy",
                  "Ali","Dan");Mat1

## columns
colnames(Mat1)<-c("Year 1","Year 10",
                  "Year 19");Mat1

## Create two additional vectors to
## illustrate rbind() and cbind()
Age<-sample(x=12:40,size=15) ;Age   ### sampling w/o replacement
Salary<-sample(x=0:2500,size=15);Salary

## rbind()
rbind(Weight,Age,Salary)

## using cbind() 
cbind(Weight,Age,Salary)

## sampling with replacement
?sample
Religion<-sample(x=c("Moslem","Christian","Others"), 
                 size=15, replace = T);Religion

## Combining vectors of different data types

Mat2<-cbind(Weight,Age,Salary,Religion);Mat2

#### 3. Dataframes
## two dimensional array that can contain
##  different data types
?data.frame

my.df<-data.frame(Weight,Age,Salary,Religion);my.df


### Referencing observations(s) in matrices
### and dataframes

#a) Using row and column numbers
 ##   Name[i,j] ## ith row(s); jth column(s)

my.df[1,2]
my.df[1,]  ## all elements on the 1st row

## b) Use row or column names
my.df[,"Weight"]

colnames(Mat1)
rownames(Mat1)

Mat1["Ama",]

### c) For data frames $
my.df$Weight[2:5]

##################################################
### 2nd March, 2023
###################################################

### User-Define Functions
##################################################

myCor<-function(x,y)
{
  ## Plot
  plot(x,y,xlab=names(x),ylab=names(y))
  ## Correlation
  Rho<-cor(x,y,method="pearson");
  rho.test<-cor.test(x=x, y=y,
      alternative = c("two.sided"),
        method = c("pearson"),
        conf.level = 0.95)
  
  return(rho.test)
}

?cor.test
x<-sample(1:100,size=20)
y<-runif(n=20,min=1,max=100)
par(mar=c(4,4,1,1))
###
myCor(x=x,y=y)

###
cars
x=cars[,1];y=cars$dist
names(y)<-"Distance"

myCor(x=cars$speed,y=cars$dist)

### Reading critical values
qt(p=0.975,df=48)

##########################################
### BMI function
########################################

#### Conditional Statements
Classify<-function(bmi)
{
  if(bmi<=18.5)
    {
    Category<-"Underweight"
    }else 
      if(bmi<=25)
        {Category<-"Normal"
      }else
    {Category<-"Overweight"}
  return(Category)
}
Classify(10)
#########################################

BMI<-function(Weight, Height)
{
  ### Compute bmi and rounded it to 2 d.p
  bmi<-round(Weight/Height^2,digits=2)
  ### Classify
  #Category<- Classify(bmi)
    ### TO enable Classify act on a vector
  ## of more than 1 element
  Category<- sapply(bmi, Classify)
    Tab<-data.frame(Weight=Weight,
                    Height=Height,
                    BMI=bmi,
                   Category=Category)
  return(Tab)
}

BMI(50,1.65)

### Sample Observations
Weights<-round(runif(n=15,min=60,max=150),
               digits = 2)
Height<-round(runif(n=15,min=1.5,max=2.5),
              digits = 2)
BMI(Weight=Weights,Height=Height)
sum((BMI(Weight=Weights,Height=Height))=="Normal")
sum((BMI(Weight=Weights,Height=Height))=="Overweight")


#### sample bmi
bmi.try<-c(12,20,23,18,27)
sapply(bmi.try, Classify)


############################################
### Descriptive Statistics
###########################################

?anorexia

boxplot(anorexia[,-1],
        col="#1100ff")
boxplot(count~spray,data=InsectSprays,
        col=rainbow(6))

### Hypothesis
?t.test

DeliveryTime<-c(45,50,25,20,30,40,
                35,20,28,29)
Glovo<-c(20,50,65,30,22)
###
t.test(x=DeliveryTime,y= Glovo,
       alternative = "greater",
       mu = 0, paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

#######################################################
#### 9th March, 2023
#######################################################

### Test of Variances
?var.test
var.test(x=DeliveryTime, y=Glovo, 
         ratio = 1,
         alternative = "two.sided",
         conf.level = 0.95)

######################################
### We fail to reject Equality of Variances
### Therefore, the argument var.equal=TRUE
t.test(x=DeliveryTime,y= Glovo,
       alternative = c("greater"),
       mu = 0, paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

##### Summary Statistics
describe(x=DeliveryTime)
describe(x=Glovo)

##################################################
### Pairwise t test
#################################################
?anorexia
head(anorexia)

### Descriptive
describe(x=anorexia[,-1])
par(mar=c(4,4,1,1))
boxplot(anorexia[,-1])

####

## Check of equality of variances
var.test(x=anorexia$Prewt,
         y=anorexia$Postwt)
## Conclusion: Variances are not equal

t.test(x=anorexia$Prewt,y=anorexia$Postwt,
       alternative = "less",
       mu = 0, paired = TRUE, 
       var.equal = FALSE,
       conf.level = 0.95)


head(anorexia)
### Select only CBT treatment

Index<-anorexia$Treat=="CBT"
CBT.grp<-anorexia[Index,]

t.test(x=CBT.grp$Prewt,y=CBT.grp$Postwt,
       alternative = c("less"),
       mu = 0, paired = TRUE, 
       var.equal = FALSE,
       conf.level = 0.95)

ChickWeight
##########################################
### 23 March, 2023
##########################################

head(ChickWeight)
?ChickWeight

### Random selection of diets
ChickWeight$Diet
levels(ChickWeight$Diet)
?levels
set.seed(4)
library(MASS)
str(anorexia)
set.seed(500)
s = sample(x=levels(anorexia$Treat),size=2,replace=F);s
anorexia[anorexia$Treat=='FT',]
anorexia[anorexia$Treat=='CBT',]
library(dplyr)
fil = anorexia%>%
  filter(Treat=='FT')



?filter
?Reduce

rDiets<-sample(x=levels(ChickWeight$Diet),
               size=2,replace = FALSE);rDiets

Diet4<-ChickWeight[ChickWeight$Diet=="4",];Diet4
Diet1<-ChickWeight[ChickWeight$Diet=="1",];Diet1
#### b)
par(mar=c(4,4,1,1)) 
plot(x=Diet4$Time,y=Diet4$weight,
     xlab="Time",ylab="Weight")

plot(y=Diet4$Time,x=Diet4$weight,
     xlab="Time",ylab="Weight")








#### c)
### Combine weights of diets 1 and 4
### Also populate Diet 4 with NAs to 
### make the length equal that of Diet1

length(Diet1$weight)
length(Diet4$weight)
Weights1n4<-data.frame(Diet1=Diet1$weight,
                       Diet4=c(Diet4$weight,rep(NA,220-118)))
dim(Weights1n4)
### Side by side boxplot
boxplot(Weights1n4,ylab="Weights",col=rainbow(4))

colors()




#############################################
## d)

#############################################
### Simple Linear Regression
#############################################

plot(cars,ylab="Breaking Distance")
?cars
### Correlation
cor(x=cars$speed,y=cars$dist)
### Test on rho
cor.test(x=cars$speed,y=cars$dist,
         method = "pearson",
         alternative = "two.sided")

############################################
# Simple linear regresssion
?lm

### Fits a SLR model
Fitlm<-lm(formula=dist~speed,data=cars)

### Draws the fitted line on the scatter plot
abline(Fitlm,col=2,lwd=2)

### Summary
summary(Fitlm)


##Diagnostic
plot(Fitlm)
hist(Fitlm$residuals)
shapiro.test(Fitlm$residuals)




### Predictions
### Fitted values
points(fitted(Fitlm),col="#0000ff")
abline(Fitlm,lwd=3)
?points
points(x=20,y=50,col="#00ff00",lwd=3) # just trying out something
?fitted
abline(h=40,v=20)


####
?predict.lm
### New speed to be used to predict
### expected distance
newx<-data.frame(speed=c(5,10,19,30))

### Use predict to obtain values
Pred.dist<-predict(object=Fitlm,
                   newdata=newx)

round(data.frame(Speed=newx,
           Distance=Pred.dist),2)



### function to plot and compute correlation
fun<-function(a,b)
{
  #### the plot
  plot(a,b,
       xlanb="a",
       ylab="b",
       main="Scatter plot of a and b")
  ### the corelation
  c<-cor(a,b)
  return(c)
}
d<-round(runif(1:10,1,10),2);d
e<-round(rnorm(1:10,mean=mean(1:10),sd=sd(1:10)),2);e
fun(d,e)
f<-data.frame(d,e);f
g<-lm(formula=e~d,data=as.data.frame(d,e));g
summary(g)
abline(g,col="#00ff00",
       lwd=2)
h<-data.frame(a=c(2,4,6,8,10));h
i<-predict(object=g,newdata=h);i
j<-data.frame(newa=h,new_b=i);j
plot(j)



k<-plot(cos,-pi,pi,ylab="",col="#ff0000",lty=3)
l<-plot(sin,-pi,pi,add=T,col="blue",lty=2)
m<-plot(tan,-pi,pi,add=T,col=3)
legend("topleft",
       legend=c("cos","sin","Tan"),
       fill = c("#ff0000","#0000ff","#00ff00"),
       lty=c(3,2,1),
       lwd=2)




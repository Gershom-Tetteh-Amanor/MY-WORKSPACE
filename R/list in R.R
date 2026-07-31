Age<-c(22,22,18,35,12);Age # vector
Gender<-c("M","F","M","F","M");Gender 
Weight<-c(70, 60, 79, 39, NA);Weight 

mydata<-data.frame(Age,Gender,Weight);mydata
rownames(mydata)<-LETTERS[1:5];mydata

mydata$Age>=18 # logic to check for ages that are greater than 18
mydata$Age[Age>=18] #printing Ages greater than or equal to18
mydata[c(1,3,5),"Age"] 
# note that when using names to ref, you must put them in double quotes since itis a character


### List
Weight1<-c(70, 60, 79, 39, ) #
mylist<-list(Age, Gender, Weight);mylist #
length(mylist)
str(Gender)
#### selecting from the list
mylist[2] # this comes witha dollar sign
# in order to take away the dollar sign, use double[[]]
mylist[[2]]

### labeling
mylist<-list(Ages=Age,Genders=Gender,Weights=Weight);mylist
#selecting using variable names
mylist$Ages
mylist$Genders
mylist$Weights



##### importing data ###
newdat<-read.table(file=file.choose(),header=T, sep=",",
                   row.names=c("Ama","Abena","Akua"),
                   col.names=c("AGE","GENDER","WEIGHT"));newdat
Gershon<-read.table(file=file.choose(), header=T, sep=",");Gershon
#?read.table

## from excel
newdata<-read.csv(file = file.choose(), header=T,
                  row.names=c("Ama","Abena","Akua","Amina"),
                  col.names=c("AGE","GENDER","WEIGHT"));newdata


##### plotting
### plot function
plt<-plot(newdata$AGE)

##### adding type
plt<-plot(newdata$AGE, type = "b")


#### labeling 
par(mar = c(4,4,1,1)) # setting the margin ratios
plt<-plot(newdata$AGE, type = "b", 
          main="scatter plot", xlab="weight", ylab = "Ages",
          pch=50, col="green", lwd=5)
### Graphs --- scatter plot
par(mar = c(4,4,1,1))
plt<-plot(newdata$AGE, type = "b")
plt<-plot(newdata$AGE, lwd=70, type = "hist")
plt<-plot(newdata$AGE, type = "blockchat", xlab = "Index", ylab = "Ages")
boxplot(newdata$AGE, col="yellow", ylab="Ages",main="Box plot")

hist(newdata$AGE,col="orange",xlab = "Ages", main = NULL)


par(mfrow=c(3,3)) # setting the number of graphs per page
boxplot(newdata$AGE, col=c("yellow","blue","orange"), ylab="Ages",main="Box plot")

hist(newdata$AGE,c("yellow","blue","orange"),xlab = "Ages", main = NULL)
#would not run because it is a categorical data for the x-axis
?hist


plt<-plot(newdata$AGE, col="green",lwd=10, type = "blockchat", xlab = "Index", ylab = "Ages")

###  scatter plot ######
### to draw a scatter plot, you need two variables; x and y
### par() is used to set the parameters of of the graph. 
### example when it is too small 
## mar argument is 


### barplot()
par(mar = c(1,1,1,1))

barplot(Age, col=c("yellow","blue","orange"),
        main="Barchat", xlab="Age",ylab="Frequency")
sex<-table(newdata$GENDER);sex
barplot(sex, main="Barplot",xlab="sex",
        ylab = "Frequency",col=c("blue","green"))
##### rainbow colors
par(mar = c(1,1,1,1))

barplot(Age, col=rainbow(5), main="Barchat", xlab="Age",ylab="Frequency")


###### descriptive statistics 
library(datasets)
head(mtcars)
summary(mtcars)

library(psych )
describe(mtcars)
describe(mtcars$mpg)
par(mar = c(1,1,1,1))
pie(sex, col=c("yellow","blue"),
    main = "PIE CHART IN R", ylab="FREQUENCY", xlab ="GENDER")

##########################################################
###                   CALCULATING                      ###
##########################################################
# 1 sum
100.1 + 1234.9 + 12.01
# 2 square root
sqrt(256)
# 3
log10(100)*cos(pi)
# 4 cumulative sum
cumsum(c(2,3,4,5,6))
# 5 cum sum in reverse order
cumsum(rev(c(2,3,4,5,6)))
# 7. 10 random sample b/n 1 and 100 to the nearest whole  numbers
sample(1:10,size=10)# using sample function
round(runif(min=1,max=100,n=10),0)# using the uniform sample

#########################################################
###                 OBJECTS                           ###
#########################################################
x<-10;x
y<-20;y
z<-x*y;z # the product of x and y
ls() # inspect your environment

# making a vector
myvec<-c(x,y,z);myvec
# min,max,length,variance of myvec
min(myvec)
max(myvec)
length(myvec)
var(myvec)

##########################################################
###           WORKING WITH A SINGLE VECTOR            ###
##########################################################
rainfall<-c(0.1,0.6,33.8,1.9,9.6,4.3,33.7,0.3,0.0,0.1);rainfall
# mean rainfall
mean(rainfall)
# standard deviation
sd(rainfall)
# cumulative rainfall
cumsum(rainfall)
# which day saw the highest rainfall
which.max(rainfall)

##########################################################
###           TO QUOTE OR NOT TO QOUTE                ###
##########################################################
one<-1;one
two<-2;two
vector1<-c("one","two")
vector2<-c(one,two)
c('a','b')

##########################################################
###           WORKING WITH A SINGLE VECTOR            ###
##########################################################
# two vectors
lenghts<-c(2.1,3.4,2.5,2.7,2.9);lenghts
diameters<-c(0.3,0.5,0.6,0.9,1.1);diameters
# correlation
cor(lenghts,diameters)
# volume of a cylinder
volume<-(lenghts)*pi*(diameters/2)^2;volume
# mean,SD,coefficient of variation,volumes
mean(volume)
sd(volume)
(sd(volume))/(mean(volume))

# converyt fro cm to mm and find the 
# mean,sd,coefficient of variation
volume.mm<-(lenghts*10)*pi*(10*diameters/2)^2;volume.mm
mean(volume.mm)
sd(volume.mm)
(sd(volume.mm))/(mean(volume.mm))
lenghts1<-c(2.1,3.4,2.5,2.7,2.9);lenghts1
heights1<-c(0.3,0.5,0.6,0.6,0.9,1.1);heights1

# correlation
mycor<-cor(lenghts1,heights1);mycor# error due incompatible dimensions

# volumes
volume1<-(0.25)*pi*(lenghts1)*(heights1)^2
# warning due to differnce in the lenths of the ectors
# standard deviations
sd(volume1)


#########################################################
###            ALPOHABET AEROBICS 1                  ###
########################################################
lets<-c("A","B","C","D");lets
rep(lets,each=3)# each being repeated
rep(lets,3) # the vector being repeated

## sampling 10 letters and sorting them in alphabetical order
sample(letters,10)
sort(sample(letters,10))

# samplingg 5 from lower and upper each
low<-sample(letters,5);low
upp<-sample(LETTERS,5);upp
sort(c(low,upp))
# sorting in descending order
sort(c(low,upp),decreasing=T)

########################################################
###        COMPARING AND COMBINING VECTORS           ###
########################################################
# using union,setdiff,intersect
x<-c(1,2,5,9,11);x
y<-c(2,5,1,0,23);y

# find the values that are contained in both x and y
intersect(x,y)

# find the values that are contained in x and not y and vice versa
setdiff(x,y)# x and not y
setdiff(y,x)#y and not x

# vector that contains x or y
union(x,y)
length(union(x,y))# join values that are in x or y
c(x,y)
length(c(x,y))# joins the two vectors


###########################################################
###           INTO THE MATRIX                         ###
#########################################################
# 10x10 matrix containing random variables b/n 0 and 1
m<-matrix(runif(100),ncol=10);m
rowMeans(m)#calculating the row means
sd(rowMeans(m))# sd ofrow means
# 10x100 mat 
m1<-matrix(runif(1000*100),ncol=1000);m1
colMeans(m1)
rowSums(m1)
colSums(m1)

example("rowsum")

hist(colMeans(m1),col=rainbow(7),
     xlab=" Means of the columns",
     main="HISTOGRAM",
     sub="Happy Day",
     freq = FALSE)
lines(density(colMeans(m1),bw=0.01),col="#000000",lwd=1.5)


##########################################################
###                PACKKAGES                          ###
#########################################################
install.packages("carData")#installing a package
library(carData)# loading a package
??densityplot
example("density")
load("list in R")

#########################################################
###        WORKING WITH A SINGLE VECTOR 2             ###
#########################################################
rainfall #calling the rainfall vector
# subsetting rainfall larger than 20
rainfall[rainfall>20]
# mean rainfall for days where rainfall was at least 4
mean(rainfall[rainfall>=4])
# subsetting vector where it is either 0 or ecactly 0.6
rainfall[rainfall==(0)|rainfall==(0.6)]
# alternative
rainfall[rainfall %in% c(0,0.6)]

#############################################################
###                  ALPHABET AEROBICS 2                  ###
############################################################# 
LETTERS[18];letters[18]
LETTERS[26];letters[26]
letters[length (letters)]# last letter

let15<-sample(letters,15,replace=T);let15
any(duplicated(let15))# is there any duplicated
which(duplicated(let15))#which positions are duplicated
let15[which(duplicated(let15))]#printing the duplicated values
length(let15)



unique(let15)# unique characters
length(unique(let15))#how many unique characters used



#########################################################
###                  BASIC OPERATIONS                 ###
#########################################################
# reading in a short dataset
sht<-read.csv(file="shortdataset.csv",header=T);sht
is.data.frame(sht)
str(sht)
sht1<-data.frame("Day no."=seq(1:7),sht);sht1
sht1[,-2]
subset(sht1,select=-Day)

# on which day did you observe most honey eaters
sht1[which.max(nrbirds),c(-3)]
od<-order(sht1$nrbirds)
st<-sort(sht1$nrbirds)

data.frame(Day=od,Nbirds=st)

?order
example(order)

ls()
ls()[ls()!=sht1]
rm(list = ls()[ls()!=sht1])
?grep
library(lubridate)
as.Date(dmy(anorexia$Prewt))
?diff
??hydro
?ifelse()
vec<-c(2,3,4,5,4,6,8,9,10)
ifelse(vec<=4,0,1)

readLines("alphabet.txt")
anorexia
order((boxplot(anorexia[,-1],main="COUNTRY SIDE", font.main=1)),decreasing =FALSE)
x<-Cars93$Price;x
hist(x,freq=FALSE,col=rainbow(7))
curve(dnorm(x,mean=mean(x),sd=sd(x)),lwd=5,add=T)
lines(density(x,bw=5))

## Additional function that will return the indices of a vector
v<-c(4,7,2,10,1,0)
### checking if for the values that are greater than or equal to 4
### It will return boolean results TRUE for those greater than or equal to 4 and False otherwise
v>=4
which(v>=4) ## it produces results that gives the position of values greater than or equal to 4
which.max(v) ## position of the (first) maximum value
which.min(v) ## position of the (first) least value
match(c(0,1,2),v) ## for finding the first position of a specified value



### OPERATIONS IN VECTORS
x<-c(4,7,2,10,1,0);x
y<-x^2 +1;y
xy<-x*y;xy




##### USEFUL VECTORS IN R
sum(x) ### sum
prod(x)
prod(x=x[-6]) ### products excluding the last value 
cumsum(x) ### cumulative sum
cumprod(x) ###  cumulative product
min(x) ### min value of x
max(x) ### max value of x
mean(x) #### average
median(x) ### median of x
cov(x,y) ### co-variance of x and y
sd(x) ### standard deviation
var(x) ### variance 
range(x) # range by stating the min and max values
quantile(x, probs=c(0.25,0.1,.95,.60,.70,.50)) ### Quartiles
fivenum(x) ### five number summary  (minimum, lower-hinge, median, upper-hinge, maximum)
length(x) # number of elements
unique(x) ### unique values only. No repeated value or row or column
rev(x) ### reverse
sort(x) ### order into ascending or descending
sort(x, decreasing = T);sort(x, decreasing = F)
union(x,y) ### union of x and y
intersect(x,y) ### intersection of x and y
setdiff(x,y); setdiff(mtcars,mtcars$gear) ### y complement or x only
setequal(x,y) ## Do x and y contain the same elements?


#################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
### MATRICES#####
# syntax matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,
# dimnames = NULL)
mat<-matrix(c(x,y), nrow=6,ncol=2, byrow =F);mat

### Naming matrices
rown<-rownames(mat)<-c("A","B","C","D","E","E");mat
coln <-colnames(mat)<-c("X","Y");mat
plot(mat,col=rainbow(6),pch=1:6,lwd=5)

# dimnames() is used to give row and column names in a list form
dimnames(mat)<-list(rows=c("ENG","MATH","SCI","SOC","PHYS","CHEM"),cols=c("X","Y") );mat

# REFERENCING A MATRIX
# (a) using the numerical index matrix-name[row,column]
mat[1,2];mat[6,1]
## multiple rows or columns
mat[c(3,6),2]; mat[2,c(2,1)]
# (b) using column rownames and names
mat["ENG","Y"];mat[c("SCI","SOC"),c("X","Y")]


#################################
# MATRIX OPERATION
mat.a<-matrix(1:4,nrow=2);mat.a
mat.b<-matrix(1,nrow=2,ncol=2);mat.b
mat.c<-matrix(1:3);mat.c
# For matrix multiplication use the %*% operator
mat.a%*%mat.b
mat.c/(mat.a%*%mat.b) # you'll encounter an error because the matrices are not conformable in terms of number of rows and colummns
mat.c1<-matrix(10:13,nrow=2, ncol=2);mat.c1
mat.c1/(mat.a%*%mat.b)
###############################################
# USEFUL MATRIX FUNCTIONS
A<-matrix(c(x,y), nrow=3, ncol=3);A
b<-matrix(1:3)
t(A) # transpose matrix A
solve(A,b) # solves the equation Ax=b
?solve()
solve(A) # Matrix inverse of A
MASS::ginv(A) # general inverse of A (MASS package)
eigen(A) # Eigenvalues and eigenvectors of A
chol(A) # Choleski factorization of A
n<-5;diag(n) # n by n identity matrix
diag(A) # diagonals of A
x<-c(10:15);diag(x) # creates a diagonal matrix of vector x
lower.tri(A);upper.tri(A) # Matrix of logicals indicating lower/upper triangular matrix
#########    APPLY()    #########
# The apply() function is used for applying functions to the margins of a
# matrix, array, or data frames
# syntax:  apply(x,MARGIN,FUN,...)
# x=the matrix, MARGIN
apply(A,1,sum) # row totals
apply(A,2,sum) # column means
#################################################
############    ARRAYS      #################
# Arrays are similar to  matrix
# specify the dimensions 
#dim=c(2,3,2) will produce two 2x3 matrices
array(1:12,dim=c(2,3,10),dimnames=list(c("A","B"),c("X","Y","Z"),c("ARRAY1","ARRAY2","ARRAY3","ARRAY4","ARRAY5","ARRAY6","ARRAY7","ARRAY8","ARRAY9","ARRAY10")))
####  REFERENCING ARRAY ################
#[row(s),column(S),Array position]
array<-array(1:12,dim=c(2,3,10),dimnames=list(c("A","B"),c("X","Y","Z"),c("ARRAY1","ARRAY2","ARRAY3","ARRAY4","ARRAY5","ARRAY6","ARRAY7","ARRAY8","ARRAY9","ARRAY10")));array
array[1,2,1]; array[1:2,,"ARRAY10"];array[,2:3,6:8]
#########    Useful Array Functions       #######
apply(array,1,sum); #sum of rows
apply(array,2,sum)
dim(array); # dimensions in the form of number of rows, number of columns , number of arrays

######################################################
########          LISTS IN R      #############
# using the function list()
# it is a general form of a vector where the elements don't need to be of the same type oror dimensions
?list()
list<-list(num=c(1,2,3),c("Nick","VICK","WICK") ,identity=diag(3));list
####   REFERENCING ELEMENTS IN A LIST   ####
list[[2]];  #### second element of list
list[["num"]]; # Element named "num"
list$identity; # Element named identity
##############   USEFUL LIST FUNCTIONS   #########
L<-lapply(3:9,seq);L # List of seven different vectors
# Calculate the five number summary for each vector in L
lapply(l,fivenum)
sapply(L,fivenum)
vapply(L,fivenum,c(min=0,"1st Quart"=0, median=0,"3rd Quart"=0, max=0))
#Since 3:9 is not a list, R calls as.list(3:9) which coerces the vector 3:9
#to a list of length 7 where each number is an element of L. Also note that
#seq(n) is the same as 1:n.

#########    DATAFRAMES     ##############
#A data frame is a matrix-like structure, where the columns can be of
#different types. You can also think of a data frame as a list. Each column is
#an element of the list and each element has the same length.
a<-c(4:6);a;b<-c(1:3);b;c<-(a+b);c
data.frame(A=a,B=b,TOTAL=c,check.rows=T,row.names=c("ENG","MATH","SCI"))

format(13.7,nsmall=3);# 3 decimal places
format(c(1,10,100,1000),trim=F); # assume all have same sizes and place them under the place values
format(c(1,10,100,1000),trim=T); # remove the spaces around
format(2^16,scientific = F);# raw
format(2^16,scientific = T);# scientific notation

####       Example - Logical Operations     ####
x<-1:10;x
(x%%2==0)|(x>5) # What elements of x are even or greater than 5?
y<-5:15;y
x %in% y # What elements of x are in y?
x[x %in% y] # the values of x in y
any(x>5) # Are any elements of x greater then 5?
all(x>5) # Are all the elements of x greater then 5?
identical(x,y); # is x exactly equal to y?
z<-1:10
identical(x,z); # is x exactly equal to z?
all.equal(x,y) # is x nearly equal to y?
all.equal(x,z) # is x nearly equal to z?
# Isn’t that equal?
name <- "Nick"
if(name=="Nick") TRUE else FALSE
# But what if name is never set to "Nick"?
name <- NA
if(name=="Nick") TRUE else FALSE
if(identical(name, "Nick")) TRUE else FALSE
#Therefore, do not use all.equal() directly in if expressions,
#instead use with isTRUE() or identical().
all.equal(x^2, 1)
isTRUE(all.equal(x^2, 1))
f<-"kofi and ama"
toupper(f)
F<-"KOFI AND AMA"
tolower(F)
noquote(F)
nchar(f)
letters
LETTERS
animals <- c("bird", "horse", "fish")
substr(animals,2,4) # Get characters 2-4 of each animal
strtrim(animals, 3) # Print the first three characters
list(x,y)
colors()
as.factor(x)
levels(x)
cut(x,3); cut(x,c(1,3,5))
########### Detecting Missing Data
is.nan(x) #Tests for NaN data in x
is.null(x) #Tests if x is NULL
X<-c(4,7,2,0,1,NA);X
mean(X, na.rm=TRUE)
Sys.Date()
as.Date()















# I wanna create a function to plot 3 graphs
gers<-function(x,y,z)
{
  par(mar=c(4,4,1,1))
  par(mfrow=c(3,3))
  # a function that plots 3 graphs 
  #bar plot
  a1<-barplot(x,y,col="green")
  a2<-barplot(x,z, col="red")
  a3<-barplot(y,z,col="blue")
  #box plot
  b1<-boxplot(x,y,col="yellow")
  b2<-boxplot(x,z,col="purple")
  b3<-boxplot(y,z,col="orange")
  c<-cor(c(x,y),c(y,z),method = c("pearson","kendal"))
  return(c(a1,a2,a3,b1,b2,b3,c))
}
round(sample(runif(anorexia$Prewt,min=1,max=10),size=10),2)
X<-c(1:4);x
Y<-c(5:8);y
Z<-c(10:13);z
try<-gers(X,Y,Z); try
paste("the correlation is : ", try)

###########################################
### Importinng data in R
# 1) From text (notepad file)
# i wanna copy the anorexia files in the MASS package and create a otepad file
anorexia

#### Reading the data with R
# a). Clipboard 
# first copy the data to clipboard and use the function, read.table(file="clipboard", ....)
a<-read.table(file= "clipboard", header=TRUE);a

# b) using the read.table and setting the file="THE NSME OF THE FILE"
b<-read.table(file="No-Treat-Prewt -Postwt.txt",
              header=TRUE
              );b # NB: don't forget to add the file extension(txt)

# if the file is not in your working directorate;
# i). Copy the file path and past for the file 
A<-read.table(header = TRUE,file = "C:/Users/user/Desktop/⁮/ACTUARIAL SCIENCE PACK/STAT 240/R programming/No-Treat-Prewt-Postwt.txt")
# ii). or set file = choose.file
B<-read.table(choose.files(), header=TRUE);B
# (iii). using URL
# copy the URL of an online dataset and paste for the file
dotchart(B$Prewt, col=1:100, pch=1:100)
#(iv). using import from the environment

mtcars
read.csv(file="Book1.csv", header=T)
read.csv(file=choose.files(), header=T)
read.table(file="mtcars.txt", header=T)

### for a bar plot; you need
#-height,width
barplot(height=mtcars$cyl, col=c("blue",rainbow=c(1:7)))
r?barplot    


################################################################################
#########      PIE CHARTS          ##########

#############################################################
###########     3D PIE CHART                  #############
# the 3D pie chart is in the plotrix package
# we can draw a 3D pie chart with the function, pie3D()
interview.of.graduates<-c("Manager", "Blue-Colour", "Unemployed", "Manager",
                          "Manager", "Other", "Manager", "Blue-Colour", 
                          "Unemployed", "Other", "Blue-Colour", "Other", "Other", 
                          "Unemployed", "Unemployed", "Unemployed", "Other", "Other",
                          "Other", "Other", "Other");interview.of.graduates
### converting to frequency table
interview.of.graduates.table<-table(interview.of.graduates);interview.of.graduates.table

# Question 2.a)
### can plotted using pie chart,bar chart,boxplot
library(plotrix);par(mar=c(4,4,1,1)
    );par(mfrow=c(2,2)
);pie3D(interview.of.graduates.table,
        col=c("blue","yellow","green","red"),
        main=c(toupper("3D Pie chart")),
        labels=paste(names(interview.of.graduates.table)),labelcex=.8
);barplot(interview.of.graduates.table,
          col=c("blue","yellow","green","red"),
          main=c(toupper("Bar chart")),
          xlab="CATEGORIES",
          ylab="FREQUENCIES"
);pie(interview.of.graduates.table,
      col=c("blue","yellow","green","red"),
      main=c(toupper("Pie chart")),
      labels=paste(names(interview.of.graduates.table)),
      
);pie3D(interview.of.graduates.table,
        col=c("blue","yellow","green","red"),
        main=c(toupper("Exploded 3D Pie chart")),
        explode=0.3,labelcex=.8,
        labels=paste(names(interview.of.graduates.table)))


Sys.Date()
Sys.time();Sys.timezone()
Sys.getpid()


f = read.csv(file = "C:/Users/user/Desktop/⁮/ACTUARIAL SCIENCE PACK/LEVEL 200/L200 SEM1/STAT 240/R programming/amu.csv")
library(dplyr)
View(f)
ff = f[,-c(1,7:19)]
#ff=mutate(ff,)
attributes(ff)
nrow(ff)
mean=c(mean(ff$DISTRICT),mean(ff$AGE),mean(ff$EDUCATION),
       mean(ff$MARRIED),mean(ff$CHILDREN))
vars =c(var(ff$DISTRICT),var(ff$AGE),var(ff$EDUCATION),
             var(ff$MARRIED),var(ff$CHILDREN))

ff[c((nrow(ff)+1),(nrow(ff)+2)),]=c(mean,vars)
format(ff,scientific = F)
?format
tail(ff)
glimpse(ff)

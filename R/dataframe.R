# dta frame - rectangular or 2-dimensional array that can contain different data types
# can be created using the function data.frame
?data.frame
### check.rows checks for the consistency of length and names
Age<-sample(x=12:40, size=15);Age
Salary<-sample(x=0:2500, size=15);Salary
Weight<-sample(50:140, size = 15);Weight
Religion<-sample(x=c("muslim","christian","others"), 
                 size=15, replace=T, prob=c(0.70,0.18,0.12)
                 );Religion

my.df<-data.frame(Weight,Age,Salary,Religion);my.df



### Referencing in data frame
# a). using row and column numbers
## Name[i,j] 
# ith row(s) and jth column(s)
my.df[1,2] # row 1, column 2
my.df[,1] # all rows of column 1

## b). using row or column numbers
my.df[,"Weight"]# all rows of weight

### Naming dta frames
### row names
rownames(my.df)<-LETTERS[1:15];my.df
### Column names
colnames(my.df)<-(toupper(c("Weight","Age","Salary","Religion")));my.df


# c). for data frame, we can use the dollar sign
my.df$WEIGHT[2:5]
# in my.df,select the weight column and choose from row 2 to 5
my.df$WEIGHT[c(2:5,12:15)]
# in my.df,select the weight column and choose from row 2 to 5
# and row 12 to 15


par(mar=c(4,4,1,4),mfrow=c(2,2))
# calling with the $ sign
hist(my.df$SALARY,
     col=rainbow(5),
     xlab="SALARY",
     ylab=toupper("NUMBER OF PEOPLE"),
     main="SALARY ANALYSIS")
barplot(my.df$SALARY,
            col=rainbow(7),
            xlab="SALARY",
            ylab=toupper("NUMBER OF PEOPLE"),
            main="SALARY ANALYSIS")
pie(my.df$SALARY,
     col=rainbow(5),
     xlab="SALARY",
     ylab=toupper("NUMBER OF PEOPLE"),
     main="SALARY ANALYSIS")
plot(my.df$SALARY,
     col=rainbow(5),
     xlab="SALARY",
     ylab=toupper("NUMBER OF PEOPLE"),
     main="SALARY ANALYSIS")

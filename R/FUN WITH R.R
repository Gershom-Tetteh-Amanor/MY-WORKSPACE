Sys.time()
# Question 1
# creating five vectors of integers
a <- c(1,2,3,4,5,6)
b <- c(2,4,6,8,10,12)
c <- seq(10,60,10)
d <- seq(1,12,2)
e <- 10:15

# combining the vectors to form a matrix
A <- cbind(a,b,c,d,e)
rownames(A) <- letters[21:26];A

# modifying the code to make each vector a row
# we can transpose the matrix, A
t(A)

# Question 2
is.matrix(A)
# A is a matrix since the return is TRUE

# Question 3
# creating a vector with 20 integers
scores <- sample(0:100,size = 20,replace = F);scores
B <- matrix(scores,nrow=5,ncol=4)
X <- matrix(scores,nrow=5,ncol=4,byrow=T,
            dimnames=list(c("Zeric","Ranita","Angela", "Moses" , "Joseph"),
                          c("STAT222", "STAT226", "STAT224","GERSHON")));X
B # B is filled column wise

# Transpose of X
t(X)

# Trace
sum(diag(X))

# a 3x3 sub matrix
subX <- X[c(1:3),-4];subX

# Question 4
# (a) creating a data frame
ID <- factor(1021:1030)
Age <- c(19,22,24,30,19,23,28,21,20,35)
Gender <- factor(c("Male","Male","Female",
                   "Male","Female","Female",
                   "Female","Male","Female","Male"))
GP <- c(2.35,1.75,3.13,3.01,3.73,2.53,2.89,3.89,2.83,2.45)
Residential_Status <- c("Resident","Resident",
                                  "Non-resident","Non-resident",
                                  "Resident","Non-resident","Non-resident",
                                  "Resident","Non-resident","Non-resident")
Data <- data.frame(ID,Age,Gender,GP,Residential_Status,
                   row.names=c("Eric","Yaw","Sally",
                              "Ben","Ranita",
                              "Portia","Roberta",
                              "Mensah","Queen",
                              "Fred"));head(Data)


# 4 (b)
COVID_Test <- factor(c("Yes","Yes","No","No","Yes",
                "No","No","Yes","No","Yes"))
DATA <- data.frame(Data,COVID_Test);head(DATA)

# (4.b.i)
# code to check number of rows and column
dim(DATA)
# it has 10 rows and 6 columns

# (4.b.ii)
# Code to check the class of each data type
str(DATA)


# (4.b.iii)
paste("It has a sample size of ", dim(DATA)[1])


# Question 5
str(state.center)
# A list with two vectors, X and Y
head(as.data.frame(state.center)) # converting to data frame
is.data.frame(as.data.frame(state.center))

# Question 6
a <- c(12,32,43,9,7,5);a
b <- sample(1:100,size=6);b
c <- round(runif(6,0,50),2);c
my.data <- data.frame(a,b,c,
           row.names=LETTERS[1:6])

a.order <- sort(a,decreasing = F)

# Using the first column to order the entire data frame
my.data.ordered <- rbind.data.frame(
  my.data[my.data$a==a.order[1],],
  my.data[my.data$a==a.order[2],],
  my.data[my.data$a==a.order[3],],
  my.data[my.data$a==a.order[4],],
  my.data[my.data$a==a.order[5],],
  my.data[my.data$a==a.order[6],]
);my.data.ordered

# Question 7
# (a) Checking if the VADeaths death data is a data frame
is.data.frame(VADeaths)
# Converting the VADeaths data to a data frame
Vad <- as.data.frame(VADeaths);Vad

# (b) Creating a variable called Total to sum the rows
Total <- rowSums(Vad);Total

# (c) Adding the Total to the data frame
VAD <- data.frame(Total,Vad);VAD

# Question 8
# (a) Checking if the state.x77 data is a data frame
is.data.frame(state.x77)
# Converting the state.x77 data set to a dataframe
dat <- as.data.frame(state.x77);head(dat)

# (b) states with income greater than 5000
sum(dat$Income>5000)
# 8 states have income greater than 5000

# (c) the states with the highest and the lowest life expectancy in years.
dat[dat$`Life Exp`==max(dat$`Life Exp`),]
dat[dat$`Life Exp`==min(dat$`Life Exp`),]

# (d) information for states with land area in squares miles greater over
# 55000 and Illiteracy rate less than 1.0.
head(dat[(dat$Area>55000)&dat$Illiteracy<1.0,])


# Question 9
# Checkoing if the swiss data set is a data frame
is.data.frame(swiss)
# Creating a data frame with some selected rows and columns
SWISS <- swiss[c(1,2,3,10,11,12,13),
      c("Examination", "Education", "Infant.Mortality")];SWISS


# (a) correcting a value
(SWISS["Sarine","Infant.Mortality"]=NA);SWISS

# (b) a row that will be the total sum of the column,
Total <- colSums(SWISS);Total
SWISS[8,] <- Total
rownames(SWISS)<- c(rownames(SWISS[-8,]),"Total"); SWISS

# (c) a new variable that will be the proportion of Examination
Proportion.of.Examination <- (
  SWISS[,
        "Examination"])/SWISS["Total",
                              "Examination"
                              ];Proportion.of.Examination

SWISS[,4] <- Proportion.of.Examination
colnames(SWISS) <- c(colnames(SWISS[-4]),"Proportion.of.Examination");SWISS



# Question 10
States <- data.frame("abb"=state.abb,"are"=state.area,
                     "div"=state.division,"nam"=state.name,
                     "reg"=state.region,
                     row.names=state.name);head(States)

# Question 11
State.and.x77 <- data.frame(state.x77,States);head(State.and.x77)

# (a) Remove the variable div
State.and.x77.simplified <- State.and.x77[,-11];head(State.and.x77.simplified)

# (b) remove the variables Life Exp, HS Grad, Frost, abb, and are.
State.and.x77.simplified1 <- State.and.x77.simplified[ ,
                                            -c(4,6,7,9,10)
                                            ];head(State.and.x77.simplified1)

# (c)
# we write function that categorizes the level of illiteracy 
category <- function(x)
{
  if ((x>=0)&(x<1))
  {
    cat <- "low"
  }else
    if ((x>=1)&(x<2))
  {
    cat <- "some"
  }else
    if(x>=2)
  {
    cat <- "high"
  }else
  {
    cat <- "Error in input, Level of illiteracy has to be a positive value"
  }
  return(cat)
}

# Applying the function to the Illiteracy
level.of.illiteracy <- sapply(
  State.and.x77.simplified1[,
                            "Illiteracy"
                            ],category);head(level.of.illiteracy)

# Adding the categories to the data frame
State.and.x77.simplified1[,8] <- level.of.illiteracy

colnames(State.and.x77.simplified1) <- c(
  colnames(State.and.x77.simplified1[,-8]),
  "level.of.illiteracy");head(State.and.x77.simplified1)

# (d)
# West states
west.states <- State.and.x77.simplified1[
  (State.and.x77.simplified1$reg=="West"),
];head(west.states)


# West state with low illiteracy,
west.states.low.lit <- west.states[west.states$level.of.illiteracy=="low",
                                   ];west.states.low.lit


# West state with low illiteracy,and highest income
west.states.low.lit.high.income <-west.states.low.lit[
  west.states.low.lit$Income==max(west.states.low.lit$Income),
];west.states.low.lit.high.income

# Income of West state with low illiteracy,and highest income
with(west.states.low.lit.high.income,print(Income))

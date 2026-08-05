#### ASSIGNMENT 
#### write a function to compute
#### CGPA, Grading
#### a. pearson
#### b. Kendal
#### c. spear man and put them in data frame


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
  CCT <- sum(credit) # cumulative credit taking
  CGPT <- sum(GPT) # Cumulative grade point taken
    
  gpa <- round(CGPT/CCT,2)
  GPA <- c(gpa, rep(x=' ', times = length(mrks)-1))
    
    return(data.frame('Course Code' = score$Course_Code,'Marks (%)' = mrks,'Credit Hours' = credit, 'Grade' = Grade,'Grade Point' = GPT, 'GPA' = GPA))
}

GPA()






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




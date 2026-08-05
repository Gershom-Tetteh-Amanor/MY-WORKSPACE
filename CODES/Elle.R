GPA <- function(Course_Code,marks,credit_Hours)
{ 
  score <- data.frame(
    'Course_Code' = as.character(Course_Code),
    'marks' = as.numeric(marks), 
    'credit_Hours' = as.numeric(credit_Hours)
  )
  
  # Defining some vectors
  mrks <- as.vector(score$marks)
  credit <- as.vector(score$credit_Hours)
  Grade <- c()
  GPT <- c()
  
  
  for(i in 1:length(mrks))
  {
    if (length(score$Course_Code) != length(score$marks) | length(score$Course_Code) != length(score$credit_Hours))
    {
      print("Please make sure all the variables are of the same length")
      break
    }
    else
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
  result <- data.frame('Course Code' = score$Course_Code,'Marks (%)' = mrks,'Credit Hours' = credit, 'Grade' = Grade,'Grade Point' = GPT, 'GPA' = GPA)
  
  
  return(result)
}


Course_Code <- c('ACTU 301', 'ACTU 359','FINC 301' )
marks <- c(89,67,74)
credit_Hours <- c(3,3,3)

GPA(Course_Code,marks,credit_Hours)





my_correlation <- function(X,Y)
{
  if(length(X) != length(Y))
  {
    print(" X and Y must be of the samme length")
  }
  else
  {
    N <- length(X)
    n = N
    r <- (N*sum(X*Y)-sum(X)*sum(Y))/(sqrt((N*sum(X^2)-(sum(X))^2)*(N*sum(Y^2)-(sum(Y))^2)))
    
    
    concordant <- c()
    discordant <- c()
    for(i in 1:length(X))
    {
      if(X[i] %in% Y)
      {
        conc <- X[i]
        concordant[i] <- conc
      }
      else 
      {
        disc <- X[i]
        discordant[i] <- disc
      }
    }
    
    concordant <- discordant <- 0
    
    for (i in 1:(n - 1)) {
      for (j in (i + 1):n) {
        if ((X[i] - X[j]) * (Y[i] - Y[j]) > 0) {
          concordant <- concordant + 1
        } else if ((X[i] - X[j]) * (Y[i] - Y[j]) < 0) {
          discordant <- discordant + 1
        }
      }
    }
    
    k <- (concordant - discordant) / choose(n, 2)
    
    
    di <- X-Y  
    rho <- 1 - ((6*sum(di^2))/(n*(n^2-1)))
    
  }
  
  return(data.frame('Pearson'=round(r,4),
                    'Kendall' = round(k,4),
                    'Spearman' = round(rho,4)))
}



X <- 1:10
Y <- 10:1
my_correlation(X,Y)



## Go into the ExpQQ and ensure that

#1.  No tittle of plot

#2.  pareto is a special distribution for modelling large data

#3.  use the ExpQQ to achieve the pareto.

#NOTE: If Z has the basic pareto distribution with shape parameter *a*, then T = ln(z) has the exponential distribution with rate parameter *a*.

library(ReIns)
#trace(ExpQQ, edit = TRUE)

my_pareto <- function (data, plot = TRUE, main = NULL) 
{
  X <- as.numeric(sort(data))
  n <- length(X)
  i <- 1:n
  eqq.the <- ((n+1)/(n+1-i))
  eqq.emp <- X
  plot(eqq.the, eqq.emp, type = "p", xlab = "Quantiles of standard pareto", 
       ylab = "X", main = main)
}


library(MASS)
my_pareto(anorexia$Prewt)

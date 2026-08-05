##########################################################################
########               ACTU 302 - EXERCISE 1                       #######
##########################################################################
### Q1. Creating a vector named salary
Salary <- sample(x = 0:10000,
                 size = 7)
Salary

names(Salary) <- c("Aba","Adu","Dan","Nat","Kit","Yaa","Yaw")


### Q2. Selecting elements from the vector
### a. 3rd salary
Salary[3] ## Alternatively
Salary["Dan"]


### b. 2nd, 4th and 6th salaries
Salary[c(2,4,6)]
Salary[c("Adu","Nat","Yaa")]


### c. other salaries other than what is in b
Salary[-c(2,4,6)]


### Q3. using the state.x77 data
### a. Inspecting the data structure
str(state.x77)


### b. selecting the states with the highest and lowest life expectancy
### State with the maximum income
which.max(state.x77[,"Life Exp"])
state.x77[which.max(state.x77[,"Life Exp"]),]


### State with the minimum income
which.min(state.x77[,"Life Exp"])
state.x77[which.min(state.x77[,"Life Exp"]),]


### c. states with area values more than 100000
state.x77[,"Area"] > 100000
state.x77[state.x77[,"Area"] > 100000,]


### d. states with area values more than 100000 and murder rate above 10
state.x77[,"Area"] > 100000 & state.x77[,"Murder"] > 10
state.x77[state.x77[,"Area"] > 100000 & state.x77[,"Murder"] > 10,]



### Q4. External data
URL <- "https://raw.githubusercontent.com/rminkah/STAT222/refs/heads/master/GHApparel.csv"

### a. Loading the data
GHApparel <- read.csv(file = URL,
                      header = TRUE)
head(GHApparel)


### b. i. number of payment methods available
unique(GHApparel$Method.of.Payment)
length(unique(GHApparel$Method.of.Payment))


### ii. Cross tabulation of method of payment by type of customer
ctab_paybycust <- table(GHApparel$Type.of.Customer,
                        GHApparel$Method.of.Payment)
ctab_paybycust


### iii. More prevalent method
which.max(colSums(ctab_paybycust))
max(colSums(ctab_paybycust))




### Q5. creating a vector, data frame, matrix and a list
(my_vec <- c(12,34,56,78,90))

(My_df <- data.frame(Age = c(34,33,54,65,45),
                    Religion = c("Chr","Mus","Mus","Tra","Oth"),
                    Hall = c("sarbah", "Akuafo","Liman","Volta","Pent")))


(My_mat <- matrix(data = 1:20,
                 nrow = 4,
                 ncol = 5,
                 byrow = T))


(My_list <- list(People = c("Boys","Girls","Men","Women"),
                mat = matrix(0:1,4,4,byrow = T)))


(Final_list <- list(my_vec,My_df,My_mat,My_list))

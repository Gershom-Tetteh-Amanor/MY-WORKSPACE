data <- read.csv(file = "C:/Users/user/Desktop/b./ACTUARIAL SCIENCE PACK/LEVEL 200/L200 SEM2/STAT 230/PROJECT/H1N1_Flu_Vaccines.csv", header=T)
#Making sure the data is in the right format
Data <- with(data,data.frame(h1n1_concern=factor(h1n1_concern),
                           h1n1_knowledge=factor(h1n1_knowledge),
                           chronic_med_condition=factor(chronic_med_condition),
                           health_worker=factor(health_worker),
                           opinion_h1n1_sick_from_vacc=factor(opinion_h1n1_sick_from_vacc),
                           opinion_seas_sick_from_vacc=factor(opinion_seas_sick_from_vacc),
                           age_group=factor(age_group),sex=factor(sex),
                           income_poverty=factor(income_poverty),
                           marital_status=factor(marital_status),
                           household_children=factor(household_children),
                           h1n1_vaccine=factor(h1n1_vaccine),
                           seasonal_vaccine=factor(seasonal_vaccine)))

#a. Produce descriptive statistics for the following variables: 
#Age group
summary(Data$age_group)
# H1N1 concern
summary(Data$h1n1_concern)
#sex
summary(Data$sex)

#b. Construct a contingency table for h1n1_concern (row) and age_group (column).
Table <- table(Data$h1n1_concern,Data$age_group)

# CHI SQUARE TEST OF INDEPENDENCE
chisq.test(Table)

#d. Use Cramerb
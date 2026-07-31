install.packages('tidyverse')
install.packages('patchwork')
install.packages("devtools")
library(tidyverse)
library(patchwork)
library(dplyr)
data()
head(file)
data = file %>%
#Not at all concerned;Not very concerned;Somewhat concerned;Very concerned
#(tab,c('Not at all concerned',
#                'Not very concerned',
#                'Somewhat concerned',
#                'Very concerned'))





mutate(size=cut((data$h1n1_concern),
                breaks = 4,
                labels = c('0','1','2','3')))  

select(data,data$h1n1_concern,na.action=na.omit)

licence()
RShowDoc("COPYING")
RShowDoc("GPL-3")
RShowDoc("C:/Users/user/Desktop/⁮/ACTUARIAL SCIENCE PACK/LEVEL 200/L200 SEM2/STAT 230/PROJECT/Report.docx")
citation()
citation("pkgname")
library("pkgname")



#H0: the variables are independent
#H1: the variables are dependent
tab = table(factor(data$h1n1_concern),
      data$age_group)
t = chisq.test(tab)
t$expected
t$observed

# Cramer's v
# base
#table the variables
tabv = table(factor(data$h1n1_concern),
            data$age_group)
# total sample size
n = sum(tabv)
# minimumu of number of rows and columns
m = min(nrow(tabv),ncol(tabv))
# the chi square value
chi = unname(chisq.test(tabv)$statistic)
# Cramer's v
v = sqrt(chi/(n*(m-1)))


# with the lsr package
library(lsr)
cramersV(tabv)

# with the DescTools package
library(DescTools)
CramerV(tabv)

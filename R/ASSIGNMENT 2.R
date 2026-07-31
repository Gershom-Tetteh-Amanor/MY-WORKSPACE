Sys.Date()
### calling the anorexia data set
library(MASS)
head(anorexia)
tail(anorexia)
# Question 1.a)
### selecting the patients treated with CBT
CBT<-anorexia[anorexia$Treat=="CBT",];CBT 

# Question 1.b)
### ploting box and whisker for postwt and prewt
boxplot(CBT[,-1],col=c("green","yellow"))
### comment 
### The boxplot for prewt is slightly normally distributed with outliers
### The boxplot for postwt is skewed to the right and has no outliers

# Question 1.c)
### Summary statistics
summary(CBT[,-1])
### for prewt, there is insignificant difference between mean and median
### but for postwt, there is a significant difference between mean and median

# Question 1.d)
### testing equality of mean
var.test(x=CBT[,2],y=CBT[,3],ratio=1,
         alternative="two.sided", conf.level=0.95,
         var.equal=T,pair=F)
stem(CBT[,c(2,3)])

# Question 1.e)
# H0: difference in means =0
# H1: difference in means is not equal to 0
# we reject H0 if our interval does not enclose 0
# since 0 is included in the interval, we fail to reject H0
# we can conclude that at a significance level of 0.05,
# there is significant information that the difference in mean is 0


# Question 2
interview.of.graduates<-c("Manager", "Blue-Colour", "Unemployed", "Manager",
                          "Manager", "Other", "Manager", "Blue-Colour", 
                          "Unemployed", "Other", "Blue-Colour", "Other", "Other", 
                          "Unemployed", "Unemployed", "Unemployed", "Other", "Other",
                          "Other", "Other", "Other"
                          );interview.of.graduates
### converting to frequency table
interview.of.graduates.table<-table(interview.of.graduates
                                    );interview.of.graduates.table

 
par(mfrow=c(2,1),mar=c(4,4,1,1)
);pie(interview.of.graduates.table,
      col=c("blue","yellow","green","red"),
      main=c(toupper("Pie chart"))
);barplot(interview.of.graduates.table,
          col=c("blue","yellow","green","red"),
          main=c(toupper("Bar chart")),
          sub="",
          xlab="CATEGORIES",
          ylab="FREQUENCIES")


# Question 2.b)
### proportions
round(interview.of.graduates.table/sum(interview.of.graduates.table),
      2
      );noquote(paste(names(interview.of.graduates.table
                    ),round(((interview.of.graduates.table/sum(interview.of.graduates.table)
                    )*100),2),"%"))
?legend
round((interview.of.graduates.table/sum(interview.of.graduates.table))*100,digits=2)
?paste

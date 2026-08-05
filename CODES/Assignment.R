# Thu May 23 11:54:47 2024 ------------------------------
###############################################################################
###                      DESCRIPTIVE STATISTICS                            ####
###############################################################################
### Graphical Descriptives
library(MASS)
Insurance$District # Categorical with nominal scale
table(Insurance$District)

Insurance$Group #Ordinal scale
table(Insurance$Group)

Insurance$Age
table(Insurance$Age)

cats
sex.freq <- table(cats$Sex)
pie(sex.freq)
### Margins
par(mar=c(2,2,0.5,0.1))
pie(sex.freq)
library(plotrix)
pie3D(sex.freq,explode = 0.5)


### BAR CHAT
barplot(sex.freq,
        col= c("#bf1090","#bbf120"),
        horiz = F,density = NULL,beside=T,angle=30)


#### QUANTITVE DATA
#### HISTOGRAM
?hist
par(mar=c(4,4,0.1,0.1))
hist(cats$Hwt,
     xlab= "Heart Weight (g)",
     main="",
     col=c("#bbf001","#bff","#bbf","#bf1111","#fbb"))


### STEM AND LEAF  PLOT
stem(cats$Hwt)


### BOX AND WHISKER PLOT
?boxplot
boxplot(cats$Hwt,col="#bf0101")

### SIDE BY SIDE BOXPLOT
boxplot(Hwt~Sex,data=cats,col=c("#bf1","#bbf"))
colnames(cats)


### SCATTER PLOT
plot(cats)
plot(x = anorexia$Prewt,
     y = anorexia$Postwt,
     xlab = "Pre weight (kg)",
     ylab = "Post weight (kg)")


### ASSIGNMENTS
### 1. interpret the graphs
### 2. video on side by side plots


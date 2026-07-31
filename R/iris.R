d = iris
library(caTools)
library(rpart)
library(rpart.plot)
library(caret)
# Splitting
set.seed(20) # Setting the seed
sample =sample.split(d$Species, SplitRatio = .70)
Train=subset(d, sample==TRUE)
Test=subset(d, sample==FALSE)


# Training the decision Tree classifier
Tree <- rpart(Species~., data=Train,cp=0.2)# The dot reps all other variables
# Prediction
Tree.Species.pred = predict(Tree,Test,type = c( "class"))
Tree.Species.pred = predict(Tree,Test,type = c( "class"),
                            na.action = na.pass)

# Confusion matrix to evaluate the model
# confusionMatrix(your predicted test, the actual values)
confusionMatrix(Tree.Species.pred,Test$Species)
str(d)

# Visualizing the decision Tree
rpart.plot(Tree,
           main='using rpart',border.col='purple',
    box.col=c('green','blue','orange'),
    split.box.col='yellow',
    split.border.col='red',
    split.round=1,
    round=T,
    leaf.round = 1,lwd=2)


# Visualizing the decision Tree
prp(Tree,
    main='using prp',border.col='purple',
           box.col=c('green','blue','orange'),
           split.box.col='yellow',
           split.border.col='red',
           split.round=1,
           round=T,
           leaf.round = 1,lwd=2)

rpart.plot(Tree,split.border.col='red')

install.packages("xlsx")
library(xlsx)
install.packages('readxl')
library(readxl)

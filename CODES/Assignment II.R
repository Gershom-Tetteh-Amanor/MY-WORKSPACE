# Sun May 26 15:43:28 2024 ------------------------------

# loading the MASS package since the anorexia data is in the MASS package
library(MASS)

# setting the margins
par(mar = c(4,4,1,1))
boxplot(Prewt~Treat,
        data = anorexia,
        xlab = 'Treatment Type',
        ylab = 'Pre weight',
        col = c('red','white','blue'))


boxplot(count~spray,
        data=InsectSprays,
        col = rainbow(6),
        ylab = 'count of insects',
        xlab = 'spray')

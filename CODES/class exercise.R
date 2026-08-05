# generate observations fro gamma 100, shape = 2, scale = 5
Claim_size <- rgamma(n = 100, shape = 2, scale = 5)
par(mar = c(4,4,1,1))
hist(Claim_size,
     xlab = " Claim Sixe",
     main = "")
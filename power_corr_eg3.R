# Load package
library(pwr)

# Given parameters
n <- 38
power <- 0.9
alpha <- 0.05

# Compute the minimum detectable correlation (r)
pwr_result <- pwr.r.test(n = n, sig.level = alpha, power = power)

# View the result
pwr_result

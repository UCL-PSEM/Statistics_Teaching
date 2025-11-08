# Load package
library(pwr)

# Parameters
r <- 0.5        # true correlation under H1
n <- 38         # sample size
alpha <- 0.05   # significance level

# Compute power
pwr_result <- pwr.r.test(r = r, n = n, sig.level = alpha)

# Show result
pwr_result

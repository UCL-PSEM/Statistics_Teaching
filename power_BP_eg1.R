# 1. Load the package
library(pwr)

# calculate the effect size (d)
d <- 5 / 19   # d = mean difference / SD

# Run the power analysis and STORE the result in 'pwr_result'
pwr_result <- pwr.t.test(d = d,
                         sig.level = 0.05,
                         power = 0.90,
                         type = "two.sample",
                         alternative = "two.sided")

# Extract the sample size per group
pwr_result$n

# Adjust for 10% attrition 
n_adjusted <- ceiling(pwr_result$n / 0.9)

# 
n_adjusted * 2

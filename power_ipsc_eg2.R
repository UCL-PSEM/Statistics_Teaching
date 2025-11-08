# Load the package
library(pwr)

# calculate the effect size (d)
d <- 25 / 10  # d = mean difference / SD

# Run the power analysis and STORE the result in 'pwr_result'
pwr_result <- pwr.t.test(d = d,
                         sig.level = 0.05,
                         power = 0.90,
                         type = "two.sample",
                         alternative = "two.sided")

# Extract the sample size per group
pwr_result$n

# adjust for no attrition
n_adjusted <- ceiling(pwr_result$n / 1)
n_adjusted * 2

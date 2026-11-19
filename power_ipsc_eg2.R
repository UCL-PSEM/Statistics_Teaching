# Load the package
library(pwr)

# Inputs
mean_diff <- 25    # expected difference between group means
sd_pooled <- 10    # pooled standard deviation of the two groups
alpha     <- 0.05  # significance level
power     <- 0.90  # target power

# calculate the effect size (d)
d <- mean_diff / sd_pooled  # d = mean difference / SD

# Run the power analysis and STORE the result in 'pwr_result'
pwr_result <- pwr.t.test(d = d,
                         sig.level = alpha,
                         power = power,
                         type = "two.sample",
                         alternative = "two.sided")

# Extract the sample size per group (rounded up to a whole participant)
n_per_group <- ceiling(pwr_result$n)
n_per_group

# Total sample size across both groups
2 * n_per_group

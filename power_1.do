/* Code related to the lecture 'An Introduction to Sample Size and Power Calculations'
ADH 08/11/2025
*/

* Example 1: A classic example based on effect differences in blood pressure
power twomeans 145, sd(19) diff(-5) alpha(0.05) power(0.9)
* 
display "Allowing for 10% loss to follow-up, N(total) = " ceil(r(N)/0.9)
display "Allowing for 10% loss to follow-up, N per group = " ceil(r(N)/(0.9*2))

* Example 2: A small laboratory study
power twomeans 145, sd(10) diff(25) alpha(0.05) power(0.9)

* Example 3A: a fixed sample size (detectable effect size)
power onecorrelation 0, power(0.9) n(38) alpha(0.05)

* Example 3B: a fixed sample size (power)
power onecorrelation 0 0.5, n(38) alpha(0.05)

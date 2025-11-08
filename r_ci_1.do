/* Code to estimate 95% confidence intervals for various r values given a fixed number of samples (N = 38)
ADH 01/11/25
*/

* run quietly
qui { 
clear
set more off

*--- Define sample size ---
local n = 38

*--- Create data for r values from 0.3 to 0.8 in steps of 0.1 ---
set obs 6
gen r = 0.2 + _n*0.1   // r = 0.3 to 0.8

*--- Fisher z-transformation ---
gen z = 0.5*ln((1 + r) / (1 - r))

*--- Standard error of z ---
gen sez = 1/sqrt(`n' - 3)

*--- Compute 95% CI in z-space ---
gen z_low  = z - 1.96*sez
gen z_high = z + 1.96*sez

*--- Transform back to r-space ---
gen r_low  = (exp(2*z_low) - 1) / (exp(2*z_low) + 1)
gen r_high = (exp(2*z_high) - 1) / (exp(2*z_high) + 1)

*--- Set display format for variables ---
format r r_low r_high %5.3f
}

*--- Display results ---
list r r_low r_high, noobs sep(0)

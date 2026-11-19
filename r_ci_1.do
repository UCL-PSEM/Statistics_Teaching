/* Code to estimate 95% confidence interval widths for various r values at several sample sizes (N = 17, 38, 72, 144) and plot them
ADH 01/11/25
*/

* run quietly
qui { 
clear
set more off

*--- Define inputs ---
local nlist   17 38 72 144   // sample sizes
local level   = 95           // confidence level (%)
local r_start = 0.3          // first r value
local r_step  = 0.1          // step between r values
local n_r     = 6            // number of r values (0.3 to 0.8)

*--- Critical value for the chosen confidence level ---
local zcrit = invnormal(1 - (1 - `level'/100)/2)   // 1.96 for 95%

*--- Number of sample sizes ---
local k : word count `nlist'

*--- Create data for r values ---
set obs `n_r'
gen r = `r_start' + (_n - 1)*`r_step'   // r = 0.3 to 0.8

*--- One copy of each r value per sample size ---
gen r_id = _n
expand `k'
bysort r_id: gen n = real(word("`nlist'", _n))
sort n r

*--- Fisher z-transformation ---
gen z = 0.5*ln((1 + r) / (1 - r))

*--- Standard error of z (now varies with n) ---
gen sez = 1/sqrt(n - 3)

*--- Compute CI in z-space ---
gen z_low  = z - `zcrit'*sez
gen z_high = z + `zcrit'*sez

*--- Transform back to r-space ---
gen r_low  = (exp(2*z_low) - 1) / (exp(2*z_low) + 1)
gen r_high = (exp(2*z_high) - 1) / (exp(2*z_high) + 1)

*--- CI width in r-space ---
gen ci_width = r_high - r_low

*--- Set display format for variables ---
format r r_low r_high ci_width %5.2f
}

*--- Display results ---
list n r r_low r_high ci_width, noobs sepby(n)

*--- Plot CI width against r, one line per n ---
local plots
local legend
local i = 0
foreach nn of local nlist {
    local ++i
    local plots `plots' (line ci_width r if n == `nn', sort pstyle(p`i'))
    local legend `legend' `i' "n = `nn'"
}

twoway `plots', ///
    legend(order(`legend') cols(1) size(12pt)) ///
    xtitle("Correlation (r)", size(12pt)) ///
    ytitle("Width of `level'% CI", size(12pt)) ///
    xlabel(, format(%3.2f) labsize(12pt)) ///
    ylabel(, format(%3.2f) labsize(12pt)) ///
    title("Width of `level'% confidence interval for r by sample size", size(12pt))

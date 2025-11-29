# Sample Size and Power Calculations: Student Notes

## 1. Why Are Sample Size Calculations Important?

-   Ensure the study can detect the targeted effect with adequate
    precision or power
-   Underpowered studies contribute to reproducibility issues
-   Overpowered studies can impose unnecessary risk and waste resources
-   Required for grant applications (and dissertations!)

## 2. Key Concepts

### Fisher's approach

-   Compatibility of observed data with the Null Hypothesis (H₀) using
    p-values
-   The p-value is the probability of observing data as extreme or more
    extreme than those actually seen, given H₀ and model assumptions
    *(NB: the p-value is not the probability H₀ is true)*

### Neyman--Pearson (N-P) approach

-   Formulates statistical testing as a decision procedure comparing a
    main hypothesis (H) and an alternative hypothesis (K)
-   Requires the investigator to specify acceptable long-run error
    rates:
    -   **Type I error (α):** probability of rejecting H when it is
        true
    -   **Type II error (β):** probability of failing to reject H when K
        is true
-   Emphasises long-run operating characteristics and decision rules
    rather than evidence from a single experiment
-   Did **not** assume universal (i.e. fixed) α levels; error rates
    should be set according to the decision context

## 3. Null Hypothesis Statistical Testing (NHST)

-   A hybrid of Fisher's and Neyman--Pearson's approach which conflates
    p-values with α
-   Can be misleading because Fisher's p-values (compatibility with H₀)
    are interpreted like N--P error rates (decision thresholds)

## 4. Determinants of Power

-   **Sample Size (N):** Larger N → higher power
-   **Effect Size:** Larger effect → easier detection
-   **Significance Level (α):** Lower α → harder detection
-   **Variability:** Greater outcome variability relative to effect size
    → lower power
-   **Study design:** e.g., paired vs unpaired, clustered vs independent

## 5. Steps for Sample Size Calculation

1.  Define aim and hypothesis
2.  Make design and analysis plan
3.  Decide minimally important effect (MIE)
4.  Estimate variability using reliable external data
5.  Perform calculation and allow for dropout

## 6. A Digression on Effect Sizes

-   Sometimes it is difficult to determine the minimally important
    effect
-   Rough conventions for Cohen's d:
    -   small = 0.2
    -   medium = 0.5
    -   large = 0.8
-   Use effect sizes cautiously; context matters

## 7. Common Mistakes in Sample Size Estimates

-   Using a sample size from a previous study without justification
-   Using pilot data as if precise
-   Basing sample size on convenience
-   Overly optimistic effect size assumptions
-   Failing to account for clustering or repeated measures
-   Ignoring attrition
-   Failing to specify level (individuals, clusters, etc.)

## 8. Tools for Power Analysis

-   **[G*Power](https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower)**
-   **Stata:** `power`, `sampsi`, user-written packages
-   **R packages:** `pwr`, `pwrss`, `simr`

## 9. Alternatives to Power

-   Estimate precision using confidence intervals when N is fixed
-   Precision-based approaches are often preferable for estimation

## 10. Summary

-   Sample size estimation is essential for robust design
-   Requires statistical expertise and subject knowledge
-   Should be transparent and justified
-   Complex designs often need simulation

## References

-   Cohen J. *Statistical Power Analysis for the Behavioral Sciences*
-   Ellis P. *The Essential Guide to Effect Sizes*
-   Greenland et al. *Guide to Misinterpretations of p-values*

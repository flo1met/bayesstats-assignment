# Bayesian Statistics — Group Assignment (2026)

**Bayesian Inference from Scratch: Coding Your Own Sampling Algorithm**

University of Amsterdam · Course: Bayesian Statistics (2026)

## Overview

This repository contains the materials for the group assignment in which we build a
**Gibbs sampler from scratch** to estimate a Bayesian linear regression model, and
use it to investigate whether a brief online mindfulness program reduces students'
end-of-exam-period anxiety, after adjusting for baseline anxiety.

The data is **simulated**. The research question is:

> *"Does access to the mindfulness program reduce end-of-exam-period anxiety, after
> adjusting for baseline anxiety levels?"*

## Repository contents

| File | Description |
|------|-------------|
| `Assignment_gibbs.qmd` | The assignment brief: research question, model, full-conditional update formulas, Gibbs algorithm, and grading rubric. Source for the analysis/report. |
| `Assignment_gibbs.pdf` | Rendered PDF of the assignment brief. |
| `simulate_anxiety_data.R` | Script that simulates the `anxiety_data` dataset (N = 120) and saves it. |
| `anxiety_data.rds` | The simulated dataset used in the analysis. |
| `model.stan` | Stan model for the same regression, used to cross-check the hand-coded Gibbs sampler via `cmdstanr`. |
| bayesstats-assignment.qmd | Presentation Qmd file |
| bayesstats-assignment.html | rendered presentation |


## Requirements

- R
- R packages: `cmdstanr` (+ CmdStan), `logspline`, and optionally `invgamma`
- Quarto (to render the `.qmd`)
- RTools/Xcode
- you need to have [CmdStanR](https://mc-stan.org/cmdstanr/index.html) installed which is not available on CRAN. To do this, make sure you have [RTools](https://cran.r-project.org/bin/windows/Rtools/) (Windows) or [Xcode](https://developer.apple.com/xcode/) (Mac) installed and the run the following code

```r
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
cmdstanr::check_cmdstan_toolchain(fix = TRUE)
cmdstanr::install_cmdstan(cores = 2)
```
To make sure everything installed correctly, run this example:

```r
file <- file.path(cmdstan_path(), "examples", "bernoulli", "bernoulli.stan")
mod <- cmdstan_model(file)
```

If you run into any problems, you can look at the [Getting started with CmdStanR](https://mc-stan.org/cmdstanr/articles/cmdstanr.html) guide.

## References

- Johnson, Ott & Dogucu (2022). *Bayes Rules!* https://www.bayesrulesbook.com/
- Gelfand & Smith (1990). Sampling-based approaches to calculating marginal densities. *JASA*.
- Gelman & Rubin (1992). Inference from iterative simulation using multiple sequences. *Statistical Science*.
- Wagenmakers et al. (2010). Bayesian hypothesis testing for psychologists: the Savage-Dickey method. *Cognitive Psychology*.

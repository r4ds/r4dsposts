
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r4dsposts

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/r4dsposts)](https://CRAN.R-project.org/package=r4dsposts)
[![Codecov test
coverage](https://codecov.io/gh/r4ds/r4dsposts/branch/main/graph/badge.svg)](https://app.codecov.io/gh/r4ds/r4dsposts?branch=main)
[![R-CMD-check](https://github.com/r4ds/r4dsposts/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r4ds/r4dsposts/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

r4dsposts will be used to create an archive of posts on the R4DS Slack.

## Installation

You can install the development version of r4dsposts from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("r4ds/r4dsposts")
```

## Usage

This package provides helpers for fetching and cleaning data about the
[R4DS Online Learning Community](https://r4ds.io). Most of these
functions were originally developed as part of the
[mentordash](https://github.com/r4ds/mentordash), but they have been
refined and expanded here. Some functions probably *should* be pulled
out into a more general-use package. We are intentionally keeping the
Imports list for [slackthreads](https://github.com/yonicd/slackthreads)
light, so for now they’re here. Ultimately I’ll likely write a bridge
package for the general-purpose Slack tidying functions.

## Code of Conduct

Please note that the r4dsposts project is released with a [Contributor
Code of Conduct](https://r4ds.github.io/r4dsposts/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

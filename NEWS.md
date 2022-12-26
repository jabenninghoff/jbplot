# jbplot 1.2.0

Added ggplot2 convenience functions:

* `geom_rlm()`: wrapper for `ggplot2::geom_smooth()` that sets `method` to `MASS::rlm()` and `formula` to `y ~ x`

# jbplot 1.1.8

* Update links

# jbplot 1.1.7

* Replace development lintr with CRAN release 3.0.0

* Updated `rdev::use_rdev_package()` and `rdev::use_spelling()`

# jbplot 1.1.6

* Updated `rdev::use_lintr()`

# jbplot 1.1.5

* Maintenance updates

# jbplot 1.1.4

* Updated `rdev::use_rdev_package()` and `rdev::use_codecov()`

* Updated for R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"

# jbplot 1.1.3

* Maintenance updates

# jbplot 1.1.2

* Maintenance updates

# jbplot 1.1.1

* Maintenance updates

# jbplot 1.1.0

* Removed `viridis_quo()` function as its method of setting options was problematic for reproducibility

* Maintenance updates

# jbplot 1.0.3

* Maintenance updates

# jbplot 1.0.2

* Important update from renv 0.15.0 to [0.15.1](https://rstudio.github.io/renv/news/index.html#renv-0151)

# jbplot 1.0.1

* Minor updates, added `theme_quo()` example to README

# jbplot 1.0.0

* Migrated `theme_quo()` from `rdev::theme_quo()`: [ggplot2](https://ggplot2.tidyverse.org) theme based on `ggplot2::theme_bw()` and font [Lato](https://www.latofonts.com)

* Migrated `viridis_quo()` from `rdev::viridis_quo()`: Sets the default theme to `theme_quo()` and the default color scales to `viridis`

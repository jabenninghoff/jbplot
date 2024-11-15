# jbplot 1.5.0

Added [Security Differently](https://www.security-differently.com) branded palettes and color functions:

* `sd_palettes`: all Security Differently palettes

* `pal_sd()`: Security Differently palette constructor

# jbplot 1.4.8

* Enabled pkgdown [light switch](https://pkgdown.r-lib.org/articles/customise.html#light-switch)

# jbplot 1.4.7

* Updated for R 4.4.0

# jbplot 1.4.6

* Maintenance updates

# jbplot 1.4.5

* Maintenance updates

# jbplot 1.4.4

* Maintenance updates

# jbplot 1.4.3

* Maintenance updates

# jbplot 1.4.2

* Updated logo

# jbplot 1.4.1

* Add new jbplot hex sticker logo from [stickers](https://jabenninghoff.github.io/stickers/) to `man/figures/logo.png` per [roxygen2](https://github.com/r-lib/roxygen2/blob/db4dd9a4de2ce6817c17441d481cf5d03ef220e2/R/object-defaults.R#L43) and to `README.Rmd` per [pkgdown](https://github.com/r-lib/pkgdown/blob/548a9493b72ff93d3ed8392d4ad30b77d8b15fa5/README.Rmd#L15)

# jbplot 1.4.0

* Added `ggplot_donut()`: creates a donut plot from a data frame containing groups and corresponding values with `ggplot2::ggplot()`.

* Added `ggplot_donut_percent()`: creates a donut plot with the text value of the percentage in the center, using `ggplot_donut()`.

# jbplot 1.3.4

* Maintenance updates

# jbplot 1.3.3

* Maintenance updates

# jbplot 1.3.2

* Maintenance updates

# jbplot 1.3.1

* Maintenance updates

# jbplot 1.3.0

* Check `theme_quo()` arguments with [checkmate](https://mllg.github.io/checkmate/index.html)

# jbplot 1.2.10

* Site rendering fixes

# jbplot 1.2.9

* Moved "jbplot ggplot2 style" vignette to "Get Started" article

# jbplot 1.2.8

* Update site to Bootstrap 5

# jbplot 1.2.7

* Updated installation instructions

# jbplot 1.2.6

* Maintenance updates

# jbplot 1.2.5

* Maintenance updates

# jbplot 1.2.4

* Maintenance updates

# jbplot 1.2.3

* Maintenance updates

# jbplot 1.2.2

* Maintenance updates

# jbplot 1.2.1

* Added `geom_lm()`: wrapper for `ggplot2::geom_smooth()` that sets `method` to `lm()` and `formula` to `y ~ x`

# jbplot 1.2.0

Added ggplot2 convenience functions:

* `geom_rlm()`: wrapper for `ggplot2::geom_smooth()` that sets `method` to `MASS::rlm()` and `formula` to `y ~ x`

* `geom_hist_bw()`: wrapper for `ggplot2::geom_histogram()` that sets `color` to `black` and `fill` to `white`

* `annotate_quo()`: wrapper for `ggplot2::annotate()` that sets the font to Lato

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

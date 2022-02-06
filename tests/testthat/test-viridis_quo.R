# theme_quo

test_that("theme_quo sets theme properties", {
  gg <- theme_quo()

  expect_identical(gg$text$family, "Lato")
  expect_identical(gg$plot.title$face, "bold")
  expect_identical(gg$plot.subtitle$face, "bold")
  expect_identical(gg$plot.caption$hjust, 0)
})

test_that("theme_quo grid lines options work", {
  blank <- ggplot2::element_blank() # == structure(list(), class = c("element_blank", "element"))
  minor <- structure(list(
    colour = NULL, size = structure(0.5, class = "rel"), linetype = NULL,
    lineend = NULL, arrow = FALSE, inherit.blank = TRUE
  ), class = c("element_line", "element"))

  base <- theme_quo()
  expect_null(base$panel.grid.major)
  expect_null(base$panel.grid.major.x)
  expect_null(base$panel.grid.major.y)
  expect_identical(base$panel.grid.minor, minor)
  expect_null(base$panel.grid.minor.x)
  expect_null(base$panel.grid.minor.y)

  no_maj <- theme_quo(major = FALSE)
  expect_identical(no_maj$panel.grid.major, blank)
  expect_null(no_maj$panel.grid.major.x)
  expect_null(no_maj$panel.grid.major.y)
  expect_identical(no_maj$panel.grid.minor, minor)
  expect_null(no_maj$panel.grid.minor.x)
  expect_null(no_maj$panel.grid.minor.y)

  no_min <- theme_quo(minor = FALSE)
  expect_null(no_min$panel.grid.major)
  expect_null(no_min$panel.grid.major.x)
  expect_null(no_min$panel.grid.major.y)
  expect_identical(no_min$panel.grid.minor, blank)
  expect_null(no_min$panel.grid.minor.x)
  expect_null(no_min$panel.grid.minor.y)

  no_x <- theme_quo(x = FALSE)
  expect_null(no_x$panel.grid.major)
  expect_identical(no_x$panel.grid.major.x, blank)
  expect_null(no_x$panel.grid.major.y)
  expect_identical(no_x$panel.grid.minor, minor)
  expect_identical(no_x$panel.grid.minor.x, blank)
  expect_null(no_x$panel.grid.minor.y)

  no_y <- theme_quo(y = FALSE)
  expect_null(no_y$panel.grid.major)
  expect_null(no_y$panel.grid.major.x)
  expect_identical(no_y$panel.grid.major.y, blank)
  expect_identical(no_y$panel.grid.minor, minor)
  expect_null(no_y$panel.grid.minor.x)
  expect_identical(no_y$panel.grid.minor.y, blank)

  no_maj_x <- theme_quo(major.x = FALSE)
  expect_null(no_maj_x$panel.grid.major)
  expect_identical(no_maj_x$panel.grid.major.x, blank)
  expect_null(no_maj_x$panel.grid.major.y)
  expect_identical(no_maj_x$panel.grid.minor, minor)
  expect_null(no_maj_x$panel.grid.minor.x)
  expect_null(no_maj_x$panel.grid.minor.y)

  no_maj_y <- theme_quo(major.y = FALSE)
  expect_null(no_maj_y$panel.grid.major)
  expect_null(no_maj_y$panel.grid.major.x)
  expect_identical(no_maj_y$panel.grid.major.y, blank)
  expect_identical(no_maj_y$panel.grid.minor, minor)
  expect_null(no_maj_y$panel.grid.minor.x)
  expect_null(no_maj_y$panel.grid.minor.y)

  no_min_x <- theme_quo(minor.x = FALSE)
  expect_null(no_min_x$panel.grid.major)
  expect_null(no_min_x$panel.grid.major.x)
  expect_null(no_min_x$panel.grid.major.y)
  expect_identical(no_min_x$panel.grid.minor, minor)
  expect_identical(no_min_x$panel.grid.minor.x, blank)
  expect_null(no_min_x$panel.grid.minor.y)

  no_min_y <- theme_quo(minor.y = FALSE)
  expect_null(no_min_y$panel.grid.major)
  expect_null(no_min_y$panel.grid.major.x)
  expect_null(no_min_y$panel.grid.major.y)
  expect_identical(no_min_y$panel.grid.minor, minor)
  expect_null(no_min_y$panel.grid.minor.x)
  expect_identical(no_min_y$panel.grid.minor.y, blank)
})

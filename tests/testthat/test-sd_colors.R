# sd_palettes

# pal_sd

test_that("pal_sd validates parameters", {
  expect_error(pal_sd(name = NA), "'name'")
  expect_error(pal_sd(name = ""), "'name'")
  expect_error(pal_sd(name = "notsd"), "'name'")
  expect_no_error(pal_sd(name = "primary"))
})

test_that("pal_sd returns a function", {
  expect_type(pal_sd(), "closure")
})

test_that("pal_sd function errors on invalid values of n", {
  long <- "^Number of requested colors greater than available colors in palette.$"
  expect_error(pal_sd(name = "status")(4), long)
  expect_error(pal_sd(name = "primary")(7), long)
  expect_error(pal_sd(name = "plot")(7), long)

  short <- "^Must request at least one color from a sd palette.$"
  expect_error(pal_sd()(0), short)
})

test_that("pal_sd function returns an unnamed vector of correct length", {
  expect_identical(pal_sd(name = "plot")(1), unname(sd_palettes$plot[1]))
  expect_identical(pal_sd(name = "plot")(3), unname(sd_palettes$plot[1:3]))
  expect_identical(pal_sd(name = "plot")(6), unname(sd_palettes$plot))
})

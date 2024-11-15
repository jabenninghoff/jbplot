# differently_palettes

# pal_differently

test_that("pal_differently validates parameters", {
  expect_error(pal_differently(name = NA), "'name'")
  expect_error(pal_differently(name = ""), "'name'")
  expect_error(pal_differently(name = "notdifferently"), "'name'")
  expect_no_error(pal_differently(name = "primary"))
})

test_that("pal_differently returns a function", {
  expect_type(pal_differently(), "closure")
})

test_that("pal_differently function errors on invalid values of n", {
  long <- "^Number of requested colors greater than available colors in palette.$"
  expect_error(pal_differently(name = "status")(4), long)
  expect_error(pal_differently(name = "primary")(7), long)
  expect_error(pal_differently(name = "plot")(7), long)

  short <- "^Must request at least one color from a sd palette.$"
  expect_error(pal_differently()(0), short)
})

test_that("pal_differently function returns an unnamed vector of correct length", {
  expect_identical(pal_differently(name = "plot")(1), unname(differently_palettes$plot[1]))
  expect_identical(pal_differently(name = "plot")(3), unname(differently_palettes$plot[1:3]))
  expect_identical(pal_differently(name = "plot")(6), unname(differently_palettes$plot))
})

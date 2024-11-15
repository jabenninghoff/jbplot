# differently_palettes

# pal_differently

test_that("pal_differently validates parameters", {
  expect_error(pal_differently(palette = NA), "'palette'")
  expect_error(pal_differently(palette = ""), "'palette'")
  expect_error(pal_differently(palette = "notdifferently"), "'palette'")
  expect_error(pal_differently(direction = NA), "'direction'")
  expect_error(pal_differently(direction = 0), "'direction'")
  expect_error(pal_differently(direction = 1.5), "'direction'")
  expect_error(pal_differently(direction = -1.5), "'direction'")
  expect_no_error(pal_differently(palette = "primary"))
})

test_that("pal_differently returns a function", {
  expect_type(pal_differently(), "closure")
})

test_that("pal_differently function errors on invalid values of n", {
  long <- "^Number of requested colors greater than available colors in palette.$"
  expect_error(pal_differently(palette = "status")(4), long)
  expect_error(pal_differently(palette = "primary")(7), long)
  expect_error(pal_differently(palette = "plot")(7), long)

  short <- "^Must request at least one color from a sd palette.$"
  expect_error(pal_differently()(0), short)
})

test_that("pal_differently function returns an unnamed vector of correct length", {
  expect_identical(pal_differently(palette = "plot")(1), unname(differently_palettes$plot[1]))
  expect_identical(pal_differently(palette = "plot")(3), unname(differently_palettes$plot[1:3]))
  expect_identical(pal_differently(palette = "plot")(6), unname(differently_palettes$plot))
})

test_that("pal_differently direction reverses vector order", {
  expect_identical(
    pal_differently(palette = "plot", direction = -1)(6), rev(unname(differently_palettes$plot))
  )
})

# scale_color_differently_d

df <- data.frame(x = 1, y = 1, z = "a", c = 0.5, stringsAsFactors = FALSE)

test_that("scale_color_differently_d changes point color", {
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = z)) +
    ggplot2::geom_point()
  p2 <- p1 + scale_color_differently_d()

  expect_false(ggplot2::layer_data(p1)$colour == ggplot2::layer_data(p2)$colour)
  expect_identical(ggplot2::layer_data(p2)$colour, differently_palettes$plot[[1]])
})

# scale_fill_differently_d

test_that("scale_fill_differently_d changes fill color", {
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, fill = z)) +
    ggplot2::geom_histogram(bins = 1)
  p2 <- p1 + scale_fill_differently_d()

  expect_false(ggplot2::layer_data(p1)$fill == ggplot2::layer_data(p2)$fill)
  expect_identical(ggplot2::layer_data(p2)$fill, differently_palettes$plot[[1]])
})

# scale_color_differently_c

test_that("scale_color_differently_c changes point color", {
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = c)) +
    ggplot2::geom_point()
  p2 <- p1 + scale_color_differently_c()

  expect_false(ggplot2::layer_data(p1)$colour == ggplot2::layer_data(p2)$colour)
  expect_identical(ggplot2::layer_data(p2)$colour, "#8D6C7D")
})

# scale_fill_differently_c

test_that("scale_fill_differently_c changes fill color", {
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, fill = c)) +
    ggplot2::geom_histogram(bins = 1)
  p2 <- p1 + scale_fill_differently_c()

  expect_false(ggplot2::layer_data(p1)$fill == ggplot2::layer_data(p2)$fill)
  expect_identical(ggplot2::layer_data(p2)$fill, "#8D6C7D")
})

# scale_color_differently_b

test_that("scale_color_differently_b changes point color", {
  df2 <- data.frame(x = 1:2, y = 1:2, z = c(0.5, 1), stringsAsFactors = FALSE)

  p1 <- ggplot2::ggplot(df2, ggplot2::aes(x, y, color = z)) +
    ggplot2::geom_count() +
    ggplot2::scale_x_binned()
  p2 <- p1 + scale_color_differently_b()

  expect_false(all(ggplot2::layer_data(p1)$colour == ggplot2::layer_data(p2)$colour))
  expect_identical(ggplot2::layer_data(p2)$colour, unname(differently_palettes$plot[c(1, 5)]))
})

# scale_fill_differently_b

test_that("scale_fill_differently_b changes fill color", {
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = c)) +
    ggplot2::geom_tile()
  p2 <- p1 + scale_fill_differently_b()

  expect_false(ggplot2::layer_data(p1)$fill == ggplot2::layer_data(p2)$fill)
  expect_identical(ggplot2::layer_data(p2)$fill, differently_palettes$plot[[1]])
})

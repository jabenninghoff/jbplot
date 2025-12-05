# ggplot_donut

test_df <- data.frame(
  group = c("A", "B", "C"),
  n = c(10, 60, 30),
  stringsAsFactors = FALSE
)
gg <- ggplot_donut(test_df)

test_that("ggplot_donut validates parameters", {
  bad_df <- data.frame(
    n = c(10, 60, 30)
  )
  expect_error(ggplot_donut(1), "'data'")
  expect_error(ggplot_donut(bad_df), "'data'")
  expect_error(ggplot_donut(test_df, group = ""), "'group'")
  expect_error(ggplot_donut(test_df, value = ""), "'value'")
  expect_error(ggplot_donut(test_df, hsize = -1), "'hsize'")
  expect_error(ggplot_donut(test_df, hsize = Inf), "'hsize'")
})

test_that("ggplot_donut uses geom_col()", {
  expect_s3_class(gg[["layers"]][[1]][["geom"]], "GeomCol")
})

test_that("ggplot_donut uses radial coordinates", {
  expect_s3_class(gg$coordinates, "CoordRadial")
  expect_identical(gg$coordinates$r, "x")
  expect_identical(gg$coordinates$theta, "y")
  expect_identical(gg$coordinates$arc, c(0, 2 * pi))
})

test_that("ggplot_donut limits are set with hsize", {
  expect_identical(gg[["scales"]][["scales"]][[1]][["limits"]], c(0, 2.95))
  gg <- ggplot_donut(test_df, hsize = 0)
  expect_identical(gg[["scales"]][["scales"]][[1]][["limits"]], c(0, 0.95))
})

test_that("ggplot_donut theme elements are blank", {
  expect_identical(gg$theme$axis.title, ggplot2::element_blank())
  expect_identical(gg$theme$axis.text, ggplot2::element_blank())
  expect_identical(gg$theme$axis.ticks, ggplot2::element_blank())
  expect_identical(gg$theme$panel.background, ggplot2::element_blank())
  expect_identical(gg$theme$panel.grid, ggplot2::element_blank())
})

# ggplot_donut_percent

ggp <- ggplot_donut_percent(0.6)

test_that("ggplot_donut_percent validates parameters", {
  expect_error(ggplot_donut_percent(-0.1), "'p'")
  expect_error(ggplot_donut_percent(1.1), "'p'")
  expect_error(ggplot_donut_percent(0.6, accuracy = ""), "'accuracy'")
  expect_error(ggplot_donut_percent(0.6, hsize = -1), "'hsize'")
  expect_error(ggplot_donut_percent(0.6, hsize = Inf), "'hsize'")
  expect_error(ggplot_donut_percent(0.6, size = ""), "'size'")
  expect_error(ggplot_donut_percent(0.6, family = ""), "'family'")
})

test_that("ggplot_donut_percent disables guide", {
  expect_null(ggp$guides$fill)
})

test_that("ggplot_donut_percent adds geom_text()", {
  expect_s3_class(ggp[["layers"]][[2]][["geom"]], "GeomText")
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["x"]], 0)
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["label"]], "60%")
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["size"]], 20)
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["family"]], "Lato")
})

test_that("ggplot_donut_percent parameters modify geom_text()", {
  ggp <- ggplot_donut_percent(0.599, accuracy = 0.1, size = 18, family = "sans")
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["label"]], "59.9%")
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["size"]], 18)
  expect_identical(ggp[["layers"]][[2]][["aes_params"]][["family"]], "sans")
})

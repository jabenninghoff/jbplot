# ggplot_donut

test_df <- data.frame(
  group = c("A", "B", "C"),
  n = c(10, 60, 30),
  stringsAsFactors = FALSE
)
gg <- ggplot_donut(test_df)

test_that("ggplot_donut uses geom_col()", {
  expect_s3_class(gg[["layers"]][[1]][["geom"]], "GeomCol")
})

test_that("ggplot_donut uses polar coordinates", {
  expect_s3_class(gg$coordinates, "CoordPolar")
  expect_identical(gg$coordinates$r, "x")
  expect_identical(gg$coordinates$theta, "y")
  expect_identical(gg$coordinates$start, 0)
  expect_identical(gg$coordinates$direction, 1)
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

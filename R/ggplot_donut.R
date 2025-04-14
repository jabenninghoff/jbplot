#' Create a ggplot Donut (Doughnut) Plot
#'
#' Create a donut plot from a data frame containing groups and corresponding values with
#'   [ggplot2::ggplot()].
#'
#' Implemented using [ggplot2::geom_col()], [ggplot2::coord_polar()], and [ggplot2::xlim()], adapted
#'   from guides in [The R Graph Gallery](https://r-graph-gallery.com/128-ring-or-donut-plot.html)
#'   and [R CHARTS](https://r-charts.com/part-whole/donut-chart-ggplot2/).
#'
#' Some default plot elements are disabled using [ggplot2::theme()] and [ggplot2::element_blank()].
#'
#' @importFrom rlang .data
#' @inheritParams ggplot2::ggplot
#' @param group Name of column to use for the plot colors.
#' @param value Name of column to use for the sector size.
#' @param hsize Size of the donut hole. Defaults to `2`, and must be a non-negative value. A value
#'   of `0` creates a pie chart.
#'
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#' library(ggplot2)
#'
#' mtcars |>
#'   count(cyl) |>
#'   mutate(cyl = as.factor(cyl)) |>
#'   ggplot_donut(group = "cyl")
#' @export
ggplot_donut <- function(data, group = "group", value = "n", hsize = 2) {
  checkmate::assert_data_frame(data, min.cols = 2)
  checkmate::assert_string(group, min.chars = 1)
  checkmate::assert_string(value, min.chars = 1)
  checkmate::assert_number(hsize, lower = 0, finite = TRUE)

  # For xlim of c(0, size), the smallest possible value of size is 0.95, which creates a pie chart
  # (determined through trial and error).
  #
  # Setting aes(x = hsize) and xlim(c(0, hsize + 0.5)) roughly follows R CHARTS and is arbitrary.
  #
  # Since we want a hole size of 0 to be a pie chart, we add 0.45 to hsize on the next line, which
  # gives size = 0.45 + 0 + 0.5 = 0.95.
  hsize <- 0.45 + hsize
  ggplot2::ggplot(data, ggplot2::aes(x = hsize, y = .data[[value]], fill = .data[[group]])) +
    ggplot2::geom_col() +
    ggplot2::coord_polar(theta = "y") +
    ggplot2::xlim(c(0, hsize + 0.5)) +
    ggplot2::theme(
      panel.background = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank()
    )
}

#' Create a Donut Percentage Plot
#'
#' Create a donut plot with the text value of the percentage in the center, using [ggplot_donut()].
#'
#' `ggplot_donut_percent()` creates a data frame and calls [ggplot_donut()] to create the base plot,
#'   removes the legend, and adds a [`geom_text()`][ggplot2::geom_text()] centered in the plot.
#'
#' The text label is formatted using [scales::label_percent()] with the specified `accuracy`.
#'
#' @inheritParams scales::label_percent
#' @param p Proportion to plot. Must be a value between `0` and `1`.
#' @param hsize Size of the donut hole. Defaults to `4`, and must be a non-negative value.
#' @param size Font size to use. Defaults to `20`.
#' @param family Font family to use. Defaults to `"Lato"`.
#'
#' @examples
#' library(showtext)
#'
#' font_add_google("Lato", "Lato")
#' showtext_auto()
#' # workaround for https://github.com/yixuan/showtext/issues/51
#' showtext_opts(dpi = 192)
#'
#' ggplot_donut_percent(0.6)
#' @export
ggplot_donut_percent <- function(p, accuracy = NULL, hsize = 4, size = 20, family = "Lato") {
  checkmate::assert_number(p, lower = 0, upper = 1)
  checkmate::assert_number(accuracy, null.ok = TRUE)
  checkmate::assert_number(hsize, lower = 0, finite = TRUE)
  checkmate::assert_number(size)
  checkmate::assert_string(family, min.chars = 1)

  donut_data <- data.frame(
    group = c(TRUE, FALSE),
    n = c(p, 1 - p)
  )

  ggplot_donut(donut_data, hsize = hsize) +
    ggplot2::guides(fill = "none") +
    ggplot2::geom_text(
      x = 0,
      label = scales::label_percent(accuracy = accuracy)(p),
      size = size,
      family = family
    )
}

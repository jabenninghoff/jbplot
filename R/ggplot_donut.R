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
#' @param group Name of column to use for the plot colors
#' @param value Name of column to use for the sector size
#' @param hsize Size of the donut hole. Defaults to 2, and must be a non-negative value. A value
#'   of 0 creates a pie chart.
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

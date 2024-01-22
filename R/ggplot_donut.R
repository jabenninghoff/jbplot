# adapted from https://r-graph-gallery.com/128-ring-or-donut-plot.html and
#   https://r-charts.com/part-whole/donut-chart-ggplot2/
#' @importFrom rlang .data
ggplot_donut <- function(df, group = "group", value = "n", hsize = 2) {
  checkmate::assert_data_frame(df, min.cols = 2)
  checkmate::assert_string(group, min.chars = 1)
  checkmate::assert_string(value, min.chars = 1)
  checkmate::assert_number(hsize, lower = 0, finite = TRUE)

  hsize <- 0.45 + hsize
  ggplot2::ggplot(df, ggplot2::aes(x = hsize, y = .data[[value]], fill = .data[[group]])) +
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

#' Quo Theme
#'
#' An opinionated [ggplot2][ggplot2::ggplot2-package] theme based on [ggplot2::theme_minimal()].
#'   [Viridis Quo](https://www.youtube.com/watch?v=HhZaHf8RP6g)!
#'
#' Quo requires [Lato](https://www.latofonts.com), which can be installed on macOS using
#'   `brew install font-lato`.
#'
#' Quo is designed to be paired with the viridis color scale, added by calling one of the continuous
#'   (c) or discrete (d) viridis color scales:
#'
#' - [ggplot2::scale_color_viridis_c()]
#' - [ggplot2::scale_fill_viridis_c()]
#' - [ggplot2::scale_color_viridis_d()]
#' - [ggplot2::scale_fill_viridis_d()]
#'
#' @param major,major.x,major.y,minor,minor.x,minor.y,x,y set to FALSE to disable grid lines by
#'   setting the appropriate panel.grid element to [ggplot2::element_blank()].
#'
#' @examples
#' # adapted from ggplot2::theme_minimal()
#' library(ggplot2)
#' library(showtext)
#'
#' font_add_google("Lato", "Lato")
#' showtext_auto()
#' # workaround for https://github.com/yixuan/showtext/issues/51
#' showtext_opts(dpi = 192)
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
#'   geom_point() +
#'   labs(
#'     title = "Fuel economy declines as weight increases",
#'     subtitle = "(1973-74)",
#'     caption = "Data from the 1974 Motor Trend US magazine.",
#'     tag = "Figure 1",
#'     x = "Weight (1000 lbs)",
#'     y = "Fuel economy (mpg)",
#'     color = "Gears"
#'   ) +
#'   theme_quo() +
#'   scale_color_viridis_d()
#' @export
# nolint start: object_name_linter.
theme_quo <- function(major = TRUE,
                      major.x = TRUE,
                      major.y = TRUE,
                      minor = TRUE,
                      minor.x = TRUE,
                      minor.y = TRUE,
                      x = TRUE,
                      y = TRUE) {
  # nolint end
  checkmate::assert_flag(major)
  checkmate::assert_flag(major.x)
  checkmate::assert_flag(major.y)
  checkmate::assert_flag(minor)
  checkmate::assert_flag(minor.x)
  checkmate::assert_flag(minor.y)
  checkmate::assert_flag(x)
  checkmate::assert_flag(y)

  gg <- ggplot2::theme_minimal(base_family = "Lato") +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold"),
      plot.subtitle = ggplot2::element_text(face = "bold"),
      plot.caption = ggplot2::element_text(hjust = 0)
    )

  if (!major) gg <- gg + ggplot2::theme(panel.grid.major = ggplot2::element_blank())
  if (!major.x || !x) gg <- gg + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
  if (!major.y || !y) gg <- gg + ggplot2::theme(panel.grid.major.y = ggplot2::element_blank())
  if (!minor) gg <- gg + ggplot2::theme(panel.grid.minor = ggplot2::element_blank())
  if (!minor.x || !x) gg <- gg + ggplot2::theme(panel.grid.minor.x = ggplot2::element_blank())
  if (!minor.y || !y) gg <- gg + ggplot2::theme(panel.grid.minor.y = ggplot2::element_blank())

  gg
}

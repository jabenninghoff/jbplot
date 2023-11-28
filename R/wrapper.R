# convenience functions aren't tested and are excluded from code coverage
# nolint start: object_name_linter. ggplot2 functions include dotted.case parameters.

#' Robust linear smoothing
#'
#' A wrapper for [ggplot2::geom_smooth()] that sets `method` to [MASS::rlm()] and `formula` to
#'   `y ~ x`.
#'
#' @inheritParams ggplot2::geom_smooth
#' @importFrom MASS rlm
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   geom_rlm()
#' @export
geom_rlm <- function(
    mapping = NULL,
    data = NULL,
    position = "identity",
    ...,
    method = MASS::rlm,
    formula = y ~ x,
    se = TRUE,
    na.rm = FALSE,
    orientation = NA,
    show.legend = NA,
    inherit.aes = TRUE) {
  ggplot2::geom_smooth(
    mapping = mapping,
    data = data,
    position = position,
    ...,
    method = method,
    formula = formula,
    se = se,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' Linear smoothing
#'
#' A wrapper for [ggplot2::geom_smooth()] that sets `method` to [lm()] and `formula` to `y ~ x`.
#'
#' @inheritParams ggplot2::geom_smooth
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   geom_lm()
#' @export
geom_lm <- function(
    mapping = NULL,
    data = NULL,
    position = "identity",
    ...,
    method = "lm",
    formula = y ~ x,
    se = TRUE,
    na.rm = FALSE,
    orientation = NA,
    show.legend = NA,
    inherit.aes = TRUE) {
  ggplot2::geom_smooth(
    mapping = mapping,
    data = data,
    position = position,
    ...,
    method = method,
    formula = formula,
    se = se,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' Black and white histogram
#'
#' A wrapper for [ggplot2::geom_histogram()] that sets `color` to `black` and `fill` to `white`.
#'
#' @inheritParams ggplot2::geom_histogram
#' @param color Histogram color. Defaults to `"black"`.
#' @param fill Histogram fill. Defaults to `"white"`.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(hwy)) +
#'   geom_hist_bw(binwidth = 1)
#' @export
geom_hist_bw <- function(
    mapping = NULL,
    data = NULL,
    position = "stack",
    color = "black",
    fill = "white",
    ...,
    binwidth = NULL,
    bins = NULL,
    na.rm = FALSE,
    orientation = NA,
    show.legend = NA,
    inherit.aes = TRUE) {
  ggplot2::geom_histogram(
    mapping = mapping,
    data = data,
    position = position,
    color = color,
    fill = fill,
    ...,
    binwidth = binwidth,
    bins = bins,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' Annotate using quo theme font
#'
#' A wrapper for [ggplot2::annotate()] that sets the font to Lato.
#'
#' @inheritParams ggplot2::annotate
#' @param family Font family to use. Defaults to `"Lato"`.
#'
#' @examples
#' library(ggplot2)
#' library(showtext)
#'
#' font_add_google("Lato", "Lato")
#' showtext_auto()
#' # workaround for https://github.com/yixuan/showtext/issues/51
#' showtext_opts(dpi = 192)
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   geom_rlm(method = "loess") +
#'   annotate_quo("label", x = 5.5, y = 30, label = "hwy increases for displ greater than 5.5") +
#'   theme_quo()
#' @export
annotate_quo <- function(
    geom,
    x = NULL,
    y = NULL,
    xmin = NULL,
    xmax = NULL,
    ymin = NULL,
    ymax = NULL,
    xend = NULL,
    yend = NULL,
    family = "Lato",
    ...,
    na.rm = FALSE) {
  ggplot2::annotate(
    geom = geom,
    x = x,
    y = y,
    xmin = xmin,
    xmax = xmax,
    ymin = ymin,
    ymax = ymax,
    xend = xend,
    yend = yend,
    family = family,
    ...,
    na.rm = na.rm
  )
}

# nolint end

# inspired by:
# - https://github.com/karthik/wesanderson/blob/master/R/colors.R
# - https://github.com/r-lib/scales/blob/main/R/pal-brewer.R
# - https://github.com/r-lib/scales/blob/main/R/pal-viridis.R
# - https://github.com/tidyverse/ggplot2/blob/main/R/scale-viridis.R

#' Security Differently Palettes
#'
#' Security Differently branded color palettes. Use [pal_differently()] to construct palettes of
#'   desired length.
#'
#' Primary color palette (`primary`):
#'
#' - `blue`: logo, headings, links
#' - `orange`, `lightblue`, `lightorange`: graphics, accents
#' - `darkgray`: body text
#' - `lightgray`: alternate background, accents
#'
#' Status color palette (`status`): `success`, `warning`, `error`
#'
#' Chart and data visualization palette (`plot`): accessible colors for plotting on a white
#'   background.
#'
#' @format A list of 3 named vectors of colors.
#'
#' @export
differently_palettes <- list(
  primary = c(
    blue = "#0D629C", orange = "#FC7A00", darkgray = "#575757", lightblue = "#3498DB",
    lightorange = "#FFBC50", lightgray = "#ECF0F1"
  ),
  status = c(success = "#1E8542", warning = "#EB7100", error = "#C83B31"),
  plot = c(
    blue = "#0D629C", orange = "#EB7100", green = "#1E8542", fuschia = "#D123B7",
    purple = "#8942C4", red = "#C83B31"
  )
)

#' Security Differently palette
#'
#' Construct Security Differently branded color palettes.
#'
#' @param name Name of palette, one of: `primary`, `status`, or `plot` (the default).
#' @param direction Sets the order of colors in the scale. If 1, (the default) colors are as output
#'   by [differently_palettes]. If -1, the order of colors is reversed.
#'
#' @return A vector of hex code colors.
#'
#' @examples
#' library(scales)
#' show_col(pal_differently()(6))
#' show_col(pal_differently("primary")(6))
#' show_col(pal_differently("primary", direction = -1)(6))
#' show_col(pal_differently("status")(3))
#'
#' @export
pal_differently <- function(name = "plot", direction = 1) {
  checkmate::assert_choice(name, names(differently_palettes))
  checkmate::assert_choice(direction, c(-1, 1))
  function(n) {
    pal <- unname(differently_palettes[[name]])
    if (n == 0) {
      stop("Must request at least one color from a sd palette.")
    }
    if (n > length(pal)) {
      stop("Number of requested colors greater than available colors in palette.")
    }
    pal <- pal[1:n]

    if (direction == -1) {
      pal <- rev(pal)
    }

    pal
  }
}

#' @export
#' @rdname pal_differently
differently_pal <- pal_differently

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
#' @param palette Palette to use, one of: `primary`, `status`, or `plot` (the default).
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
pal_differently <- function(palette = "plot", direction = 1) {
  checkmate::assert_choice(palette, names(differently_palettes))
  checkmate::assert_choice(direction, c(-1, 1))
  function(n) {
    pal <- unname(differently_palettes[[palette]])
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

#' Security Differently color scales
#'
#' Security Differently branded color scales.
#'
#' @inheritParams pal_differently
#' @inheritParams scales::pal_gradient_n
#' @inheritParams ggplot2::continuous_scale
#' @param ... Other arguments passed on to [ggplot2::discrete_scale()],
#'   [ggplot2::continuous_scale()], or [ggplot2::binned_scale()] to control name, limits, breaks,
#'   labels and so forth.
#' @param aesthetics Character string or vector of character strings listing the
#'   name(s) of the aesthetic(s) that this scale works with. This can be useful, for
#'   example, to apply color settings to the `color` and `fill` aesthetics at the
#'   same time, via `aesthetics = c("color", "fill")`.
#' @rdname scale_differently
#' @examples
#' library(ggplot2)
#' # Use differently_d with discrete data
#' txsamp <- subset(txhousing, city %in%
#'   c("Houston", "Fort Worth", "San Antonio", "Dallas", "Austin"))
#' (d <- ggplot(data = txsamp, aes(x = sales, y = median)) +
#'   geom_point(aes(color = city)))
#' d + scale_color_differently_d()
#'
#' # Change scale label
#' d + scale_color_differently_d("City\nCenter")
#'
#' # Select palette to use, see ?jbplot::pal_differently for more details
#' d + scale_color_differently_d(palette = "primary")
#'
#' # scale_fill_differently_d works just the same as
#' # scale_color_differently_d but for fill colors
#' p <- ggplot(txsamp, aes(x = median, fill = city)) +
#'   geom_histogram(position = "dodge", binwidth = 15000)
#' p + scale_fill_differently_d()
#' # the order of color can be reversed
#' p + scale_fill_differently_d(direction = -1)
#'
#' # Use differently_c with continuous data
#' (v <- ggplot(faithfuld) +
#'   geom_tile(aes(waiting, eruptions, fill = density)))
#' v + scale_fill_differently_c()
#' v + scale_fill_differently_c(palette = "primary")
#'
#' # Use differently_b to bin continuous data before mapping
#' v + scale_fill_differently_b()
#'
#' @export
scale_color_differently_d <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                      direction = 1, aesthetics = "color") {
  ggplot2::discrete_scale(
    aesthetics,
    name = name,
    palette = pal_differently(palette, direction),
    ...
  )
}

#' @export
#' @rdname scale_differently
scale_fill_differently_d <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                     direction = 1, aesthetics = "fill") {
  ggplot2::discrete_scale(
    aesthetics,
    name = name,
    palette = pal_differently(palette, direction),
    ...
  )
}

#' @export
#' @rdname scale_differently
scale_color_differently_c <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                      direction = 1, values = NULL,
                                      na.value = "grey50", # nolint: object_name_linter.
                                      guide = "colorbar", aesthetics = "color") {
  ggplot2::continuous_scale(
    aesthetics,
    name = name,
    palette = scales::pal_gradient_n(pal_differently(palette, direction)(6), values),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_differently
scale_fill_differently_c <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                     direction = 1, values = NULL,
                                     na.value = "grey50", # nolint: object_name_linter.
                                     guide = "colorbar", aesthetics = "fill") {
  ggplot2::continuous_scale(
    aesthetics,
    name = name,
    palette = scales::pal_gradient_n(pal_differently(palette, direction)(6), values),
    na.value = na.value,
    guide = guide,
    ...
  )
}

# from https://github.com/tidyverse/ggplot2/blob/main/R/utilities.R
pal_binned <- function(palette) {
  function(x) {
    palette(length(x))
  }
}

#' @export
#' @rdname scale_differently
scale_color_differently_b <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                      direction = 1, values = NULL,
                                      na.value = "grey50", # nolint: object_name_linter.
                                      guide = "colorsteps", aesthetics = "color") {
  pal <- pal_binned(
    pal_differently(palette, direction)
  )

  ggplot2::binned_scale(
    aesthetics,
    name = name,
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_differently
scale_fill_differently_b <- function(name = ggplot2::waiver(), ..., palette = "plot",
                                     direction = 1, values = NULL,
                                     na.value = "grey50", # nolint: object_name_linter.
                                     guide = "colorsteps", aesthetics = "fill") {
  pal <- pal_binned(
    pal_differently(palette, direction)
  )

  ggplot2::binned_scale(
    aesthetics,
    name = name,
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_differently
#' @usage NULL
scale_colour_differently_d <- scale_color_differently_d

#' @export
#' @rdname scale_differently
#' @usage NULL
scale_colour_differently_c <- scale_color_differently_c

#' @export
#' @rdname scale_differently
#' @usage NULL
scale_colour_differently_b <- scale_color_differently_b

#' Security Differently Palettes
#'
#' Security Differently branded color palettes.
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
sd_palettes <- list(
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

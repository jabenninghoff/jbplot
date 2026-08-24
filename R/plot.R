#' Example Survey Questions
#'
#' Example questions used for [plot_question()].
#'
#' @format A named vector of question titles of length 3:
#' - Q1 = "I enjoy answering survey questions"
#' - Q2 = "I use the Likert scale on my own surveys"
#' - Q3 = "I would complete future surveys by this author"
#' @keywords internal
"questions"

#' Example Survey Answers
#'
#' Example answers used for [plot_question()].
#'
#' @format A data frame with 9 rows and 3 variables (Q1, Q2, Q3). Q1 and Q2 has answers from a
#'   five-point Likert scale, Q3 has "Yes" or "No" answers.
#' @keywords internal
"answers"

#' Plot Survey Question
#'
#' Plot answers to a survey question using a horizontal bar chart using ggplot2.
#'
#' @param question name of column containing the question answers as a factor with specified levels.
#' @param df data frame containing survey answers.
#' @param titles named character vector containing titles for answers.
#' @param nudge amount of distance to nudge text label (percentage), passed on to
#'   [ggplot2::geom_text()] as `nudge_x`.
#' @param wrap character width to wrap response labels, passed on to [stringr::str_wrap()] as
#'   `width`.
#'
#' @importFrom rlang .data
#'
#' @examples
#' library(purrr)
#'
#' map(names(questions), plot_question, answers, questions, nudge = 0.25)
#' @export
plot_question <- function(question, df, titles, nudge = 1, wrap = 20) {
  checkmate::assert_string(question, min.chars = 1)
  checkmate::assert_data_frame(df, min.rows = 1, min.cols = 1)
  checkmate::assert_character(titles, names = "unique")
  checkmate::assert_number(nudge)
  checkmate::assert_number(wrap)

  df |>
    dplyr::group_by(.data[[question]]) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::mutate(label = scales::label_percent()(.data$count / sum(.data$count))) |>
    dplyr::rename(q = {{ question }}) |>
    ggplot2::ggplot(ggplot2::aes(.data$count, q)) +
    ggplot2::geom_col() +
    ggplot2::geom_text(ggplot2::aes(label = .data$label), nudge_x = nudge) +
    ggplot2::scale_y_discrete(
      drop = FALSE, labels = function(x) stringr::str_wrap(x, width = wrap)
    ) +
    ggplot2::labs(x = NULL, y = NULL) +
    ggplot2::labs(title = paste0(question, ". ", titles[[question]])) +
    theme_quo(minor = FALSE)
}

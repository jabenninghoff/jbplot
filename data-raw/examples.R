# example survey questions and answers for plot_question
# plot using: purrr::map(names(questions), plot_question, answers, questions, nudge = 0.25)

questions <- c(
  Q1 = "I enjoy answering survey questions",
  Q2 = "I use the Likert scale on my own surveys",
  Q3 = "I would complete future surveys by this author"
)

answers <- data.frame(
  Q1 = structure(
    c(4L, 2L, 5L, 4L, 4L, 4L, 5L, 2L, 5L),
    levels = c(
      "strongly disagree", "disagree", "neither agree nor disagree",
      "agree", "strongly agree"
    ), class = "factor"
  ),
  Q2 = structure(
    c(5L, 5L, 5L, 4L, 5L, 4L, 5L, 4L, 5L),
    levels = c(
      "strongly disagree", "disagree", "neither agree nor disagree",
      "agree", "strongly agree"
    ), class = "factor"
  ),
  Q3 = structure(c(2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L), levels = c("No", "Yes"), class = "factor")
)

usethis::use_data(questions, answers, overwrite = TRUE)

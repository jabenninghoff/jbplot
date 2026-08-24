# plot_question

gg <- plot_question(names(questions[1]), answers, questions)

test_that("plot_question validates parameters", {
  expect_no_error(plot_question(names(questions[1]), answers, questions))
  expect_error(plot_question("", answers, questions), "'question'")
  expect_error(plot_question(names(questions[1]), data.frame(), questions), "'df'")
  expect_error(plot_question(names(questions[1]), answers, c("title 1", "title 2")), "'titles'")
  expect_error(plot_question(names(questions[1]), answers, questions, nudge = "a"), "'nudge'")
  expect_error(plot_question(names(questions[1]), answers, questions, wrap = "b"), "'wrap'")
})

test_that("plot_question uses geom_col()", {
  expect_s3_class(gg[["layers"]][[1]][["geom"]], "GeomCol")
})

test_that("plot_question uses geom_text()", {
  expect_s3_class(gg[["layers"]][[2]][["geom"]], "GeomText")
})

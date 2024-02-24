source("renv/activate.R")

options(
  warnPartialMatchArgs = TRUE,
  warnPartialMatchAttr = TRUE,
  # disable due to ggplot2 warning:
  #   Warning in vp$just: partial match of 'just' to 'justification'
  # see: https://github.com/tidyverse/ggplot2/issues/5654
  # TODO: remove when https://github.com/r-lib/gtable/pull/94 is resolved
  # warnPartialMatchDollar = TRUE,
  styler.cache_root = "styler-perm"
)

# attach devtools and set options per https://r-pkgs.org/setup.html
if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(rdev))
  if (!suppressMessages(suppressWarnings(require(pkgload::pkg_name("."), character.only = TRUE)))) {
    devtools::load_all(".")
  }
  # install pre-commit git hook when cloning repository
  if (!fs::file_exists(".git/hooks/pre-commit")) {
    cat("git hook pre-commit missing, installing...\n")
    usethis::use_git_hook(
      "pre-commit", readLines(fs::path_package("rdev", "templates", "pre-commit"))
    )
  }
  # warn if pandoc not found in PATH
  if (Sys.which("pandoc") == "") warning("pandoc not found, run `open /Applications/RStudio.app`")
}

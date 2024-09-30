#' Deliver praise
#'
#' @description This function is super useful when you're feeling sad
#' and is useful for everyone
#'
#' @param name text string; This is the name of the person I want to praise
#' @param punctuation text string; This is our emphasis as a text input.
#' @return Text string with praise
#' @export
#'
#' @examples
#' praise(name = "Steph", punctuation = "!")
praise <- function(name, punctuation = "!"){
  glue::glue("You're the best, {name}{punctuation}")
}

usethis::use_mit_license("Minkyung-Jane")

?praise


my_func <- function(x, k) { plot(x, x^k)
  x^k
}

my_func(-100:100, 3)

my_func(0:100, 3)
my_func(-100:100, 2)

library(testthat)

test_that("test praise works", {
  expect_identical(praise("Thomas"),
                   glue::glue("You're the best, Thomas!"))
  expect_identical(praise("Thomas", ";"),
                   glue::glue("You're the best, Thomas;"))
  expect_error(praise())
})

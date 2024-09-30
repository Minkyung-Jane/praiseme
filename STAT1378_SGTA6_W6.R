
install.packages(c("devtools", "roxygen2", "usethis","testthat"))

xcode-select --install

library(testthat) # loading the package

expect_identical(1, 1L)

m <- function(x,y){
  return(x*y)
}


expect_error(m("2","3"), "non-numeric argument to binary operator")
expect_equal(m(2,3), 6)
expect_equal(m(2,c(2,3)), c(4,6))
expect_error(m(2,"3"), "non-numeric argument to binary operator")
is_greater_10 <- function(x){
  if (x > 10) "Not greater than 10"
}
expect_null(is_greater_10(9))
expect_identical(is_greater_10(11), "Not greater than 10")


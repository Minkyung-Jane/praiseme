library(stringr)
strings <- list("Mary", "John", "Jill")
map_dbl(strings, str_sub, start = 1, end = 1)

strings

## apply: summing rows
x <- matrix(1:100, nrow = 25, ncol = 4)
rowsum <- apply(x, MARGIN = 1, sum)
rowsum
apply(x, 1, sum)

## apply: summing columns
colsum <- apply(x, MARGIN = 2, sum)
colsum
apply(x, 2, sum)
sumsq <- function(x) sum(x^2)

rowsumsquare <- apply(x, 1, sumsq)

rowsumsquare

## apply: summing squared rows with in-line anonymous function rowsumsquare <- apply(x, 1, function(irow) sum(irowˆ2)) rowsumsquare
x <- list(x1 = 1:5, x2 = 11:15, x3 = c("a", "b", "c")) 
#
length_and_class_2 <- function(x) {
  paste(
    "This slot is of length", length(x), "and class", paste(class(x), collapse = ", ")
  ) }

ll <- sapply(x, length_and_class_2)

ll

class(ll)

#
my_rnd_generator_1 <- function(x) rnorm(6, mean = length(x), sd = 1) 

ll1 <- sapply(x, my_rnd_generator_1)

ll1

class(ll1)
#
my_rnd_generator_2 <- function(x) rnorm(length(x), mean = 0, sd = 1) 

ll2 <- sapply(x, my_rnd_generator_2)

ll2

class(ll2)




#### exercise

nrom()

## Exercise 2 
# Minkyung Park (46858822)

# 0. Run set.seet(2048)
set.seed(2048)

# 1. Create a list X with N = 100 slots, and in each slot create a list of two elements
X <- lapply(1:100,
            function(x) {
              list(
                name = paste0("n",x),
                vect = rnorm(5, 20, 10)
              )})

# 2. Show the structure of X (str(X))
str(X)

# 3. Compute the sum of the values of vect in each slot and show the output. The output must be a vector of 100 values
sum_X <- sapply(X, function(x) round(sum(x$vect),2) )
sum_X

# 4. Create a matrix M (not a data frame) of size 100× 5 using the 100 vect objects in the slots of X.
vector <- sapply(X, function(x) round(x$vect,2))
M <- matrix(vector,100,5)

# 5. Use a for loop to compute the sums by columns of M and show the result.
sum_M_by_columns <- 0
for (i in 1:ncol(M)) {
  sum_M_by_columns[i] <- sum(M[,i])
}
sum_M_by_columns

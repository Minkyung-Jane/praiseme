1 + 1
2*24
2^4
log(10)
log10(10)
exp(3)
x <- 2
x
x+3
x <- x+3
x
1:10
a <- 1:10
a
a[3]
a <- a+5
a
a*a
a%%a
a%o%a

a %/% 3
a %% 3

matrix(data = 1:50, nrow = 5, ncol = 10)

round(3.14159)
round(3.14159, 2)
round(x=3.14159, digits = 2)
x <- 1:10
mean (x)
round(mean(x))
round(mean(x), digits = 0)
round(mean(x), digits = 2)

my_func <- function(x) {
  x <- x+2
  mean(x)
}

my_func(1:10)
my_func(1:5)


my_func(c(4,7))

(6+9)/2

sum2 <- function(x,y) {
  return(x+y)
}

sum2(3, 7)
sum2(4, 8)
sum2(-1, 1)

tabyl()
install.packages("janitor")
library("janitor")
x <- c(1,2,2,2,3,3)
tabyl(x)

rnorm(100)

plot(x=rnorm(100),y=rnorm(100), mean=1, sd=7)
hist(x=rnorm(1000000))

boxplot(airquality$Ozone)

#Exercise 2
x <- 1:10
k <- 2

plot(x = x, y=x^k)

output <- function(x) {
  return(x^k)
  
}
output(x)

twoinputs <- function(x,k) {
  plot(x, x^k)
  return(x^k)
  
}

twoinputs(1:10,3)


#Exercise 3

threeinputs <- function(x,k,cols=c("red", "blue")) {
  plot(x, x^k, col= cols[1], main="Pretty graph", type="l")
  lines(x,x^(k+1), col=cols[2])
  legend("topleft", 
        legend=c(paste("x^",k,sep=""), 
                 paste("x^", k+1, sep="")),
        col = cols,
        lty = 1)
}

threeinputs(1:10,3, cols=c("pink", "lightblue"))

fourgen <- function(N,rx1,rx2, beta, sigma) {
  X <- cbind(rep(1,N), seq(rx1[1], rx1[2], len=N),runif(N, min=rx2[1], max=rx2[2]))
  Y <- t(beta %*% t(X)) + rnorm(N, 0, sigma)
  par(mfrow = c(1,2))
  plot(X[,2],Y, xlab = "x1")
  plot(X[,3], Y, xlab = "x2")
  
}

fourgen(100, c(18, 110), c(140, 250), beta = c(1,2,3), sigma = 1)


# Solutions

## Exercise2

my_fun2 <- function(x, k) {
  plot (x, x^k)
  x^k
}

my_fun2(-100:100,3)

## Exercise3
my_fun3 <- function(x, k, colors = c("red", "blue")) {
  f1 <- x^k
  f2 <- x^(k+1)
  ylim <- range(c(f1, f2))
  plot(x, x^k, t= "l", main = "Power functions", col = colors[1], ylim = ylim, ylab = "")
  lines(x, x^(k+1), col = colors[2])
  legend("bottomright", legend = c(paste("x^", k, sep=""), paste("x^", k+1, sep ="")), col = colors, lty=1)
}
my_fun3((-100:100) / 50, 2)
my_fun3((-100:100)/ 50, 3, colors = c("red", "green"))



## Exercise4
my_gen_func <- function(N, rx1, rx2, beta, sigma) {
  X <- cbind(rep(1,N), seq(rx1[1], rx1[2], len = N), runif(N, min = rx2[1], max = rx2[2]))
  Y <- t(beta %*% t(X)) + rnorm(N, 0, sigma)
  par(mfrow = c(1,2))
  plot(X[,2], Y, xlab = "x1")
  plot(X[,3], Y, xlab = "x2", col = "red")
  par(mfrow = c(1,1))
}

my_gen_func(100, c(0,10), c(2, 12), beta = c(1,5,7), sigma = 1)


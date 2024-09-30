## if and else
# part 1
x <- 2
x==1
x>1
log(x)
if (x==1) log(x)
if (x>1) log(x)

if(x==2) x^2

# part 2

foo <- function(x) {
  if(x>2){
    "a"
  } else if(x>2){
    "b"
  } else if(x==1){
    "c"
  } else {
    "d"
  }
}
foo(1)

clean <- function(x) { 
  if (x == -99) NA
  if (x == ".") NA
  if (x == "NaN") NA
  x
  }

clean(-99)

clean <- function(x) { 
  if (x == -99 | x =="." | x == " "| x == "NaN") {NA
    }else {x}
}

clean <- function(x) {
  if (x %n% c(-99, ".", " ","NaN")) {
    NA
  } else {x}
}


clean2 <- function(x) {
  if(x == -99){
    "NA"
  } else if(x == "."){
    "NA"
  } else if(x ==  " "){
    "NA"
  } else if(x == "NaN"){
    "NA"
  } else {
    return(x)
  }
}

clean2(-99)
clean2(".")
clean2(" ")
clean2("NaN")

## return () and stop()
impatient_square <- function(x) {
  return(x)
  x^2
}
impatient_square(2)

clean <- function(x) {
  if (x %n% c(-99, ".", " ","NaN")) {return(NA)
  }
  x
}

clean(-99)
clean(".")
clean("NaN")
clean(1)


immovable_square <- function(x) {
  stop("I refuse to proceed.")
  x^2
}
immovable_square(2)

# while loop

n <-1
while (n <= 5) {
  print(n)
  n <- n+1
}
is_prime <- function(x){
  n <- 2
  repeat {
    print(n)
    if (n==x){
      return(TRUE)
    }
    if(x %% n == 0){
      return(FALSE)
    }
    n <- n+1
  }
}
is_prime(7)

##ANSWER
is_prime <- function(x){
  n <- 2
  while (n<x){
    print(n)
    if(x %% n == 0){
      return(FALSE)
    }
    n <- n+1
  }
  TRUE
}

is_prime(7)

## 4. Using for loops
for (n in c(1,2,3,4,5)) {
  print(n)
}
for (i in c(1,10,200)) {
  print(i)
}
for (person in c("Betty", "Veronica", "Archie")) {
  greeting <- paste("Hello", person)
  print(greeting)
}
seq(1,10)
seq_along(c(1,10,200))


is_prime <- function(x){
  for (n in seq(2, x-1)) {
    print(n)
    if(x %% n == 0){
      return(FALSE)
    }
  }
  TRUE
}
is_prime(7)
is_prime(4)

x <- c(1,2,3,4,5)
y <- double(length =5)
for (i in seq_along(x)){
  y[i] <- sqrt(i) 
}
y
sqrt(x)
c(1,2,3,4,5)+c(1,2,3,4,5)
round_square <- function(vec) {
  sqs <- sqrt(vec)
  round(sqs, digits = 2)
}
round_square(x)

# ANSWER
x <- c(1,2,3,4,5)+c(1,2,3,4,5)
round_square <- function(vec) {
  sqs <- sqrt(vec)
  round(sqs, digits = 2)
}
round_square(x)
round(sqrt(x), digit = 2)

## d
is_prime <- function(x, n = 2) { if (n == x) {
  return(TRUE)
} else if (x %% n == 0) {
  return(FALSE) } 
  else {
    is_prime(x, n = n + 1) 
    }
} 
is_prime(7)

## 5. vectorised if and else if
# a
x <- -99
x == -99 | x== "."
x <- c(-99, 0, 1)
x == -99
x == "."
x == -99 |x == "."

x <- c(-99, 0, 1)

# if (x == -99 | x == ".") NA
if (x == c(-99, 0, 1)| x == c("a","b","c")) NA
x <- -99
if (x == -99 || stop("if you eval_sol this.")) "I didn't eval_sol stop()."

# b and its Answer
clean <- function(x) {
  ifelse (x == -99, NA, x)
}

clean(c(-99, 567856343, 234234234, -99))

# c
foo <- function(x) { if (x > 2) {
  "a"
  } else if (x < 2) { "b"
  } else if (x == 1) { "c"
  } else { "d"
  } 
}

foo(1)


#d
clean <- function(x) {
  if (x == -99) {
  NA
  } else if (x == ".") { 
    NA
  } else if (x == "") { 
    NA
  } else if (x == "NaN") { 
    NA
  } else { 
    x
  } 
}

## 6
#a
x <- c(rep(100, 9), 90)

#b
(sum(x)- min(x))/9

#c
chris <- c(94, 97, 88, 93, 87, 84, 87, 85, 87, 88)
maurizio <- c(94, 83, 82, 85, 76, 77, 83, 75, 73, 97)
tom <- c(77, 73, 77, 69, 59, 69, 72, 69, 71, 77)
sam <- x
grade <- function(x) {
  (sum(x)- min(x))/9
}
grade(maurizio)

## 7


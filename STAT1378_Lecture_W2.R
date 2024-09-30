x <- runif(1)
if (x>0.5) {
  "Heads"
} else {
  "Tails!"
}

ifelse(x>0.5, "Head!", "Tails")

x <- runif(10)
ifelse(x>0.5, "Head!", "Tails")

rbind(1:6>2, 1:6==3)

1:6>2 && 1:6==3

x <- ceiling(runif(5, 0, 6))
x
x == 2 | x == 4 | x == 6

x%in% c(2, 4, 6)

x <- runif(1)
y <- runif(1)

if(x>0.5 && y >0.5) {
  "Both Heads!"
} else if(x <= 0.5 && y <= 0.5) {
  "Both Tails"
} else {
  "Onse Head, One Tail!"
}

if(x>0.5 || y >0.5) {
  "Both Heads!"
} else if(x <= 0.5 || y <= 0.5) {
  "Both Tails"
} else {
  "Onse Head, One Tail!"
}

x <- runif(1)
ifelse(x < 1/3, "Rock!",
        ifelse (x < 2/3, "Paper!", "Scissors!"))

dplyr :: case_when(
  x < 1/3 ~ "Rock!",
  x < 2/3 ~ "Paper!",
  TRUE ~ "Scissors!"
)

## for loop

x <- 0
for (i in 1:5){
  x <- x+1
}
x

count <- sum <- 0
for(i in seq(2,20,2)){
  sum <- sum + i
  count <- count + 1
}
average <- sum/count

paste0("The sum ", sum,". The average is ", average, "." )

install.packages("glue")
glue::glue ("The sum is {sum}. The average is {average}.")

A <- matrix(runif(16), ncol=4)
total <- 0
for (i in 1:4){
  for (j in 1:4){
    total <- total+ A[i, j]
  }
}
sum(A) == total

for (person in c("Betty", "Vecky", "Archie")) {
  greeting <- paste("Hello", person)
  print(greeting)
}

for (person in c("Betty", "Vecky", "Archie")) {
  greeting <- glue::glue ("Hello, {person}")
  print(greeting)
}

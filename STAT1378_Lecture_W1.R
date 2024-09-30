install.packages("tidyverse")
packages <- installed.packages() [, "Package"]
save(packages, file = "Rpackages")

load("Rpackages")
for (p in setdiff(
  packages,
  installed.packages()[,"Package"]
)) {
  install.packages(p)
}


my_function_name <- function(argument = "I am a default value") {
  output <- argument
  return(output)
}
my_function_name()
  

ponies <- c(
  "Twilight Sparkle",
  "Rainbow Dash",
  "Pinkie Pie",
  "Applejack",
  "Rarity",
  "Fluttershy"
)
rpony <- function(n, data = ponies) {
  sample(data, n, replace = TRUE)
}

rpony(10)

show_poines <- function(x) {
  sort (x)
}

show_poines(ponies)
 
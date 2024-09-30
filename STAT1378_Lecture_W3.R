library(tidyverse)
email50 <- read_csv("email50.csv")
email50

head(email50$num_char)

attach(email50)
head(num_char)

detach(email50)

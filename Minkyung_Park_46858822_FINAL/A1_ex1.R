## Exercise 1
# Minkyung Park (46858822)

library(tidyverse)
library(dplyr)

# 1. Read the file A1_Ex1.csv in a data frame or tibble X
ex1 <- read_csv("A1_Ex1.csv") 
ex1 

# 2. Show the structure of X (str(X))
str(ex1) 

# 3. Compute and show the total sum of the expenditures 
sum(ex1 %>% select(expenditure))

# 4. Compute and show the sum of the expenditures in Jul
ex1 %>% filter(ex1$month %in% "Jul") %>% summarize(sum(ex1$expenditure))

# 5. Compute and show the sum of the expenditures in May when the weather is rainy
ex1 %>% filter(ex1$month %in% "May" & ex1$weather %in% "rainy") %>% summarise(sum(expenditure))

# 6. Find and show the month with the highest expenditure
ex1 %>% group_by(month) %>% summarize(highest = max(expenditure)) %>% slice_max(highest)


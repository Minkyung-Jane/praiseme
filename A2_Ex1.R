## Exercise 1
## Minkyung Park (46858822)

setwd("/Users/minkyungpark/Desktop/Desktop_MacBook Air/Bachelor course/2024-Session 2/STAT1378_Coding and Communication in Statistics/STAT1378_R")
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

library(readr)
library(dplyr)
library(ggplot2)

nintendo <- read_csv(file = "records.csv")
head(nintendo)

# plot1
nintendo %>% filter(type == "Three Lap", shortcut == "No") %>% group_by(track) %>%
  ggplot(aes(date, time)) +
  geom_line() + 
  facet_wrap(~ track, ncol = 4, scales = 'free') + 
  coord_cartesian(xlim = c(min(nintendo$date), max(nintendo$date))) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(title = "How the three lap, with no shortcut world record develop over time",
       x = "date",
       y = "time")


# plot 2
nintendo <- nintendo %>%
  mutate(shortcut= ifelse(shortcut == "No", "with no shortcut",
                  ifelse(shortcut == "Yes", "with shortcut", NA)))

nintendo %>% filter(track =="Rainbow Road") %>% 
  mutate(Race = paste(type, shortcut)) %>%
  ggplot(aes(x = date, y = time, color = Race)) +
  geom_line() +
  geom_point() +
  labs(title = "How the WR for Rainbow Road develop over time",
       subtitle = "With shortcuts, it is quicker to finish a 3 lap race than completing a single lap!",
       x = "date",
       y = "time")


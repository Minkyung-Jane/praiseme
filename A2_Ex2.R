## Exercise 2
## Minkyung Park (46858822)

setwd("/Users/minkyungpark/Desktop/Desktop_MacBook Air/Bachelor course/2024-Session 2/STAT1378_Coding and Communication in Statistics/STAT1378_R")
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

library(readr)
library(dplyr)
library(ggplot2)
library(tibble)

# a
gdp <- read_csv(file = "aus_GDP_changes.csv")
median <- read_csv(file = "aus_median_house_price.csv")
head(gdp)
head(median)

# b
colnames(median)[1] <- "Factors"
sydney <- median %>% select(1,2) %>% data.frame() %>% slice(10:98) %>% setNames(c("date", "median"))
sydney

# c 
library(lubridate)

sydney <- sydney %>%
  mutate(`date` = dmy(paste("01", `date`))) 

sydney$median <- as.numeric(sydney$median)
 
plot <- ggplot(data = sydney, aes(x = date, y = median)) + 
          geom_line(color = 'blue') +
          labs(title = "Median Price of Established House Transfers in Sydney",
               subtitle = "Unstratified & not seasonally adjusted",
               y = "Median Price ('000)") +
          scale_y_continuous(breaks = seq(0, max(sydney$median), by = 100)) +
          theme(axis.title.x = element_blank()) +
          theme(panel.grid.major.x = element_blank()) + 
          theme(panel.grid.minor = element_blank())
plot

ggsave("Median Price of Established House Transfers in Sydney.png", plot, width = 7,  height = 5)


# d
min(sydney$date)
gdp$DATE <- dmy(gdp$DATE)
low_GDP_period <- gdp %>% filter(DATE >= '2002-03-01') %>% filter(GDP_changes < 0.1)
low_GDP_period
low_GDP <- function(x) {
  if(x <= max(low_GDP_period$DATE) && x >= min(low_GDP_period$DATE)) {
    "TRUE"
  }
  else{
    "FALSE"
  }
}

low_GDP('2007-10-01')
low_GDP('2010-10-01')
low_GDP('2023-10-01')

# e
plot_with_GDP <- ggplot(data = sydney, aes(x = date, y = median)) + 
                geom_line(color = 'blue') +
                labs(title = "Median Price of Established House Transfers in Sydney",
                     subtitle = "Unstratified & not seasonally adjusted",
                     y = "Median Price ('000)") +
                scale_y_continuous(breaks = seq(0, max(sydney$median), by = 100)) +
                theme_bw() +
                theme_minimal() + 
                theme(axis.title.x = element_blank()) +
                theme(panel.grid.minor = element_blank())+
                theme(panel.grid.major.x = element_blank())+
                geom_rect(aes(xmin = as.Date('2008-10-01'), xmax = as.Date('2009-01-01'), ymin = -Inf, ymax = Inf), fill = 'gray') +
                geom_rect(aes(xmin = as.Date('2011-01-01'), xmax = as.Date('2011-04-01'), ymin = -Inf, ymax = Inf), fill = 'gray') +
                geom_rect(aes(xmin = as.Date('2015-04-01'), xmax = as.Date('2015-08-01'), ymin = -Inf, ymax = Inf), fill = 'gray') +
                geom_rect(aes(xmin = as.Date('2016-07-01'), xmax = as.Date('2016-11-01'), ymin = -Inf, ymax = Inf), fill = 'gray') + 
                geom_rect(aes(xmin = as.Date('2020-01-01'), xmax = as.Date('2020-07-01'), ymin = -Inf, ymax = Inf), fill = 'gray') + 
                geom_rect(aes(xmin = as.Date('2021-07-01'), xmax = as.Date('2021-10-01'), ymin = -Inf, ymax = Inf), fill = 'gray')
plot_with_GDP
ggsave("Median Price of Established House Transfers in Sydney with lower GDP.png", plot_with_GDP, width = 7,  height = 5)


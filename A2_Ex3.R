## Exercise 3
## Minkyung Park (46858822)

set.seed(2048)
arrival_time <- cumsum(rexp(100, 1/60))
service_time <- rexp(length(arrival_time), 1/150) + 20
bank <- data.frame(arrival_time, service_time)

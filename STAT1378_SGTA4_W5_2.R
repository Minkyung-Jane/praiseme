library(babynames)
select(babynames, name)
select(babynames, name, sex)
select(babynames, name | year)
select(babynames, !prop)
select(babynames, -c(year, sex, prop))
select(babynames, name:n)
select(babynames, starts_with("n"))

filter(babynames, name == "Khaleesi")
filter(babynames, name == "Sea" | name =="Anemone")
filter(babynames, prop > 0.08)
filter(babynames, year == 1880, (n==5 | n==6))
filter(babynames, name %in% c("Acura", "Lexus", "Yugo"))

arrange(babynames,n)
arrange(babynames, n, prop)
arrange(babynames, year, desc(prop))
arrange(babynames, desc(year), desc(prop))


babynames %>%
  filter(name == "Thomas", sex == "M") %>%
  summarise(total = sum(n), max = max(n), mean = mean(n))
babynames %>%
  filter(name == "Khaleesi") %>%
  summarise(year = first(year))
babynames %>%
  summarise(n = n(), distinct = n_distinct(name))


babynames %>%
  group_by(year, sex) %>%
  summarise(total = sum(n)) %>%
  summarise(total = sum(total))

babynames %>%
  group_by(year, sex) %>%
  summarise(total = sum(n))

babynames %>%
  group_by(year, sex)

babynames %>%
  group_by(year, sex) %>%
  ungroup()

babynames %>%
  group_by(year, sex) %>%
  group_by(name)

babynames %>%
  group_by(name, sex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total))

babynames %>%
  mutate(births = n/prop)

babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(n)) %>%
  ungroup () %>%
  mutate(fraction = n / year_total) %>%
  group_by(name) %>%
  slice_max(fraction, n=1)

table4a

table4a_long <- table4a %>%
  pivot_longer(c('1999', '2000'), names_to = "year", values_to = "cases")
table4a_long
table4a_long %>%
  pivot_wider(values_from = cases, names_from = year)


dat <- tibble(oat_bran_free = c(4.61, 5.42, 5.40, 4.54, 3.98), oat_bran = c(3.64, 5.57, 4.85, 4.80, 3.68))
dat_tidy <- dat %>%
  pivot_longer(col = everything(), values_to = "cholesterol", names_to = "diet")
dat_tidy
dat_tidy <- group_by(diet) %>%
  summarise(n=n(), mu = mean(cholesterol), sd=sd(cholesterol))

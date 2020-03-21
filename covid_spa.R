
library(tidyverse)
library(forecast)
library(lubridate)


df <- readxl::read_excel("smit.xlsx")

ts_smit <- ts(na.omit(df$iceland))[-(1:5)]

fit <- ets(log(ts_smit))

fc <- fit %>% forecast(h = 10)



idag <- today() - 1
spa_date <- idag + days(19)

fc %>% autoplot() +
  labs(x = NULL, y = NULL,
       title = "Fjöldi smita og spá næstu 14 daga") +
  scale_x_date(breaks = (seq(as.Date("2020-02-28"), as.Date(spa_date), by = "1 week")))

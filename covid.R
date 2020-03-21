
library(tidyverse)
library(janitor)
library(forecast)
library(lubridate)

date <- paste(month(today()- 1), day(today() - 1), year(today() - 1), sep = "-")

link <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-13-2020.csv"

df <- read_csv(link) %>% 
  clean_names()


df %>% 
  filter(country_region != "China") %>% 
  group_by()
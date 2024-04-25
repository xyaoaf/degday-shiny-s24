## This script will download temperature data from CIMIS using the cimir package, and save it as csv.

library(dplyr)
library(tidyr)
library(lubridate)
library(cimir)

## Set my API key
## (To get a CIMIS key, sign-up at https://cimis.water.ca.gov/Auth/Register.aspx)
# my_cimis_key <- "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" 

## The author of this script stores his CIMIS API key in a text file in "My Documents/My Tokens"
my_cimis_key <- readLines("~/My Tokens/cimis_token.txt", n = 1)
cimir::set_key(my_cimis_key)

## Define the CIMIS station we want
cimis_stn_id <- 77
cimis_stn_name <- "oakville"

## Define the start and end dates
start_dt <- make_date(2023, 1, 1)
end_dt <- make_date(2023, 6, 30)

## Define the data directory
data_dir <- here::here("exercises/data")
dir.exists(data_dir)

## Define the CSV file name
(dailytemps_csv <- file.path(data_dir, paste0(cimis_stn_name, "-cimis-2023.csv")))
file.exists(dailytemps_csv)

## Get the data
## Note 1. This should take <10 seconds. If it takes longer, the API may be down. Try in a few minutes.
## Note 2. CIMIS is updating their API in 2024, so this code may not work forever.

dailytemps_long_tbl <- cimis_data(targets = cimis_stn_id, start.date = start_dt, end.date = end_dt,
                              items = "day-air-tmp-max,day-air-tmp-min")

## View the data
# head(dailytemps_long_tbl)
# dim(dailytemps_long_tbl)
# sapply(dailytemps_long_tbl, class)
# dailytemps_long_tbl |> View()

## Do a little cleaning
dailytemps_wide_tbl <- dailytemps_long_tbl |>
  mutate(dt = ymd(Date)) |> 
  select(station_id = Station, dt, Item, Value) |>  
  pivot_wider(id_cols = c(station_id, dt), 
              names_from = Item, 
              values_from = Value) |> 
  rename(tasmax_f = DayAirTmpMax, tasmin_f = DayAirTmpMin) |> 
  relocate(tasmin_f, .before = tasmax_f)
  
## Inspect
head(dailytemps_wide_tbl)

## Write the data to disk
write.csv(dailytemps_wide_tbl, dailytemps_csv, row.names = FALSE)

## DONE!!


##load up data from .csv
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

##read in raw data from .csv
dir()
raw_data<-read_csv("supermarket_data_aggr.csv") %>%
  filter(complete.cases(.))

sort(unique(raw_data$unique_products_purchased))
sort(unique(raw_data$shops_used))
sort(unique(raw_data$products_purchased))



##replicate the three original tables
supermarket_distances<-raw_data %>%
  select(customer_id,shops_used,distance_shop_1:distance_shop_5) %>%
  distinct(.) %>%
  gather(key=junk,value=distance,distance_shop_1:distance_shop_5) %>%
  distinct(.) %>%
  select(-junk) %>%
  mutate(customer_id=as.character(customer_id)) %>%
  mutate(shops_used=as.character(shops_used))



supermarket_prices<-raw_data %>%
  select(unique_products_purchased_shop_1:unique_products_purchased_shop_5,avg_price_shop_1:avg_price_shop_5) %>%
  distinct(.)

#supermarket_purchases<-raw_data %>%
  
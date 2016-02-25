##load up data from .csv
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)

##read in raw data from .csv
dir()
raw_data<-read_csv("supermarket_data_aggr.csv") %>%
  filter(complete.cases(.))

##going to try to replicate original tables
##i'm making the assumign that "shops_used" is a unique identify of one of five shops
##this is based on other columns in the raw data and appearance that other parameters may correspond to 1-5
supermarket_distances<-raw_data %>%
  select(customer_id,shops_used,distance_shop_1:distance_shop_5) %>%
  distinct(.) %>%
  gather(key=junk,value=distance,distance_shop_1:distance_shop_5) %>%
  distinct(.) %>%
  select(-junk) %>%
  mutate(customer_id=as.character(customer_id)) %>%
  mutate(shops_used=as.character(shops_used))

##distance of average consumer to each shop
distance_fig<-supermarket_distances %>%
  mutate(shops_used=as.character(shops_used)) %>%
  select(shops_used,distance) %>%
  ggplot() +
  geom_histogram(aes(x=distance,fill=shops_used),colour='black') +
  geom_vline(xintercept=mean(supermarket_distances$distance)) +
  theme_grey(base_size=18) +
  facet_wrap(~shops_used)

##violin plot of customer distance to each shop  
distance_fig

summary_distances<-supermarket_distances %>%
  mutate(shops_used=as.character(shops_used)) %>%
  group_by(shops_used) %>%
  summarize(count=n(),
            mean_dist=mean(distance),
            sd_dist=sd(distance))
View(summary_distances)










##load up data from .csv
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

##What sorts of actionable insights can we draw from this data set?
##First I need to figure out what these fields mean by plotting them
##This will help me identify variables

##read in raw data from .csv; only take random sampling of data
set.seed(33)
raw_data<-read_csv("supermarket_data_aggr.csv") %>%
  filter(complete.cases(.)) %>%
  sample_n(size=10000) %>%
  mutate(customer_id=as.character(customer_id))

##figure out what ambiguous variables mean by plotting

##products_purchased v amount_purchased
corr_fig1<-raw_data %>%
  ggplot()+
  geom_point(aes(x=products_purchased,amount_purchased),colour="dodgerblue4") +
  theme_grey(base_size = 18)
corr_fig1

##also here
corr_fig2<-raw_data %>%
  ggplot()+
  geom_point(aes(x=unique_products_purchased,products_purchased),colour="coral") +
  theme_grey(base_size = 18)
corr_fig2
##looks like unique products purchased is a count, not some ID

##plot a bunch of histograms of data
hist_figs<-raw_data %>%
  select(distance_shop_1:avg_price_shop_5) %>%
  gather(key=item,value=number,distance_shop_1:avg_price_shop_5) %>%
  ggplot()+
  geom_histogram(aes(x=number,fill=item),colour="black",show.legend = FALSE)+
  facet_wrap(~item)
hist_figs








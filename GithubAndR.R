library(tidyverse)
library(haven)
#Add Libraries now, so you do not have to later

nfhs <- read_dta("IAHR52FL.dta")
#AddDataSet

nfhs <- select(nfhs , hhid:shstruc)
count(nfhs, hhid) 
  
nfhs %>%
  summary() 

#Some basic getting to know your data stuffl, also so you can get the points

ggplot(data = nfhs) + 
  geom_histogram(mapping = aes(hv009), binwidth = 1/2) +
  xlab("Number of Household Members")
#First graph, this shows distrubution of household members

nfhs <- mutate(nfhs, urban = hv025 == 1)
#Add variable urban

urban_for_box <- nfhs %>%
  filter(hv025 == 1)

ggplot(data = urban_for_box, mapping = aes(x = hv009, y = factor(hv026))) + 
  geom_boxplot() +
  xlab('Household Distribution') +
  ylab('Type of Urban Area')
#Make a histogram, true = urban, false = rural

summarise(nfhs)
by_city_size <- group_by(nfhs, hv025, hv026)
#Made a new variable so that you can compare data, name says it all

summarise(by_city_size, average_family_size = mean(hv009, na.rm = TRUE))
#This is the answer to the first part of the question. 

summarise(by_city_size, average_family_size = median(hv009, na.rm = TRUE))
#This is the answer to the extended response this make sense because if you look at the first graph
#You can see that the data is most distributed at the beginning with few outliers
rlang::last_error()
rlang::last_trace()

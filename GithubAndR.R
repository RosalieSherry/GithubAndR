library(tidyverse)
library(haven)
#Add Libraries now, so you do not have to later

nfhs <- read_dta("IAHR52FL.dta")
#AddDataSet

nfhs <- select(nfhs, hhid:shstruc)
count(nfhs, hhid)
summary(nfhs)

#Some basic getting to know your data stuff

ggplot(data = nfhs) + 
  geom_histogram(mapping = aes(hv009), binwidth = 1/2) +
  xlab("Number of Household Members")
#First graph, this shows distrubution of household members

nfhs <- mutate(nfhs, urban = hv025 == 1)
levels(nfhs$urban)
#Add variable urban

ggplot(data = nfhs, mapping = aes(x = hv009, y = urban)) + 
  geom_boxplot()
#Make a histogram, true = urban, false = rural

summarise(nfhs)

by_city_size <- group_by(nfhs, hv025, hv026)
#Made a new variable so that you can compare data, name says it all

summarise(by_city_size, average_family_size = mean(hv009, na.rm = TRUE))
#This is the answer to the first part of the question. 

summarise(by_city_size, average_family_size = median(hv009, na.rm = TRUE))
#This is the answer to the extended response this make sense because if you look at the first graph
#You can see that the data is most distributed at the beginning with few outliers
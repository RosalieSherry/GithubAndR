library(tidyverse)
library(haven)
#Add Libraries now, so you do not have to later

nfhs <- read_dta("~/Documents/Grad School/Fall 2020/OMSBA5112/IAHR52FL.dta")
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


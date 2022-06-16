
library("dataRetrieval")
library("ggplot2")
library("tidyverse")

siteNumber <- "02037500" 
mysite <- readNWISsite(siteNumber)
parameterCd <- "00060" #discharge
sDate <- '2022-01-01'
eDate <- '2022-06-15'

discharge <- readNWISdv(siteNumber,parameterCd,sDate,eDate)


df <- discharge
colnames(df)[4] <- ("Discharge")

#jpeg("Location.jpeg")
prettygraph <- df %>%
  ggplot(aes(x=Date, y=Discharge)) +
  geom_line() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),legend.position = "none", 
        axis.text=element_blank(), axis.ticks=element_blank(), axis.title = element_blank())
#ggsave("Location.jpeg")

print(prettygraph)
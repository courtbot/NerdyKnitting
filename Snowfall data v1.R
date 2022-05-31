library(ggplot2)
library(readxl)
library(viridis)
library(hrbrthemes)
library(tidyverse)

#get data into r
Wanakena_snowfall_data <- 
  read_excel("Practice w Snowfall/Wanakena snowfall data.xlsx")

#simplify data
df <- as.data.frame(Wanakena_snowfall_data)
colnames(df)[2] <- ("Total.Snowfall")

df <- df[-c(3,5,6,7)] %>%
  drop_na()

#math
print <- mean(df$Total.Snowfall)

df$rank <- rank(df$Total.Snowfall)
df$Bins <- ifelse(df$rank <= 10, 'F',
                  ifelse(df$rank<=20,'E',
                         ifelse(df$rank<=30,'D',
                                ifelse(df$rank<=40,'C',
                                       ifelse(df$rank<=50,'B','A')))))

#pdf("/Users/cbotelho/R/Practice w Snowfall/Plot1.pdf")
#jpeg("/Users/cbotelho/R/Practice w Snowfall/PlotJPEG.jpeg")

#pretty graph 
prettygraph <- df %>%
  arrange(desc(rank)) %>%
  ggplot(aes(x=Year, y=Total.Snowfall, size=rank)) +
    geom_point(alpha=0.5, shape=15, aes(colour = Bins)) +
    scale_color_viridis(discrete=TRUE, option="mako")+
    scale_size(range= c(1,6),name="Ranking")+
#This is the 'get rid of everything' part of the graph   
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),legend.position = "none", 
        axis.text=element_blank(), axis.ticks=element_blank(), axis.title = element_blank())

#ggsave("/Users/cbotelho/R/Practice w Snowfall/Plot1.pdf")
ggsave("/Users/cbotelho/R/Practice w Snowfall/PlotJPEG2.jpeg")

#clean up 
#rm(list = ls())
#dev.off(dev.list()["RStudioGD"]) 

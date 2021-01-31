## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(tidyverse)
totalBaltimore_type<- NEI %>%
  filter(fips=="24510") %>%
  group_by(year,type) %>%
  summarise(sum(Emissions))

plot3<-ggplot(totalBaltimore_type, aes(x=as.factor(year), y=`sum(Emissions)`)) + 
  geom_bar(stat="identity") +
  facet_wrap(~as.factor(type)) + 
  labs(x="Year", y="Total PM 2.5 Emission (tons)", title="Total PM2.5 Emission by sources in Baltimore City, Maryland") + 
  theme_bw() +
  theme(title = element_text(size=9))

ggsave("plot3.png", plot=plot3, device="png", width=5, height=5, units="in")

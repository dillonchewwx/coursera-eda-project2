## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(tidyverse)
coal<-SCC %>% 
  slice(grep("coal", .$EI.Sector, ignore.case=TRUE)) %>%
  select(SCC) %>%
  merge(NEI, by="SCC") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

plot4<-ggplot(coal, aes(x=as.factor(year), y=`sum(Emissions)`)) + 
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM 2.5 Emission (tons)", title="Total PM2.5 Emission by from coal combustion-related sources") + 
  theme_bw() +
  theme(title = element_text(size=9))

ggsave("plot4.png", plot=plot4, device="png", width=5, height=5, units="in")

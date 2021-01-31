## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(tidyverse)
vehicles<-SCC %>% 
  slice(grep("vehicles", .$EI.Sector, ignore.case=TRUE)) %>%
  select(SCC) %>%
  merge(NEI, by="SCC") %>%
  filter(fips=="24510") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

plot5<-ggplot(vehicles, aes(x=as.factor(year), y=`sum(Emissions)`)) + 
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM 2.5 Emission (tons)", title="Total PM2.5 Emission by from motor vehicles in Baltimore City") + 
  theme_bw() +
  theme(title = element_text(size=9))

ggsave("plot5.png", plot=plot5, device="png", width=5, height=5, units="in")

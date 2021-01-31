## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(tidyverse)
q6<-SCC %>% 
  slice(grep("vehicles", .$EI.Sector, ignore.case=TRUE)) %>%
  select(SCC) %>%
  merge(NEI, by="SCC") %>%
  filter(fips=="24510" | fips=="06037") %>%
  group_by(year, fips) %>%
  summarise(sum(Emissions)) %>%
  mutate(fips=ifelse(fips=="06037", "Los Angeles, California", "Baltimore, Maryland"))

plot6<-ggplot(q6, aes(x=as.factor(year), y=`sum(Emissions)`)) + 
  geom_bar(stat="identity") +
  facet_wrap(~fips) +
  labs(x="Year", y="Total PM 2.5 Emission (tons)", title="Total PM2.5 Emission by from motor vehicles") + 
  theme_bw() +
  theme(title = element_text(size=9))

ggsave("plot6.png", plot=plot6, device="png", width=5, height=5, units="in")

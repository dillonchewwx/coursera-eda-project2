## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

library(tidyverse)
totalBaltimore<- NEI %>%
  filter(fips=="24510") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

png("plot2.png")
barplot(totalBaltimore$`sum(Emissions)`, main="Total PM2.5 Emission from all sources in Baltimore City, Maryland", xlab="Year", ylab="Total PM 2.5 Emission (tons)", names.arg=totalBaltimore$year)
dev.off()

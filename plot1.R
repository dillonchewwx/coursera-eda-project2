## Coursera - Exploratory Data Analysis
# Course Project 2
# @dillonchewwx, 31012021

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

NEI <- readRDS("../summarySCC_PM25.rds")
SCC <- readRDS("../Source_Classification_Code.rds")

# Questions
# You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

total<-aggregate(NEI$Emissions, list(year=NEI$year), sum)

png("plot1.png")
barplot(total$x, main="Total PM2.5 Emission from all sources in the United States", xlab="Year", ylab="Total PM 2.5 Emission (tons)", names.arg=total$year)
dev.off()
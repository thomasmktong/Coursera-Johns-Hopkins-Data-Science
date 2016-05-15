## prep

setwd('C:/Users/Thomas/Documents/GitHub/ExData_Plotting2')
library("dplyr", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("ggplot2", lib.loc="C:/Program Files/R/R-3.1.1/library")

data_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(data_url, destfile='Dataset.zip')

unzip('Dataset.zip')
NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))

## plot

plotData <- NEI %>% filter(fips == "24510") %>% group_by(type, year) %>% 
        summarise(total_emissions = sum(Emissions))

png("plot3.png")
qplot(year, total_emissions, data=plotData, colour=type, geom="line")
dev.off()
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

plotData <- NEI %>% 
        filter(fips == "24510" | fips == "06037") %>%
        left_join(SCC, by = c('SCC'='SCC')) %>%
        filter(grepl('Vehicle', EI.Sector)) %>%
        group_by(year, fips) %>% 
        summarise(total_emissions = sum(Emissions))

plotDataBT <- filter(plotData, fips == "24510") %>% arrange(year) %>% mutate(fips = "Baltimore City")
plotDataBT$emissions_changes_percent <- plotDataBT$total_emissions / lag(plotDataBT$total_emissions) - 1

plotDataLA <- filter(plotData, fips == "06037") %>% arrange(year) %>% mutate(fips = "Los Angeles County")
plotDataLA$emissions_changes_percent <- plotDataLA$total_emissions / lag(plotDataLA$total_emissions) - 1

plotData <- rbind_list(plotDataBT, plotDataLA)

png("plot6.png")
qplot(year, emissions_changes_percent, data=plotData, geom="line", color = fips)
dev.off()
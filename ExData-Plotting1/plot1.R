rm(list=ls())
library("data.table", lib.loc="C:/Program Files/R/R-3.1.1/library")
setwd('C:\\Users\\Thomas\\Documents\\GitHub\\ExData_Plotting1')

## Read file

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile='household_power_consumption.zip')
unzip('household_power_consumption.zip', 'household_power_consumption.txt')
fileData <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## Date type

fileData$Date <- as.Date(fileData$Date, format='%d/%m/%Y')
fileData$Global_active_power <- as.double(fileData$Global_active_power)
fileData <- fileData[fileData$Date >= as.Date('2007-02-01', format='%Y-%m-%d') & 
                             fileData$Date <= as.Date('2007-02-02', format='%Y-%m-%d'), ]

## Plot

png("plot1.png")
hist(fileData$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Acitve Power (kilowatts)", ylab="Frequency")
dev.off()

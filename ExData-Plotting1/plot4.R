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

setkey(fileData, Date, Time)
fileData[,"posix"] = as.POSIXct(paste(as.character(fileData$Date), fileData$Time, " "))

## Plot

png("plot4.png")
par(mfrow=c(2,2))
with(fileData, plot(fileData$posix, Global_active_power, xlab="", type="l", ylab="Global Active Power"))
with(fileData, plot(fileData$posix,Voltage, type="l"))
with(fileData, plot(fileData$posix,Sub_metering_1, xlab="", type="l", ylab="Energy sub metering"))
with(fileData,lines(fileData$posix,Sub_metering_2,col="red"))
with(fileData,lines(fileData$posix,Sub_metering_3,col="blue"))
legend("topright", cex=1, col=c("black", "red", "blue"),lwd=2,bty="n",
        y.intersp=0.8,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(fileData, plot(fileData$posix, Global_reactive_power, type="l"))
dev.off()
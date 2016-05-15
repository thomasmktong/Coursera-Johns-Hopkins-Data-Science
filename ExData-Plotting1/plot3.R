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

png("plot3.png")
plot(fileData$posix,fileData$Sub_metering_1,
     xlab="", type="l", ylab="Energy sub metering")
lines(fileData$posix,fileData$Sub_metering_2,col="red")
lines(fileData$posix,fileData$Sub_metering_3,col="blue")
legend("topright", cex=1, col=c("black", "red", "blue"),
       lwd=1,y.intersp=1,xjust=1,text.width = strwidth("Sub_metering_1"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Exploratory Analysis Course Project #1 - Plot #3

## turn off warnings for closing unused connections
options(warn=-1)

## Install required packages
require(sqldf, quietly=TRUE)  
require(lubridate, quietly=TRUE)  

## Create data frame
df <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from 
                   file WHERE Date in ('1/2/2007', '2/2/2007') ", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Create DateTime
DateTime <- as.POSIXct(paste(df$Date, df$Time))

## Create plot
yrange<-range(df$Sub_metering_1)
png("plot3.png", width = 480, height = 480)
plot(DateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new=T)
plot(df$Sub_metering_2,type="l",axes=F,col="red", ylim = yrange, xlab = "", ylab = "")
par(new=T)
plot(df$Sub_metering_3,type="l", axes=F, col="blue", ylim = yrange, xlab = "", ylab = "")
legend("topright", pch = 1, col = c("black", "blue", "red"), legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## turn warnings back on
options(warn=0)


## Exploratory Analysis Course Project #1 - Plot #2

## turn off warnings for closing unused connections
options(warn=-1)

## Install required package
require(sqldf, quietly=TRUE)  
require(lubridate, quietly=TRUE)  

## Create data frame
df <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from 
          file WHERE Date in ('1/2/2007', '2/2/2007') ", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Create DateTime
DateTime <- as.POSIXct(paste(df$Date, df$Time))

## Create plot
png("plot2.png", width =480, height = 480)
plot(DateTime, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

## turn warnings back on
options(warn=0)
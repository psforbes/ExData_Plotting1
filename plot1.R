## Exploratory Analysis Course Project #1 - Plot #1

## turn off warnings for closing unused connections
options(warn=-1)

## Install required package
require(sqldf, quietly=TRUE)  

## Create data frame
df <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from 
                   file WHERE Date in ('1/2/2007', '2/2/2007') ", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Create plot
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")
dev.off()

## turn warnings back on
options(warn=0)

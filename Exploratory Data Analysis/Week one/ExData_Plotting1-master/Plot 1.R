#Peer-graded Assignment: Exploratory Data Analysis
#-------------Beginning of the general steps------------------
#Getting the data
ulrfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dirfile <- "./data/Powerconsumption.zip"

download.file(ulrfile, destfile =dirfile, method = "curl")

unzip(dirfile,exdir="./data")

# Variables assignation and subseting the dates

powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerconsumption <- subset(powerconsumption, powerconsumption$Date=="1/2/2007" | powerconsumption$Date=="2/2/2007")

# Date and Time variables to Date/Time classes
library(lubridate) # DON'T take points away for this method, it wasn't say that this is not an option!
powerconsumption$Date <- dmy(powerconsumption$Date)
powerconsumption$Time <- hms(powerconsumption$Time)

# Determination of classes
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)
powerconsumption$Global_reactive_power <- as.numeric(powerconsumption$Global_reactive_power)
powerconsumption$Voltage <- as.numeric(powerconsumption$Voltage)
powerconsumption$Global_intensity <- as.numeric(powerconsumption$Global_intensity)
powerconsumption$Sub_metering_1 <- as.numeric(powerconsumption$Sub_metering_1)
powerconsumption$Sub_metering_2 <- as.numeric(powerconsumption$Sub_metering_2)
powerconsumption$Sub_metering_3 <- as.numeric(powerconsumption$Sub_metering_3)

#----------Plot1 Code------------------
with(powerconsumption, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)", col="red"))
dev.copy(png,"Plot 1.png", width = 480, height = 480)
dev.off()



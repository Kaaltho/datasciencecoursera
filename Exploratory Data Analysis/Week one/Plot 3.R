#Peer-graded Assignment: Exploratory Data Analysis
#-------------Beginning of the general steps------------------
#Getting the data
# File download
ulrfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dirfile <- "./data/Powerconsumption.zip"

download.file(ulrfile, destfile =dirfile, method = "curl")

unzip(dirfile,exdir="./data")

# Variables assignation and subseting the dates

powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerconsumption <- subset(powerconsumption, powerconsumption$Date=="1/2/2007" | powerconsumption$Date=="2/2/2007")

# Determination of classes
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)
powerconsumption$Global_reactive_power <- as.numeric(powerconsumption$Global_reactive_power)
powerconsumption$Voltage <- as.numeric(powerconsumption$Voltage)
powerconsumption$Global_intensity <- as.numeric(powerconsumption$Global_intensity)
powerconsumption$Sub_metering_1 <- as.numeric(powerconsumption$Sub_metering_1)
powerconsumption$Sub_metering_2 <- as.numeric(powerconsumption$Sub_metering_2)
powerconsumption$Sub_metering_3 <- as.numeric(powerconsumption$Sub_metering_3)

#----------Plot3 Code------------------
DataTime <- strptime(paste(powerconsumption$Date, powerconsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("Plot 3.png", width = 480, height = 480)
with(powerconsumption, plot(DataTime, Sub_metering_1, type="l", xlab="", ylab="Energy Submetering"))
with(powerconsumption, lines(DataTime, Sub_metering_2, col="red"))
with(powerconsumption, lines(DataTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()

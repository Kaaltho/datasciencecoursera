#Peer-graded Assignment: Exploratory Data Analysis
#-------------Beginning of the general steps------------------
#Getting the data
setwd("F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis")
if(!file.exists("Week one")){
  dir.create("Week one")
  setwd("F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis/Week one")
}  
# File download
ulrfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dirfile <- "F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis/Week one/Powerconsumption.zip"

download.file(ulrfile, destfile =dirfile, method = "curl")

unzip(dirfile,exdir="F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis/Week one")

# Variables assignation and subseting the dates
dirfiles <- "F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis/Week one"

powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerconsumption <- subset(powerconsumption, powerconsumption$Date=="1/2/2007" | powerconsumption$Date=="2/2/2007")

# Date and Time variables to Date/Time classes
library(lubridate)
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

#Peer-graded Assignment: Exploratory Data Analysis

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

unzip(dirfile,exdir="F:/R codes/Projects/datasciencecoursera/Exploratory Data Analysis/Week one/Dataset")


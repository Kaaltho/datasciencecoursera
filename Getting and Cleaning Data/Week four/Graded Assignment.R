#Peer-graded Assignment: Getting and Cleaning Data Course Project

#Getting the data
setwd("F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data")
if(!file.exists("Week four")){
  dir.create("Week four")
  setwd("F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data/Week four")
}  
# File download
ulrfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dirfile <- "F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data/Week four/Dataset.zip"
  
download.file(ulrfile, destfile =dirfile, method = "curl")

unzip(dirfile,exdir="F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data/Week four/Dataset")

dirfiles <- "F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data/Week four/Dataset"

files <- file.path(dirfiles, "UCI HAR Dataset")
usefiles <- list.files(files, recursive=TRUE)
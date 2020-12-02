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

# Variables asignation
dirfiles <- "F:/R codes/Projects/datasciencecoursera/Getting and Cleaning Data/Week four/Dataset"

files <- file.path(dirfiles, "UCI HAR Dataset")
usefiles <- list.files(files, recursive=TRUE)


dataActtrain <- read.table(file.path(files, "train", "Y_train.txt"),header = FALSE)
dataActtest  <- read.table(file.path(files, "test" , "Y_test.txt" ),header = FALSE)

dataSubjtrain <- read.table(file.path(files, "train", "subject_train.txt"),header = FALSE)
dataSubjtest  <- read.table(file.path(files, "test" , "subject_test.txt"),header = FALSE)

dataFeattrain <- read.table(file.path(files, "train", "X_train.txt"),header = FALSE)
dataFeattest  <- read.table(file.path(files, "test" , "X_test.txt" ),header = FALSE)

#Merging training and test
dataActivity <- rbind(dataActtrain, dataActtest)
dataSubject <- rbind(dataSubjtrain, dataSubjtest)
dataFeatures <- rbind(dataFeattrain, dataFeattest)




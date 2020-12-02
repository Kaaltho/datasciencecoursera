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

names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesNames <- read.table(file.path(files,"features.txt"), head=FALSE)
names(dataFeatures) <- dataFeaturesNames$V2

dataCombine <- cbind(dataSubject, dataActivity)
datos <- cbind(dataFeatures, dataCombine)

#Extracting measurements of mean and standard deviation

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
datos1<-subset(datos,select=selectedNames)

#Descriptive names

activityLabels <- read.table(file.path(files, "activity_labels.txt"),header = FALSE)
datos1$activity<-factor(datos1$activity,labels=activityLabels[,2])

#Setting labels with descriptive variable names
names(datos1)<-gsub("^t", "time", names(datos1))
names(datos1)<-gsub("^f", "frequency", names(datos1))
names(datos1)<-gsub("Acc", "Accelerometer", names(datos1))
names(datos1)<-gsub("Gyro", "Gyroscope", names(datos1))
names(datos1)<-gsub("Mag", "Magnitude", names(datos1))
names(datos1)<-gsub("BodyBody", "Body", names(datos1))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
install.packages("plyr")
library(plyr)
datos2<-aggregate(. ~subject + activity, datos1, mean)
datos2<-datos2[order(datos2$subject,datos2$activity),]
write.table(datos2, file = "independenttidydata.txt",row.name=FALSE)

#Generating a Coodebook
install.packages("codebook")
library(codebook)
new_codebook_rmd()



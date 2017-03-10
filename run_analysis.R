##Setting Working Directory
setwd("E:/coursera/UCI HAR Dataset")
##Loading Packages 
library(dplyr)
library(data.table)
##Loading raw data sets
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

##Organizing and combining raw data sets into single one
xDataSet<-rbind(xTrain,xTest)
yDataSet<-rbind(yTrain,yTest)
subjectDataSet<-rbind(subjectTrain,subjectTest)
dim(xDataSet)
dim(yDataSet)
dim(subjectDataSet)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

features<-read.table("features.txt")
mean.sd<-grep("-mean\\(\\)|-std\\(\\)", features[, 2]) ##Subsets only that rows which has mean and std
xDataSet.mean.sd<-xDataSet[,mean.sd] ##Subset only those from  xDataSet columns which have mean and std

##Uses descriptive activity names to name the activities in the data set

names(xDataSet.mean.sd)<-features[mean.sd,2] ##Allot column names from features table(only mean and std) 
names(xDataSet.mean.sd) <- tolower(names(xDataSet.mean.sd)) 
names(xDataSet.mean.sd) <- gsub("\\(|\\)", "", names(xDataSet.mean.sd)) ##Removes braces from columnames

activities<-read.table("activity_labels.txt")
activities[,2]<-tolower(as.character(activities[,2]))
activities[,2]<-gsub("_","",activities[,2]) ##Numbers from 1 to 6 are alotted to different activities. 

yDataSet[, 1] <-activities[yDataSet[, 1], 2]                                                 ##All rows of yDataSet have been allotted respective activites
colnames(yDataSet)<-"activity"
colnames(subjectDataSet)<-"subject"

# Appropriately labels the data set with descriptive activity names.
data<-cbind(subjectDataSet,xDataSet.mean.sd,yDataSet)
str(data)
write.table(data, './Project/merged.txt', row.names = F)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
average.df <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.df <- average.df[, !(colnames(average.df) %in% c("subj", "activity"))]
str(average.df)
write.table(average.df, './Project/average.txt', row.names = F)

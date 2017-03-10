# Getting-And-Cleaning-Data-Assignment

##Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1.a tidy data set as described below;
2.a link to a Github repository with your script for performing the analysis; and
3.a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

##Objectives 

R script called run_analysis.R that does the following:

a) Merges the training and the test sets to create one data set.
b) Extracts only the measurements on the mean and standard deviation for each measurement.
c) Uses descriptive activity names to name the activities in the data set
d) Appropriately labels the data set with descriptive activity names.
e) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#run_analysis.R

1.It downloads the UCI HAR Dataset data set to working directrory. After it is downloaded, it unzips the file into the UCI HAR Dataset folder.
2.It loads the train and test data sets and appends the two datasets into one data frame. This is done using rbind.
3.It extracts just the mean and standard deviation from the features data set. This is done using grep.
4.After cleaning the column names, these are applied to the xDataSet data frame.
5.After loading activities data set, it converts it to lower case using tolower and removes underscore using gsub. activity and subject column names are named for yDataSet and subjectDataSet data sets, respectively.
6.The three data sets, xDataSet, yDataSet and subjectDataSet, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt.
7.The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file; this is named average.txt.

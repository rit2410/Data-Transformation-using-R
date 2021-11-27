# Data loading and Transformation Using R

## Purpose

Here I tried to demonstrate my ability to collect, work with, and clean a data set using R language. My goal here is to prepare tidy data that can be used for later analysis.

## Objectives 

R script called run_analysis.R that does the following:

*  Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis.R

1. It downloads the UCI HAR Dataset data set to working directrory. After it is downloaded, it unzips the file into the UCI HAR Dataset folder.
2. It loads the train and test data sets and appends the two datasets into one data frame. This is done using rbind.
3. It extracts just the mean and standard deviation from the features data set. This is done using grep.
4. After cleaning the column names, these are applied to the xDataSet data frame.
5. After loading activities data set, it converts it to lower case using tolower and removes underscore using gsub. activity and subject column names are named for yDataSet and subjectDataSet data sets, respectively.
6. The three data sets, xDataSet, yDataSet and subjectDataSet, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt.
7. The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file; this is named average.txt.

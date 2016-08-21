
# About This Project

This is a Course Work for the Coursera "Getting and Cleaning Data" course by Johns Hopkins University.

## Goal

Prepare tidy data that can be used for later analysis. 

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Make descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Source Data

The Source Data for this project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Files Description

* __activity_labels.txt__  Names of the activities, e.g. "walking", "laying" with their numeric codes
* __features.txt__         Feature names for X_test and X_train
* __processed_data.csv__   The output of the R script        
* __ReadMe.md__            This file
* __run_analysis.R__       The main script. Process the data and forms processed_data.csv
* __subject_test.txt__     Table with subject numbers for test data
* __subject_train.txt__    Table with subject numbers for training data
* __X_test.txt__           Test data        
* __X_train.txt__          Training data
* __y_test.txt__           Table with activity numbers for test data
* __y_train.txt__          Table with activity numbers for traingin data
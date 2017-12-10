# Getting-and-Cleaning-Data-Course-Project
Human Activity Recognition Using Smartphones Dataset

## overview
This script is mean to process data collected from the accelerometers from the Samsung Galaxy S smartphone according to the requirement of Course Project.

## struncture of the original data
If you want to run the script, make sure that the data is in your R workspace. The structure of directory should be like this:  

\\UCI HAR Dataset\\activity_labels.txt"  
\\UCI HAR Dataset\\features.txt"  
\\UCI HAR Dataset\\test\\subject_test.txt"  
\\UCI HAR Dataset\\test\\X_test.txt"  
\\UCI HAR Dataset\\test\\y_test.txt"  
\\UCI HAR Dataset\\train\\subject_train.txt"  
\\UCI HAR Dataset\\train\\X_train.txt"  
\\UCI HAR Dataset\\train\\y_train.txt"  

## where to get the original data
you can get the data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
here is the codebook of this data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## what the "run_analysis.R" do
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## understand the output
the output has been saved in file "result.txt". A full description is available in the CodeBook

## The dataset includes the following files
README.md  
codebook.txt:show information about the result.txt  
result.txt:a independent tidy data set with the average of each variable for each activity and each subject.

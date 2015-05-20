---
title: "Readme for Getting and Cleaning Data Course Project"
output: html_document
---
# Overview
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Running
To run the code you first need to download data and unzip it
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

When extracting zip file keep sub-folder structure intact, since the script expects subfolders test and train to exists

Merging of the data can be done by executing script in run_analysis.R file

Output of the script are two files

* complete_data.txt / merged data set
* summary_data.txt / summary data set

For reference see codebook.md


---
title: "CodeBook.md"
author: "Matthew Smith"
date: "4/6/2020"
output: html_document
---
## Getting and Cleaning Data - peer assessment project


## The original data was transformed by

* Step 1. Merging the training and the test sets to create one data set.
* Step 2. Extracting only the measurements on the mean and standard deviation for each measurement. 
* Step 3. Using descriptive activity names to name the activities in the data set
* Step 4. Appropriately labeling the data set with descriptive activity names. 
* Step 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## About R script
File with R code "run_analysis.R" perform 5 above steps (in accordance assigned task of course work)

## About variables:   

* The variables are divided into three main groups, Train Data ,Test Data, and Other

## Train Data
The variables for Train Data are as follows:
* trainDS1  is the variable for the file X_train.txt
* trainDS2   is the variable for the file Y_train.txt
* trainsub  is the variable for the filesubject_train.txt
* trainX  reads the data from trainDS1
* trainY reads the data from trainDS2
* subject_train reads the data from trainsub

## Test Data
The variables for Test Data are as follows:
* testDS1  is the variable for the file X_test.txt
* testDS2  is the variable for the file Y_test.txt 
* testsub   is the variable for the file subject_test.txt
* testX reads the data from testDS1
* testY reads the data from  testDS2 
* subject_test reads the data from testsub

## Other
* features  is the variable for the file features.txt. The  features.txt  contains the correct variable name, which corresponds to each column of  x_train.txt  and  x_test.txt

* act_Labels is the variable for the file activity_labels.txt.  The  activity_labels.txt  contains the descriptive names for each activity label, which corresponds to each number in the  y_train.txt  and  y_test.txt

* The  README.txt  is the overall description about the overall process of how publishers of this dataset did the experiment and got the data result.

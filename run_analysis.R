##This R script called run_analysis.R performs the following.

##1. Merges the training and the test sets to create one data set.

library("dplyr")
library("reshape2")

## Determines if dataset already exists
if(!file.exists("./data")){dir.create("./data")}
#Here are the data for the project:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
## Unzips Dataset
unzip("./data/Dataset.zip")

## Train Data
trainDS1 <- "./UCI HAR Dataset/train/X_train.txt"
trainDS2 <- "./UCI HAR Dataset/train/Y_train.txt"
trainsub <- "./UCI HAR Dataset/train/subject_train.txt"

trainX <- read.table(trainDS1 )
trainY <- read.table(trainDS2)
subject_train <- read.table(trainsub)

## Test Data
testDS1 <- "./UCI HAR Dataset/test/X_test.txt"
testDS2 <- "./UCI HAR Dataset/test/Y_test.txt"
testsub <- "./UCI HAR Dataset/test/subject_test.txt"

## Read dataset to tables
testX <- read.table(testDS1 )
testY <- read.table(testDS2)
subject_test <- read.table(testsub)

features <- read.table('./UCI HAR Dataset/features.txt')
act_Labels <- read.table('./UCI HAR Dataset/activity_labels.txt')

## applies column name to data
colnames(trainX) <- features[,2]
colnames(trainY) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(testX) <- features[,2] 
colnames(testY) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(act_Labels) <- c('activityId','activityType')

## combines datasets
train_dataset <- cbind(trainY, subject_train, trainX)
test_dataset <- cbind(testY, subject_test, testX)
master_dataset <- rbind(train_dataset, test_dataset)

colNames <- colnames(master_dataset)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

DSMeanAndStd <- master_dataset[ , mean_and_std == TRUE]



##3. Uses descriptive activity names to name the activities in the data set
setAct_Names <- merge(DSMeanAndStd, act_Labels,
                      by='activityId',
                      all.x=TRUE)


##4. Appropriately labels the data set with descriptive variable names.
#Done in previous steps


##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

proccessed_dataSet <- aggregate(. ~subjectId + activityId, setAct_Names, mean)
proccessed_dataSet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

#5.2 Writing second tidy data set in txt file

write.table(proccessed_dataSet, "proccessed_dataSet.txt", row.name=FALSE)

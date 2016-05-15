## run_analysis.R

## Prep: Load lib, set working directory, download dataset & unzip



library("dplyr", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("tidyr", lib.loc="C:/Program Files/R/R-3.1.1/library")

setwd('C:/Users/Thomas/Documents/GitHub/GetData_HumanActivityRecognition')
data_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(data_url, destfile='Dataset.zip')
unzip('Dataset.zip')


## 1. Merges the training and the test sets to create one data set



x_train_path <- 'UCI HAR Dataset/train/X_train.txt'
y_train_path <- 'UCI HAR Dataset/train/y_train.txt'
x_test_path <- 'UCI HAR Dataset/test/X_test.txt'
y_test_path <- 'UCI HAR Dataset/test/y_test.txt'

x_train_tbl <- tbl_dt(read.table(x_train_path))
y_train_tbl <- tbl_dt(read.table(y_train_path))
x_train_tbl <- mutate(x_train_tbl, activity = y_train_tbl$V1)

x_test_tbl <- tbl_dt(read.table(x_test_path))
y_test_tbl <- tbl_dt(read.table(y_test_path))
x_test_tbl <- mutate(x_test_tbl, activity = y_test_tbl$V1)

tbl <- rbind_list(x_train_tbl, x_test_tbl)
rm(list = ls()[grepl("(train|test)", ls())])

tbl


### 4. Appropriately labels the data set with descriptive variable names



features_path <- 'UCI HAR Dataset/features.txt'
features_tbl <- tbl_dt(read.table(features_path))
names(tbl)[features_tbl$V1] <- paste(features_tbl$V1, '-', as.character(features_tbl$V2), sep = '')

tbl


### 2. Extracts only the measurements on the mean and standard deviation for each measurement



tbl = select(tbl, activity, contains("mean()"), contains("std()"))

tbl


### 3. Uses descriptive activity names to name the activities in the data set



activity_labels_path <- 'UCI HAR Dataset/activity_labels.txt'
activity_labels_tbl <- tbl_dt(read.table(activity_labels_path))
tbl$activity <- activity_labels_tbl[tbl$activity]$V2

tbl


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



gathed_tbl <- gather(tbl, subject, value, -activity)
grouped_tbl <- group_by(gathed_tbl, activity, subject) %>% summarise(mean(value))

write.table(grouped_tbl, file = "output.txt", row.name = FALSE, sep = "\t")
grouped_tbl



## Source: local data frame [396 x 3]
## Groups: activity
## 
##    activity                  subject  mean(value)
## 1    LAYING      1-tBodyAcc-mean()-X  0.268648643
## 2    LAYING      2-tBodyAcc-mean()-Y -0.018317728
## 3    LAYING      3-tBodyAcc-mean()-Z -0.107435632
## 4    LAYING  41-tGravityAcc-mean()-X -0.375021334
## 5    LAYING  42-tGravityAcc-mean()-Y  0.622270363
## 6    LAYING  43-tGravityAcc-mean()-Z  0.555612474
## 7    LAYING 81-tBodyAccJerk-mean()-X  0.081847390
## 8    LAYING 82-tBodyAccJerk-mean()-Y  0.011172357
## 9    LAYING 83-tBodyAccJerk-mean()-Z -0.004859769
## 10   LAYING   121-tBodyGyro-mean()-X -0.016725340
## ..      ...                      ...          ...


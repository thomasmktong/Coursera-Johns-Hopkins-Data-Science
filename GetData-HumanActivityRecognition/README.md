GetData_HumanActivityRecognition
================================

This is a project which tries to tidy and analyze data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The Analysis

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For more information, please refer to [run_analysis.md](run_analysis.md) or [run_analysis.R](run_analysis.R)

## Codebook

The analysis result - [output.txt](output.txt) - contains 3 columns:

1. `activity`
2. `subject`
3. `mean(value)`

`activity` indicates the activity done when accelerometers was collecting the information, it includes values:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

`subject` indicates the types of metrics collected - refer [UCI HAR Dataset/features_info.txt](UCI HAR Dataset/features_info.txt) for more information

`mean(value)` is the mean calculated, grouped by each particular activity and subject

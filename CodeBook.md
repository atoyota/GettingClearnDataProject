#CodeBook
This is the summary of result data TidyData.txt after running analysis program run_analysis.R.

#Key Identifiers
* subject: The test subject ID
* Activity - The activity type name representing type of activities performed when the corresponding measurements were taken

  Activity Type Values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

#Measurements
* timeBodyAccMean-X
* timeBodyAccMean-Y
* timeBodyAccMean-Z
* timeBodyAccStd-X
* timeBodyAccStd-Y
* timeBodyAccStd-Z
* timeGravityAccMean-X
* timeGravityAccMean-Y
* timeGravityAccMean-Z
* timeGravityAccStd-X
* timeGravityAccStd-Y
* timeGravityAccStd-Z
* timeBodyAccJerkMean-X
* timeBodyAccJerkMean-Y
* timeBodyAccJerkMean-Z
* timeBodyAccJerkStd-X
* timeBodyAccJerkStd-Y
* timeBodyAccJerkStd-Z
* timeBodyGyroMean-X
* timeBodyGyroMean-Y
* timeBodyGyroMean-Z
* timeBodyGyroStd-X
* timeBodyGyroStd-Y
* timeBodyGyroStd-Z
* timeBodyGyroJerkMean-X
* timeBodyGyroJerkMean-Y
* timeBodyGyroJerkMean-Z
* timeBodyGyroJerkStd-X
* timeBodyGyroJerkStd-Y
* timeBodyGyroJerkStd-Z
* timeBodyAccMagMean
* timeBodyAccMagStd
* timeGravityAccMagMean
* timeGravityAccMagStd
* timeBodyAccJerkMagMean
* timeBodyAccJerkMagStd
* timeBodyGyroMagMean
* timeBodyGyroMagStd
* timeBodyGyroJerkMagMean
* timeBodyGyroJerkMagStd
* frequenceBodyAccMean-X
* frequenceBodyAccMean-Y
* frequenceBodyAccMean-Z
* frequenceBodyAccStd-X
* frequenceBodyAccStd-Y
* frequenceBodyAccStd-Z
* frequenceBodyAccJerkMean-X
* frequenceBodyAccJerkMean-Y
* frequenceBodyAccJerkMean-Z
* frequenceBodyAccJerkStd-X
* frequenceBodyAccJerkStd-Y
* frequenceBodyAccJerkStd-Z
* frequenceBodyGyroMean-X
* frequenceBodyGyroMean-Y
* frequenceBodyGyroMean-Z
* frequenceBodyGyroStd-X
* frequenceBodyGyroStd-Y
* frequenceBodyGyroStd-Z
* frequenceBodyAccMagMean
* frequenceBodyAccMagStd
* frequenceBodyBodyAccJerkMagMean
* frequenceBodyBodyAccJerkMagStd
* frequenceBodyBodyGyroMagMean
* frequenceBodyBodyGyroMagStd
* frequenceBodyBodyGyroJerkMagMean
* frequenceBodyBodyGyroJerkMagStd

#Data Prepareation Process by run_analysis.R script
-  Read X_train.txt, y_train.txt and subject_train.txt and store them in train.x, train.y and train.subject variables respectively.
-  Read X_test.txt, y_test.txt and subject_test.txt store them in test.x, test.y and test.subject variables respectively.
-  Merge train.subject, train.y, train.x into TrainData
-  Merge test.subject, test.y, test.x into testData
-  Merge trainData, testData into fullData
-  Extracts only the measurements on the mean and standard deviation for each measurement load feature names from features.txt into featureName
- extract mean and standard deviation of each measurements from featureName and set column names
- set descriptive activity names to name the activities in the data set load activity data into activityName
- replace 1 to 6 with activity names
- Appropriately labels the data set with descriptive variable names.
- generate independent tidy data set with the average of each variable for each activity and each subject.
- write out in the TidyData.txt file 

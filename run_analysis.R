library(stats)
library(base)
library(dplyr)

reLoadOption <- readline("Do you want to re-load the zip file (Y/N)?") 
# Merge the training and the test sets to create one data set.
# If the user wants to re-load the data file, download and unzip the data file from the internet site.
if (reLoadOption=="Y" |reLoadOption=="y") {
  ## download zip file from website
  if(!file.exists("./UCI HAR Dataset")) {
    dir.create("./UCI HAR Dataset") 
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "./UCI HAR Dataset/projectData_getCleanData.zip")
    ## unzip the downloaded file
    listZip <- unzip("./UCI HAR Dataset/projectData_getCleanData.zip", exdir = "./UCI HAR Dataset")
  }
} else if (reLoadOption=="N" |reLoadOption=="n"){
    message("Re-calculating the stats without re-loading the data file.")
} else {
  stop("Please provide your choice of re-loading file correctly.  Bye.")
}

## reading unzipped data into R
train.x <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
test.x <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

## 1. merge train and test data
trainData <- cbind(train.subject, train.y, train.x)
testData <- cbind(test.subject, test.y, test.x)
fullData <- rbind(trainData, testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## load feature names into R
featureName <- read.table("./UCI HAR Dataset/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]

## extract mean and standard deviation of each measurements
featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featureName)
finalData <- fullData[, c(1, 2, featureIndex+2)]
colnames(finalData) <- c("subject", "activity", featureName[featureIndex])


# 3. Uses descriptive activity names to name the activities in the data set
## load activity data into R
activityName <- read.table("./UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

## replace 1 to 6 with activity names
finalData$activity <- factor(finalData$activity, levels = activityName[,1], labels = activityName[,2])

# 4. Appropriately labels the data set with descriptive variable names.

names(finalData) <- gsub("\\()", "", names(finalData))
names(finalData) <- gsub("^t", "time", names(finalData))
names(finalData) <- gsub("^f", "frequence", names(finalData))
names(finalData) <- gsub("-mean", "Mean", names(finalData))
names(finalData) <- gsub("-std", "Std", names(finalData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
groupData <- finalData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

if(!file.exists("./Result")) dir.create("./Result")
write.table(groupData, "./Result/MeanData.txt", row.names = FALSE)
# GettingClearnDataProject
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
+ a tidy data set as described below, 
+ a link to a Github repository with your script for performing the analysis, and 
+ a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names.
4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# User Guide
The program asks you if you want to re-load the data file from the internet site.  Please type your answer Y or N to the question.
-  If your answer is Y, the program will download the data file from the internet and load it into memory for the analysis.
-  If you answer N, the program will load the data previously downloaded to the local machine for the analysis.

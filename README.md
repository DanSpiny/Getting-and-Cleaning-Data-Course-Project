# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project based on Human Activity Recognition Using Smartphones Data Set.

In this repo you could find 2 key files:
   1. run_analysis.R - R-file that contains the code to extract data from initial Human Activity Recognition Using Smartphones Data Set and make a tidy data set from it. 
   2. CodeBook.rmd - code book that describes the variables, the data, and transformations that I performed to clean up the data

Just place this file in the same directory together with the Samsung data and run it.
The analisys file do the following:

(1) Read the data from given files (training and the test) and merge them

(2) Extracts from a combined set only the measurements on the mean and standard deviation for each measurement

   (2.1) Extracts the names of features from the corresponding file
   (2.2) Determins the indexes of the given variable names that only correponds to "mean" and "standard deviation" fields
   (2.3) Does the required extraction from the combined data frame

(3) Uses descriptive activity names to name the activities in the data set
   (3.1) Extracts the names of activities from the corresponding file
   (3.2) Assings these names to the column (levels) in the data set


(4) Appropriately labels the data set with descriptive variable names. 

(5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

(6) Saves this tidy data set to the file "tidy_data.txt" in you working directory

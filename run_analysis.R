## (1) Read the data from given files (training and the test) and merge them

x_test_data <- read.table("test/X_test.txt")
aLabel_test_data <- read.table("test/y_test.txt")
subjId_test_data <- read.table("test/subject_test.txt")

x_train_data <- read.table("train/X_train.txt")
aLabel_train_data <- read.table("train/y_train.txt")
subjId_train_data <- read.table("train/subject_train.txt")

raw_data <- rbind(x_test_data, x_train_data)
aLabel_data <- rbind(aLabel_test_data, aLabel_train_data)
subjId_data <- rbind(subjId_test_data, subjId_train_data)

## (2) Extracts only the measurements on the mean and standard deviation
## for each measurement

# (2.1) Extracts the names of features from the file
features <- read.table("features.txt", col.names = c("number", "feature_name"))
features$feature_name <- make.unique(as.character(features$feature_name))

# (2.2) Determins the indexes of the given variable names
## that only correponds to "mean" and "standard deviation" fields
ind <- grep("mean\\(\\)|std\\(\\)", features$feature_name)
extracted_features <- features[ind, ]

# (2.3) Does the requiredls extraction from the combined data frame
extracted_data <- raw_data[,ind ]

# (3) Uses descriptive activity names to name the activities in the data set
activity_names <- read.table("activity_labels.txt", col.names =c("number", "aLabel_name") )
aLabel_data[,1] <- as.factor(aLabel_data[,1])
levels(aLabel_data[,1]) <- activity_names$aLabel_name

extracted_data <- cbind(extracted_data, aLabel_data)

# (4) Appropriately labels the data set with descriptive variable names. 
extracted_data <- cbind(extracted_data, subjId_data)

colnames(extracted_data) <- c(extracted_features$feature_name, "activity_label", "subjId")

# (5) From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.)
tidy_data <- aggregate(extracted_data[,1:66], list(extracted_data$subjId, extracted_data$activity_label), FUN = "mean")
colnames(tidy_data)[1:2] <- c("subjId", "activity_label")

write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)




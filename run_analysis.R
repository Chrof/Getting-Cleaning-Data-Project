# Getting and Cleaning Data - Course Project


#Set working directory to location of dataset
setwd("~/Datascience/Getting-Cleaning-Data-Project")

#Reading data
x_train_data <- read.table("train/X_train.txt")
x_test_data <- read.table("test/X_test.txt")

y_train_data <- read.table("train/y_train.txt")
y_test_data <- read.table("test/y_test.txt")

subject_train_data <- read.table("train/subject_train.txt")
subject_test_data <- read.table("test/subject_test.txt")

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#Merging data
x_data <- rbind(x_train_data, x_test_data)
#head(x_data)
y_data <- rbind(y_train_data, y_test_data)
#head(y_data)
subjects <- rbind(subject_train_data, subject_test_data)
#head(subjects)


#Cleanup feature names 
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])


# Extract only the measurements on the mean and standard deviation for each measurement
mean_std <- grep(".*Mean.*|.*Std.*", features[,2])
x_data <- x_data[, mean_std]
names(x_data) <- features[mean_std, 2]

# Use descriptive activity names to name the activities in the data set
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


# Appropriately label the data set with descriptive variable names
names(subjects) <- "subject"
completeData = cbind(x_data, y_data, subjects)
write.table(completeData, "complete_data.txt", row.name=FALSE)


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summary_data = aggregate(completeData, by=list(activity = completeData$activity, subject=completeData$subject), mean)
write.table(summary_data, "summary_data.txt", row.name=FALSE )





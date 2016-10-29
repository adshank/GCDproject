# run_analysis.R script, created by Adam Shankland, 10/29/2016
# Completes steps 1-4 in Getting and Cleaning Data course project, Coursera
# See README.md for more information about this script

# Set working directory (wd_path must be changed to run script on a different machine)
wd_path <- "C:/Users/adshan/Documents/Coursera/Getting & Cleaning Data/UCI HAR Dataset"
setwd(wd_path)

# -- STEP 1: Merge the training and test sets to create one data set -- #

# Read in activity_labels.txt file as a table, and rename column headers appropriately
# activity_labels links the class labels with their activity name
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("ID", "Activity")

# Read in the features.txt file as a table, and rename column headers appropriately
# features is a list of all features
features <- read.table("features.txt")
names(features) <- c("Feature_ID", "Feature_Name")

# Read in X_train.txt file, and rename column headers from list of features
# x_train is the training set
x_train <- read.table("train/X_train.txt")
names(x_train) <- features$Feature_Name

# Read in y_train.txt file, and rename column header appropriately
# y_train is the set of training labels
y_train <- read.table("train/y_train.txt")
names(y_train) <- "ID"

# Read in the subject_train.txt file, and rename column header appropriately
# Each row in subject_train identifies the subject who performed the activity for each
# window sample. Its range is from 1 to 30
subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- "Subject_ID"

training_labels <- merge(y_train, activity_labels, by.x = "ID", by.y = "ID")
training_data <- cbind(training_labels, subject_train, x_train)

# ---------- Prepare test dataset ---------- #

# Read in X_test.txt file, and rename column headers from list of features
# x_test is the test set
x_test <- read.table("test/X_test.txt")
names(x_test) <- features$Feature_Name

# Read in the y_test.txt file, and rename column header appropriately
# y_test is the set of test labels
y_test <- read.table("test/y_test.txt")
names(y_test) <- "ID"

# Read in the subject_test.txt file, and rename column header appropriately
subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- "Subject_ID"

test_labels <- merge(y_test, activity_labels, by.x = "ID", by.y = "ID")
test_data <- cbind(test_labels, subject_test, x_test)

# Create complete dataset, consisting of training data and test data
complete_data <- rbind(training_data, test_data)

# Check for missing values in complete dataset
sum(is.na(complete_data))

# -- STEP 2: Extract only the measurements on the mean and standard deviation for each measurement -- #

vector_of_locations <- (grep(".*mean.*|.*std.*", ignore.case = TRUE, names(complete_data)))
df_with_stats <- complete_data[vector_of_locations]
df_with_stats <- cbind(complete_data[,1], complete_data[,2], complete_data[,3], df_with_stats)

# -- STEP 3: Uses descriptive activity names -- #
# Step 3 was started during step 1 + finished in step 4

# -- STEP 4: Appropriately label data set -- #
# Also, clean up current column headers

# Rename first three columns, which lost their header in the previous cbind
colnames(df_with_stats)[1] <- "ID"
colnames(df_with_stats)[2] <- "Activity"
colnames(df_with_stats)[3] <- "Subject_ID"

# Tidy up some of the column headers with the gsub command
colnames(df_with_stats) <- gsub("mean", "Mean", colnames(df_with_stats))
colnames(df_with_stats) <- gsub("std", "Std.Dev", colnames(df_with_stats))
colnames(df_with_stats) <- gsub("[()]", "", colnames(df_with_stats))
colnames(df_with_stats) <- gsub("[-]", "", colnames(df_with_stats))

# -- STEP 5: Create a second, independent tidy data set with the avg. of each variable for each activity and each subject

final_dataset <- df_with_stats
final_dataset <- aggregate(final_dataset[, 4:89], list(final_dataset$Activity, final_dataset$Subject_ID), mean)

names(final_dataset)[1] <- "Activity"
names(final_dataset)[2] <- "Subject_ID"

# Write out tidy dataset
write.table(final_dataset, file = "./tidy_dataset.txt", row.names = FALSE)

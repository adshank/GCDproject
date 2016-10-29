# GCDproject
Repo created for course project for "Getting and Cleaning Data" on Coursera.

## run_analysis.R script:
The run_analysis.R script performs all of the execution for this project. The script achieves the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script completes the above tasks by taking the following steps:

- Read in all of the text files provided by Coursera, located in the .zip file
- Rename the column headers appropriately
- Create the training dataset by combining R objects by columns (column labels + subjects + training data)
- Create the test dataset by combining R objects by columns (column labels + subjects + test data)
- Create the complete dataset by combining the training data and test data by rows
- Check for missing data points
- Determine which columns contain mean or standard deviation information
- Trim down dataset to include only columns with mean or standard deviation information
- Clean up column headers
- Get averages for each column
- Write out tidy dataset

## Other noteable things: 
The run_analysis.R script currently reads in data from a local working directory.
In order for a new user to run the script, they need to change the working directory appropriately.
The script will not run properly if the .zip file containing the text files does not exist in the working directory.

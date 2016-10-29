# CodeBook for "Getting and Cleaning Data" course project

This codebook describes the variables, data, and transformations contained in the course project.
The code used for execution in this repository is run_analysis.R.
The README.md describes the process for which the course project is completed.

## Input Data
The following are the data sets that are read in from the .zip folder provided by Coursera. 

- activity_labels - Read in from the "activity_labels.txt" file. Links the class labels with their activity name.
- features - Read in from the "features.txt" file. List of all features.
- x_train - Read in from the "X_train.txt" file. Training set.
- y_train - Read in from the "y_train.txt" file. Training labels.
- subject_train - Read in from the "train/subject_train.txt" file. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- subject_test - Read in from the "test/subject_test.txt" file. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- x_test - Read in from the "test/X_test.txt" file. Test set.
- y_test - Read in from the "test/y_test.txt" file. Test labels.

## Output Data
The following is the data set that is written out from the run_analysis.R script:

- "./tidy_dataset.txt" - table, in .txt form, consisting of the entire final tidy data set.

## Internal Datasets
The following are the data sets that were created within the R environment and used to run the analyses:

- training_data - dataframe consisting of the training data set.
- test_data - dataframe consisting of the test data set.
- complete_data - dataframe consisting of both the training set and the test set.
- vector_of_locations - locations of the columns containing mean/standard deviation information
- df_with_stats - dataframe containing only the label columns and the mean/standard deviation columns
- final_dataset - tidy dataset, consisting of mean/std.dev columns and their average values. This is the dataset that is output.

## Identifiers
The following are the column headers used for the unique row identifiers:

- ID - Test/Train labels, brought in from the y_test/y_train files.
- Activity - The labels used to identify different activities.
- Subject_ID - Identifiers for the different subjects.

## Column Headers
The list below shows the different column headers used in the final tidy dataset. These column headers have been cleaned.

 [1] "Activity"                           "Subject_ID"                        
 [3] "tBodyAccMeanX"                      "tBodyAccMeanY"                     
 [5] "tBodyAccMeanZ"                      "tBodyAccStd.DevX"                  
 [7] "tBodyAccStd.DevY"                   "tBodyAccStd.DevZ"                  
 [9] "tGravityAccMeanX"                   "tGravityAccMeanY"                  
[11] "tGravityAccMeanZ"                   "tGravityAccStd.DevX"               
[13] "tGravityAccStd.DevY"                "tGravityAccStd.DevZ"               
[15] "tBodyAccJerkMeanX"                  "tBodyAccJerkMeanY"                 
[17] "tBodyAccJerkMeanZ"                  "tBodyAccJerkStd.DevX"              
[19] "tBodyAccJerkStd.DevY"               "tBodyAccJerkStd.DevZ"              
[21] "tBodyGyroMeanX"                     "tBodyGyroMeanY"                    
[23] "tBodyGyroMeanZ"                     "tBodyGyroStd.DevX"                 
[25] "tBodyGyroStd.DevY"                  "tBodyGyroStd.DevZ"                 
[27] "tBodyGyroJerkMeanX"                 "tBodyGyroJerkMeanY"                
[29] "tBodyGyroJerkMeanZ"                 "tBodyGyroJerkStd.DevX"             
[31] "tBodyGyroJerkStd.DevY"              "tBodyGyroJerkStd.DevZ"             
[33] "tBodyAccMagMean"                    "tBodyAccMagStd.Dev"                
[35] "tGravityAccMagMean"                 "tGravityAccMagStd.Dev"             
[37] "tBodyAccJerkMagMean"                "tBodyAccJerkMagStd.Dev"            
[39] "tBodyGyroMagMean"                   "tBodyGyroMagStd.Dev"               
[41] "tBodyGyroJerkMagMean"               "tBodyGyroJerkMagStd.Dev"           
[43] "fBodyAccMeanX"                      "fBodyAccMeanY"                     
[45] "fBodyAccMeanZ"                      "fBodyAccStd.DevX"                  
[47] "fBodyAccStd.DevY"                   "fBodyAccStd.DevZ"                  
[49] "fBodyAccMeanFreqX"                  "fBodyAccMeanFreqY"                 
[51] "fBodyAccMeanFreqZ"                  "fBodyAccJerkMeanX"                 
[53] "fBodyAccJerkMeanY"                  "fBodyAccJerkMeanZ"                 
[55] "fBodyAccJerkStd.DevX"               "fBodyAccJerkStd.DevY"              
[57] "fBodyAccJerkStd.DevZ"               "fBodyAccJerkMeanFreqX"             
[59] "fBodyAccJerkMeanFreqY"              "fBodyAccJerkMeanFreqZ"             
[61] "fBodyGyroMeanX"                     "fBodyGyroMeanY"                    
[63] "fBodyGyroMeanZ"                     "fBodyGyroStd.DevX"                 
[65] "fBodyGyroStd.DevY"                  "fBodyGyroStd.DevZ"                 
[67] "fBodyGyroMeanFreqX"                 "fBodyGyroMeanFreqY"                
[69] "fBodyGyroMeanFreqZ"                 "fBodyAccMagMean"                   
[71] "fBodyAccMagStd.Dev"                 "fBodyAccMagMeanFreq"               
[73] "fBodyBodyAccJerkMagMean"            "fBodyBodyAccJerkMagStd.Dev"        
[75] "fBodyBodyAccJerkMagMeanFreq"        "fBodyBodyGyroMagMean"              
[77] "fBodyBodyGyroMagStd.Dev"            "fBodyBodyGyroMagMeanFreq"          
[79] "fBodyBodyGyroJerkMagMean"           "fBodyBodyGyroJerkMagStd.Dev"       
[81] "fBodyBodyGyroJerkMagMeanFreq"       "angletBodyAccMean,gravity"         
[83] "angletBodyAccJerkMean,gravityMean"  "angletBodyGyroMean,gravityMean"    
[85] "angletBodyGyroJerkMean,gravityMean" "angleX,gravityMean"                
[87] "angleY,gravityMean"                 "angleZ,gravityMean" 

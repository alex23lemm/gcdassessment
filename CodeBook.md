# Code book for Samsung tidy data set

This is the code book accompanying the R script `run_analysis.R`. 

Section "Study design"" includes a thorough description of how we collected the data. In addition, it contains information about the summary choices we made.

Section "Code book"" describes each variable of the tidy data set and its units.


## Study design

### Data collection

The data was collected via download from the [following source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted to our R working directory.

### Data identification

A careful inspection of the README file included in the extracted UCI HAR Dataset folder revealed that the relevant data for our project was distributed among 3 different folders:

* UCI HAR Dataset folder: 
  * `features.txt` contains 561 names of the time and frequency domain variables
* train folder:
  * `X_train.txt`: Data of the 561 features for each subject in the training set
  * `y_train.txt`: Activity labels for the training set
  * `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample
* test folder:
  * `X_test.txt`: Data of the 561 features for each subject in the test set
  * `y_test.txt`: Activity labels for the test set
  * `subject_test.txt`: Each row identifies the subject who performed the activity for each window sample

### Data reading

After downloading the data the identified .txt files were read into R via the `read.table` command. Each .txt file was stored in a dedicated variable.

### Data pre-processing

Before we started implementing the instructions of the peer assessment project we  pre-processed the data in 3 steps:
* We excluded the row number column from the feature_names data frame. By this operation the data frame was converted to a vector
* We merged the relevant training data (training_subjects, training_activities, training_set) to get a single data frame (7352 obs, 563 variables) representing the entire training data
* We merged the relevant test data (test_subjects, test_activities, test_set) to get a single data frame (2947 obs, 563 variables) representing the entire test data

### Data processing

Next, we followed the instructions of the peer assessment project web page. 

First, the training set and test data set were merged and column names were added to the resulting data frame (10299 obs, 563 variables).

In a second step, we identified those columns which only contained measurements on the mean and standard deviation. Consulting the `features_info.txt` in the UCI HAR Dataset folder showed that a set of 17 variables were estimated from the signals which used to estimate variables of the feature vector for each pattern. Only 2 of those variables were relevant for us:
* mean(): Mean value
* std(): Standard deviation

Based on this information we used a regular expression to identify the feature columns of choice. We dropped every other feature column which resulted in a data frame with 68 remaining columns (subject, activity, and 66 features).

Thirdly, we used the `mapValues()` function from the `plyr`package to convert the activity number to descriptive activity names in the activity column of the data set. The mapping instructions were included in the `activity_labels.txt` file.

Fourthly, we transformed the feature column names via one `gsub`and two `sub` calls into a camel case to make them more human readable by omitting ')', '(', and '-'.

Next, we used the `ddply` function from the `plyr` package to create a second, independent tidy data set with the average of each variable for each activity and each subject. This operation collapsed the rows tremendously resulting in a data frame with 180 observations and 68 variables. 

In a last step we saved the created tidy data set as a .txt file to our working directory. 






## Code book


The tidy Samsung data set includes 68 variables:

* `activity` identifies the recorded activity of each person. The following 6 activities were recorded during the experiment: walking, walking upstairs, walking downstairs, sitting,standing, laying
* `subject` contains numeric data (numbers between 1 and 30) to identify the 30 volunteers who participated in the original experiment

__IMPORTANT__: Both columns (activity and subject) form the primary key of the Samsung tidy data set because the remaining columns were averaged by activity and by subject

* The remaining 66 variables represent averaged features __by activity and by subject__. They are normalized and bounded within [-1,1].

This is the complete list of the variables:

    activity
    subject
    tBodyAccMeanX
    tBodyAccMeanY 
    tBodyAccMeanZ 
    tBodyAccStdX
    tBodyAccStdY 
    tBodyAccStdZ
    tGravityAccMeanX
    tGravityAccMeanY
    tGravityAccMeanZ
    tGravityAccStdX
    tGravityAccStdY
    tGravityAccStdZ
    tBodyAccJerkMeanX
    tBodyAccJerkMeanY
    tBodyAccJerkMeanZ
    tBodyAccJerkStdX
    tBodyAccJerkStdY
    tBodyAccJerkStdZ
    tBodyGyroMeanX
    tBodyGyroMeanY
    tBodyGyroMeanZ
    tBodyGyroStdX
    tBodyGyroStdY
    tBodyGyroStdZ
    tBodyGyroJerkMeanX
    tBodyGyroJerkMeanY
    tBodyGyroJerkMeanZ
    tBodyGyroJerkStdX
    tBodyGyroJerkStdY
    tBodyGyroJerkStdZ
    tBodyAccMagMean
    tBodyAccMagStd
    tGravityAccMagMean
    tGravityAccMagStd
    tBodyAccJerkMagMean
    tBodyAccJerkMagStd
    tBodyGyroMagMean
    tBodyGyroMagStd
    tBodyGyroJerkMagMean
    tBodyGyroJerkMagStd
    fBodyAccMeanX
    fBodyAccMeanY
    fBodyAccMeanZ
    fBodyAccStdX
    fBodyAccStdY
    fBodyAccStdZ
    fBodyAccJerkMeanX
    fBodyAccJerkMeanY
    fBodyAccJerkMeanZ
    fBodyAccJerkStdX
    fBodyAccJerkStdY
    fBodyAccJerkStdZ
    fBodyGyroMeanX
    fBodyGyroMeanY
    fBodyGyroMeanZ
    fBodyGyroStdX
    fBodyGyroStdY
    fBodyGyroStdZ
    fBodyAccMagMean
    fBodyAccMagStd
    fBodyBodyAccJerkMagMean
    fBodyBodyAccJerkMagStd
    fBodyBodyGyroMagMean
    fBodyBodyGyroMagStd
    fBodyBodyGyroJerkMagMean
    fBodyBodyGyroJerkMagStd
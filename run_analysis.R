# Load libraries ---------------------------------------------------------------

library(data.table)


# Load data --------------------------------------------------------------------

training_set <- read.table('./UCI HAR Dataset/train/X_train.txt')
training_subjects <- read.table('./UCI HAR Dataset/train/subject_train.txt')
training_activities <- read.table('./UCI HAR Dataset/train/y_train.txt')

test_set <- read.table('./UCI HAR Dataset/test/X_test.txt')
test_subjects <- read.table('./UCI HAR Dataset/test/subject_test.txt')
test_activities <- read.table('./UCI HAR Dataset/test/y_test.txt')

feature_names <- read.table('./UCI HAR Dataset/features.txt')


# Pre-process data -------------------------------------------------------------

# Drop the row number column and convert result into character vector to ensure
# setting of column names later
feature_names <- as.character(feature_names[, 2])

training_set <- cbind(training_subjects, training_set, training_activities)
test_set <- cbind(test_subjects, test_set, test_activities)


## Process the data according to peer assessment instructions ------------------

# Merge the training and the test sets
merged_set <- rbind(training_set, test_set)
colnames(merged_set) <- c('subject', feature_names, 'activity')

# Extract only the measurements on the mean and standard deviation for each 
# measurement 

grepl('(.*?)-(mean|std)(.*?)', feature_names[1:10])

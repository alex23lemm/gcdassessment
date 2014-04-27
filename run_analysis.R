# Load libraries ---------------------------------------------------------------

library(plyr)


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

training_set <- cbind(training_subjects, training_activities, training_set)
test_set <- cbind(test_subjects, test_activities, test_set)



## Process the data according to peer assessment instructions ------------------

# 1. Merge the training and the test sets
merged_set <- rbind(training_set, test_set)
colnames(merged_set) <- c('subject', 'activity', feature_names)

# 2. Extract only the measurements on the mean and standard deviation
focus_features <- grepl('(.*)-(mean|std)\\(\\)(.*)', feature_names)
merged_set <- merged_set[, c(TRUE, TRUE, focus_features)]

# 3. Uses descriptive activity names to name the activities in the data set
merged_set$activity <- mapvalues(merged_set$activity , c(1, 2, 3, 4, 5, 6),
                                 c('walking', 'walking upstairs', 
                                   'walking downstairs', 'sitting', 'standing',
                                   'laying'))

# 4. Appropriately labels the data set with descriptive activity names
colnames(merged_set) <- gsub('[-()]', '', colnames(merged_set))
colnames(merged_set) <- sub('mean', 'Mean', colnames(merged_set))
colnames(merged_set) <- sub('std', 'Std', colnames(merged_set))

# 5. Create a second, independent tidy data set with the average of each 
#    variable for each activity and each subject
tidy_set <- ddply(merged_set, c('activity', 'subject'), numcolwise(mean))
write.table(tidy_set, file = "./data/tidy_samsung_data.txt", quote = FALSE,
            row.names = FALSE, sep='\t')





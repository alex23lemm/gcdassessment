# Getting and Cleaning Data Assessment Project

The purpose of this project is to collect and clean human activity data orginally collected during an experiment for building a system for human physical Activity Recognition (AR) using inertial sensors of a Galaxy S2 smartphone.

A full description of the original experiment can be found in the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This repository contains the following files:

* `run_analyis.R`: R script tranforming the original data into a tidy data set according to the peer assessment instructions
* `CodeBook.md`: Describes the variables, the data, and the transformations that were performed to clean up the original data

  
## Installation

### R libraries

You need to install the following R libraries on your machine:

    install.packages('plyr')

### R script

Download `run_analysis.R` from this repository and put it into your R working directory

### Data

* Downlad the original project data from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Extract the downloaded archive to your working directory

After a succesful installation your working directory should contain the following files and folders:

*Note: Only the first two folder levels below the root level are shown here.*

* run_analysis.R
* UCI HAR Dataset
  * test
  * train
  * activity_labels.txt
  * features.txt
  * features_info.txt
  * README.txt
  
  
## Running the R script

After completing the installation you can execute `run_analysis.R` in your R working directory. 

`run_analyis.R` will access the original data contained underneath the `UCI HAR Dataset` folder and do the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Stores the tidy data set as a .txt file to your working directory







---
title: "Code Book"
author: "charzee"
date: "5/10/2020"
output: html_document
---

## Assignment Overview
The assignement outline:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Prerequisites

To run the script, you'll need to download the text files containing the data:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


You'll also need to have the dplyr package installed:  `install.packages("dplyr")`

Once you've downloaded and unzipped the file, you can drop `run_analysis.R` in the **getdata_projectfiles_UCI HAR Dataset** folder.

## Description of `run_analysis.R`

1. Merges the training and the test sets to create one data set.
    + use `read.table` to pull in the following data sets and assign them to corresponding variables:  activities, features, subject_test, x_test, y_test, subject_train, x_train, and y_train.
    + Combine `x_train` and `x_test` into one `x` table
    + Combine `y_train` and `y_test` into one `y` table 
    + Combine `subject_train` and `subject_test` into one table
    + column bind (`cbind`) all three together
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    + use `select` to pull these columns from `step1`: `subject`, `nums`, any column containing "means", and any column containing "std"
    + Assign these into a new table named `step2`
3. Uses descriptive activity names to name the activities in the data set
    + Assign `step2` into a new table named `step3` 
    + Replace numbers in `nums` column with activities found in the `activities` variable from earlier
4. Appropriately labels the data set with descriptive variable names.
    + Assign `step3` into a new table named `step4`
    + Use `gsub` to replace abbreviations and rename columns in `step4`
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
    + Assign `step4` into a new table named `step5`
    + export table to text file using `write.table`

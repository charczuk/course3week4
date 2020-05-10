---
title: "README"
author: "charzee"
date: "5/10/2020"
output: html_document
---


This is a peer-graded assignment for my **Getting and Cleaning Data** course.

## Prerequisites

To run the script, you'll need to download the text files containing the data:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


You'll also need to have the dplyr package installed:  `install.packages("dplyr")`


## Files

List of files contained in this repository

* `CodeBook.md` a code book that outlines data and transformations in `run_analysis.R` and creation of `step5.txt`.
* `run_analysis.R` reads data found in zip file and runs through the 5 steps of the assignment.
* `step5.txt` is the data set containing averages by activity and subject (as outlined in Step 5 of the assignment)
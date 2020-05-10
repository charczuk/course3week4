library(dplyr) #load dplyr package


#########
# 1. merge traing and test sets into one data set

#read files
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("nums", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "nums")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "nums")


#combine into one table
x <- rbind(x_train, x_test)  #row bind x sets
y <- rbind(y_train, y_test)  #row bind y sets
subject <- rbind(subject_train, subject_test)  #row bind subject sets
step1 <- cbind(subject, x, y)  #column bind all together


########
# 2. extract measurements of mean and stdv for each measurement
step2 <- step1 %>% select(subject, nums, contains("mean"), contains("std"))


########
# 3. use descriptive activity names to name activities
#    decipher code column
step3 <- step2
step3$nums <- activities[step3$nums, 2]



########
# 4. apply lables with descriptive names
step4 <- step3
names(step4)[2] = "activity"
names(step4)<-gsub("Acc", "accelerometer", names(step4))
names(step4)<-gsub("Gyro", "gyroscope", names(step4))
names(step4)<-gsub("BodyBody", "body", names(step4))
names(step4)<-gsub("Mag", "magnitude", names(step4))
names(step4)<-gsub("^t", "time", names(step4))
names(step4)<-gsub("^f", "frequency", names(step4))
names(step4)<-gsub("tBody", "timebody", names(step4))
names(step4)<-gsub("-mean()", "mean", names(step4), ignore.case = TRUE)
names(step4)<-gsub("-std()", "standarddeviation", names(step4), ignore.case = TRUE)
names(step4)<-gsub("-freq()", "frequency", names(step4), ignore.case = TRUE)
names(step4)<-gsub("angle", "angle", names(step4))
names(step4)<-gsub("gravity", "gravity", names(step4))


########
# 5. create independent set with average of each variable for each activity and subject
step5 <- step4 %>% group_by(subject, activity) %>% summarise_all(list(mean))
write.table(step5, "step5.txt", row.name=FALSE)


#https://github.com/charczuk/course3week4.git
### You should create one R script called run_analysis.R that does the following.

setwd("~/Coursera/3 Getting and Cleaning Data/Wk4/UCI HAR Dataset")
if (dir.exists("UCI HAR Dataset") == FALSE){
  print("Data files not found")
}

test_set2 <-read.table("test/X_test.txt")
test_set <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

train_set <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

features_labels <- read.table("features.txt")

## 1. Merge the training and the test sets to create one data set.

test_set <- cbind(test_labels,test_set)
test_set <- cbind(subject_test,test_set)

train_set <- cbind(train_labels,train_set)
train_set <- cbind(subject_train,train_set)
df <- rbind(test_set,train_set)


## 2. Extract only the measurements on the mean and standard deviation for each measurement.

variable_names <- c("subject","activity")
for (i in 1:561) {
  variable_names <- c(variable_names, as.character(features_labels[i,2]))
  }
colnames(df) <- variable_names

variable_names_test <- grepl("subject|activity|mean|std", variable_names)

df2 <- df [,variable_names_test]

## 3. Uses descriptive activity names to name the activities in the data set

df2[,2] <- sub("1", "walking",df2[,2])
df2[,2] <- sub("2", "walking_upstairs",df2[,2])
df2[,2] <- sub("3", "walking_downstairs",df2[,2])
df2[,2] <- sub("4", "sitting",df2[,2])
df2[,2] <- sub("5", "standing",df2[,2])
df2[,2] <- sub("6", "laying",df2[,2])

## 4. Appropriately labels the data set with descriptive variable names.

colnames2 <- names(df2[3:42])
colnames2a <- sub("t","Time",colnames2)
colnames3 <- names(df2[43:81])
colnames3a <- sub("f","Freq",colnames3)
colnames(df2) <- c("subject","activity", colnames2a,colnames3a)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
df3 <- melt(df2,id=c("subject","activity"))
df4 <- dcast(df3, subject + activity ~ variable, mean)

df4






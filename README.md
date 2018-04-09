# GCDFinalAssignment

## Preliminary step: checks to see if the data exists and reads the data into R using read.table()

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

## Step 1. The following code merges the training and the test sets to create one data set.
## This is done by firstly using cbind() to to merge the activity (i.e. 'test labels', in number format) and subject identifiers together with the data, and then rbind() to merge the test and training sets together.

test_set <- cbind(test_labels,test_set)

test_set <- cbind(subject_test,test_set)

train_set <- cbind(train_labels,train_set)

train_set <- cbind(subject_train,train_set)

df <- rbind(test_set,train_set)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.
## This is done by firstly updating the column names in the merged data set with names provided in the original data (features.txt) to the activity columns. A vector (variable_names) is created with activity and subject as the first two entries, and then a loop function is used to add each of the 561 variable names from the features described in the original dataset. 
## From variable_names, another logical true/false vector (variable_names_test) is created using the grepl() function to filter only thoses variable continaing 'subject', 'activity', 'mean' and 'std'. This logical vector is then applied to subset the mereged dataset (df) to obtain only the columns on mean and std for the required subset (df2). 

variable_names <- c("subject","activity")
for (i in 1:561) {
  variable_names <- c(variable_names, as.character(features_labels[i,2]))
  }
colnames(df) <- variable_names

variable_names_test <- grepl("subject|activity|mean|std", variable_names)

df2 <- df [,variable_names_test]

## 3. Uses descriptive activity names to name the activities in the data set
## This is done by substituting the numbers within the activity column of the working dataset (df2) with thieir activity names. 

df2[,2] <- sub("1", "walking",df2[,2])
df2[,2] <- sub("2", "walking_upstairs",df2[,2])
df2[,2] <- sub("3", "walking_downstairs",df2[,2])
df2[,2] <- sub("4", "sitting",df2[,2])
df2[,2] <- sub("5", "standing",df2[,2])
df2[,2] <- sub("6", "laying",df2[,2])

## 4. Appropriately labels the data set with descriptive variable names.
## The variable names used in the orginal data have already been added at an earlier stage in order to facilitate subsetting (see step 2 above). The following code modifies those names, to make them more understandable to the user. 

colnames2 <- names(df2[3:42])
colnames2a <- sub("t","Time",colnames2)
colnames3 <- names(df2[43:81])
colnames3a <- sub("f","Freq",colnames3)
colnames(df2) <- c("subject","activity", colnames2a,colnames3a)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## This is done using the melt() command in the reshape2 package, and then reconstructing the dataframe (df4) grouped by subject and activity, and with the mean function applied to obtain the average for each subject-activity combination (a total of 180) for each variable , as required.

library(reshape2)
df3 <- melt(df2,id=c("subject","activity"))
df4 <- dcast(df3, subject + activity ~ variable, mean)

write.table(df4, file="tidydataset.txt", row.name=FALSE)

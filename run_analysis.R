# Getting and Cleaning Data - Course Project
# Uses data sourced from....
#       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# This project script does the following...
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names
# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

#Read the input files
table1 <- read.table("train/X_train.txt")
table2 <- read.table("test/X_test.txt")

table3 <- read.table("train/subject_train.txt")
table4 <- read.table("test/subject_test.txt")

table5 <- read.table("train/y_train.txt")
table6 <- read.table("test/y_test.txt")

# Merge the data
tableX <- rbind(table1, table2)
tableSubj <- rbind(table3, table4)
tableY <- rbind(table5, table6)

# Extracts measurements on the mean and standard deviation for each measurement.

tableFeat <- read.table("features.txt")
indexFeat <- grep("-mean\\(\\)|-std\\(\\)", tableFeat[, 2])
X <- X[, indexFeat]
names(tableX) <- tableFeat[indexFeat, 2]
names(tableX) <- gsub("\\(|\\)", "", names(tableX))
names(tableX) <- tolower(names(tableX)) 

#Uses descriptive activity names to name the activities in the data set

tableActiv <- read.table("activity_labels.txt")
tableActiv[, 2] = gsub("_", "", tolower(as.character(tableActiv[, 2])))
tableY[,1] = tableActiv[tableY[,1], 2]
names(tableY) <- "activity"

#Label the data set with descriptive activity names.

names(tableSubj) <- "subject"
tableClean <- cbind(tableSubj, tableY, tableX)
write.table(tableClean, "cleanData.txt")

# Create independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(tableSubj)[,1]
numSubjects = length(unique(tableSubj)[,1])
numActivities = length(tableActiv[,1])
numCols = dim(tableClean)[2]
result = tableClean[1:(numSubjects*numActivities), ]

row = 1
for (sCtr in 1:numSubjects) {
  for (aCtr in 1:numActivities) {
    result[row, 1] = uniqueSubjects[sCtr]
    result[row, 2] = activities[aCtr, 2]
    tmp <- tableClean[tableClean$subject==sCtr & tableClean$activity==activities[aCtr, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidy_data_set.txt")
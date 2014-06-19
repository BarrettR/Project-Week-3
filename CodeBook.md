This project uses data sourced from.... 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project script performs the following as required by the assignment...

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names
Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

The script begins by reading the data into temporary data frames.
Next, the temporary data frames are merged to create data frames containing the number of instances, number of attributes, subject IDs and Activity IDs.

The next section of code extracts measurements on the mean and standard deviation for each measurement using the features.txt data set.

The code then reads the activity_labels.txt data and applies descriptive names. In the process the names are clened up by removing underscores, spaces, and uppercase characters.

Subject, activity, and feature dataframes are then merged. Data is out put to "cleanData.txt"

The tidy data set is then output to "tidy_data_set.txt". THis file contains Subject ID, activity names, and attribute averages.


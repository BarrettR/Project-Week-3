Getting and Cleaning Data - Week 3 Project.
==========================================================


This project uses data sourced from....
       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 This project script performs the following as required by the assignment...
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive activity names
 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

To run the script, you must first download and then extract the data from the source website. 
The extracted data should reside in your working directory and will create sub directories for .\test and .\train

Running the script will take several seconds and will produce two output files. 
The final tidy data set will be in the file "tidy_data_set.txt"

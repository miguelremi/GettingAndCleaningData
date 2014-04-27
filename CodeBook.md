# Description of data
Original data set is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Inside ZIP file you can find a README.txt file describing this dataset.

There are test data and and train data sets that will be merged in our final data. Once merged measures are grouped in groups with distinct subject and activity and all other variables are summarized by using the mean within a group.
There are a total of 180 groups (rows) in final data corresponding to 30 subjects with 6 types of activities.

# Data Set

Grouping data:
* Subject: an integer identifier for the person who did the activity.
* Activity: string describing the type of activity.

Only variables containing "-mean" or "-std" are included in final data. Parenthesis in column names are removed and "-" is replaced with underscore "_" character.

Mean values from Original Dataset (mean values obtained for each group for every variable) (see features_info.txt in ZIP file for description of ungrouped values. Mean is calculated for each group, even if it is not described what is the interpretation of that mean):

tBodyAcc_mean_XYZ
tBodyAcc_std_XYZ
tGravityAcc_mean_XYZ
tGravityAcc_std_XYZ
tBodyAccJerk_mean_XYZ
tBodyAccJerk_std_XYZ
tBodyGyro_mean_XYZ
tBodyGyro_std_XYZ
tBodyGyroJerk_mean_XYZ
tBodyGyroJerk_std_XYZ
tBodyAccMag_mean
tBodyAccMag_std
tGravityAccMag_mean
tGravityAccMag_std
tBodyAccJerkMag_mean
tBodyAccJerkMag_std
tBodyGyroMag_mean
tBodyGyroMag_std
tBodyGyroJerkMag_mean
tBodyGyroJerkMag_std
fBodyAcc_mean_XYZ
fBodyAcc_std_XYZ
fBodyAcc_meanFreq_XYZ
fBodyAccJerk_mean_XYZ
fBodyAccJerk_std_XYZ
fBodyAccJerk_meanFreq_XYZ
fBodyGyro_mean_XYZ
fBodyGyro_std_XYZ
fBodyGyro_meanFreq_XYZ
fBodyAccMag_mean
fBodyAccMag_std
fBodyAccMag_meanFreq
fBodyBodyAccJerkMag_mean
fBodyBodyAccJerkMag_std
fBodyBodyAccJerkMag_meanFreq
fBodyBodyGyroMag_mean
fBodyBodyGyroMag_std
fBodyBodyGyroMag_meanFreq
fBodyBodyGyroJerkMag_mean
fBodyBodyGyroJerkMag_std
fBodyBodyGyroJerkMag_meanFreq
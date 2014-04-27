# Peer review for Week 3.

# Do not read string as factors
options(stringsAsFactors=FALSE)

# Read features table describing X_train and X_test data columns
#   There are 561 rows like this:
#   <column index> <feature name>
features <- read.table("features.txt")

# Select the columns we are interested on:
#    -> thouse with substring "-std" and "-mean"
colNumbers <- grep(pattern="-std|-mean", features[,2])

# X_train and X_test are quite large and we do not want to read all 561
#   columns, just thouse columns with index stored in previous "colNumbers".
#
#   Filtering will save a big amount of memory. It can be achieved by using
#   colClasses argument for read.table (see ?read.table, colClasses, "NULL"
#   value inside colClasses array)
colClassesArg <- rep("NULL", nrow(features)) # Initialize as all columns skipped
colClassesArg[colNumbers] <- "numeric" # Then set "num" to columns we want to read.

# Escape column names
# Remove parenthesis and replace "-" with "_" symbol
featureColumnNames <- gsub("-", "_", gsub("\\(|\\)","", features[, 2]))

# Read train data
subject_train <- read.table(file="train/subject_train.txt", head=FALSE,
                            col.names = "Subject")
X_train <- read.table(file="train/X_train.txt", head=FALSE,
                      colClasses=colClassesArg,
                      col.names=featureColumnNames)
Y_train <- read.table(file="train/Y_train.txt", head=FALSE)


# Read test data
subject_test <- read.table(file="test/subject_test.txt", head=FALSE,
                           col.names = "Subject")
X_test <- read.table(file="test/X_test.txt", head=FALSE,
                     colClasses=colClassesArg,
                     col.names=featureColumnNames)
Y_test <- read.table(file="test/Y_test.txt", head=FALSE)

# Read activity labels
activity_labels <- read.table(file="activity_labels.txt", head=FALSE)

# Use activity name based on Y_test and Y_train instead of just numbers
Y_test_activity_name <- as.data.frame(activity_labels[Y_test[,1],2])
colnames(Y_test_activity_name) <- "Activity"
Y_train_activity_name <- as.data.frame(activity_labels[Y_train[,1],2])
colnames(Y_train_activity_name) <- "Activity"


# Combine subject, activity and features for test and train data into "data"
data <- rbind(cbind(subject_test, Y_test_activity_name, X_test),
             cbind(subject_train, Y_train_activity_name, X_train))

# Use aggregate to summarize average of each variable for each activity and each subject
#  So there should be a group for each combination of subject and activity.
tidydata <-aggregate(data[,3:ncol(data)], by=list(subject = data$Subject, activity = data$Activity), FUN=mean)

# Write to file (with column names)
write.table(tidydata, file="tidydata.txt", row.names=FALSE, col.names=TRUE)









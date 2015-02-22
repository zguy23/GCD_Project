library(dplyr)
# Read in data.  The UCI HAR Dataset directory must be in the local directory where this script is stores in order to run.
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Extract feature names from features
feature_names <- features[ ,2]

# Add column names to x_test and x_train using feature_names
names(x_test) <- feature_names
names(x_train) <- feature_names

# Rename column in sub_train, sub_test, y_train and y_test
names(sub_train) <- c("Subject")
names(sub_test) <- c("Subject")
names(y_train) <- c("Activity")
names(y_test) <- c("Activity")

# Replace activity number in Activity column with description for both
# y_train and y_test
y_train$Activity <- gsub('1','WALKING',y_train$Activity)
y_train$Activity <- gsub('2','WALKING_UPSTAIRS',y_train$Activity)
y_train$Activity <- gsub('3','WALKING_DOWNSTAIRS',y_train$Activity)
y_train$Activity <- gsub('4','SITTING',y_train$Activity)
y_train$Activity <- gsub('5','STANDING',y_train$Activity)
y_train$Activity <- gsub('6','LAYING',y_train$Activity)

y_test$Activity <- gsub('1','WALKING',y_test$Activity)
y_test$Activity <- gsub('2','WALKING_UPSTAIRS',y_test$Activity)
y_test$Activity <- gsub('3','WALKING_DOWNSTAIRS',y_test$Activity)
y_test$Activity <- gsub('4','SITTING',y_test$Activity)
y_test$Activity <- gsub('5','STANDING',y_test$Activity)
y_test$Activity <- gsub('6','LAYING',y_test$Activity)

# Combine x_train, y_train and sub_train DFs together
x_train <- cbind(x_train,y_train)
x_train <- cbind(x_train,sub_train)

# Repeat prior step for x_test, y_test and sub_test
x_test <- cbind(x_test,y_test)
x_test <- cbind(x_test,sub_test)

# Combine x_train with y_train DFs
x_train_test <- rbind(x_train,x_test)

# Subset x_train_test to only include Subject, Activiy plus any colummns or variables which contain mean or standard deviation.
## This is done in three steps.

## Step 1, find all variables that contain mean calculations.  Denoted by mean() according features_info.txt
mean_cols <- names(x_train_test[grep("mean\\(\\)",names(x_train_test), ignore.case = TRUE)])

## Step 2, find all variables that contain standard deviaton (std) calculations.  Denoted by std() according features_info.txt
std_cols <- names(x_train_test[grep("std\\(\\)",names(x_train_test), ignore.case = TRUE)])

## Step 3, subset x_train_test using mean_cols, mean_std, Activity and Subject
tidy_data <- x_train_test[, c("Subject","Activity", mean_cols, std_cols)]

# Cleanup column / variable names in tidy_data
names(tidy_data) <- gsub('BodyBody','Body',names(tidy_data))

# Remove unsupported characters from column / variable names in tidy_data
names(tidy_data) <- gsub('-','.',names(tidy_data))  # Remove '-'
names(tidy_data) <- gsub('\\(','',names(tidy_data))  # Remove '('
names(tidy_data) <- gsub(')','',names(tidy_data))  # Remove ')'
names(tidy_data) <- gsub('\\.','',names(tidy_data))  # Remove '.'
# Replace 1st occurence of fB with FreqB.  Eg.  fBody will become FreqBody
names(tidy_data) <- sub('fB','FreqB',names(tidy_data))
# Replace 1st occurance of std with Std.  E.g. std will become Std
names(tidy_data) <- sub('std','Std',names(tidy_data))
# Replace 1st occurence od mean with Mean.
names(tidy_data) <- sub('mean','Mean',names(tidy_data))

# Arrange (sort) DF by Subject and Activity
tidy_data <- arrange(tidy_data,Subject,Activity)

# Set groups in order to aggregate data by Subject and Activity
tidy_data_groups <- group_by(tidy_data,Subject,Activity)

# Calculate the mean for each variable / column in the table
tidy_data_summary <- summarise_each(tidy_data_groups,funs(mean))

# Command to write out table if needed.  Uncomment if needed.
#write.table(tidy_data_summary,"tidy_data.txt",row.names=FALSE)

<h3>CodeBook for run_analysis.R</h3>

<p>The following steps were taken to process the data from Human Activity Recognition Using Smartphones Data Set.  It can be downloaded from:</p>

<p>[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]</p>

<h4>Steps Taken to Process Raw Data</h4>

<ol>
<li>Using read.table, read in subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt, features.txt and activity_labels.txt files and store them accordingly.</li>
<li>Extract feature names from the features.txt file by subsetting.  This files contain the names of the variables recored by the experiment.</li>
<li>Update the default column names in x_train and x_test data frames using the names() function with the data from step 2.</li>
<li>Update the default column name in the sub_train, sub_test, y_train and y_test data frames.  These data frames only contain one column, Subject and Activity information.  The names() function was used here again.</li>
<li>Replace the activity number with its character representation in y_train and y_test by looking up the meaning in the activity_labels.txt file.  This was done using gsub(). </li>
<li>Merge x_test, y_test and sub_test data frames together using the cbind().</li>
<li>Repeat step 6 with x_train, y_train and sub_train data frames.</li>
<li>Merge x_train and x_test data frames with rbind().  Store this into a new data frame called x_train_test.</li>
<li>Using grep, find the variable names which contain mean() or std() in their name.  The features_info.txt file states the variables with the "()" after mean or std indicate mean and standard deviation respectively.  There are 33 variables each for mean and standard deviation.  Store the results in mean_cols and std_cols.</li>
<li>Subset the data frame created from step 8, x_train_test, using variables required for project.  I selected Subject, Activity, and the mean and standard deviation variables found from the prior step.  This is subsetted data frame is stored in tidy_data.</li>
<li>Using sub() and gsub(), cleanup variable names.  E.g. Remove duplicate words and characters such as ".", "(", ")" and ",".</li>
<li>Sort the tidy_data data frame using arrange() by Subject and Activity variables.</li>
<li>Since we are asked to provide averages of the variables I used the group_by() function to do so.  The groups selected were Subject and Activity.</li>
<li>Finally, aggregate or summarize data using the summarize_each function on the data frame created in step 13.</li>
<li>The tidy_data frame is now complete per project requirements.  The data frame contains 10299 rows and 68 columns.</li>
</ol>

<h2>CodeBook.md</h2>

<p>This file contain variable names and descriptions of each.</p>

- tBodyAccMeanX - average value of mean values of the time Body acceleration signals in the x direction by volunteer and activity 
tBodyAccMeanY average value of mean values of the time Body acceleration signals in the y direction by volunteer and activity 
tBodyAccMeanZ average value of mean values of the time Body acceleration signals in the z direction by volunteer and activity 
tGravityAccMeanX average value of mean values of the time Gravity acceleration signals in the x direction by volunteer and activity 
tGravityAccMeanY average value of mean values of the time Gravity acceleration signals in the y direction by volunteer and activity 
tGravityAccMeanZ average value of mean values of the time Gravity acceleration signals in the z direction by volunteer and activity <br />
tBodyAccJerkMeanX average value of mean values of the time body linear acceleration Jerk signals  in the x direction by volunteer and acitivity
tBodyAccJerkMeanY average value of mean values of the time body linear acceleration Jerk signals  in the y direction by volunteer and acitivity
tBodyAccJerkMeanZ average value of mean values of the time body linear acceleration Jerk signals  in the z direction by volunteer and acitivity
tBodyGyroMeanX average value of mean values of the time Body gyroscope signals in the x direction by volunteer and activity
tBodyGyroMeanY average value of mean values of the time Body gyroscope signals in the y direction by volunteer and activity
tBodyGyroMeanZ average value of mean values of the time Body gyroscope signals in the z direction by volunteer and activity
tBodyGyroJerkMeanX average value of mean values of the time body gyroscope Jerk signals  in the x direction by volunteer and acitivity
tBodyGyroJerkMeanY average value of mean values of the time body gyroscope Jerk signals  in the y direction by volunteer and acitivity
tBodyGyroJerkMeanZ average value of mean values of the time body gyroscope Jerk signals  in the z direction by volunteer and acitivity
tBodyAccMagMean average value of mean values of the magnitude of the Body acceleration signals by volunteer and acitivity
tGravityAccMagMean average value of mean values of the magnitude of the Gravity acceleration signals by volunteer and acitivity
tBodyAccJerkMagMean average value of mean values of the magnitude (body linear acceleration,time Jerk signals) by volunteer and acitivity
tBodyGyroMagMean average value of mean values of time magnitude Body gyroscope signals  by volunteer and activity
tBodyGyroJerkMagMean average value of mean values of the magnitudes of time body gyroscope Jerk signals by volunteer and acitivity
FreqBodyAccMeanX average value of mean values of frequency domain body acceleration signals in the x direction by volunteer and activity 
FreqBodyAccMeanY average value of mean values of frequency domain body acceleration signals in the y direction by volunteer and activity 
FreqBodyAccMeanZ average value of mean values of frequency domain body acceleration signals in the z direction by volunteer and activity 
FreqBodyAccJerkMeanX average value of mean values of the frequency domain body linear acceleration Jerk signals in the x direction by volunteer and acitivity
FreqBodyAccJerkMeanY average value of mean values of the frequency domain body linear acceleration Jerk signals in the y direction by volunteer and acitivity
FreqBodyAccJerkMeanZ average value of mean values of the frequency domain body linear acceleration Jerk signals in the z direction by volunteer and acitivity
FreqBodyGyroMeanX average value of mean values of frequency domain Body gyroscope signals in the x direction by volunteer and activity
FreqBodyGyroMeanY average value of mean values of frequency domain Body gyroscope signals in the y direction by volunteer and activity
FreqBodyGyroMeanZ average value of mean values of frequency domain Body gyroscope signals in the z direction by volunteer and activity
FreqBodyAccMagMean average value of mean values of the magnitude of the frequency domain Body acceleration signals by volunteer and acitivity
FreqBodyAccJerkMagMean average value of mean values of the magnitude of the frequency domain Body acceleration Jerk signals by volunteer and acitivity
FreqBodyGyroMagMean average value of mean values of magnitude of frequency domain Body gyroscope signals  by volunteer and activity
FreqBodyGyroJerkMagMean average value of mean values of the magnitudes of frequency domain body gyroscope Jerk signals by volunteer and acitivity
tBodyAccStdX average value of standard deviations of the time Body acceleration signals in the x direction   by volunteer and activity 
tBodyAccStdY average value of standard deviations of the time Body acceleration signals in the y direction   by volunteer and activity 
tBodyAccStdZ average value of standard deviations of the time Body acceleration signals in the z direction   by volunteer and activity 
tGravityAccStdX average value of standard deviations of the time Gravity acceleration signals in the x direction by volunteer and activity 
tGravityAccStdY average value of standard deviations of the time Gravity acceleration signals in the y direction by volunteer and activity 
tGravityAccStdZ average value of standard deviations of the time Gravity acceleration signals in the z direction by volunteer and activity <br />
tBodyAccJerkStdX average value of standard deviations of the time body linear acceleration Jerk signals in the x direction by volunteer and acitivity
tBodyAccJerkStdY average value of standard deviations of the time body linear acceleration Jerk signals in the y direction by volunteer and acitivity
tBodyAccJerkStdZ average value of standard deviations of the time body linear acceleration Jerk signals  in the z direction by volunteer and acitivity
tBodyGyroStdX average value of standard deviations of the time Body gyroscope signals in the x direction by volunteer and activity
tBodyGyroStdY average value of standard deviations of the time Body gyroscope signals in the y direction by volunteer and activity
tBodyGyroStdZ average value of standard deviations of the time Body gyroscope signals in the z direction by volunteer and activity
tBodyGyroJerkStdX average value of standard deviations of the time body gyroscope Jerk signals  in the x direction by volunteer and acitivity
tBodyGyroJerkStdY average value of standard deviations of the time body gyroscope Jerk signals  in the y direction by volunteer and acitivity
tBodyGyroJerkStdZ average value of standard deviations of the time body gyroscope Jerk signals  in the z direction by volunteer and acitivity
tBodyAccMagStd average value of standard deviations of the magnitude of the Body acceleration signals by volunteer and acitivity
tGravityAccMagStd average value of standard deviations of the magnitude of the Gravity acceleration signals by volunteer and acitivity
tBodyAccJerkMagStd average value of standard deviations of the magnitude (body linear acceleration,time Jerk signals) by volunteer and acitivity</p>

<ul>
<li>tBodyGyroMagStd - average value of
standard deviations of magnitude Body
gyroscope signals  by volunteer and
activity </li>
<li>tBodyGyroJerkMagStd average
value of standard deviations of the
magnitudes of time body gyroscope
Jerk signals by volunteer and
acitivity 
FreqBodyAccStdX average
value of standard deviations
frequency domain body acceleration
signals in the x direction by
volunteer and activity 
FreqBodyAccStdY average value of
standard deviations frequency domain
body acceleration signals in the y
direction by volunteer and activity
FreqBodyAccStdZ average value of
standard deviations frequency domain
body acceleration signals in the z
direction by volunteer and activity
FreqBodyAccJerkStdX average value of
standard deviations of the frequency
domain body linear acceleration Jerk
signals in the x direction by
volunteer and acitivity
FreqBodyAccJerkStdY average value of
standard deviations of the frequency
domain body linear acceleration Jerk
signals in the y direction by
volunteer and acitivity
FreqBodyAccJerkStdZ average value of
standard deviations of the frequency
domain body linear acceleration Jerk
signals in the z direction by
volunteer and acitivity
FreqBodyGyroStdX average value of
standard deviations of frequency
domain Body gyroscope signals in the
x direction by volunteer and activity
FreqBodyGyroStdY average value of
standard deviations of frequency
domain Body gyroscope signals in the
y direction by volunteer and activity
FreqBodyGyroStdZ average value of
standard deviations of frequency
domain Body gyroscope signals in the
x direction by volunteer and activity
FreqBodyAccMagStd average value of
standard deviations of the magnitude
of the frequency domain Body
acceleration signals by volunteer and
acitivity FreqBodyAccJerkMagStd
average value of standard deviations
of the magnitude of the frequency
domain Body acceleration Jerk signals
by volunteer and acitivity
FreqBodyGyroMagStd average value of
standard deviations of magnitude of
frequency domain Body gyroscope
signals  by volunteer and activity
FreqBodyGyroJerkMagStd average value
of standard deviations of the
magnitudes of frequency domain body
gyroscope Jerk signals by volunteer
and acitivity</li>
</ul>
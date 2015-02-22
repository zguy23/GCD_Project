<h3>CodeBook for run_analysis.R</h3>

<p>The following steps were taken to process the data from Human Activity Recognition Using Smartphones Data Set.  It can be downloaded from:</p>

<p><a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a></p>

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
<h1>Getting and Cleaning Data class project</h1>

<p>This README is for the Getting and Cleaning Data class project at Johns Hopkins University.  The data used for 
this course can be downloaded at the following website. <br />
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</p>

<p>This repo contains the following three files.  </p>

<ul>
<li>README.md</li>
<li>run_analysis.R</li>
<li>CodeBook.md</li>
</ul>

<p>This README file contains links to the data used and specific steps taken to process the raw data taken from the 
above mentioned website.  The run_analysis.R contains the actual code used to process the data from the
downloaded raw dataset to the tidy data set that it produces.  The CodeBook.md contains information about
the variables and information about how I have chose to summarize the data.</p>

<h2>Project Objective</h2>

<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for
each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names. </li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

<h2>run_analysis.R Script</h2>

<p>*Notes prior to execution</p>

<ol>
<li>Download the data from the URL above and unzip it in the directory of choice.</li>
<li>Download the run_analysis.R script into the directory above.  This directory should contain the "UCI HAR Dataset" directory along with the test and train subdirectories.</li>
</ol>

<h4>Steps Taken to Process Raw Data</h4>

<ol>
<li>Using read.table, read in subject<em>train.txt, X</em>train.txt, y<em>train.txt, subject</em>test.txt, X<em>test.txt, y</em>test.txt, features.txt and activity_labels.txt files and store them accordingly.</li>
<li>Extract feature names from the features.txt file by subsetting.  This files contain the names of the variables recored by the experiment.</li>
<li>Update the default column names in x<em>train and x</em>test data frames using the names() function with the data from step 2.</li>
<li>Update the default column name in the sub<em>train, sub</em>test, y<em>train and y</em>test data frames.  These data frames only contain one column, Subject and Activity information.  The names() function was used here again.</li>
<li>Replace the activity number with its character representation in y<em>train and y</em>test by looking up the meaning in the activity_labels.txt file.  This was done using gsub(). </li>
<li>Merge x<em>test, y</em>test and sub_test data frames together using the cbind().</li>
<li>Repeat step 6 with x<em>train, y</em>train and sub_train data frames.</li>
<li>Merge x<em>train and x</em>test data frames with rbind().</li>
<li>Using grep, find the variable names which contain mean() or std() in their name.  The features<em>info.txt file states the variables with the "()" after mean or std indicate mean and standard deviation respectively.  Store the results in mean</em>cols and std_cols.</li>
<li>Subset the data frame created from step 8, x<em>train</em>test, using variables required for project.  I selected Subject, Activity, and the mean and standard deviation variables found from the prior step.  This is subsetted data frame is stored in tidy_data.</li>
<li>Using sub() and gsub(), cleanup variable names.  E.g. Remove duplicate words and characters such as ".", "(", ")" and ",".</li>
<li>Sort the tidy_data data frame using arrange() by Subject and Activity variables.</li>
<li>Since we are asked to provide averages of the variables I used the group_by() function to do so.  The groups selected were Subject and Activity.</li>
<li>Finally, aggregate or summarize data using the summarize_each function on the data frame created in step 13.</li>
<li>The tidy_data frame is now complete per project requirements.  </li>
</ol>

<h2>CodeBook.md</h2>

<p>This file contain variable names and descriptions of each.</p>
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

<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=macintosh">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link rel=File-List href="variables_fin_files/filelist.xml">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl65
	{mso-style-parent:style0;
	vertical-align:top;
	white-space:normal;}
-->
</style>
</head>

<body link=blue vlink=purple>

<table border=0 cellpadding=0 cellspacing=0 width=728 style='border-collapse:
 collapse;table-layout:fixed;width:728pt'>
 <col class=xl65 width=65 style='width:65pt'>
 <col class=xl65 width=147 style='mso-width-source:userset;mso-width-alt:6272;
 width:147pt'>
 <col class=xl65 width=516 style='mso-width-source:userset;mso-width-alt:22016;
 width:516pt'>
 <tr height=15 style='height:15.0pt'>
  <td height=15 class=xl65 align=right width=65 style='height:15.0pt;
  width:65pt'><a name="Print_Area">1</a></td>
  <td class=xl65 width=147 style='width:147pt'>Subject</td>
  <td class=xl65 width=516 style='width:516pt'>Subject that was performing
  specific activity.</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>2</td>
  <td class=xl65 width=147 style='width:147pt'>Activity</td>
  <td class=xl65 width=516 style='width:516pt'>Represents one of 6 subjects
  activities that were measured.
  E.g.&quot;WALKING&quot;,&quot;WALKING_UPSTAIRS&quot;,&quot;WALKING_DOWNSTAIRS&quot;,&quot;SITTING&quot;,&quot;STANDING&quot;,&quot;LAYING&quot;</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>3</td>
  <td class=xl65 width=147 style='width:147pt'><a name="untitled_text">tBodyAccMeanX</a></td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body acceleration signals in the x direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>4</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body acceleration signals in the y direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>5</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body acceleration signals in the z direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>6</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Gravity acceleration signals in the x direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>7</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Gravity acceleration signals in the y direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>8</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Gravity acceleration signals in the z direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>9</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body linear acceleration Jerk signals<span
  style="mso-spacerun:yes">&nbsp; </span>in the x direction by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>10</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body linear acceleration Jerk signals<span
  style="mso-spacerun:yes">&nbsp; </span>in the y direction by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>11</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body linear acceleration Jerk signals<span
  style="mso-spacerun:yes">&nbsp; </span>in the z direction by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>12</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body gyroscope signals in the x direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>13</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body gyroscope signals in the y direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>14</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time Body gyroscope signals in the z direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>15</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the x direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>16</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the y direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>17</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the z direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>18</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitude of the Body acceleration signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>19</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitude of the Gravity acceleration signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>20</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitude (body linear acceleration,time Jerk signals) by volunteer and
  acitivity</td>
 </tr>
 <tr height=15 style='height:15.0pt'>
  <td height=15 class=xl65 align=right width=65 style='height:15.0pt;
  width:65pt'>21</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of time
  magnitude Body gyroscope signals<span style="mso-spacerun:yes">&nbsp;
  </span>by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>22</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitudes of time body gyroscope Jerk signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>23</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain body acceleration signals in the x direction by volunteer
  and activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>24</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain body acceleration signals in the y direction by volunteer
  and activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>25</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain body acceleration signals in the z direction by volunteer
  and activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>26</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  frequency domain body linear acceleration Jerk signals in the x direction by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>27</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  frequency domain body linear acceleration Jerk signals in the y direction by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>28</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  frequency domain body linear acceleration Jerk signals in the z direction by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>29</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroMeanX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain Body gyroscope signals in the x direction by volunteer and
  activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>30</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroMeanY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain Body gyroscope signals in the y direction by volunteer and
  activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>31</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroMeanZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  frequency domain Body gyroscope signals in the z direction by volunteer and
  activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>32</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitude of the frequency domain Body acceleration signals by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>33</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitude of the frequency domain Body acceleration Jerk signals by volunteer
  and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>34</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of
  magnitude of frequency domain Body gyroscope signals<span
  style="mso-spacerun:yes">&nbsp; </span>by volunteer and activity</td>
 </tr>
 <tr height=30 style='page-break-before:always;height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>35</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroJerkMagMean</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of mean values of the
  magnitudes of frequency domain body gyroscope Jerk signals by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>36</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body acceleration signals in the x direction<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>by volunteer and activity<span
  style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>37</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body acceleration signals in the y direction<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>by volunteer and activity<span
  style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>38</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body acceleration signals in the z direction<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>by volunteer and activity<span
  style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>39</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Gravity acceleration signals in the x direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>40</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Gravity acceleration signals in the y direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>41</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Gravity acceleration signals in the z direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>42</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body linear acceleration Jerk signals in the x direction by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>43</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body linear acceleration Jerk signals in the y direction by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>44</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body linear acceleration Jerk signals<span
  style="mso-spacerun:yes">&nbsp; </span>in the z direction by volunteer and
  acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>45</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body gyroscope signals in the x direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>46</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body gyroscope signals in the y direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>47</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time Body gyroscope signals in the z direction by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>48</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the x direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>49</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the y direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>50</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the time body gyroscope Jerk signals<span style="mso-spacerun:yes">&nbsp;
  </span>in the z direction by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>51</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitude of the Body acceleration signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>52</td>
  <td class=xl65 width=147 style='width:147pt'>tGravityAccMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitude of the Gravity acceleration signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>53</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyAccJerkMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitude (body linear acceleration,time Jerk signals) by volunteer and
  acitivity</td>
 </tr>
 <tr height=15 style='height:15.0pt'>
  <td height=15 class=xl65 align=right width=65 style='height:15.0pt;
  width:65pt'>54</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  magnitude Body gyroscope signals<span style="mso-spacerun:yes">&nbsp;
  </span>by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>55</td>
  <td class=xl65 width=147 style='width:147pt'>tBodyGyroJerkMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitudes of time body gyroscope Jerk signals by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>56</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations
  frequency domain body acceleration signals in the x direction by volunteer
  and activity<span style="mso-spacerun:yes">&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>57</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations
  frequency domain body acceleration signals in the y direction by volunteer
  and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>58</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations
  frequency domain body acceleration signals in the z direction by volunteer
  and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>59</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the frequency domain body linear acceleration Jerk signals in the x direction
  by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>60</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the frequency domain body linear acceleration Jerk signals in the y direction
  by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>61</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the frequency domain body linear acceleration Jerk signals in the z direction
  by volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>62</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroStdX</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  frequency domain Body gyroscope signals in the x direction by volunteer and
  activity<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>63</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroStdY</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  frequency domain Body gyroscope signals in the y direction by volunteer and
  activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>64</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroStdZ</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  frequency domain Body gyroscope signals in the x direction by volunteer and
  activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>65</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitude of the frequency domain Body acceleration signals by volunteer
  and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>66</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyAccJerkMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitude of the frequency domain Body acceleration Jerk signals by
  volunteer and acitivity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>67</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  magnitude of frequency domain Body gyroscope signals<span
  style="mso-spacerun:yes">&nbsp; </span>by volunteer and activity</td>
 </tr>
 <tr height=30 style='height:30.0pt'>
  <td height=30 class=xl65 align=right width=65 style='height:30.0pt;
  width:65pt'>68</td>
  <td class=xl65 width=147 style='width:147pt'>FreqBodyGyroJerkMagStd</td>
  <td class=xl65 width=516 style='width:516pt'><span
  style="mso-spacerun:yes">&nbsp;</span>average value of standard deviations of
  the magnitudes of frequency domain body gyroscope Jerk signals by volunteer
  and acitivity</td>
 </tr>
</table>

</body>

</html>

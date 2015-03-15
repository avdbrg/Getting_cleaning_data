# Tidying the UCI Human Activity Recognition Data Set

The first step is reading the training and the test set and merging them into one set. The description of the original dataset is found here [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The script starts with reading the name files and stores them into a variable for later use. Then it reads the test and the trainign data, with the features.txt names as column names (variable names).

The data is subset with the column names cotaining mean() or std(), dropping al other columns.

Then the columns with the subjects (numnbers) and Activities (numbers) are added to the data set. When that is done, test and training data are merged into one file. The activty labels (1,2, etc.) are replaced with the more descriptive activtiy names (based on activity_labels.txt) and the activities are ordered by subject and activity.

Then the script calculates the mean value for all (79) variables per subject, per activity. So the final data set containts 180 observations (30 subjects * 6 acticitivities). The final dataset is exported as "UCIHAR_Subject_Activity_Means.txt" and placed in the working directory.

The variables in the final set are:

Subject: the people being observed, numbered from 1 to 30.
Activity: the Activity the subject performed during the measurements, possible labels are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

The variables followin this are the average of all means and standarddeviations from alll measurments from the accelerometer (tAcc) en the gyroscope (tGyro) and are measured along three axis (XYZ). The accelerometer measurements were seprated into a body and a gravity signal (tBodyAcc-XYZ and tGravityAcc-XYZ).

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

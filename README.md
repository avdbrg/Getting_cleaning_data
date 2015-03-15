# README before running run_analysis.R

This run_analysis.R script creates a tidy dataset, based on the UCI Human Activity Recognition set. 

The programa should be run from the working directory and expects the following files to be present: 

* **features.txt**: contains descriptors voor the measurement (variable names)
* **activity_labels.txt**: contains the names voor activities numbered 1 to 6 (activitynames)
* the directories: **test** and **train**, which contain
+ **X-test.txt/X_train.txt**: the actual measurements per variable, observation there is a row
+ **y_test.txt/y_train.txt**: the activities being measured, per row an activity
+ **subject_test.txt/subject_train.txt**: the subjects being observed, per row a subject
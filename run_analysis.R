## creating a tidy dataset, based on the UCI Human Activity Recognition set
## first step is reading the training and the test set and merging them into one set
## The description of the data in the set is found ...

library(data.table)
library(dplyr)

## The programa expects the following files in the working directory
## features,txt: contains descriptors voor the measurement (variable names)
## activity_labels.txt: contains the names voor activities numbered 1 to 6 (activitynames)
## the directories: test and train, which contain
## X-test.txt/X_train.txt: the actual measurements per variable, observation there is a row
## y_test.txt/y_train.txt: the activities being measured, per row an activity
## subject_test.txt/subject_train.txt: the subjects being observed, per row a subject

## reading the name files
features <- read.table("features.txt", stringsAsFactors = FALSE)
actNames <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

## First reading the test data
xTest <- read.table("test/X_test.txt", col.names=features[[2]])
yTest <- readLines("test/y_test.txt")
subjectTest <- readLines("test/subject_test.txt")

## reading the training data
xTrain <- read.table("train/X_train.txt", col.names=features[[2]])
yTrain <- readLines("train/y_train.txt")
subjectTrain <- readLines("train/subject_train.txt")

## Subset data with colums that contain mean() or std()
dumpColumns <- (grepl("mean()",features[[2]]) | grepl("std()", features[[2]]))
xTest <- xTest[,dumpColumns]
xTrain <- xTrain[,dumpColumns]


## Add columns with subjects and activities
xTest <- cbind(Subject = as.numeric(subjectTest), Activity = yTest, xTest, stringsAsFactors = FALSE)
xTrain <- cbind(Subject = as.numeric(subjectTrain), Activity = yTrain, xTrain, stringsAsFactors = FALSE)

## Merging training and testdata
Data <- as.data.table(rbind(xTest, xTrain))

## Replace the activity numbers with the Activity names
Data[Activity == 1,Activity := actNames[1,2][1]]
Data[Activity == 2,Activity := actNames[2,2][1]]
Data[Activity == 3,Activity := actNames[3,2][1]]
Data[Activity == 4,Activity := actNames[4,2][1]]
Data[Activity == 5,Activity := actNames[5,2][1]]
Data[Activity == 6,Activity := actNames[6,2][1]]

setorder(Data, Subject, Activity)

## Calculte the means per subject, per activity
Data2 <- Data[,lapply(.SD, mean), by= .(Subject, Activity)]
setorder(Data2, Subject, Activity)

## Export the file
write.table(Data2, file = "UCIHAR_Subject_Activity_Means.txt", row.names = FALSE)


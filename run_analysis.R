# path
url_activity_labels="\\UCI HAR Dataset\\activity_labels.txt"
url_features="\\UCI HAR Dataset\\features.txt"

## path - test
url_subject_test="\\UCI HAR Dataset\\test\\subject_test.txt"
url_x_test="\\UCI HAR Dataset\\test\\X_test.txt"
url_y_test="\\UCI HAR Dataset\\test\\y_test.txt"

## path - train
url_subject_train="\\UCI HAR Dataset\\train\\subject_train.txt"
url_x_train="\\UCI HAR Dataset\\train\\X_train.txt"
url_y_train="\\UCI HAR Dataset\\train\\y_train.txt"

# load every thing
activity_labels=read.table(url_activity_labels)
features=read.table(url_features)

## test
subject_test=read.table(url_subject_test)
x_test=read.table(url_x_test)
y_test=read.table(url_y_test)

## train
subject_train=read.table(url_subject_train)
x_train=read.table(url_x_train)
y_train=read.table(url_y_train)

# Merges the training and the test sets to create one data set.
subject=rbind(subject_train,subject_test)
x=rbind(x_train,x_test)
activity=rbind(y_train,y_test)

# Appropriately labels the data set with descriptive variable names.
names(subject)=c("subject")
names(activity)=c("activity")
names(x)=as.character(features$V2)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement.
# I did not select the meanFreq() because i believe it's not what the question
# asked for.MeanFreq is the mean of frequency, not value.
x=x[,grep('(mean\\(\\))|(std\\(\\))',as.character(features$V2))]

# Uses descriptive activity names to name the activities in the data set
library(dplyr)

# put "subject","activity" and "x" in one data set
x=cbind(x,subject,activity)

# merge activity_name
x=left_join(x,activity_labels,by = c("activity" = "V1"))
x=rename(x,activity_name=V2)

# better name!
names(x)=tolower(names(x))
names(x)=gsub("\\(","",names(x))
names(x)=gsub("\\)","",names(x))

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
result=aggregate(x[,1:66],by=list(x$subject,x$activity_name),mean)
write.table(x = result,"result.txt",row.name = FALSE)

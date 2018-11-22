##Getting the file path, download file and unzip
f<-file.path(getwd(),"data.zip")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile=f)
unzip("data.zip")

##Getting the training dataset
training_set<-read.table("UCI HAR Dataset/train/X_train.txt")
training_activities<-read.table("UCI HAR Dataset/train/Y_train.txt")
training_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")

##Getting the test dataset
test_set<-read.table("UCI HAR Dataset/test/X_test.txt")
test_activities<-read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")

##Getting feature details for mean and std & activity list
activities<-read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2]<-as.character(activities[,2])
features<-read.table("UCI HAR Dataset/features.txt")
req_features<-grep(".*mean.*|.*std.*",features[,2])
req_features_names<-features[req_features,2]

##Tidying the feature names
req_features_names<-gsub("-mean","Mean",req_features_names)
req_features_names<-gsub("-std","Std",req_features_names)
req_features_names<-gsub("[-()]","",req_features_names)

##Getting the required training and test datasets
training_set_req<-training_set[req_features]
test_set_req<-test_set[req_features]

final_training_set<-cbind(training_subjects,training_activities,training_set_req)
final_test_set<-cbind(test_subjects,test_activities,test_set_req)

##Merging the training and test data
merged_data<-rbind(final_training_set,final_test_set)
colnames(merged_data)<-c("Subject","Activity",req_features_names)

##Mark subject and activity as factors
merged_data$Subject<-as.factor(merged_data$Subject)
merged_data$Activity<-factor(merged_data$Activity,levels=activities[,1],labels=activities[,2])

##Use reshape2 package to get the required tidy dataset
##that is, a new dataset with average values for each variable by activity and by subject
library(reshape2)

#melting the dataset
melt_merged_data<-melt(merged_data,c("Subject","Activity"))

#dcast the data into the final dataset, with averaged values
final_merged_data<-dcast(melt_merged_data,Subject+Activity~variable,mean)

#Write the tidy data into text file
write.table(final_merged_data,file="TidyDataset.txt",row.names=FALSE,quote=FALSE)



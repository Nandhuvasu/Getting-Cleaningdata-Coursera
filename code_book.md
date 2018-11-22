The steps taken are updated in the script file :"run_analysis.R". 
This file explains the variables used in the script and the steps taken to complete the assignment. 
Steps followed in run_analysis.R script:
Variable "f" to store the file path (inside the working directory); 
The training dataset is first loaded into the var "training_set"; 
The activities and subjects are taken in "training_subjects" and "training_activities". 
Similarly test dataset is also loaded. The activities names are loaded into var "activities"; 
The required features are compiled in "req_features", after loading the features. 
The training and the test set are modified based on the req_features list. 
Then they are merged. "merged_data" is the required dataset. 
They are given readable column names, based on variables. 
The Subject and Activity columns are taken as factors; 
Using the "reshape2" library, the dataset is melted and stored in "melt_merged_data" and are cast into the tidy dataset, "final_merged_data". 
The tidy dataset consists of averaged out values for each variable for each subject and activity. 
The output file is written as text file titled "TidyDataSet.txt".

Identifiers in "TidyDataSet.txt":
1. Subject
2. Activity.

Variables in "TidyDataSet.txt":
1. tBodyAccMeanX 
2. tBodyAccStdX 
3. tGravityAccMeanX 
4. tGravityAccStdX 
5. tBodyAccJerkMeanX 
6. tBodyAccJerkStdX 
7. tBodyGyroMeanX 
8. tBodyGyroStdX 
9. tBodyGyroJerkMeanX 
10. tBodyGyroJerkStdX 
11. tBodyAccMagMean 
12. tBodyAccMagStd 
13. tGravityAccMagMean 
14. tGravityAccMagStd 
15. tBodyAccJerkMagMean 
16. tBodyAccJerkMagStd 
17. tBodyGyroMagMean 
18. tBodyGyroMagStd 
19. tBodyGyroJerkMagMean 
20. tBodyGyroJerkMagStd 
21. fBodyAccMeanX 
22. fBodyAccStdX 
23. fBodyAccMeanFreqX 
24. ffBodyAccJerkStdX 
25. fBodyAccJerkMeanFreqX 
26. fBodyGyroMeanX 
27. fBodyGyroStdX 
28. fBodyGyroMeanFreqX 
29. fBodyAccMagMean 
30. fBodyAccMagStd 
And similar other 49 variables for various motions.

The activity names:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

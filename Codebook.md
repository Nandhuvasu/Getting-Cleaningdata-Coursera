The steps taken are updated in the script file :"run_analysis.R".
This file explains the variables used in the script and the steps taken to complete the assignment.
Variable "f" to store the file path (inside the working directory);
The training dataset is first loaded into the var "training_set"; The activities and subjects are taken in "training_subjects" and "training_activities".
Similarly test dataset is also loaded.
The activities names are loaded into var "activities";
The required features are compiled in "req_features", after loading the features.
The training and the test set are modified based on the req_features list.
Then they are merged.
"merged_data" is the required dataset.
They are given redable clumn names, based on variables.
The Subject and Activity columns are taken as factors;
Using the "reshape2" library, the dataset is melted and stored in "melt_merged_data" and are cast into the tidy dataset, "final_merged_data".
The tidy dataset consists of averaged out values for each variable for each subject and activity.
The output file is written as text file titled "TidyDataSet.txt".

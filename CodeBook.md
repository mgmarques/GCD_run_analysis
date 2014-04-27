run_analysis.R Code Book:
=========================

> <b>run_analysis.R</b> - Created for Peer Assessments/Getting and Cleaning Data Project<p>
> Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library<p>
> <b>Created by:</b> Marcelo Gomes Marques - At: 04/26/2014<p>
 
#### Code and transformations description:

The run_analysis.R code initiate with functions definitions and load libraries. 

* First is defined a check_file_exist to check if the files exists in the path defined by file_path. If don't exists stops execution of the current expression and executes an error action

* Second is defined a load_data function. This function use dataset and data_dir to define the file_path, call the check_file_exist function to check, if the file exist send a message to user for waiting the load of file. Proceed with these for the test and training files. Finally merges the training and the test sets to create one data set that's returned.

* Third its defined a load_metadata function  to metadata file check and load. This function use meta_data_file and data_dir to define the file_path, call the check_file_exist  function to check, if the file exist send a message to user for waiting the load of file. 

* Forth proceed with load the data.table library. I presume that you all read install this package, but if don't, you need made it first use the command: install.packages("data.table") 

In sequence the main code block of this script execute checks of source files and primarily directories definitions recognized by this implementation:

At this point we proceed with a assign the directory that all data set was expect unziped to a variable called data_dir with value "./data/UCI HAR Dataset". Than confirm it's "./data/UCI HAR Dataset" directory exists, if doesn't ask to user the path of his UCI HAR Dataset directory. If user inform a invalid directory path stops execution of the current expression and executes an error action

Finally, we proceed with steps of ours Peer Assessments/Getting and Cleaning Data Project: 
1. Merges the training and the test sets to create one data set.
1.1 X files are load and merge in a unique data.frame called X by the load_data that receive "X" and our data_dir for dataset and data_dir parameters.
1.2 The same are made to Y and subject
1.3 A date of this load is register in the dateLoaded variable.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2.1 Fist is proceed with a check if the features' metadata file exists and load it. Use the load_metadata function for it, assign the "features.txt" for the metadata_file parameter and our data_dir. The results, if the file exists are assign to the features variable, if not, this part of this code is stop and a error is emitted, but the execution continuous.
2.2 Getting the index of measurements on the mean and standard deviation from the features. For this, we look for the pattern of "-mean\\(\\)|-std\\(\\)" in the second colon of features data.frame. With use of grep function, we can get the index where we find these patterns and assign to the mean_std_features_idx variable.
2.3 With mean_std_features_idx we extracts only the measurements on the mean and standard deviation for each measurement and assigning to X_mean_std variable
2.4 Uses features metadata index again and its names to name the mean and standard deviation measurements of the new data set. All names put in upper case and are cleaning, by change the "(" and ")" symbols by "" and "-" symbol by "_"

3. Uses descriptive activity names to name the activities in the data set
3.1 First we need check if the activity's metadata file exists and load it with our load_metadata function with "activity_labels.txt" assign to the metadata_file parameter 
3.2 If file exists the return is assign to activities variable, if not a message error is emitted, but don't abort the execution.
3.3 Now we getting the index of descriptive activity names to name the activities in the data set. In this point, the code chages all "_" by " " and put all text in lower case.
3.4 The activities' names are attribute to the Y data set
3.5 Finally we change the name of activity field in the Y data set with "ACTIVITY"

4. Appropriately labels the data set with descriptive activity names. 
4.1 First we change the name of subject field in the subject data set with "SUBJECT"
4.2 A unique tidy data.frame is created combine the colon of subject, Y, X_mean_std data.frames;
4.3 A "tidy.txt" file is created in our data_dir with tidy data.frame. Again, we use the check_file_exist function to check if this file was created or not. In that case, if the file exists you receive a message too.  

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 A tidy2 variable assign with the aggregation of all measurements of tidy by "ACTIVITY" and "SUBJECT" colons with mean function and NA's removed.
5.2 A "tidy_2.txt" file is created in our data_dir with tidy2 data.frame. Again, we use the check_file_exist function to check if this file was created or not. In that case, if the file exists you receive a message too.  



#### Data Book:

##### X
data.frame:	10299 obs. of  561 variables:</p>
<b>Description:</b> Represents the training and test dataset of X source merge in a unique dataset. 

> see summary_X.TXT file in this repository

https://github.com/mgmarques/GCD_run_analysis/blob/master/Summary_X.txt

 
##### X_mean_std
data.frame:	10299 obs. of  66 variables:
<b>Description:</b> Represents the training and test dataset of X source merge in a unique dataset already select only means and standard variation measurements and all columns names assign with transformed patters applied.    

> see summary_X_mean_std.TXT file in this repository

https://github.com/mgmarques/GCD_run_analysis/blob/master/Summary_X_mean_std.txt

##### Y
data.frame:	10299 obs. of  1 variables:
<b>Description:</b> Represents the training and test dataset of Y source merge in a unique dataset already all names assign with transformed patters applied and column name assign too.    

> summary(Y)
   ACTIVITY        
 Length:10299      
 Class :character  
 Mode  :character

##### activities
data.frame:	6 obs. of  2 variables:
<b>Description:</b> Represents the activities source metadata with all transformed patters applied.    

> summary(activities)
       V1            V2           
 Min.   :1.00   Length:6          
 1st Qu.:2.25   Class :character  
 Median :3.50   Mode  :character  
 Mean   :3.50                     
 3rd Qu.:4.75                     
 Max.   :6.00                     
 
##### features
data.frame:	561 obs. of  2 variables:
<b>Description:</b> Represents the features source metadata.    

> summary(features)
       V1                                 V2     
 Min.   :  1   fBodyAcc-bandsEnergy()-1,16 :  3  
 1st Qu.:141   fBodyAcc-bandsEnergy()-1,24 :  3  
 Median :281   fBodyAcc-bandsEnergy()-1,8  :  3  
 Mean   :281   fBodyAcc-bandsEnergy()-17,24:  3  
 3rd Qu.:421   fBodyAcc-bandsEnergy()-17,32:  3  
 Max.   :561   fBodyAcc-bandsEnergy()-25,32:  3  
               (Other)                     :543 
			   
##### tidy and file_tidy
data.frame:	10299 obs. of  68 variables:
<b>Description:</b> Represents first tidy dataset and file generated, combine all columns of Y, X_mean_std and subject with already all names assign with transformed patters applied and column name assign too.    

> see summary_tidy.TXT file in this repository
 
https://github.com/mgmarques/GCD_run_analysis/blob/master/Summary_tidy.txt


##### tidy2 and file_tidy_2
data.frame:	180 obs. of  68 variables:
<b>Description:</b> Represents the second tidy dataset (tidy2) and file generated, with the aggregation of all measurements of tidy by "ACTIVITY" and "SUBJECT" colons with mean function and NA's removed.

> see summary_tidy2.TXT file in this repository

https://github.com/mgmarques/GCD_run_analysis/blob/master/Summary_tidy2.txt

> <p> $ ACTIVITY                 : chr  "laying" "sitting" "standing" "walking" ... </p> 
> <p> $ SUBJECT                  : int  1 1 1 1 1 1 2 2 2 2 ... </p>
> <p> $ TBODYACC_MEAN_X          : num  0.222 0.261 0.279 0.277 0.289 ... </p>
> <p> $ TBODYACC_MEAN_Y          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ... </p>
> <p> $ TBODYACC_MEAN_Z          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ... </p>
> <p> $ TBODYACC_STD_X           : num  -0.928 -0.977 -0.996 -0.284 0.03 ... </p>
> <p> $ TBODYACC_STD_Y           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ... </p>
> <p> $ TBODYACC_STD_Z           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ... </p>
> <p> $ TGRAVITYACC_MEAN_X       : num  -0.249 0.832 0.943 0.935 0.932 ... </p>
> <p> $ TGRAVITYACC_MEAN_Y       : num  0.706 0.204 -0.273 -0.282 -0.267 ... </p>
> <p> $ TGRAVITYACC_MEAN_Z       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ... </p>
> <p> $ TGRAVITYACC_STD_X        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ... </p>
> <p> $ TGRAVITYACC_STD_Y        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ... </p>
> <p> $ TGRAVITYACC_STD_Z        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ... </p>
> <p> $ TBODYACCJERK_MEAN_X      : num  0.0811 0.0775 0.0754 0.074 0.0542 ... </p>
> <p> $ TBODYACCJERK_MEAN_Y      : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ... </p>
> <p> $ TBODYACCJERK_MEAN_Z      : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ... </p>
> <p> $ TBODYACCJERK_STD_X       : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ... </p>
> <p> $ TBODYACCJERK_STD_Y       : num  -0.924 -0.981 -0.986 0.067 -0.102 ... </p>
> <p> $ TBODYACCJERK_STD_Z       : num  -0.955 -0.988 -0.992 -0.503 -0.346 ... </p>
> <p> $ TBODYGYRO_MEAN_X         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ... </p>
> <p> $ TBODYGYRO_MEAN_Y         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ... </p>
> <p> $ TBODYGYRO_MEAN_Z         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ... </p>
> <p> $ TBODYGYRO_STD_X          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ... </p>
> <p> $ TBODYGYRO_STD_Y          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ... </p>
> <p> $ TBODYGYRO_STD_Z          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ... </p>
> <p> $ TBODYGYROJERK_MEAN_X     : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ... </p>
> <p> $ TBODYGYROJERK_MEAN_Y     : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ... </p>
> <p> $ TBODYGYROJERK_MEAN_Z     : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ... </p>
> <p> $ TBODYGYROJERK_STD_X      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ... </p>
> <p> $ TBODYGYROJERK_STD_Y      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ... </p>
> <p> $ TBODYGYROJERK_STD_Z      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ... </p>
> <p> $ TBODYACCMAG_MEAN         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ... </p>
> <p> $ TBODYACCMAG_STD          : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ... </p>
> <p> $ TGRAVITYACCMAG_MEAN      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ... </p>
> <p> $ TGRAVITYACCMAG_STD       : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ... </p>
> <p> $ TBODYACCJERKMAG_MEAN     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ... </p>
> <p> $ TBODYACCJERKMAG_STD      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ... </p>
> <p> $ TBODYGYROMAG_MEAN        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ... </p>
> <p> $ TBODYGYROMAG_STD         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ... </p>
> <p> $ TBODYGYROJERKMAG_MEAN    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ... </p>
> <p> $ TBODYGYROJERKMAG_STD     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ... </p>
> <p> $ FBODYACC_MEAN_X          : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ... </p>
> <p> $ FBODYACC_MEAN_Y          : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ... </p>
> <p> $ FBODYACC_MEAN_Z          : num  -0.883 -0.959 -0.985 -0.332 -0.226 ... </p>
> <p> $ FBODYACC_STD_X           : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ... </p>
> <p> $ FBODYACC_STD_Y           : num  -0.834 -0.917 -0.972 0.056 -0.113 ... </p>
> <p> $ FBODYACC_STD_Z           : num  -0.813 -0.934 -0.978 -0.28 -0.298 ... </p>
> <p> $ FBODYACCJERK_MEAN_X      : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ... </p>
> <p> $ FBODYACCJERK_MEAN_Y      : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ... </p>
> <p> $ FBODYACCJERK_MEAN_Z      : num  -0.948 -0.986 -0.991 -0.469 -0.288 ... </p>
> <p> $ FBODYACCJERK_STD_X       : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ... </p>
> <p> $ FBODYACCJERK_STD_Y       : num  -0.932 -0.983 -0.987 0.107 -0.135 ... </p>
> <p> $ FBODYACCJERK_STD_Z       : num  -0.961 -0.988 -0.992 -0.535 -0.402 ... </p>
> <p> $ FBODYGYRO_MEAN_X         : num  -0.85 -0.976 -0.986 -0.339 -0.352 ... </p>
> <p> $ FBODYGYRO_MEAN_Y         : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ... </p>
> <p> $ FBODYGYRO_MEAN_Z         : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ... </p>
> <p> $ FBODYGYRO_STD_X          : num  -0.882 -0.978 -0.987 -0.517 -0.495 ... </p>
> <p> $ FBODYGYRO_STD_Y          : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ... </p>
> <p> $ FBODYGYRO_STD_Z          : num  -0.917 -0.944 -0.982 -0.437 -0.238 ... </p>
> <p> $ FBODYACCMAG_MEAN         : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ... </p>
> <p> $ FBODYACCMAG_STD          : num  -0.798 -0.928 -0.982 -0.398 -0.187 ... </p>
> <p> $ FBODYBODYACCJERKMAG_MEAN : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ... </p>
> <p> $ FBODYBODYACCJERKMAG_STD  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ... </p>
> <p> $ FBODYBODYGYROMAG_MEAN    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ... </p>
> <p> $ FBODYBODYGYROMAG_STD     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ... </p>
> <p> $ FBODYBODYGYROJERKMAG_MEAN: num  -0.942 -0.99 -0.995 -0.319 -0.282 ... </p>
> <p> $ FBODYBODYGYROJERKMAG_STD : num  -0.933 -0.987 -0.995 -0.382 -0.392 ... </p> 
 
#### Variables
> <p> str(data_dir) </p>
 chr "./data/UCI HAR Dataset"

> <p> str(dateLoaded) </p>
 chr "Sat Apr 26 21:03:53 2014"

> <p> str(mean_std_features_idx) </p>
 int [1:66] 1 2 3 4 5 6 41 42 43 44 ... </p>


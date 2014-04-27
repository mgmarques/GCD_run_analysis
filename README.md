GCD_run_analysis
================

#### Main propose of this repository: 

Publisher the run_analysis code, code book abd results for performing my analysis attend to Peer Assessments/Getting and Cleaning Data Project and their.

#### Repository content:
* run_analysys.R: R code created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library
* README.md: This present file that you are reding
* tidy.txt: Text file with the results of first all date prepared and cleaned with the instruction of steps 1 to 4 of our Peer Assessments/Getting and Cleaning Data Project
* tidy2.txt:  Text file with the results of the second, independent tidy data set with the average of each variable for each activity and each subject.
* CodeBook.md: A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
* summary_X.TXT: Represents the training and test dataset of X source merge in a unique dataset. 
* summary_X_mean_std.TXT: Represents the training and test dataset of X source merge in a unique dataset already select only means and standard variation measurements and all columns names assign with transformed patters applied. 
* tidy.TXT: Represents first tidy dataset and file generated, combine all columns of Y, X_mean_std and subject with already all names assign with transformed patters applied and column name assign too.    
* summary_tidy2.TXT: Represents the second tidy dataset (tidy2) and file generated, with the aggregation of all measurements of tidy by "ACTIVITY" and "SUBJECT" colons with mean function and NA's removed.


#### Steps to use my run_analysis.R:

1.  If you don't have download the data for the project, please click below: 

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

    A full description of this dataset is available at the site where the original data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

2. 	Proceed with a simple Unzip the file source download in step 1, in other words unzip the folder "UCI HAR Dataset" contained in this file into a folder on your local drive. I suggest you "C:\Users\yourname\Documents\data\", or the equivalent to "./data" to reference your work directory in R. If you unzip to another folder, my code ask you where you put these stuff. 

3.  Download my run_analysis.R and saved it in your R working directory.

4.  In R Studio, at the command line of the console type: 
    > source("run_analysis.R")  

5. If you unzip the source file to a unrecognaze folder, in rellation to your working directory, my code ask you where you put these stuff. If you inform a not exists folder, or some file don't be find, the part of the code is stop and inform a error. It's dont abort or quit, for you can see all erros and tanke actions if need.

6. If you unzip to, or inform, a recognize folder and your R Studio function properly with data.table library, you must see same messages to informs you about the progress of the execution. See belong all messages:
 
  Please Wait! Load X train dataset...
  Please Wait! Load X test dataset...
  Please Wait! Merges X training and the test sets to create one data set...
  Please Wait! Load Y train dataset...
  Please Wait! Load Y test dataset...
  Please Wait! Merges Y training and the test sets to create one data set...
  Please Wait! Load subject train dataset...
  Please Wait! Load subject test dataset...
  Please Wait! Merges subject training and the test sets to create one data set...
  Please Wait! Load features.txt meta data file...
  Please Wait! Load activity_labels.txt meta data file...
  A file tidy.txt was saved on  ./data/UCI HAR Dataset
  A file tidy_2.txt was saved on  ./data/UCI HAR Dataset

7. If you prefer you can read the files to another data frames in R, and compare to variables tidy, with first all date prepared and cleaned with the instruction of steps 1 to 4 of our Peer Assessments/Getting and Cleaning Data Project, and tidy2 with a second, independent tidy data set with the average of each variable for each activity and each subject. You can use these commands at the R console command line:
  > file_tidy <- read.table(paste(data_dir,"/tidy.txt", sep=""))
  
  > file_tidy_2 <- read.table(paste(data_dir,"/tidy_2.txt", sep=""))
 
If you got here, congratulations, now you can evaluating this code, its results and all support material upload to this repository.

Thanks,

#### Steps of our Peer Assessments/Getting and Cleaning Data Project:
Create one R script called run_analysis.R that does the following:

1.  Merges the training and the test sets to create one data set. 

2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

3.  Uses descriptive activity names to name the activities in the data set.

4.  Appropriately labels the data set with descriptive activity names. 

6.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

MGM


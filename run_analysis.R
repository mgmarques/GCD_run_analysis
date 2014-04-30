## +-------------------------------------------------------------------------------------+
## | Peer Assessments /Getting and Cleaning Data Project: run_analysis.R                 |
## | Created by: Marcelo Gomes Marques - At: 04/26/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO                            |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Check if the files exists in the path defined by file_path.
## If don't exists stops execution of the current expression 
## and executes an error action
check_file_exist <- function(file_path) 
{
        if (!file.exists(file_path))
                stop("The ", file_path, " not found!") else TRUE 
}

## Use dataset and data_dir to define the file_path, call the check_file_exist
## function to check, if the file exist send a message to user for waiting the
## load of file. Proceed with these for the test and training files. Finally
## merges the training and the test sets to create one data set that's returned.
load_data <- function(dataset, data_dir = "./data/UCI HAR Dataset") 
{
        # Training dataset check and load 
        
        file_path <- paste(data_dir, "/train/", dataset, "_train.txt", sep="")
        check_file_exist(file_path);
        message(paste("Please Wait! Load", dataset, "train dataset..."));
        train <- read.table(file_path, header=FALSE);

        # Test dataset check and load
        
        file_path <- paste(data_dir, "/test/",  dataset, "_test.txt",  sep="")
        message(paste("Please Wait! Load", dataset, "test dataset..."));
        test  <- read.table(file_path, header=FALSE);
    
        # Merges the training and the test sets to create one data set.
        
        message(paste("Please Wait! Merges", dataset, "training and the test sets to create one data set..."));
        data <- rbind(train, test);
}

## Use meta_data_file and data_dir to define the file_path, call the check_file_exist
## function to check, if the file exist send a message to user for waiting the load of file. 
load_metadata <- function(metadata_file, data_dir = "./data/UCI HAR Dataset") 
{
        # Meta data file check and load 
        
        file_path <- paste(data_dir, "/", metadata_file, sep="")
        check_file_exist(file_path);
        message(paste("Please Wait! Load", metadata_file, "meta data file..."));
        metadata <- read.table(file_path, header=FALSE);
        
}

## Load data.table library
library(data.table)

## ************ End Function definitions and load libraries code segment ***************** 

## **************** Main code block - script to execute run_analysis.R *******************

## Assign the directory that all data set was unzip and confirm its exists
data_dir <- "./data/UCI HAR Dataset";

## Check if the "./data/UCI HAR Dataset" directory exists, if doesn't ask to user the path
## of his UCI HAR Dataset directory. If user inform a invalid directory path stops execution
## of the current expression and executes an error action
if (!file.exists(data_dir)){
        data_dir <- readline(prompt = "Please, inform your UCI HAR Dataset directory path: ") 
        if (!file.exists(data_dir)){
                stop("You inform a invalid directory path")
        }
}


## 1. Merges the training and the test sets to create one data set.
X <- load_data("X", data_dir);
Y <- load_data("Y", data_dir);
subject <- load_data("subject", data_dir);
dateLoaded <- date();

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Check if the features' metadata file exists and load it 
features <- load_metadata(data_dir, metadata_file = "features.txt");

## Getting the index of measurements on the mean and standard deviation from the features

mean_std_features_idx <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]);

## Extracts only the measurements on the mean and standard deviation for each measurement
## and assigning to X_mean_std variable
X_mean_std <- X[, mean_std_features_idx];

## Uses features metadata index and names to name the mean and standard deviation measurements
## of the new data set. All names put in lower case and are cleaning, by change the "(", and 
## "")" and "-"symbols by ""
names(X_mean_std) <- tolower(gsub("\\(|\\)|\\-", "",features[mean_std_features_idx, 2]));


## 3. Uses descriptive activity names to name the activities in the data set

## Check if the activity's metadata file exists and load it 
activities <- load_metadata(data_dir, metadata_file = "activity_labels.txt");

## Getting the index of descriptive activity names to name the activities in the data set
activities[, 2] = gsub("_", " ", tolower(as.character(activities[, 2])));

## Name the activities in the data set
Y[,1] = activities[Y[,1], 2];

## Name the activity field in the data set
names(Y) <- "ACTIVITY";

## 4. Appropriately labels the data set with descriptive activity names. 

names(subject) <- "SUBJECT";
tidy <- cbind(subject, Y, X_mean_std);
write.table(tidy, paste(data_dir, "/tidy.txt", sep=""));
if (check_file_exist(paste(data_dir, "/tidy.txt", sep=""))) {
        message(paste("A file tidy.txt was saved on ", data_dir))};


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy2 <-aggregate(tidy[, 3:68],by=tidy[c("ACTIVITY","SUBJECT")], FUN=mean, na.rm=TRUE);
write.table(tidy2, paste(data_dir, "/tidy_2.txt", sep=""));
if (check_file_exist(paste(data_dir, "/tidy_2.txt", sep=""))) {
        message(paste("A file tidy_2.txt was saved on ", data_dir))};

require(dplyr);

envVars <- ls();
execFolder <- "./GettingAndCleaningData/";

#ensure that we have the zip archive in the proper location
source(paste0(execFolder, "dataDownload.R"));

#load auxiliary functions
source(paste0(execFolder, "dataExtract.R"));

message("Loading raw data from archive ...");
features <- extractRawDS("features");
activity_labels <- extractRawDS("activity_labels");
subject_train <- extractRawDS("train/subject_train");
subject_test <- extractRawDS("test/subject_test");
X_train <- extractRawDS("train/X_train");
X_test <- extractRawDS("test/X_test");
y_train <- extractRawDS("train/y_train");
y_test <- extractRawDS("test/y_test");

message("Tidying up and aggregating data ...");

#select only columns containing mean or std
col_selected <- grepl("mean|std", features$V2);

#polish column names so that - is converted to . and () is removed
col_names <- grep("mean|std", features$V2, value = T);
col_names <- gsub("-", ".", col_names);
col_names <- gsub("\\(\\)", "", col_names);

#retain only columns with std and mean in the name and attach proper column names
X_train <- X_train[,col_selected];
X_test <- X_test[,col_selected];
names(X_train) <- col_names;
names(X_test) <- col_names;

#augment the individual test and training dataset with information on the 
#group (training=1 or test=2)
#activity
#subjectid
X_train <- cbind(group = 1, activity = y_train$V1, subjectid = subject_train$V1, X_train);
X_test <- cbind(group = 2, activity = y_test$V1, subjectid = subject_test$V1, X_test);

#create a single table by row-binding the train and test datasets
UCI_HAR_dataset <- rbind(X_train, X_test);

#replace some numeric columns with factors
UCI_HAR_dataset$group <- factor(UCI_HAR_dataset$group, labels = c("training", "test"));
UCI_HAR_dataset$activity <- factor(UCI_HAR_dataset$activity, labels = activity_labels$V2);
UCI_HAR_dataset$subjectid <- factor(UCI_HAR_dataset$subjectid);

#create dataset with averages as requested by step 5 of assignment.
UCI_HAR_averages <- group_by(select(UCI_HAR_dataset, -group), subjectid, activity);
UCI_HAR_averages <- summarize_each(UCI_HAR_averages, funs(mean));

#preserve the following variables from removal (output of the script)
envVars <- c(envVars, "UCI_HAR_dataset", "UCI_HAR_averages");

#remove all working variables
newVars <- ls();
rm(list = newVars[!(newVars %in% envVars)]);
rm("newVars");

message("Extended dataset stored in: UCI_HAR_dataset");
message("Dataset with averages stored in: UCI_HAR_averages");

# CODEBOOK
## UCI_HAR_dataset and UCI_HAR_averages
These two data frames contain the result of processing sensor measurement data for a Samsung Galaxy S II device as obtained from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## UCI_HAR_dataset
Data frame **UCI_HAR_dataset** collects information on both the training and test data in a single table. Only mean and standard deviation variables are extracted from the original information. Moreover the table explicitly contains columns related to the subject and activity being performed in each observation.
The dataset has the following columns:

* **group**: the origin of the data, either *training* or *test*;
* **activity**: the activity being performed in the observation. One of *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING* and *LAYING*;
* **subjectid**: the identifier of the test subject, a number between 1 and 30;
* **tBodyAcc.mean.X** ... **fBodyBodyGyroJerkMag.meanFreq**: a selection of the fields of the *X_train* and *X_test* tables which contain either the string "std" or "mean". The field names are polished by removing parentheses and replacing dashes with dots.

## UCI_HAR_averages
Data frame **UCI_HAR_averages** is the result of averaging all columns of the previous data frame on groups which share the same **subjectid** and **activity** performed. Note that the column **group** identifying the source of the data (training or test group) has been dropped, so the average is performed regardless of the origin of the data.



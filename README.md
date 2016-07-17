# Getting and Cleaning Data - Final Project
This project contains the submission for the final project of course **Getting and Cleaning Data** in the John Hopkins-Coursera data science specialization.
The following R files are relevant for this project:

* **run_analysis.R** , this is the main script you need to run to perform the analysis;
* **dataDownload.R** ;
* **dataExtract.R** .

Please make sure that these three files are located in a folder with name
**GettingAndCleaningData** in your current working directory. 
The three files are described in more details below.

### run_analysis.R
This script performs the analysis required by the project and it generates two data frames
in the global environment:

* data frame **UCI_HAR_dataset** contains the main analysis results;
* data frame **UCI_HAR_averages** contains tidy data with the averages.

See file **CodeBook.md** for a description of the variables in the two datasets.

### dataDownload.R
This script is run automatically as part of the analysis and it takes care of the task of downloading the required device data in a local folder. Specifically, the downloaded archive is located in a subfolder **download** in the current working directory. The archive is downloaded only if it is missing.

### dataExtract.R
This file contains a helper function **extratRawDS(location)** which loads a single table from a specified location inside the data archive. It is used internally by the **run_analysis.R** script.


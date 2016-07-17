downloadFolder <- "";

if (!file.exists(paste0(downloadFolder,"UCI_HAR_Dataset.zip"))) {
  UCI_HAR_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
  
  if (nchar(downloadFolder)>0 & !file.exists(downloadFolder)) {
    dir.create(downloadFolder);
  }
  
  download.file(UCI_HAR_url, paste0(downloadFolder,"UCI_HAR_Dataset.zip"), mode = "wb");
}

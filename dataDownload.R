if (!file.exists("./download/UCI_HAR_Dataset.zip")) {
  UCI_HAR_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
  
  if (!file.exists("./download")) {
    dir.create("./download");
  }
  
  download.file(UCI_HAR_url, "./download/UCI_HAR_Dataset.zip", mode = "wb");
}

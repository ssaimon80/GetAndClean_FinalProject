extractRawDS <- function(location) {
  datacon <- unz("./download/UCI_HAR_Dataset.zip", filename = paste0("UCI HAR Dataset/", location, ".txt"));
  read.csv(datacon, sep = "", header = F, stringsAsFactors = F)
}
complete <- function(directory,id){
  ids <- c()
  nobs <- c()
  files = as.character(list.files(paste("./",directory,"/",sep = "")))
  files_paths = paste(directory,"/",files,sep="")
  for(item in id){
    monitor_data <- read.csv(files_paths[item],header = TRUE)
    monitor_complete_data <- monitor_data[complete.cases(monitor_data),]
    ids <- c(ids, c(item))
    nobs <- c(nobs,c(nrow(monitor_complete_data)))
  }
  data.frame("id" = ids,"nobs" = nobs)
}
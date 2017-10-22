pollutantmean <- function(directory,pollutant,id){
  pollutant_list <- c()

  files = as.character(list.files(paste("./",directory,"/",sep = "")))
  files_paths = paste(directory,"/",files,sep="")
  for(item in id){
    monitor_data <- read.csv(files_paths[item],header = TRUE)
    monitor_data_frame <- monitor_data[as.character(pollutant)]
    monitor_data_frame <- monitor_data_frame[!is.na(monitor_data_frame)]
    pollutant_list <- c(pollutant_list,c(monitor_data_frame))
  }
  mean(pollutant_list)
}
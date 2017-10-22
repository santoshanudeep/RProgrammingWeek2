corr <- function(directory,threshold = 0){
  cor_vector <- c()
  total_frames <- complete(directory,1:332)
  cor_total_frames<-total_frames[total_frames$nobs > threshold,]
  if (nrow(cor_total_frames["id"]) >= 1){
  for(id in 1:nrow(cor_total_frames["id"])){
    monitor_file <- paste(sprintf("%03d",as.numeric(cor_total_frames[id,1])),".csv",sep = "")
    monitor_file_path <- file.path(directory,monitor_file)
    monitor_data <- read.csv(monitor_file_path,header = TRUE)
    monitor_complete_data <- monitor_data[complete.cases(monitor_data),]
    cor_data <- cor(monitor_complete_data[,c("sulfate")],monitor_complete_data[,c("nitrate")])
    cor_vector <- c(cor_vector,c(cor_data))
  }
  }
  cor_vector
}
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  complete_set <- complete(directory)
  satisfied <- complete_set[complete_set$nobs > threshold,]
  ids <- satisfied$id
  corr <- c()
  setwd(directory)
  
  for (each in ids) {
    file <- paste(toString(formatC(each, width = 3, format = "d", flag = "0")),".csv",sep="")
    data <- read.csv(file)
    full <- data[!is.na(data$sulfate) & !is.na(data$nitrate),]
    corr <- c(corr,cor(full$sulfate,full$nitrate))
  }
  setwd("..")
  return(corr)
}
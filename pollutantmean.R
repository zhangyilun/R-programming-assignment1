pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  setwd(paste(getwd(),"/",directory,sep=""))
  all <- c()
  
  for (each in id) {
    file <- paste(toString(formatC(each, width = 3, format = "d", flag = "0")),".csv",sep="")
    data <- read.csv(file)
    if (pollutant == "sulfate") {
      all <- c(all,data$sulfate[!is.na(data$sulfate)])
    }
    else {
      all <- c(all,data$nitrate[!is.na(data$nitrate)])
    }
  }
  
  setwd("F:/Documents/University/3A 2014 WT4 Fall/coursera/Data Science 2 - R Programming/assignment 1")
  return(mean(all))
}
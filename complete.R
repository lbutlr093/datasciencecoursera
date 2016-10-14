complete <- function(directory, id = 1:332) {
  ## 'diretory' is a character vector of length 1 indicating
  ## the location of the CSV file
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  
  ## Directory - changed back at the end
  setwd("~/Documents/code/datasciencecoursera/specdata")
  
  ## Id to .csv file name
  csvVector <- id
  for (index in seq_along(csvVector)) { 
    csvVector[index] <- paste(csvVector[index], ".csv", sep="")
  }
  
  ## Set up dataframe for correct dimensions and column names
  dataFrame <- data.frame(matrix(ncol = 2, nrow = length(id)))
  colnames(dataFrame)[1] <- "id"
  colnames(dataFrame)[2] <- "nobs"
  
  ## Set id values
  for (i in seq_along(id)) {
    dataFrame[i, 1] <- id[i]
  }
  
  ## Set nobs values
  nobsVector <- vector(mode="numeric", length=length(id))
  for (i in seq_along(csvVector)) {
    mydata <- read.csv(csvVector[i])
    completeCase <- sum(complete.cases(mydata))
    dataFrame[i, 2] <- completeCase
  }
  
  print(dataFrame)
  
  ## Clean-up
  setwd("~/Documents/code/datasciencecoursera/")
  
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 2 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numners
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list 
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the results
  
  
  ## Directory - changed back at the end
  setwd("~/Documents/code/datasciencecoursera/specdata")
  
  ## Id to .csv file name
  for (index in seq_along(id)) { id[index] <- paste(id[index], ".csv", sep="") }
  
  ## Open .csv files
  sumVector <- vector(mode="numeric", length=length(id)) # hold all of the sums
  countVector <- vector(mode="numeric", length=length(id)) # hold all of the counts
  
  ## Grab the values from each .csv
  for (i in seq_along(id)) {
    mydata <- read.csv(id[i])
    mycol <- mydata[pollutant] #return only the values of "pollutant" arg
    sum <- sum(mycol, na.rm = TRUE) #sum the non NA values
    count <- colSums(!is.na(mycol)) #count the non NA values
    average <- sum / count #find the average 
    sumVector[i] <- sum
    countVector[i] <- count
  }
  
  finalAverage <- sum(sumVector) / sum(countVector)
  finalRounded <- round(finalAverage, digits = 3)
  print(finalRounded)
  
  ## Clean-up
  setwd("~/Documents/code/datasciencecoursera/")
}
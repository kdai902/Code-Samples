# ASSIGNMENT FROM COURSERA "R PROGRAMMING" COURSE

# The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine 
# particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from 
# a single monitor and the ID number for each monitor is contained in the file name. 

setwd("C:/Users/Karen/Desktop/Coursera R Programming")
specdata_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata_url, "specdata.zip")
unzip("specdata.zip")

# PART 2: Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first column is 
# the name of the file and the second column is the number of complete cases.

complete <- function(directory, id = 1:332) {
      filelist <- list.files(directory, pattern = ".csv", full.names = TRUE)
      nobs <- numeric()
      for(i in id) {
            data <- read.csv(filelist[i])
            nobs <- c(nobs, sum(complete.cases(data)))
      }
      data.frame(id, nobs)
}

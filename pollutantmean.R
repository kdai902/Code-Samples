# ASSIGNMENT FROM COURSERA "R PROGRAMMING" COURSE

# The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. 

setwd("C:/Users/Karen/Desktop/Coursera R Programming")
specdata_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata_url, "specdata.zip")
unzip("specdata.zip")

list.files("specdata")

# PART 1: Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
      files <- list.files(directory, pattern = ".cvs", full.names = TRUE)
      dat <- numeric()
      for(i in id) {
            values <- read.csv(files[i])
            dat <- c(dat, values[[pollutant]])
      }
      mean(dat, na.rm = TRUE)
}

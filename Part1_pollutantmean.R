setwd("C:/Users/Karen/Desktop/Coursera R Programming")
specdata_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata_url, "specdata.zip")
unzip("specdata.zip")

pollutantmean <- function(directory, pollutant, id = 1:332) {
      files <- list.files(directory, pattern = ".cvs", full.names = TRUE)
      dat <- numeric()
      for(i in id) {
            values <- read.csv(files[i])
            dat <- c(dat, values[[pollutant]])
      }
      mean(dat, na.rm = TRUE)
}

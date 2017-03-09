setwd("C:/Users/Karen/Desktop/Coursera R Programming")
specdata_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata_url, "specdata.zip")
unzip("specdata.zip")

complete <- function(directory, id = 1:332) {
      filelist <- list.files(directory, pattern = ".csv", full.names = TRUE)
      nobs <- numeric()
      for(i in id) {
            data <- read.csv(filelist[i])
            nobs <- c(nobs, sum(complete.cases(data)))
      }
      data.frame(id, nobs)
}

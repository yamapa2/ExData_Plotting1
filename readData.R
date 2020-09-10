## Create a data folder to save all the downloaded data
if(!file.exists("data"))
    dir.create("data")

## If data is not downloaded yet, download the dataset from the web location
if(!file.exists("data/hpc.zip"))
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data/hpc.zip")

## If the dataset zip file is not extracted yet, unzip the downloaded data file
if(!file.exists("data/household_power_consumption.txt"))
    unzip("data/hpc.zip", exdir = "data")

data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
data$Time <- strptime(data$Time, format = "%H:%M:%S")

sdata <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2", ]
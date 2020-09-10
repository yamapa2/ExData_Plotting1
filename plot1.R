library(data.table)
library(graphics)

## Read data
source("readData.R")

## Create the figure folder if does not already exists
if(!file.exists("figure")) dir.create("figure")

## Capture histogram of global active power in plot1.jpg
png(file = "figure/plot1.png", width = 480, height = 480)
hist(sdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
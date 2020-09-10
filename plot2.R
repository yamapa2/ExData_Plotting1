library(data.table)
library(graphics)

## Read data
source("readData.R")

## Create the figure folder if does not already exists
if(!file.exists("figure")) dir.create("figure")

## Capture line plot of global active power in plot2.jpg
png(file = "figure/plot2.png", width = 480, height = 480)
plot(sdata$datetime, sdata$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()
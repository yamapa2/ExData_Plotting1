library(data.table)
library(graphics)

## Read data
source("readData.R")

## Create the figure folder if does not already exists
if(!file.exists("figure")) dir.create("figure")

## Capture line plots of sub metering across the three meterings in plot3.jpg
png(file = "figure/plot3.png", width = 480, height = 480)
plot(sdata$datetime, sdata$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(sdata$datetime, sdata$Sub_metering_2, type="l", col="red")
lines(sdata$datetime, sdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "red", "blue"), lty=1)
dev.off()

library(data.table)
library(graphics)

## Read data
source("readData.R")

## Create the figure folder if does not already exists
if(!file.exists("figure")) dir.create("figure")

## Capture a 2x2 panel plot in plot4.jpg
png(file = "figure/plot4.png", width = 480, height = 480)

## Setup 4 panels
par(mfrow=c(2,2))

## Capture histogram of global active power in panel (1, 1)
plot(sdata$datetime, sdata$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")

## Capture line plot of global active power in panel (1, 2)
plot(sdata$datetime, sdata$Voltage, type="l", xlab = NA, ylab = "Voltage")

## Capture line plots of sub metering across the three meterings in panel (2, 1)
plot(sdata$datetime, sdata$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(sdata$datetime, sdata$Sub_metering_2, type="l", col="red")
lines(sdata$datetime, sdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "red", "blue"), lty=1)

## Capture line plot of global reactive power in panel (2, 2)
plot(sdata$datetime, sdata$Global_reactive_power, type="l", xlab = NA, ylab = "Global Reactive Power")

dev.off()

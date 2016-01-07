# Read data
explorData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- subset(explorData, Date %in% c("1/2/2007", "2/2/2007"))

# Create plot
giornoOra <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalPower <- as.numeric(subData$Global_active_power)
subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)
plot(giornoOra, subMet1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(giornoOra, subMet2, type = "l", col = "red")
lines(giornoOra, subMet3, type = "l", col = "blue")
legend("topright", c("subMet1", "subMet2", "subMet3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
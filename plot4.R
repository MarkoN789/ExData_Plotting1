# Read data
explorData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- subset(explorData, Date %in% c("1/2/2007", "2/2/2007"))

# Prepare to create the plot
giornoOra <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalPower <- as.numeric(subData$Global_active_power)
subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)
volt <- as.numeric(subData$Voltage)
reactivePower <- as.numeric(subData$Global_reactive_power)

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

# Plot 1
plot(giornoOra, globalPower, type = "l", xlab = " ", ylab = "Global Active Power")

# Plot 2
plot(giornoOra, subMet1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(giornoOra, subMet2, type = "l", col = "red")
lines(giornoOra, subMet3, type = "l", col = "blue")
legend("topright", c("subMet1", "subMet2", "subMet3"),lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# Plot 3
plot(giornoOra, volt, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 4
plot(giornoOra, reactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
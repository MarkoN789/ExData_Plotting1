# Read data
explorData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- subset(explorData, Date %in% c("1/2/2007", "2/2/2007"))

# Create plot
giornoOra <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalPower <- as.numeric(subData$Global_active_power)
png(filename = "plot2.png", width = 480, height = 480)
plot(giornoOra, globalPower, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
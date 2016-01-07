# Read data
explorData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- subset(explorData, Date %in% c("1/2/2007", "2/2/2007"))

# Create plot
globalPower <- as.numeric(subData$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(globalPower, col = "red", main = "Global Active Power", xlab = "Global Activity Power (kilowatts)", ylab = "Frequency")
dev.off()
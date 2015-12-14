# download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

# Read data, convert into date format and extract relevant data
dataset <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", na.strings = "?", header = TRUE)
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
datasetSub <- subset(dataset, dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"))

# Plot and label histogram
png(filename = "Plot3.png", width = 480, height = 480)
plot(datasetSub$datetime, datasetSub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = 'n')
points(datasetSub$datetime, datasetSub$Sub_metering_1, type = "l")
points(datasetSub$datetime, datasetSub$Sub_metering_2, type = "l", col = "red")
points(datasetSub$datetime, datasetSub$Sub_metering_3, type = "l", col = "blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
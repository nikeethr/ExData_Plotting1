# download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

# Read data, convert into date format and extract relevant data
dataset <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", na.strings = "?", header = TRUE)
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
datasetSub <- subset(dataset, dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"))

# Plot and label histogram
png(filename = "Plot1.png", width = 480, height = 480)
hist(datasetSub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
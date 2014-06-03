
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(rawdata, rawdata[,1] == "1/2/2007" | rawdata[,1] == "2/2/2007")
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# plot 1
png(file="plot1.png", width = 480, height = 480, bg="transparent")
hist(data$Global_active_power, col = "red", breaks = 12, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

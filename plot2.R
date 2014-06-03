
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(rawdata, rawdata[,1] == "1/2/2007" | rawdata[,1] == "2/2/2007")
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# plot 2
png(file="plot2.png", width = 480, height = 480, bg="transparent")
plot(data$Timestamp, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()

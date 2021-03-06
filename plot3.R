
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(rawdata, rawdata[,1] == "1/2/2007" | rawdata[,1] == "2/2/2007")
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# plot 3
png(file="plot3.png", width = 480, height = 480, bg="transparent")
with(data, {
     plot(Timestamp, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l", col="black")
     points(Timestamp, Sub_metering_2, type="l", col="red")
     points(Timestamp, Sub_metering_3, type="l", col="blue")
     legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

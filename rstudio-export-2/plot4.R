## Plot 4

data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings="?",
                   stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subData <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
subData$Voltage <- as.numeric(subData$Voltage)

subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)

subData$Datetime <- as.POSIXct(paste(subData$Date, subData$Time))

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1 (top-left)
plot(subData$Datetime,
     subData$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Plot 2 (top-right)
plot(subData$Datetime,
     subData$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# Plot 3 (bottom-left)
plot(subData$Datetime,
     subData$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")

lines(subData$Datetime, subData$Sub_metering_2, col="red")
lines(subData$Datetime, subData$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")

# Plot 4 (bottom-right)
plot(subData$Datetime,
     subData$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global Reactive Power")

dev.off()

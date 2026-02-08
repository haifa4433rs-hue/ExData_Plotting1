## Plot 3

# Load data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter Feb 1–2, 2007
subData <- subset(data,
                  Date == "2007-02-01" | Date == "2007-02-02")

# Convert sub-metering columns to numeric
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)

# Datetime column
subData$Datetime <- as.POSIXct(paste(subData$Date, subData$Time))

# Save plot
png("plot3.png", width = 480, height = 480)

# Plot first line
plot(subData$Datetime,
     subData$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

# Add other lines
lines(subData$Datetime, subData$Sub_metering_2, col = "red")
lines(subData$Datetime, subData$Sub_metering_3, col = "blue")

# Legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()

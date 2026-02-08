## Plot 2

# Load data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter only Feb 1 and Feb 2, 2007
subData <- subset(data,
                  Date == "2007-02-01" | Date == "2007-02-02")

# Convert Global Active Power to numeric
subData$Global_active_power <- as.numeric(subData$Global_active_power)

# Create Datetime column
subData$Datetime <- as.POSIXct(paste(subData$Date, subData$Time))

# Save plot as PNG
png("plot2.png", width = 480, height = 480)

# Plot line graph
plot(subData$Datetime,
     subData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

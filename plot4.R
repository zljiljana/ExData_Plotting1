# Author: Ljiljana Zigic
# Project 1, Exploratory Data Analysis
# Read in 'Electric power consumption' dataset and make a plot of the following four variables:
# - Global Active Power vs 'Time'
# - Voltage vs 'Time'
# - Energy Sub-Metering vs 'Time'
# - Global Reactive Power vs 'Time'

# Read in the dataset and subset based on the needed date
dataFrame <- subset(read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

# Combine the 'Date' and 'Time' strings into a vector
vec = paste(as.character(dataFrame$Date), as.character(dataFrame$Time), sep = " ")
# Adjust the format
vec = strptime(vec, "%d/%m/%Y %H:%M:%S")
# Append to data frame
dataFrame <- cbind(vec,dataFrame)

# Plot to a png file
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with (dataFrame, {
  plot(vec, Global_active_power, xlab ="", ylab = "Global Active Power", type = "l")
  plot(vec, Voltage, xlab ="datetime", ylab = "Voltage", type = "l")
  plot(vec, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "n")
  points(vec, Sub_metering_1, type = "l")
  points(vec, Sub_metering_2, col='red', type = "l")
  points(vec, Sub_metering_3, col='blue', type = "l")
  legend("topright", lty=1, lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n")
  plot(vec,Global_reactive_power, xlab ="datetime", ylab = "Global_reactive_power", type = "l")
})
dev.off()
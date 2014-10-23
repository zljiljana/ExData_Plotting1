# Author: Ljiljana Zigic
# Project 1, Exploratory Data Analysis
# Read in 'Electric power consumption' dataset and make a plot of 'Energy Sub-Metering' vs 'Time'

# Read in the dataset and subset based on the needed date
dataFrame <- subset(read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

# Combine the 'Date' and 'Time' strings into a vector
vec = paste(as.character(dataFrame$Date), as.character(dataFrame$Time), sep = " ")
# Adjust the format
vec = strptime(vec, "%d/%m/%Y %H:%M:%S")
# Append to data frame
dataFrame <- cbind(vec,dataFrame)

# Plot to a png file
png(filename="plot3.png",width=480,height=480)

with(dataFrame, {
  plot(vec, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "n")
  points(vec, Sub_metering_1, type = "l") # it defaults to black...me thinks
  points(vec, Sub_metering_2, type = "l", col="red")
  points(vec, Sub_metering_3, type = "l", col="blue")
  legend("topright", lty=1, lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
# Author: Ljiljana Zigic
# Project 1, Exploratory Data Analysis
# Read in 'Electric power consumption' dataset and make a histogram of 'Global Active Power'

# Read in the dataset and subset based on the needed date
dataFrame <- subset(read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

# Plot the histogram to a png file
png(file = "plot1.png", width = 480, height = 480)
hist(dataFrame$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Shut down the current device
dev.off()
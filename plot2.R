# Author: Ljiljana Zigic
# Project 1, Exploratory Data Analysis
# Read in 'Electric power consumption' dataset and make a plot of 'Global Active Power' vs 'Time'

# Read in the dataset and subset based on the needed date
dataFrame <- subset(read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

# Combine the 'Date' and 'Time' strings into a vector
vec = paste(as.character(dataFrame$Date), as.character(dataFrame$Time), sep = " ")
# Adjust the format
vec = strptime(vec, "%d/%m/%Y %H:%M:%S")
# Append to data frame
dataFrame <- cbind(vec,dataFrame)

# Plot to a png file
png(filename="plot2.png",width=480,height=480)
plot(dataFrame$vec, dataFrame$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",  main="", type = "l")

dev.off()
data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
startdate <- as.Date("1/2/2007", format="%d/%m/%Y")
enddate <- as.Date("2/2/2007", format="%d/%m/%Y")
get.rows <- data$Date >= startdate & data$Date <= enddate
data <- data[get.rows,]
data <- cbind(data, weekday=weekdays(data$Date))
data$Time <- strptime(data$Time, format="%H:%M:%S")
get.rows <- data$weekday == "Thursday" | data$weekday == "Friday" | data$weekday == "Saturday"
data <- data[get.rows,]
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(data$DateTime[get.rows], as.numeric(data$Global_active_power), type="l", xlab = " ", ylab = "Global Active Power")
plot(data$DateTime[get.rows], as.numeric(data$Voltage), type="l", xlab = "datetime", ylab = "Voltage")
par(lab=c(3,4,7))
plot(data$DateTime, as.numeric(data$Sub_metering_1), main="", xlab=" ", ylab="Energy Sub Metering", type="n")
lines(data$DateTime, as.numeric(data$Sub_metering_1), col="black", type="l")
lines(data$DateTime, as.numeric(data$Sub_metering_2), col="red", type="l")
lines(data$DateTime, as.numeric(data$Sub_metering_3), col="blue", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), cex=0.8, lty=c(1,1,1), bty="n")
plot(data$DateTime[get.rows], as.numeric(data$Global_reactive_power), type="l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()
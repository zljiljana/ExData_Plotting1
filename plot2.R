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
png(filename="plot2.png",width=480,height=480)
plot(data$DateTime[get.rows], as.numeric(data$Global_active_power), type="l", main="", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
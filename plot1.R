data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
startdate <- as.Date("1/2/2007", format="%d/%m/%Y")
enddate <- as.Date("2/2/2007", format="%d/%m/%Y")
get.rows <- data$Date >= startdate & data$Date <= enddate
data <- data[get.rows,]
png(filename="plot1.png",width=480,height=480)
hist(as.numeric(data$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
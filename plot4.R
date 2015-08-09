setwd("C:/Users/Garth/Documents/R/ExploratoryDataAnalysis")

#Download, unzip, and read data into a dataframe, and subset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption"
download.file(url, file)
unzip(file)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Format DateTime
subset$dateTime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot histogram
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(subset$dateTime, as.numeric(subset$Global_active_power), type="l", xlab="", ylab="Global Active Power")

plot(subset$dateTime, as.numeric(subset$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(subset$dateTime, as.numeric(subset$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(subset$dateTime, as.numeric(subset$Sub_metering_2), type="l", col="red")
lines(subset$dateTime, as.numeric(subset$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(subset$dateTime, as.numeric(subset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
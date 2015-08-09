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
png("plot2.png", width=480, height=480)
plot(subset$dateTime, as.numeric(subset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
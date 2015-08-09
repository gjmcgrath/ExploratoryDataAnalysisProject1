setwd("C:/Users/Garth/Documents/R/ExploratoryDataAnalysis")

#Download, unzip, and read data into a dataframe, and subset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption"
download.file(url, file)
unzip(file)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

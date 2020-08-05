#set file url
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download file if do not exists
if(!file.exists("data")) {
  dir.create("data")
  download.file(fileUrl, "./data/dataset.zip")
  unzip("./data/dataset.zip", exdir = "data")
}
#read the data from the file
data <- read.table("data/household_power_consumption.txt", sep=";")
names(data) <- data[1, ]
newdata <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
#download libraries for working with dates and tables
library(lubritate)
library(dplyr)
#add new column to the data set whis is combines date and time
newdata <- mutate(newdata, date_time= paste(newdata$Date, newdata$Time))
#create plot3
png(file = "plot3.png")
plot(dmy_hms(newdata$date_time),as.numeric(newdata$Sub_metering_1), type = "s", xlab = "", ylab = "Energy sub metering")
points(dmy_hms(newdata$date_time),as.numeric(newdata$Sub_metering_3), type = "s", col = "blue")
points(dmy_hms(newdata$date_time),as.numeric(newdata$Sub_metering_2), type = "s", col = "red")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
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
#create plot2
png(file = "plot2.png")
plot(dmy_hms(newdata$date_time),as.numeric(newdata$Global_active_power), type = "s", ylab = "Global Active Power (kilowatts)")
dev.off()
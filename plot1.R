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

png(file = "plot1.png")
hist(as.numeric(newdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
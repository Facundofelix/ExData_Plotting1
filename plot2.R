#Download file

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile="./hhpowerconsumption.zip")


#Unzip file

unzip("./hhpowerconsumption.zip")

#Getting data and subsetting it

data <- read.csv("household_power_consumption.txt", header = T, sep = ";")

data <-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data$Datatime <- strptime(paste(data$Date,data$Time),"%e/%m/%Y %H:%M:%S")

data[,-c(1,2)]<- sapply(data[,-c(1,2)], as.numeric)

#Plotting in png

png("plot2.png")

plot(data$Datatime, data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", type = "l",
     xlab = "")

dev.off()
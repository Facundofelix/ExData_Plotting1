#Download file

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile="./hhpowerconsumption.zip")


#Unzip file

unzip("./hhpowerconsumption.zip")

# Getting data and subsetting it

data <- read.csv("household_power_consumption.txt", header = T, sep = ";")

data[,-c(1,2)]<- sapply(data[,-c(1,2)], as.numeric)


data <-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data$Datatime <- strptime(paste(data$Date,data$Time),"%e/%m/%Y %H:%M:%S")

# Plotting

png("plot4.png")

par(mfrow = c(2,2)) 

# plot 1

plot(data$Datatime, data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", type = "l",
     xlab = "")

# plot 2

with(data,plot(Datatime, Voltage, type = "l"))

# plot 3

plot(data$Datatime, data$Sub_metering_1, col = "black", type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datatime, data$Sub_metering_2, col = "red", type = "l") 
lines(data$Datatime, data$Sub_metering_3, col = "blue", type = "l") 

legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"),lty = c(1,1,1))

# plot 4


with(data,plot(Datatime,Global_reactive_power, type = "l"))


dev.off()
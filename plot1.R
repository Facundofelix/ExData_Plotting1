#Download file

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile="./hhpowerconsumption.zip")


#Unzip file

unzip("./hhpowerconsumption.zip")

#Getting data and subsetting it

data <- read.csv("household_power_consumption.txt", header = T, sep = ";")

data <-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data[,-c(1,2)]<- sapply(data[,-c(1,2)], as.numeric)

#Plotting

plot1<-hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
            ylab = "Frecuency", col = "red", main = "Global Active power", 
            breaks = 15)

#Plotting in png

png("plot1.png")

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frecuency", col = "red", main = "Global Active power", 
     breaks = 15)

dev.off()




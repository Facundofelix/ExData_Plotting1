#Download file

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile="./hhpowerconsumption.zip")


#Unzip file

unzip("./hhpowerconsumption.zip")

# Getting data and subsetting it

data <- read.csv("household_power_consumption.txt", header = T, sep = ";")

data[,-c(1,2)]<- sapply(data[,-c(1,2)], as.numeric)

data <-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data$datetime <- strptime(paste(data$Date,data$Time),"%e/%m/%Y %H:%M:%S")


# Plotting

par(mfrow = c(2,2)) 

# plot 

with(data,{plot(datetime, Global_active_power, 
     ylab = "Global Active Power (kilowatts)", type = "l",
     xlab = "", lwd = 0.01)
  
  # plot 2
  
  plot(datetime, Voltage, type = "l", lwd = 0.01)

  # plot 3

   plot(datetime, Sub_metering_1, col = "black", type = "l",
     xlab = "", ylab = "Energy sub metering",lwd = 0.01)
   lines(datetime, Sub_metering_2, col = "red", type = "l",lwd = 0.01) 
   lines(datetime, Sub_metering_3, col = "blue", type = "l",lwd = 0.01) 
   
   legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"),lty = c(1,1,1),
       cex = 0.75)
   
   # plot 4
   
   plot(datetime,Global_reactive_power, type = "l", lwd = 0.01)})

png("plot4.png")

par(mfrow = c(2,2)) 

# plot 

with(data,{plot(datetime, Global_active_power, 
                        ylab = "Global Active Power (kilowatts)", type = "l",
                        xlab = "", lwd = 0.01)
   
   # plot 2
   
   plot(datetime, Voltage, type = "l", lwd = 0.01)
   
   # plot 3
   
   plot(datetime, Sub_metering_1, col = "black", type = "l",
        xlab = "", ylab = "Energy sub metering")
   lines(datetime, Sub_metering_2, col = "red", type = "l") 
   lines(datetime, Sub_metering_3, col = "blue", type = "l") 
   
   legend("topright", col = c("black","red","blue"),
          legend = c("Sub_metering_1","Sub_metering_2",
                     "Sub_metering_3"),lty = c(1,1,1),
          cex = 0.95)
   
   # plot 4
   
   plot(datetime,Global_reactive_power, type = "l", lwd = 0.01)})

dev.off()




plot4<-function()
{
  data<- read.csv2("datos1.csv", sep=",")
  DateTime<- paste(data$Date,data$Time)
  data<-data.frame(DateTime,data)
  data<-transform(data, "DateTime" = strptime(data$DateTime,"%d/%m/%Y %H:%M:%S"))
  data<-transform(data, "Date" = as.Date(data$Date,format="%d/%m/%Y"))
  data<-transform(data, "Time" = strptime(data$Time,"%H:%M:%S"))
  data<-transform(data, "Global_active_power" = as.numeric(as.character(data$Global_active_power)))
  data<-transform(data, "Global_reactive_power" = as.numeric(as.character(data$Global_reactive_power)))
  data<-transform(data, "Voltage" = as.numeric(as.character(data$Voltage)))
  data<-transform(data, "Global_intensity" = as.numeric(as.character(data$Global_intensity)))
  
  par(mfrow = c(2, 2))
  
  plot(data$DateTime,data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)", main="")
  
  plot(data$DateTime,data$Voltage, type="l", xlab="datetime", ylab = "Voltage", main="")
  
  plot(data$DateTime,data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering", main="")
  with(data,points(DateTime,Sub_metering_2,col="red",type="l"))
  with(data,points(DateTime,Sub_metering_3,col="blue",type="l"))
  legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.25)
  
  plot(data$DateTime,data$Global_reactive_power, type="l", xlab="datetime", ylab = "Global Reactive Power", main="")
  
  dev.copy(png, file = "plot4.png",width = 480, height = 480)
  dev.off()
}
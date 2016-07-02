plot2<-function()
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
  
  
  plot(data$DateTime,data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)", main="")
  
  dev.copy(png, file = "plot2.png",width = 480, height = 480)
  dev.off()
}
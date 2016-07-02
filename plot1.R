plot1<-function()
{
  data<- read.csv2("datos1.csv", sep=",")
  data<-transform(data, "Date" = as.Date(data$Date,format="%d/%m/%Y"))
  data<-transform(data, "Time" = strptime(data$Time,"%H:%M:%S"))
  data<-transform(data, "Global_active_power" = as.numeric(as.character(data$Global_active_power)))
  data<-transform(data, "Global_reactive_power" = as.numeric(as.character(data$Global_reactive_power)))
  data<-transform(data, "Voltage" = as.numeric(as.character(data$Voltage)))
  data<-transform(data, "Global_intensity" = as.numeric(as.character(data$Global_intensity)))
  hist(data$Global_active_power, col=2, xlab = "Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png, file = "plot1.png",width = 480, height = 480)
  dev.off()
}
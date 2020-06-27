par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
data_elctricity <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1 <- subset(data_elctricity,Date %in% c("1/2/2007","2/2/2017"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y") 
data1$Dateandtime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))
with(data1, {
  plot(Global_active_power~Dateandtime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
with(data1, {
  plot(Voltage~Dateandtime, type="l",
       ylab="Voltage", xlab="datetime")
})

with(data1, {
  plot(Sub_metering_1~Dateandtime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Dateandtime,col="red")
  lines(Sub_metering_3~Dateandtime,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(data1, {
  plot(Global_reactive_power~Dateandtime,type="l",
       ylab="Global Rective Power (KVAR)", xlab="datetime")
})

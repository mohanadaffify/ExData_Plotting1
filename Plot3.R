data_elctricity <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1 <- subset(data_elctricity,Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y") 
data1$Dateandtime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))
with(data1, {
  plot(Sub_metering_1~Dateandtime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="Date")
  lines(Sub_metering_2~Dateandtime,col='Red')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
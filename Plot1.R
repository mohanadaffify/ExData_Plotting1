data_elctricity <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1 <- subset(data_elctricity,Date %in% c("1/2/2007","2/2/2017"))
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power", ylab="Frequency", col="Blue")

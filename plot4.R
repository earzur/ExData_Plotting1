hpc <- read.table(file="household_power_consumption.txt",sep =";",na.strings="?",header=TRUE)
hpc$DateTime <- as.POSIXct(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
hpc2 <- subset(hpc,DateTime >= as.POSIXct('2007/02/01') & DateTime < as.POSIXct('2007/02/03'))

png('plot4.png')
par(mfrow=c(2,2))
# 1st plot
plot(hpc2$DateTime,hpc2$Global_active_power,xlab='',ylab="Global Active Power",type='n')
lines(hpc2$DateTime,hpc2$Global_active_power)
# 2nd plot
plot(hpc2$DateTime,hpc2$Voltage,xlab='datetime',ylab="Voltage",type='n')
lines(hpc2$DateTime,hpc2$Voltage)
# 3rd plot
plot(hpc2$DateTime,hpc2$Sub_metering_1, type="n", xlab='', ylab="Energy sub metering")
lines(hpc2$DateTime,hpc2$Sub_metering_1,col = 'black')
lines(hpc2$DateTime,hpc2$Sub_metering_2,col = 'red')
lines(hpc2$DateTime,hpc2$Sub_metering_3,col = 'blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, bty = "n")
# 4th plot
plot(hpc2$DateTime, hpc2$Global_reactive_power, type = "n", xlab='datetime', ylab='Global_reactive_power')
lines(hpc2$DateTime, hpc2$Global_reactive_power)
dev.off()

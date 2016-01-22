hpc <- read.table(file="household_power_consumption.txt",sep =";",na.strings="?",header=TRUE)
hpc$DateTime <- as.POSIXct(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
hpc2 <- subset(hpc,DateTime >= as.POSIXct('2007/02/01') & DateTime < as.POSIXct('2007/02/03'))

png('plot2.png')
plot(hpc2$DateTime,hpc2$Global_active_power, type="n", xlab='', ylab="Global Active Power (kilowatts)")
lines(hpc2$DateTime,hpc2$Global_active_power)
dev.off()

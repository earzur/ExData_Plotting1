setAs("character","myDate", function(from) as.Date(from,format="%d/%m/%Y"))
hpc <- read.table(file="household_power_consumption.txt",sep =";",na.strings="?",header=TRUE,colClasses=c('myDate','character',NA,NA,NA,NA,NA,NA,NA))
hpc2 <- subset(hpc,Date=='2007/02/01' | Date == '2007/02/02')

png('plot1.png')
hist(hpc2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

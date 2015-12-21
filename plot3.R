#Load the Dataset
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
			na.strings="?")

#Filter the data collected on the 1st and 2nd  or February 2007
dataSub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
rm(data)

# merge Date and time features and convert to date class
dataSub$datetime<-strptime(paste(dataSub$Date,dataSub$Time),format="%d/%m/%Y %H:%M:%S")

#Save the plot 3 as a PNG file
png(filename = "plot3.png", width = 480, height = 480)

plot(dataSub$datetime,dataSub$Sub_metering_1, type="l", col="black", 
	ylab="Energy sub metering", xlab="",ylim=c(0,35))
lines(dataSub$datetime,dataSub$Sub_metering_2, col="red")
lines(dataSub$datetime,dataSub$Sub_metering_3, col="blue")

legend("topright",col=c("black","red","blue"),
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

dev.off()
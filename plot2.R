#Load the Dataset
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
			na.strings="?")

#Filter the data collected on the 1st and 2nd  or February 2007
dataSub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
rm(data)

#Save the plot 2 as a PNG file
png(filename = "plot2.png", width = 480, height = 480)
plot(strptime(paste(dataSub$Date,dataSub$Time),
	format="%d/%m/%Y %H:%M:%S"),dataSub$Global_active_power,type="l",
	ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
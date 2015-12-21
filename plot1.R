#Load the Dataset
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
			na.strings="?")

#Filter the data collected on the 1st and 2nd  or February 2007
dataSub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
rm(data)

#Save the plot 1 as a PNG file
png(filename = "plot1.png", width = 480, height = 480)
hist(dataSub$Global_active_power, col="red", main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
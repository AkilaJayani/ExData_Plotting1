#Load the Dataset
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Filter the data collected on the 1st and 2nd  or February 2007
startDate<-strptime("1/2/2007",format="%d/%m/%Y")
endDate<-strptime("2/2/2007",format="%d/%m/%Y")
logic<-strptime(data[,1],format="%d/%m/%Y")>=startDate &  strptime(data[,1],format="%d/%m/%Y")<=endDate
dataSub<-data[logic,]
rm(data,logic)

#Convert factor variable "Global_active_power" to numeric
dataSub[,3]<-as.numeric(levels(dataSub[,3]))[dataSub[,3]]

#Save the plot 1 as a PNG file
png(filename = "plot1.png", width = 480, height = 480)
hist(dataSub[,3],col="darkorange",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
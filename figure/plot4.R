#Load the Dataset
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Filter the data collected on the 1st and 2nd  or February 2007
startDate<-strptime("1/2/2007",format="%d/%m/%Y")
endDate<-strptime("2/2/2007",format="%d/%m/%Y")
logic<-strptime(data[,1],format="%d/%m/%Y")>=startDate &  strptime(data[,1],format="%d/%m/%Y")<=endDate
dataSub<-data[logic,]
rm(data,logic)

#Convert factor variables to numeric
dataSub[,3]<-as.numeric(levels(dataSub[,3]))[dataSub[,3]]
dataSub[,4]<-as.numeric(levels(dataSub[,4]))[dataSub[,4]]
dataSub[,5]<-as.numeric(levels(dataSub[,5]))[dataSub[,5]]
dataSub[,7]<-as.numeric(levels(dataSub[,7]))[dataSub[,7]]
dataSub[,8]<-as.numeric(levels(dataSub[,8]))[dataSub[,8]]

#Save the plot 4 as a PNG file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,3],type="l",ylab="Global Active Power", xlab="")

plot(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,5],type="l",ylab="Voltage", xlab="datetime")

plot(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,7],type="l",col="black",ylab="Energy sub metering", xlab="",ylim=c(0,35))
lines(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,8],col="red")
lines(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,9],col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

plot(strptime(paste(dataSub[,1],dataSub[,2]),format="%d/%m/%Y %H:%M:%S"),dataSub[,4],type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()
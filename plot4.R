file<- read.csv("household_power_consumption.txt", sep= ";", na.strings= "?", header= TRUE)
filedf<- file[file$Date == "1/2/2007"|file$Date =="2/2/2007",] #select only 2007-2-1 to 2007-2-2
DateTime <- paste(filedf$Date,filedf$Time)
powerdf<- cbind(DateTime,filedf)
powerdf<- transform(powerdf, DateTime= strptime(powerdf$DateTime, format= "%d/%m/%Y %H:%M:%S"))

## transform the Date and Time to POSIXlt and POSIXt:
##              DateTime Global_active_power Global_reactive_power Voltage
##1 2007-02-01 00:00:00               0.326                 0.128  243.15
##2 2007-02-01 00:01:00               0.326                 0.130  243.32
##3 2007-02-01 00:02:00               0.324                 0.132  243.51

##open the png file device first!! to get the fitted legend box.
png(filename= "plot4.png")

##set mfrow
par(mfrow=c(2,2))

##plot topleft
plottp<- plot(housepower$DateTime,housepower$Global_active_power,type="l",
             xlab="",ylab="Global Active Power (kilowatts)")
##plot topright
plottr<- plot(housepower$DateTime,housepower$Voltage,type="l",
              xlab="datatime",ylab="Voltage")

##plot bottomleft
plotbl<- plot(housepower$DateTime,housepower$Sub_metering_1,type="l",
             xlab="",ylab="Energy sub metering")
lines(housepower$DateTime,housepower$Sub_metering_2, type="l",
      col="red")
lines(housepower$DateTime,housepower$Sub_metering_3, type="l",
      col="blue")
legend("topright", legend=names(housepower[,6:8]),
       lty=c("solid","solid","solid"),col= c("black","red","blue"))

##plot bottomright
plotbr<- plot(housepower$DateTime,housepower$Global_reactive_power,type="l",
              xlab="datatime",ylab="Global_reactive_power")

##close png file device
dev.off()
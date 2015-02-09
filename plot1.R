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

##plot frequency histograms

plot1<- hist(housepower$Global_active_power,
     col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

##copy to png file Decive

dev.copy(png, file="plot1.png")
dev.off()
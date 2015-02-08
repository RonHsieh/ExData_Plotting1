## transform the Date and Time to POSIXlt and POSIXt:
##              DateTime Global_active_power Global_reactive_power Voltage
##1 2007-02-01 00:00:00               0.326                 0.128  243.15
##2 2007-02-01 00:01:00               0.326                 0.130  243.32
##3 2007-02-01 00:02:00               0.324                 0.132  243.51

##open the png file device first!! to get the fitted legend box.
png(filename= "plot3.png")

##plot and add lines
plot3<- plot(housepower$DateTime,housepower$Sub_metering_1,type="l",
             xlab="",ylab="Energy sub metering")
lines(housepower$DateTime,housepower$Sub_metering_2, type="l",
      col="red")
lines(housepower$DateTime,housepower$Sub_metering_3, type="l",
      col="blue")

##add legends
legend("topright", legend=names(housepower[,6:8]),
        lty=c("solid","solid","solid"),col= c("black","red","blue"))

##close png file device
dev.off()
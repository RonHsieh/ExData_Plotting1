## transform the Date and Time to POSIXlt and POSIXt:
##              DateTime Global_active_power Global_reactive_power Voltage
##1 2007-02-01 00:00:00               0.326                 0.128  243.15
##2 2007-02-01 00:01:00               0.326                 0.130  243.32
##3 2007-02-01 00:02:00               0.324                 0.132  243.51

##plot line chart
plot2<- plot(housepower$DateTime,housepower$Global_active_power,type="l",
             xlab="",ylab="Global Active Power (kilowatts)")

##copy to png file Decive

dev.copy(png, file="plot2.png")
dev.off()
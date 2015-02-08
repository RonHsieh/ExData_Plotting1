##plot frequency histograms

plot1<- hist(housepower$Global_active_power,
     col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

##copy to png file Decive

dev.copy(png, file="plot1.png")
dev.off()
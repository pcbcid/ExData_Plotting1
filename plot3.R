dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]




dt <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(sdata$Global_active_power)

sM1 <- as.numeric(sdata$Sub_metering_1)
sM2 <- as.numeric(sdata$Sub_metering_2)
sM3 <- as.numeric(sdata$Sub_metering_3)



plot(dt, sM1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sM2, type="l", col="red")
lines(dt, sM3, type="l", col="blue")



legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


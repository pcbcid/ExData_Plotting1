dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]




dt <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(sdata$Global_active_power)
gRAP <- as.numeric(sdata$Global_reactive_power)

voltage <- as.numeric(sdata$Voltage)

sM1 <- as.numeric(sdata$Sub_metering_1)
sM2 <- as.numeric(sdata$Sub_metering_2)
sM3 <- as.numeric(sdata$Sub_metering_3)



par(mfrow = c(2, 2)) 

plot(dt, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, sM1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sM2, type="l", col="red")
lines(dt, sM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, gRAP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


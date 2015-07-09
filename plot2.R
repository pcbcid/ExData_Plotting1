dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(sdata$Global_active_power)


plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



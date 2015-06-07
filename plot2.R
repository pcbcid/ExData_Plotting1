dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


gAP <- as.numeric(sdata$Global_active_power)
dev.copy(png, file="plot1.png", height=480, width=480)
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()



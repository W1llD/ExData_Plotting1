file <- "household_power_consumption.txt"

read.table(file, head = TRUE, sep = ";", na.strings = "?") -> Epc
Epc[grep("^[12]/2/2007", Epc$Date), ] -> x
as.Date(strptime(x$Date, format = "%d/%m/%Y")) -> x$Date
strptime(paste(x$Date, x$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S") -> x$Time

#plot3

png(filename="plot3.png", width = 480, height = 480)
plot(x$Time, x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x$Time, x$Sub_metering_2, type = "l", col = "red")
lines(x$Time, x$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


file <- "household_power_consumption.txt"

read.table(file, head = TRUE, sep = ";", na.strings = "?") -> Epc
Epc[grep("^[12]/2/2007", Epc$Date), ] -> x
as.Date(strptime(x$Date, format = "%d/%m/%Y")) -> x$Date
##strptime(x$Time, format = "%H:%M:%S") -> x$Time
strptime(paste(x$Date, x$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S") -> x$Time

##plot1
png(filename="plot1.png", width = 480, height = 480)
hist(x$Global_active_power, main = "Global active power", col = "red", xlab = "Global active power (kilowates)")
dev.off()

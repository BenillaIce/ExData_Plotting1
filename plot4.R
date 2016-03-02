# This file reads some data and plots four different graphs

# read data
powerdata<-read.csv("household_power_consumption.txt", nrows = 100000, na.strings = "?", sep = ";")

# Convert to datetime
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

# Subset data to contain measurements only from two days
powerdata2<-powerdata[powerdata$Date > "2007-01-31" & powerdata$Date < "2007-02-03",]

# combine date and time
powerdata2$Date<-as.POSIXct(paste(powerdata2$Date, powerdata2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png image file
png(filename = "plot4.png",width = 480, height = 480, units = "px")

# create a 2x2 plot
par(mfrow = c(2,2))

# plot #1: Global active power
plot(powerdata2$Date, powerdata2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(powerdata2$Date, powerdata2$Global_active_power, type = "l")

# plot #2: Voltage
plot(powerdata2$Date, powerdata2$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(powerdata2$Date, powerdata2$Voltage, type = "l")

# plot #3: the sub meter data
plot(powerdata2$Date, powerdata2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(powerdata2$Date, powerdata2$Sub_metering_1, type = "l")
lines(powerdata2$Date, powerdata2$Sub_metering_2, type = "l", col = "red")
lines(powerdata2$Date, powerdata2$Sub_metering_3, type = "l", col = "blue")

# get column names
cnames<-colnames(powerdata2)

# add legend to plot #3
legend("topright", c(cnames[7:9]), col = c("black","blue","red"), bty = "n", lwd=1, lty=c(1,1,1), pch = c(NA,NA,NA))

# plot #4 reactive power
plot(powerdata2$Date, powerdata2$Global_reactive_power, ylab = "Global reactive power", xlab = "datetime", type = "n")
lines(powerdata2$Date, powerdata2$Global_reactive_power, type = "l")

# close graphics device
dev.off()


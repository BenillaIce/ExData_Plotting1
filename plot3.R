# This file reads some data and plots the histogram of the global active power

# read data
powerdata<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 100000)

# Convert to datetime
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

# Subset data to contain measurements only from two days
powerdata2<-powerdata[powerdata$Date > "2007-01-31" & powerdata$Date < "2007-02-03",]

# combine date and time
powerdata2$Date<-as.POSIXct(paste(powerdata2$Date, powerdata2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png image file
png(filename = "plot3.png",width = 480, height = 480, units = "px")

# plot the meter data
plot(powerdata2$Date, powerdata2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(powerdata2$Date, powerdata2$Sub_metering_1, type = "l")
lines(powerdata2$Date, powerdata2$Sub_metering_2, type = "l", col = "red")
lines(powerdata2$Date, powerdata2$Sub_metering_3, type = "l", col = "blue")

# get column names
cnames<-colnames(powerdata2)

# add legend
legend("topright", c(cnames[7:9]), col = c("black","blue","red"), lwd=1, lty=c(1,1,1), pch = c(NA,NA,NA))

# close graphics device,
dev.off()


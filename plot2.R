# This file reads some data and plots the global active power as time series

# read data
powerdata<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 100000)

# Convert to datetime
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

# Subset data to contain measurements only from two days
powerdata2<-powerdata[powerdata$Date > "2007-01-31" & powerdata$Date < "2007-02-03",]

# combine date and time
powerdata2$Date<-as.POSIXct(paste(powerdata2$Date, powerdata2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png image file
png(filename = "plot2.png",width = 480, height = 480, units = "px")

# create a plot with no data visible
plot(powerdata2$Date, powerdata2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close graphics device
dev.off()

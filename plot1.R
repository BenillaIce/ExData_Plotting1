# This file reads some data and plots the histogram of the global active power

# read data
powerdata<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 100000)

# Convert to datetime
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

# Subset data to contain measurements only from two days
powerdata2<-powerdata[powerdata$Date > "2007-01-31" & powerdata$Date < "2007-02-03",]

# print to png image file
png(filename = "plot1.png",width = 480, height = 480, units = "px")

# plot the histogram
hist(as.numeric(powerdata2$Global_active_power),xlab = "Global active power (kilowatts)", ylab = "Frequency", col = "red", main = "Global active power")

# close graphics device
dev.off()
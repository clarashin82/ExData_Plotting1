## DATA PREPARATION

# Set up working directory
setwd("C:/Users/Clarish/Downloads/exdata-data-household_power_consumption")
# Read in the text file. Sep = ";"
dat <- read.csv("household_power_consumption.txt", sep=";")
# Default class of Date is factor, so change the class and subset the data with the dates 2007-02-01 or 2007-02-02
dat$Date <- as.character(dat$Date)
dat1 <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")


## PLOTTING AND SAVING

# open png device
png(filename = "plot4.png")

# using par command to split the plotting area
par(mfrow = c(2,2))

# Change the class of Global Active Power into numeric
dat1$Global_active_power <- as.numeric(levels(dat1$Global_active_power)[dat1$Global_active_power])
# plot Global Active Power/ set labels/ set axis
plot(dat1$Global_active_power, type="l",  xaxt = "n", xlab = "", ylab = "Global Active Power")
axis(1, at=c(1, length(dat1$Global_active_power)/2, length(dat1$Global_active_power)), c("Thu", "Fri", "Sat"))

# Change the class of Voltage into numeric
dat1$Voltage <- as.numeric(levels(dat1$Voltage)[dat1$Voltage])
# plot Voltage/ set labels/ set axis
plot(dat1$Voltage, type="l",  xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at=c(1, length(dat1$Voltage)/2, length(dat1$Voltage)), c("Thu", "Fri", "Sat"))

# Change the class of Energy sub metering into numeric
dat1$Sub_metering_1 <- as.numeric(levels(dat1$Sub_metering_1)[dat1$Sub_metering_1])
dat1$Sub_metering_2 <- as.numeric(levels(dat1$Sub_metering_2)[dat1$Sub_metering_2])
dat1$Sub_metering_3 <- as.numeric(levels(dat1$Sub_metering_3)[dat1$Sub_metering_3])
# plot Energy sub metering/ set labels/ set axis
plot(dat1$Sub_metering_1, type="l",  xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(dat1$Sub_metering_2, col="red")
lines(dat1$Sub_metering_3, col="blue")
axis(1, at=c(1, length(dat1$Global_active_power)/2, length(dat1$Global_active_power)), c("Thu", "Fri", "Sat"))
# set legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# Change the class of Global_reactive_power into numeric
dat1$Global_reactive_power <- as.numeric(levels(dat1$Global_reactive_power)[dat1$Global_reactive_power])
# plot Global_reactive_power/ set labels/ set axis
plot(dat1$Global_reactive_power, type="l",  xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at=c(1, length(dat1$Global_reactive_power)/2, length(dat1$Global_reactive_power)), c("Thu", "Fri", "Sat"))

# turn off device
dev.off() 

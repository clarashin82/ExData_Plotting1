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
png(filename = "plot3.png")

# Change the class of Energy sub metering into numeric
dat1$Sub_metering_1 <- as.numeric(levels(dat1$Sub_metering_1)[dat1$Sub_metering_1])
dat1$Sub_metering_2 <- as.numeric(levels(dat1$Sub_metering_2)[dat1$Sub_metering_2])
dat1$Sub_metering_3 <- as.numeric(levels(dat1$Sub_metering_3)[dat1$Sub_metering_3])
# plot Energy sub metering/ set labels/ set axis
plot(dat1$Sub_metering_1, type="l",  xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(dat1$Sub_metering_2, col="red")
lines(dat1$Sub_metering_3, col="blue")
axis(1, at=c(1, length(dat1$Sub_metering_1)/2, length(dat1$Sub_metering_1)), c("Thu", "Fri", "Sat"))
# set legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# turn off device
dev.off() 


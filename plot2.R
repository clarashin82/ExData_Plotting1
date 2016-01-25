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
png(filename = "plot2.png")

# Change the class of Global Active Power into numeric
dat1$Global_active_power <- as.numeric(levels(dat1$Global_active_power)[dat1$Global_active_power])
# plot Global Active Power/ set labels/ set axis
plot(dat1$Global_active_power, type="l",  xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1, length(dat1$Global_active_power)/2, length(dat1$Global_active_power)), c("Thu", "Fri", "Sat"))

# turn off device
dev.off() 

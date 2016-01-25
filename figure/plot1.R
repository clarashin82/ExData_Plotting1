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
png(filename = "plot1.png")

# Change the class of Global Active Power into numeric
dat1$Global_active_power <- as.numeric(levels(dat1$Global_active_power)[dat1$Global_active_power])
# set histogram color to red/ set X label/ set main title as shown in the example
hist(dat1$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# turn off device
dev.off() 



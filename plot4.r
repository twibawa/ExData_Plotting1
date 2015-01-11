rm(list = ls(all = T))

##set directory
dir <- "D:\\Coursera\\exploratory_data_analysis\\course_project1\\"
setwd(dir)

##read original data
fname <- "household_power_consumption.txt"
plotname <- "plot4"
dat <- read.table(file = fname, sep = ";", header = T, na.strings = "?")

##subset data of 2007-02-01 and 2007-02-02 only
date1 <- "1/2/2007"
date2 <- "2/2/2007"
dat <- dat[dat$Date == date1 | dat$Date == date2, ]

##extract day and combine Dates Times
dat$day <- weekdays(as.Date(dat$Date))
dat$tm <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##plot and save it in png
png(paste(plotname, ".png", sep = ""), width=480, height=480, units="px")
par(mfrow=c(2,2))
#plot 1
plot(dat$tm, dat$Global_active_power, ylab = "Global Acive Power (kilowatts)", xlab = "", xaxt = "n", type = "l")
axis.POSIXct(1, at = c(dat$tm[1], dat$tm[(nrow(dat)/2)+1]), labels = T)
#plot 2
plot(dat$tm, dat$Voltage, ylab = "Voltage", xlab = "datetime", xaxt = "n", type = "l")
axis.POSIXct(1, at = c(dat$tm[1], dat$tm[(nrow(dat)/2)+1]), labels = T)
#plot 3
plot(dat$tm, dat$Sub_metering_1, ylab = "Energy sub metering", xlab = "", xaxt = "n", type = "l", col = 1, lty = 1)
lines(dat$tm, dat$Sub_metering_2, ylab = "", xlab = "", xaxt = "n", type = "l", col = 2, lty = 1)
lines(dat$tm, dat$Sub_metering_3, ylab = "", xlab = "", xaxt = "n", type = "l", col = 4, lty = 1)
legend("topright", lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
col = c("black", "red", "blue"), bty = "n")
axis.POSIXct(1, at = c(dat$tm[1], dat$tm[(nrow(dat)/2)+1]), labels = T)
#plot 4
plot(dat$tm, dat$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n", type = "l")
axis.POSIXct(1, at = c(dat$tm[1], dat$tm[(nrow(dat)/2)+1]), labels = T)
dev.off() 
rm(list = ls(all = T))

##set directory
dir <- "D:\\Coursera\\exploratory_data_analysis\\course_project1\\"
setwd(dir)

##read original data
fname <- "household_power_consumption.txt"
plotname <- "plot2"
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
plot(dat$tm, dat$Global_active_power, ylab = "Global Acive Power (kilowatts)", xlab = "", xaxt = "n", type = "l")
axis.POSIXct(1, at = c(dat$tm[1], dat$tm[(nrow(dat)/2)+1]), labels = T)

dev.off() 
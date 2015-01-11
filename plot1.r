rm(list = ls(all = T))

##set directory
dir <- "D:\\Coursera\\exploratory_data_analysis\\course_project1\\"
setwd(dir)

##read original data
fname <- "household_power_consumption.txt"
plotname <- "plot1"
dat <- read.table(file = fname, sep = ";", header = T, na.strings = "?")

##subset data of 2007-02-01 and 2007-02-02 only
dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

##plot histogram and save it in png
png(paste(plotname, ".png", sep = ""), width=480, height=480, units="px")
hist(dat$Global_active_power, col = 2, xlab = "Global Acive Power (kilowatts)", main = "Global Active Power")
dev.off() 
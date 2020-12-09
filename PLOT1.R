library("data.table")
setwd("~/Desktop/Exploratory data analysis")
powerDT <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?" ) #reads data
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")] #filters
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("PLOT1.png", width=480, height=480)
hist(powerDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") #plot1
dev.off()

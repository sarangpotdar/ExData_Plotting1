df <- read.csv(file = 'household_power_consumption.txt',sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df.subset <- subset(df, Date %in% as.Date(c("2007-02-01","2007-02-02"),format = "%Y-%m-%d"))
df.subset$Time <- as.character(df.subset$Time)
df.subset$DateTime <- paste(df.subset$Date, df.subset$Time, sep = " ")
df.subset$DateTime <- strptime(df.subset$DateTime,format = "%Y-%m-%d %H:%M:%s")

# Plot
with(df.subset, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df.subset, lines(DateTime, Sub_metering_2, col = "red"))
with(df.subset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = c(1,1,1))
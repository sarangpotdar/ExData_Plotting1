df <- read.csv(file = 'household_power_consumption.txt',sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df.subset <- subset(df, Date %in% as.Date(c("2007-02-01","2007-02-02"),format = "%Y-%m-%d"))
df.subset$Time <- as.character(df.subset$Time)
df.subset$DateTime <- paste(df.subset$Date, df.subset$Time, sep = " ")
df.subset$DateTime <- strptime(df.subset$DateTime,format = "%Y-%m-%d %H:%M:%s")

# Plot
with (df.subset, hist(Global_active_power,col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power"))
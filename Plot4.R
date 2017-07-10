# Reading into R

W1 <- read.table("C:/DSTCourse/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")

# Converting into date

W1$Date2 <- as.Date(as.character(W1$Date), "%d/%m/%Y")

# Selecting only the enties between the dates 2007-02-01 and 2007-02-02

x <- W1[W1$Date2 >= "2007-02-01" & W1$Date2 <= "2007-02-02",]

# Creating a datetime variable

x$datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plotting the graph in file plot4.png

png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(x$datetime, x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x$datetime,x$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "",yaxt = "n")
axis(side=2,at = seq(0,30,10))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_1)), col = "black"))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_2)), col = "red"))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

x$Voltage <- as.numeric(as.character(x$Voltage))
plot(x$datetime,x$Voltage, type = "l", yaxt = "n",xlab= "datetime",ylab="voltage")
axis(side=2, at = c(234,238,242,246))

x$Global_reactive_power <- as.numeric(as.character(x$Global_reactive_power))
plot(x$datetime,x$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
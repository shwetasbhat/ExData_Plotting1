# Reading the data into R

W1 <- read.table("C:/DSTCourse/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")

# Converting into date

W1$Date2 <- as.Date(as.character(W1$Date), "%d/%m/%Y")

# Selecting only the enties between the dates 2007-02-01 and 2007-02-02

x <- W1[W1$Date2 >= "2007-02-01" & W1$Date2 <= "2007-02-02",]

# Creating a datetime variable

x$datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plotting the graph in file plot3.png

png(file = "plot3.png", width =480, height = 480)
plot(x$datetime,x$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "",yaxt = "n")

# Specifying the Y-axis ticks

axis(side=2,at = seq(0,30,10))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_1)), col = "black"))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_2)), col = "red"))
with(x,lines(datetime,as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
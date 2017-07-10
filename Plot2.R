# Reading the data into R

W1 <- read.table("C:/DSTCourse/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")

# Converting into date

W1$Date2 <- as.Date(as.character(W1$Date), "%d/%m/%Y")

# Selecting only the enties between the dates 2007-02-01 and 2007-02-02

x <- W1[W1$Date2 >= "2007-02-01" & W1$Date2 <= "2007-02-02",]

# Creating a datetime variable and converting the factor to numeric type

x$datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
x$Global_active_power <- as.numeric(levels(x$Global_active_power))[x$Global_active_power]

# Plotting the graph in the file plot2.png

png(file= "plot2.png", width = 480, height = 480)
plot(x$datetime, x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
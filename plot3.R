# Reading household data from 01-02-2007 to 02-02-2007
household <- read.csv("household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?",
                      skip = 66636, nrows = 2880)

# Specifying Column names
colnames(household) <- c("Date", "Time", "Global_active_power", 
                         "Global_reactive_power", "Voltage", "Global_intensity", 
                         "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Converting into proper date and time format
house_date <- as.Date(household$Date)
house_time <- paste(household$Date, household$Time, sep = " ")
house_time <- strptime(house_time, format = "%d/%m/%Y %H:%M:%S")

# Initializing Chart
plot(house_time, household$Sub_metering_1, ylab = "Energy sub metering ", 
     xlab = "", type = "n", cex.axis = 0.7, cex.lab = 0.8)

# Plotting successive lines on Chart
lines(house_time, household$Sub_metering_1, type = "l")
lines(house_time, household$Sub_metering_2, type = "l", col = "red")
lines(house_time, household$Sub_metering_3, type = "l", col = "blue")

# Legend Specification
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),lty = c(1, 1, 1), 
       cex = 0.7, y.intersp = 0.3, x.intersp = 2.5,  
        adj = 0.22)

# Creating PNG File
dev.copy(png, file = "plot3.png", height = 480, width = 480)

# Close device connection
dev.off()
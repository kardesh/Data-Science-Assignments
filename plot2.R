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

# Plotting Line Chart
plot(house_time, household$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "", 
     cex.lab = 0.8, cex.axis = 0.7)

# Creating PNG File
dev.copy(png, file = "plot2.png", height = 480, width = 480)

# Close device connection
dev.off()

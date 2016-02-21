#Reading household data from 01-02-2007 to 02-02-2007
household <- read.csv("household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?",
                      skip = 66636, nrows = 2880)

# Specifying Column names
colnames(household) <- c("Date", "Time", "Global_active_power", 
                         "Global_reactive_power", "Voltage", "Global_intensity", 
                         "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Plotting Histogram
hist(household$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Creating PNG File
dev.copy(png, file = "plot1.png", height = 480, width = 480)

#Close device connection
dev.off()


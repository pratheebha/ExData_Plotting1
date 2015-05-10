## reading the data from Electric power consumption in household 
data <- read.table("./DOWNLOADS/household_power_consumption.txt", header =T, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"),"%Y-%m-%d") ## formatting the date into the dates variable
data_subset <- subset(data, Date %in% dates) ## subsetting the dates between the a given range of dates
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time, sep =" "), format = "%Y-%m-%d %H:%M:%S") ## formats the DateTime for use in graphs

## creates a png fie
png(filename = "plot3.png", width = 480, height = 480, bg ="white")

## uses the plot function taking in the DateTime and Sub_metering_1 column into account to draw a line graph with ylabel as eneergy sub metering
plot(data_subset$DateTime, data_subset$Sub_metering_1, type = "l",  
     xlab = "",  ylab = "Energy sub metering")
## draws a line graph for sub metering 2 and sub metering 3  for the given DateTime highlighted in red and blue with a line width of 2 
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red", lwd = 2) ## add lines for Sub_metering_2
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue", lwd = 2) ## add lines for Sub_metering_3

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), 
       lwd = c(2,2), col =c("black","red", "blue")) ## creates a legend on the top right corner of the graph describing the line graphs based on the colors mentioned

dev.off()
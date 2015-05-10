## reading the data from Electric power consumption in household 
data <- read.table("./DOWNLOADS/household_power_consumption.txt", header =T, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"),"%Y-%m-%d") ## formatting the date into the dates variable
data_subset <- subset(data, Date %in% dates) ## subsetting the dates between the a given range of dates
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time, sep =" "), format = "%Y-%m-%d %H:%M:%S") ## formats DateTime for use in the graphs

## creates a png file in pixels mentioned
png(filename = "plot2.png", width = 480, height = 480, bg ="white")

## uses the plot function which takes in 2 columns of data the DateTime and the global active power from
## the data subset, creates a line graph wih Global Active power on the ylabel 
plot(data_subset$DateTime, data_subset$Global_active_power, type = "l", xlab="",  ylab = "Global Active Power(kilowatts)")
dev.off()

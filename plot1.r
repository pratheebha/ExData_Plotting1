## reading the data from Electric power consumption in household 
data <- read.table("./DOWNLOADS/household_power_consumption.txt", header =T, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na = "?")
                
data$Date <- as.Date(data$Date, "%d/%m/%Y") 
dates <- as.Date(c("2007-02-01", "2007-02-02"),"%Y-%m-%d") ## formatting the date into the dates variable
data_subset <- subset(data, Date %in% dates) ## subsetting the dates between the a given range of dates

## create a png file with width of 480Px, height of 480px with a background being white

png(filename = "plot1.png", width = 480, height = 480, bg ="white")

## create a histogram with the hist function with takes in the Glabal active data from the data subset 
## also takes the parameters as color, title in main and the xlabel 
hist(as.numeric(data_subset$Global_active_power), col = "red", main ="Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()



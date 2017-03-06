## Coursera - Exploratory Data Analysis - March, 2017.
## Course Project 1 - Plotting

# Overall Goal: how household energy usage varies over a 2-day period in February, 2007.

## Reading data, converting and subset --------------

full_data <- read.table("household_power_consumption.txt",
                        header = TRUE, 
                        sep = ";")

str(full_data)
summary(full_data)

# Subsetting ----------

full_data_sub <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") , ]

# convert the date format ---------------

datetime <- strptime(paste(full_data_sub$Date, full_data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Extracting elements from the dataset  ---------------

globalactivepower <- as.numeric(full_data_sub$Global_active_power)
submetering1 <- as.numeric(full_data_sub$Sub_metering_1)
submetering2 <- as.numeric(full_data_sub$Sub_metering_2)
submetering3 <- as.numeric(full_data_sub$Sub_metering_3)

# Plotting 3 ----------------

# Opening the device
png("plot3.png",
    width=480,
    height=480)

plot(datetime, 
     submetering1,
     type="l",
     ylab="Energy Submeterinng.", 
     xlab="")

lines(datetime,
      submetering2, 
      type="l", 
      col="red")
lines(datetime,
      submetering3, 
      type="l", 
      col="blue")
legend("topright",
       c("submetering1", "submetering2", "submetering3"),
       lty = 1, 
       lwd = 2.5,
       col = c("black", "red", "blue"))

# closing device
dev.off()

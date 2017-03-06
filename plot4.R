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

# Extracting elements from the dataset  ---------------

globalactivepower <- as.numeric(full_data_sub$Global_active_power)
globalreactivepower <- as.numeric(full_data_sub$Global_reactive_power)
voltage <- as.numeric(full_data_sub$Voltage)
submetering1 <- as.numeric(full_data_sub$Sub_metering_1)
submetering2 <- as.numeric(full_data_sub$Sub_metering_2)
submetering3 <- as.numeric(full_data_sub$Sub_metering_3)

# Plotting 4 ----------------

# opening device ------- 

png("plot4.png", 
    width = 480,
    height = 480)
par(mfrow = c(2, 2)) 
plot(datetime,
     globalactivepower,
     type = "l",
     xlab = "",
     ylab = "Global Active Power", 
     cex = 0.2)

plot(datetime,
     voltage,
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage")

plot(datetime,
     submetering1,
     type = "l", 
     ylab = "Energy Submetering",
     xlab = "")
lines(datetime, 
      submetering2,
      type = "l", 
      col = "red")
lines(datetime, 
      submetering3,
      type = "l",
      col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty =,
       lwd = 2.5,
       col = c("black", "red", "blue"),
       bty = "o")

plot(datetime,
     globalactivepower, 
     type = "l",
     xlab = "datetime", 
     ylab = "Global_reactive_power")

## closing device ----
dev.off()

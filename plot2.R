## Coursera - Exploratory Data Analysis - March, 2017.
## Course Project 1 - Plotting

# Overall Goal: how household energy usage varies over a 2-day period in February, 2007.

## Reading data, converting and subset --------------

full_data <- read.table("household_power_consumption.txt",
                        header = TRUE, 
                        sep = ";")

str(full_data)
summary(full_data)

# convert the date format ---------------
full_data$Date <- as.Date(full_data$Date,
                          format = "%d/%m/%Y")

# Subsetting ----------
full_data_sub <- subset(full_data,
                        subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times--------------
full_data_sub$DateTime <- strptime(paste(full_data_sub$Date, full_data_sub$Time), "%Y-%m-%d %H:%M:%S")
full_data_sub$DateTime <- as.POSIXct(full_data_sub$DateTime)

# Plotting 2 ----------------

attach(full_data_sub)

# Opening the device
plot(Global_active_power ~ DateTime, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.copy(png, 
         file = "plot2.png", 
         height = 480,
         width = 480)

dev.off()
detach(full_data_sub)
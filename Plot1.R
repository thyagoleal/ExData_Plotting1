## Coursera - Exploratory Data Analysis - March, 2017.
## Course Project 1 - Plotting

# Overall Goal: how household energy usage varies over a 2-day period in February, 2007.

# Reading data -------------------------------------------------------

# Converting  Date and Time variables to Date/Time classes -----------
full_data <- read.table("household_power_consumption.txt", 
                        header = TRUE,
                        sep = ";", 
                        dec = ".")

str(full_data)
summary(full_data)

full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")
head(full_data)

full_data$datetime <- strptime(paste(full_data$Date, full_data$Time), "%Y-%m-%d %H:%M:%S")

## subsetting and converting format  -----------------

subs_data <- subset(full_data,
                    subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subs_data$Global_active_power <- as.numeric(subs_data$Global_active_power)

# Making histogram  -------------------------------------------------------

# Opening the device
png("plot1.png", 
    width = 480, height = 480)

hist(subs_data$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# closing device
dev.off()




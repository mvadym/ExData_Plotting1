# creates plot1.png file 480*480 pixels
#

# read data
power <- read.table("data\\household_power_consumption.txt", header=TRUE, sep=";", as.is = TRUE)

# filter and transform
power12 <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]
power12 <- transform(power12, Global_active_power = as.numeric(Global_active_power))

# global settings for plot
par(mfrow = c(1, 1), mar = c(4,4,2,1))

# plotting
with(power12, hist(Global_active_power, main = "Global Active Power", 
                        xlab = "Global Active Power (kilowatts)", col = "Red"))

# copy to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)  
dev.off()





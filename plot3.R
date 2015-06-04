# creates plot3.png file 480*480 pixels
# 

# read data
power <- read.table("data\\household_power_consumption.txt", header=TRUE, sep=";", as.is = TRUE)

# filter and transform
power12 <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]
power12 <- transform(power12, 
                     Sub_metering_1 = as.numeric(Sub_metering_1), 
                     Sub_metering_2 = as.numeric(Sub_metering_2),
                     Sub_metering_3 = as.numeric(Sub_metering_3),
                     datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
                     )

# global settings for plot
par(mfrow = c(1, 1), mar = c(4,4,2,1))

# plotting
with(power12, 
     {
        plot(datetime, Sub_metering_1, type = "l", main = NULL, xlab = "", 
                ylab = "Energy Sub Metering")
        lines(datetime, Sub_metering_2, col = "Red")
        lines(datetime, Sub_metering_3, col = "Blue")
        legend("topright", lty = 1, col = c("black", "blue", "red"), 
                legend = c("Sub_metering_1                      ", 
                           "Sub_metering_2                      ", 
                           "Sub_metering_3                      "))
     })

# copy to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)  
dev.off()
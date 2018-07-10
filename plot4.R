library(dplyr)
library(lubridate)
power_data <- read_delim("household_power_consumption.txt", delim = ";") %>% 
  filter(Date %in% c("2/2/2007", "1/2/2007")) %>% 
  mutate(DateTime = dmy_hms(paste(Date,as.character(Time))))

png(filename = "plot4.png", height = 504, width = 504)

par(mfrow=c(2,2))
#TopLeft plot
with(power_data, plot(DateTime,Global_active_power, type = "n", 
                      xlab = "", ylab = "Global Active Power" ))
with(power_data, lines(DateTime,Global_active_power, type = "l"))
#TopRight plot
with(power_data, plot(DateTime,Voltage, type = "n", 
                      xlab = "datetime", ylab = "Voltage" ))
with(power_data, lines(DateTime,Voltage, type = "l"))
#BottomLeft plot
with(power_data, plot(DateTime,Sub_metering_1, type = "n", 
                      xlab = "", ylab = "Energy sub metering" ))
with(power_data, lines(DateTime,Sub_metering_1, type = "l", col = "black"))
with(power_data, lines(DateTime,Sub_metering_2, type = "l", col = "red"))
with(power_data, lines(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lwd=1, col = c("black", "red", "blue"),
       bty="n")
#BottomRight plot
with(power_data, plot(DateTime,Global_reactive_power, type = "n", 
                      xlab = "", ylab = "Global Active Power" ))
with(power_data, lines(DateTime,Global_reactive_power, type = "l"))

dev.off()
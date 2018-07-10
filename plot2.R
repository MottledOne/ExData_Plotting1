library(dplyr)
library(lubridate)
power_data <- read_delim("household_power_consumption.txt", delim = ";") %>% 
  filter(Date %in% c("2/2/2007", "1/2/2007")) %>% 
  mutate(DateTime = dmy_hms(paste(Date,as.character(Time))))

png(filename = "plot2.png", width = 504, height = 504)
with(power_data, plot(DateTime,Global_active_power, type = "n", 
                      xlab = "", ylab = "Global Active Power (kilowatts)" ))
with(power_data, lines(DateTime,Global_active_power, type = "l"))
dev.off()

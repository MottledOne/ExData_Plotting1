library(dplyr)
library(lubridate)

#Import data
power_data <- read_delim("household_power_consumption.txt", delim = ";") %>% 
  filter(Date %in% c("2/2/2007", "1/2/2007")) %>% 
  mutate(DateTime = dmy_hms(paste(Date,as.character(Time))))

png(filename = "plot1.png", width = 504, height = 504)
with(power_data,hist(Global_active_power, col = "red", main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts"))
dev.off()

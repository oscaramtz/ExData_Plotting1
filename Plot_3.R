## Getting data form ./data directory
filepath <- "./data/household_power_consumption.txt"

## Loading process 
install.packages("sqldf")
library(sqldf)
library(lubridate)

### Subsetting data
keptvar <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

### 
hPowerCons_subset <- read.csv.sql(filepath, keptvar, sep=";")
hPowerCons_subset$Date <- dmy(hPowerCons_subset$Date)
hPowerCons_subset$DateTime <- as.POSIXct(paste(hPowerCons_subset$Date, hPowerCons_subset$Time), format="%Y-%m-%d %H:%M:%S")


## plot 3
with(hPowerCons_subset, 
     plot(
       DateTime ,
       Sub_metering_1,
       ylab = "Energy sub metering", 
       xlab = "",  
       type = "l")
     )
with(hPowerCons_subset, 
  lines(
         DateTime ,
         Sub_metering_2,
         col = "red"
       )
)
with(hPowerCons_subset,  
       lines(
         DateTime ,
         Sub_metering_3,
         col = "blue"
       )
)
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1
       )

dev.copy(device = png,"plot3.png")

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

## Plot 1
with(hPowerCons_subset,
     hist(Global_active_power, 
          col = "red", 
          main = "Global Active Power", 
          xlab = "Global Active Power (Kilowatts)"))
          
dev.copy(device = png,"plot1.png")


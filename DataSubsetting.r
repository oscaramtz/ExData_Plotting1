## Getting data form ./data directory

```{R}
filepath <- "./data/household_power_consumption.txt"
```
## Subsetting the data without overloading the ram


## install.packages("sqldf")
library(sqldf)
library(lubridate) ## faster than base function convertion

keptvar <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
hPowerCons_subset <- read.csv.sql(filepath, keptvar, sep=";")
hPowerCons_subset$Date <- dmy(hPowerCons_subset$Date)

```

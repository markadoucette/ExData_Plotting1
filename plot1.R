## Set working directory to cloned repository
setwd("~/R/Coursera/ExData_Plotting1")

## Estimate memory required to store dataset
memory<- 2075259*9*8/1024/1024

## Read in data filtered by date
data <- subset(read.table("~/R/Coursera/data/household_power_consumption.txt",
                          sep=";",header=TRUE,na.strings="?", stringsAsFactors = FALSE)
               ,Date=="1/2/2007" | Date=="2/2/2007")

## Convert Date from factor to Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
data$Global_active_power <- as.numeric(data$Global_active_power)


## Plot Histagram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Make histogram a png file 480 x 480
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


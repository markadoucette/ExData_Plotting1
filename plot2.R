## Set working directory to cloned repository
setwd("~/R/Coursera/ExData_Plotting1")

## Read in data filtered by date
data <- subset(read.table("~/R/Coursera/data/household_power_consumption.txt",
                          sep=";",header=TRUE,na.strings="?", stringsAsFactors = FALSE)
               ,Date=="1/2/2007" | Date=="2/2/2007")

## Convert Date from factor to Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Convert from factor to numeric 
data$Global_active_power <- as.numeric(data$Global_active_power)

## Plot 
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Make plot a png file 480 x 480
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


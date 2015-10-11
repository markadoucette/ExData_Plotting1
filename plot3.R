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

with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub meetering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright",lty=1,lwd=2, cex=0.65, xjust=1,col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})


## Make plot a png file 480 x 480
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub meetering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright",lty=1,lwd=2,bty = "n", cex=0.65, xjust=2, col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_active_power",xlab="datetime")
})

## Make plot a png file 480 x 480
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


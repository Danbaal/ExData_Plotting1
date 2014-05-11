df <- read.table( file = "pds.txt", sep=";", 
                  colClasses = c("character","character",
                                 "numeric","numeric",
                                 "numeric","numeric","numeric",
                                 "numeric","numeric"), 
                  na.strings = "?", header= TRUE)

#subsetting what we want
df = subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))

datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

df <- data.frame(datetime,df)

#Open PNG device
png(file = "plot4.png")

par(mfcol = c(2,2))

with(df, {
    plot(datetime,Global_active_power, 
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    plot(datetime,Sub_metering_1, 
         type="l",
         xlab="",
         ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright",
           col=c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1,1))
    
    plot(datetime, Voltage, type = "l")
    
    plot(datetime, Global_reactive_power, type = "l")
    
})

dev.off()
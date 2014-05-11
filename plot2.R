
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
png(file = "plot2.png")

with(df, plot(datetime,Global_active_power, 
              type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)"))

#Close device
dev.off()
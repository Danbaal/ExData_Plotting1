#Reading the dataset
df <- read.table( file = "pds.txt", sep=";", 
                  colClasses = c("character","character",
                                 "numeric","numeric",
                                 "numeric","numeric","numeric",
                                 "numeric","numeric"), 
                  na.strings = "?", header= TRUE)

#subsetting what we want
df = subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))

#Open PNG device
png(file = "plot1.png")

#Plot1
hist(df$Global_active_power, 
     col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency" )

#Close device
dev.off()
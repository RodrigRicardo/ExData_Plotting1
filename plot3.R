# Plot 3  Class project Week 1

# Read data

dataHousehold<-read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors = F) 
head(dataHousehold)

# Transform Time column from string to time type

dataHousehold$Time<-strptime(paste(dataHousehold$Date,dataHousehold$Time),"%d/%m/%Y %H:%M:%S")
head(dataHousehold)
class(dataHousehold$Time)
head(dataHousehold$Time)

# Transform Date column to date type

dataHousehold$Date<-as.Date(dataHousehold$Date, "%d/%m/%Y")
#class(dataHousehold$Date)
head(dataHousehold$Date,10)

# Extracting the right subset

startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02");
dataHousehold$Global_active_power<-as.numeric(dataHousehold$Global_active_power)
#class(dataHousehold$Global_active_power)
data_h<-subset(dataHousehold,(Date==startDate)|(Date==endDate))
head(data_h)

# Building the graph

# First Sub metering 1 Color:black
plot(data_h$Time, data_h$Sub_metering_1,
ylab="Energy sub metering",
xlab = "",
type="l")

# Second Sub metering 2 Color=red
lines(data_h$Time, data_h$Sub_metering_2,
     type="l",
     col="red")

# Third Sub metering 3 Color:darkmagenta ??
lines(data_h$Time, data_h$Sub_metering_3,
      type="l",
      col="darkmagenta")

# Now the legend:
col_p<-c("black","red","darkmagenta")
legend("topright",c("Sub metering 1","Sub metering 2", "Sub metering 3"),col=col_p,lty = c(1,1,1))

dev.copy(png,'plot3.png')
dev.off()

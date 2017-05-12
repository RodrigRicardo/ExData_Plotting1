# Plot 4  Class project Week 1

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

# Building the  composige graph

# set global parameters

par(mfrow=c(2,2))

# First Graph Color:black

plot(data_h$Time, data_h$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab = "",
     type="l")

# Second Graph
plot(data_h$Time, data_h$Voltage,
     ylab="Voltage",
     xlab ="datetime",
     type="l")

# Third Graph 

# Fix the problem with the legend

my.range<-as.numeric(range(data_h$Sub_metering_1))

y_val<-1.3*my.range[2] 

plot(data_h$Time, data_h$Sub_metering_1,
     ylab="Energy sub metering",
     xlab = "",
     type="l", 
     ylim=c(0,y_val))


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

legend("topright",
       c("Sub metering 1","Sub metering 2", "Sub metering 3"),
       col=col_p,lty = c(1,1,1),
       bty = "n" # This last option elimates the box around
)  

plot(data_h$Time, data_h$Global_reactive_power,
     ylab="Global Reactive Power",
     xlab = "datetime",
     type="l")


dev.copy(png,'plot4.png')
dev.off()

# Plot 2  Class project Week 1

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
plot(data_h$Time, data_h$Global_active_power,
ylab="Global Active Power (kilowatts)",
xlab = "",
type="l")
dev.copy(png,'plot2.png')
dev.off()
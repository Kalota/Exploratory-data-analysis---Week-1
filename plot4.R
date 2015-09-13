#Read the data "household_power_consumption.txt" from the working directory
alldata <- read.table("household_power_consumption.txt", header = T, sep=";")

#Select the rows only for the 1st and 2nd February, 2007
mydata <- alldata[as.character(alldata$Date) %in% c("1/2/2007", "2/2/2007"),]

#Unite and trasform the format of Date and Time
DateTime <- paste(mydata$Date, mydata$Time)
DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")
attach(mydata)

#Create the 4 element plot and save it as "plot4.png"
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#First element of the plot
with(mydata, plot(DateTime, as.numeric(as.character(Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power"))

#Second element of the plot
with(mydata, plot(DateTime, as.numeric(as.character(Voltage)), type = "l", xlab = "datetime", ylab = "Voltage"))

#Third element of the plot
with(mydata, plot(DateTime, as.numeric(as.character(Sub_metering_1)), type= "l", xlab = "", 
     ylab = "Energy sub metering", ylim = c(0,40)))
lines(DateTime, as.numeric(as.character(Sub_metering_2)), col = "red")
lines(DateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
       "Sub_metering_2", "Sub_metering_3"))

#Fourth element of the plot
with(mydata, plot(DateTime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", 
     ylab="Global_reactive_power"))

dev.off()

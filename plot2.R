#Read the data "household_power_consumption.txt" from the working directory
alldata <- read.table("household_power_consumption.txt", header = T, sep=";")

#Select the rows only for the 1st and 2nd February, 2007
mydata <- alldata[as.character(alldata$Date) %in% c("1/2/2007", "2/2/2007"),]

#Unite and trasform the format of Date and Time
DateTime <- paste(mydata$Date, mydata$Time)
DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")
attach(mydata)

#Create the plot of Global active power and save it as "plot2.png"
png("plot2.png", width=480, height=480, units="px")
with(mydata, plot(DateTime, as.numeric(as.character(Global_active_power)), type = "l", 
    xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

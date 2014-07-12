#Load the file
setwd("/home/carlos/Dropbox/coursera//Data science//ExploratoryAnalysis/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")

#Introduce a column with the date and the time
timedate <- paste(data$Date, data$Time)
timedate <- strptime(timedate, format="%d/%m/%Y %H:%M:%S")
data <- cbind(timedate, data)

#Filter the data and select the first two days of february
workingdata <- data[as.Date(data$timedate) == "2007-02-02" | as.Date(data$timedate) == "2007-02-01",]

par(mfrow=c(2,2))

##Plot 1
#Set the Global_active_power as a numeric variable and make the plot
workingdata$Global_active_power <- as.numeric(workingdata$Global_active_power)
plot(workingdata$timedate, workingdata$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(workingdata$timedate, workingdata$Global_active_power)

##Plot 2
#Set the Voltage as a numeric variable and make the plot
workingdata$Voltage <- as.numeric(workingdata$Voltage)
plot(workingdata$timedate, workingdata$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(workingdata$timedate, workingdata$Voltage)

#Plot 3
#Set the Sub_metering as numeric variables and make the plot
workingdata$Sub_metering_1 <- as.numeric(workingdata$Sub_metering_1)
workingdata$Sub_metering_2 <- as.numeric(workingdata$Sub_metering_2)
workingdata$Sub_metering_3 <- as.numeric(workingdata$Sub_metering_3)
plot(workingdata$timedate, workingdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(workingdata$timedate, workingdata$Sub_metering_1)
lines(workingdata$timedate, workingdata$Sub_metering_2, col="red")
lines(workingdata$timedate, workingdata$Sub_metering_3, col="blue")
legend("topright", cex=0.8, box.lty=0, lty = 1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##Plot 4
#Set the Global_active_power as a numeric variable and make the plot
workingdata$Global_Greactive_power <- as.numeric(workingdata$Global_reactive_power)
plot(workingdata$timedate, workingdata$Global_reactive_power, type="n", xlab="datetime", ylab="Global_rective_power")
lines(workingdata$timedate, workingdata$Global_reactive_power)


#Copy the histogram to the png file
#dev.copy(png, file="plot4.png")
dev.print(png, width=609, height=580, file="plot4.png")
dev.off()
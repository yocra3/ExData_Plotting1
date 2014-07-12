#Load the file
setwd("/home/carlos/Dropbox/coursera//Data science//ExploratoryAnalysis/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")

#Introduce a column with the date and the time
timedate <- paste(data$Date, data$Time)
timedate <- strptime(timedate, format="%d/%m/%Y %H:%M:%S")
data <- cbind(timedate, data)

#Filter the data and select the first two days of february
workingdata <- data[as.Date(data$timedate) == "2007-02-02" | as.Date(data$timedate) == "2007-02-01",]

#Set the Sub_metering as numeric variables and make the plot
workingdata$Sub_metering_1 <- as.numeric(workingdata$Sub_metering_1)
workingdata$Sub_metering_2 <- as.numeric(workingdata$Sub_metering_2)
workingdata$Sub_metering_3 <- as.numeric(workingdata$Sub_metering_3)
plot(workingdata$timedate, workingdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(workingdata$timedate, workingdata$Sub_metering_1)
lines(workingdata$timedate, workingdata$Sub_metering_2, col="red")
lines(workingdata$timedate, workingdata$Sub_metering_3, col="blue")
legend("topright", text.font=8, lty = 1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy the histogram to the png file
dev.print(png, width=609, height=365, file="plot3.png")
dev.off()

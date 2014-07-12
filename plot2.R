#Load the file
setwd("/home/carlos/Dropbox/coursera//Data science//ExploratoryAnalysis/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")

#Introduce a column with the date and the time
timedate <- paste(data$Date, data$Time)
timedate <- strptime(timedate, format="%d/%m/%Y %H:%M:%S")
data <- cbind(timedate, data)

#Filter the data and select the first two days of february
workingdata <- data[as.Date(data$timedate) == "2007-02-02" | as.Date(data$timedate) == "2007-02-01",]

#Set the Global_active_power as a numeric variable and make the plot
workingdata$Global_active_power <- as.numeric(workingdata$Global_active_power)
plot(workingdata$timedate, workingdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(workingdata$timedate, workingdata$Global_active_power)

#Copy the histogram to the png file
dev.copy(png, file="plot2.png")
dev.off()

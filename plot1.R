#Load the file
setwd("/home/carlos/Dropbox/coursera//Data science//ExploratoryAnalysis/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")

#Change the first column to date format
date <- (as.Date(data$Date, format="%d/%m/%Y"))
data$Date <- date

#Filter the data and select the first two days of february
workingdata <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01",]

#Set the Global_active_power as a numeric variable and make the histogram
workingdata$Global_active_power <- as.numeric(workingdata$Global_active_power)
hist(workingdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Copy the histogram to the png file
dev.copy(png, file="plot1.png")
dev.off()
# Clean up the workspace
rm(list = ls(all = TRUE))

# Setting my working Directory
setwd("~/GitHub/ExploratoryDataAnalysis/ExData_Plotting1")

# Getting and Subsetting the Dataset
AllData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')

AllData$Date <- as.Date(AllData$Date, format = "%d/%m/%Y")

# Subsetting the data to get only the Dates I'm interested in
MyData <- subset(AllData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting the Date & Time
DateTime <- paste(as.Date(MyData$Date), MyData$Time)
MyData$DateTime <- as.POSIXct(DateTime)


#Opening the Graphics Device and build the 3rd plot
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

# Generating the 3rd Plot
plot(MyData$DateTime, MyData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(MyData$DateTime, MyData$Sub_metering_1, col = "black")
lines(MyData$DateTime, MyData$Sub_metering_2, col = "red")
lines(MyData$DateTime, MyData$Sub_metering_3, col = "blue")

legend("topright",  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c( 1, 1, 1 ), lwd = c( 2, 2, 2 ),  col = c( "black", "red", "blue" ))

#Closing the Graphics Device
dev.off()

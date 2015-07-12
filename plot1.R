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


#Opening the Graphics Device and build the 1st plot
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

# Generating the 1st Plot
hist(MyData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", xlim = c(0, 6), ylim = c(0, 1200))

#Closing the Graphics Device
dev.off()
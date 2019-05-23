############################################################################
## Exploratory Data Analysis with R, Coursera Spezialization 'Data Science',
## Course 4
## Week 1, Programming Assignment
##
## It uses the "Individual household elecric power consumption Data Set" (EPC)
## taken from the UC Irvine Machine Learning Repository. This script creates a
## diagram for weekdays and Energy sub metering (as requested in plot 3).


##################################################
## GET THE DATA
# Download the file if it doesn't exist
fileName <- 'exdata_data_household_power_consumption.zip'
if(!file.exists(fileName)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL,fileName)
}

# Unzips the file
if (!file.exists("household_power_consumption")){unzip(fileName)}


############################################################
## READ THE DATA
# Read EPC data into R. While doing this
#   - replace the "?" by NA values
#   - option stringsAsFactors = FALSE due to hist() command later on
EPCdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

# Load libraries
library(dplyr)
library(lubridate)

############################################################
# PREPARE THE DATA
# Convert the day and time variables Paste the columns Date and Time together,
# i.e. create a new variable "Date.Time", and add it to the existing data table.
EPCdata <- mutate(EPCdata,Date.Time=paste(EPCdata$Date,EPCdata$Time))

# Reorder the columns: Put Date.Time at the beginning, keep the other columns
# and delete the old columns Date and Time
EPCdata <- select(EPCdata,Date.Time,Global_active_power:Sub_metering_3,-Date,-Time)

# Convert the new entries in the date/time format where %T stands for %H:%M:%S
EPCdata$Date.Time <- strptime(EPCdata$Date.Time,"%d/%m/%Y %T")

# Choose data between 2007-02-01 and 2007-02-02 and get EPCdata_subset
EPCdata$Date.Time <- as.POSIXct(EPCdata$Date.Time) # Date/time format has to be in POSIXct in order to use filter
firstday <- as.POSIXct(strptime("1/2/2007", format="%d/%m/%Y")) # Define the first day for the relevant time period
secondday <- as.POSIXct(strptime("3/2/2007", format="%d/%m/%Y")) # Define the second day for the relevant time period
EPCdata_subset <- EPCdata %>% filter(between(Date.Time, firstday, secondday))


############################################################
# CREATE THE PLOT
# Get weekdays in English
Sys.setlocale("LC_TIME", "English")

# Create an empty plot with labels
with(EPCdata_subset, plot(Date.Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))

# Add the data
lines(EPCdata_subset$Date.Time, EPCdata_subset$Sub_metering_1)
lines(EPCdata_subset$Date.Time, EPCdata_subset$Sub_metering_2, col="red")
lines(EPCdata_subset$Date.Time, EPCdata_subset$Sub_metering_3, col="blue")

# Add a legend
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the plot as png file
dev.copy(png, file="plot3.png")
dev.off()
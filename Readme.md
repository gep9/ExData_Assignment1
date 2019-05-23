# Course Project 1: Electric Power Consumption 

This repo contains the files for the first course project in the 'Exploratory Data Analysis' course by Coursera. It contains the following files:
- Readme.md
- Plot1.R
- Plot1.png
- Plot2.R
- Plot2.png
- Plot3.R
- Plot3.png
- Plot4.R
- Plot4.png


## The Data
*Study Design*

We use the "Individual household elecric power consumption Data Set" (EPC) taken from the UC Irvine Machine Learning Repository. It contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

*Variables in the Data Set*

The variables in the original data set are:
1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

The data set has about 2 Million entries.


*Transformations to the Original Data Set*

Each of the four R files ('plot1/2/3/4.R') does the following:
- replace the missing values coded as '?' by NA values
- merge the Date and Time variable into one variable called 'Date.Time'
- convert the entries in Date.Time in the date/time format in R using the strptime() and as.POSIXct() functions
- create a subset by choosing data between 2007-02-01 and 2007-02-02
- create a spezific plot (see above)


## The diagrams
From the subset (data between 2007-02-01 and 2007-02-02) four plots were made:
- plot1.png: Histogram for the Global Active Power
- plot2.png: Diagram for Weekdays and Global Active Power
- plot3.png: Diagram for Weekdays and Energy Sub Metering
- plot4.png: Plot with four small diagrams, i.e. (1) Global Active Power, (2) Weekdays and Energy Sub Metering, (3) Weekdays and Voltage and (4) Weekdays and Global Reactive Power.
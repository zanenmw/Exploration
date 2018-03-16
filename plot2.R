## Assignemnet Module 3 - Course project 1 Base Plotting
setwd('C:/Projecten 2018/Training data scientists/R-folder/Assignement Module 3 - week 1')
getwd()
# Step 1. read all the data
Hpc <- read.csv2("./household_power_consumption.txt",header=TRUE, as.is = TRUE)

## Step 2. #convert the "date" and "time" columns into objects of type dates and POSIXlt
time <- strptime(paste(Hpc$Date, Hpc$Time), "%d/%m/%Y %H:%M:%S")
Hpc$Time <- time

## Step 3. Make a subset for 1/2/2007 and 2/2/2007
HPC_feb_begin <- subset(Hpc, Hpc$Date=="1/2/2007"|Hpc$Date=="2/2/2007")
View(HPC_feb_begin)

## Step 4. Make the plot - Histogram
with(HPC_feb_begin, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## Step 5. Save the plot to png
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
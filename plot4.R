## Assignement Module 3 - Course project 1 Base Plotting

# Step 1. read all the data
Hpc <- read.csv2("./household_power_consumption.txt",header=TRUE, as.is = TRUE)

## Step 2. #convert the "date" and "time" columns into objects of type dates and POSIXlt
time <- strptime(paste(Hpc$Date, Hpc$Time), "%d/%m/%Y %H:%M:%S")
Hpc$Time <- time

## Step 3. Make a subset for 1/2/2007 and 2/2/2007
HPC_feb_begin <- subset(Hpc, Hpc$Date=="1/2/2007"|Hpc$Date=="2/2/2007")
View(HPC_feb_begin)

## Step 4. Make the 4 plots - Histogram    
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(HPC_feb_begin, {
    plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Time, Voltage, type = "l", ylab = "Voltage",  xlab = "datetime")
    plot(Time, Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab = "")
      with(HPC_feb_begin,lines(Time, Sub_metering_2,  col = "red"))
      with(HPC_feb_begin,lines(Time, Sub_metering_3,  col = "blue"))
      legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Time, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

## Step 5. Save the plot to png
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
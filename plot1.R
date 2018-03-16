## Assignemnet Module 3 - Course project 1 Base Plotting

## Step 1. read all the data
library(dplyr)
setwd('C:/Projecten 2018/Training data scientists/R-folder/Assignement Module 3 - week 1')
Hpc <- read.table('household_power_consumption.txt', sep=';', header=TRUE)

## Step 2. Make a subset for 1/2/2007 and 2/2/2007
HPC_feb_begin <- subset(Hpc, Hpc$Date=="1/2/2007"|Hpc$Date=="2/2/2007")

## Step 3. Make the plot - Histogram
hist(as.numeric(as.character(HPC_feb_begin$Global_active_power)),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="RED")

## Step 4. Save the plot to png
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
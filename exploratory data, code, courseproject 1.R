
house <- read.table("/Users/Thansen/Desktop/R/week1learn/household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
housesubset <- house[house$Date %in% c("1/2/2007","2/2/2007") ,]
##plot 1
png("plot1.png", width=480, height=480)## Defining the png, plot size
global_active_power <- as.numeric(housesubset$Global_active_power) ##Subsetting the global active power
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")

##plot 2
png("plot2.png", width=480, height=480) ## Defining the png, plot size
datetime <- strptime(paste(housesubset$Date, housesubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ##convering the data into POSIXIt
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") ##Defining the plot and adding labels

##plot 3
png("plot3.png", width=480, height=480) ## Defining the png, plot size
subMetering1 <- as.numeric(housesubset$Sub_metering_1) ## subsetting each of the subset wihtin the data
subMetering2 <- as.numeric(housesubset$Sub_metering_2)
subMetering3 <- as.numeric(housesubset$Sub_metering_3)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") ##Notice the x axes is left blank
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##plot 4 
globalReactivePower <- as.numeric(housesubset$Global_reactive_power) ## Subsetting the reactive poser as well
voltage <- as.numeric(housesubset$Voltage) ## and the voltage

png("plot4.png", width=480, height=480) ## Defining the png, plot size
par(mfrow = c(2, 2)) ##defining the plot layout as being a 2 by 2
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

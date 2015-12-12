## to load the data
#
#url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
#download.file(url, method='curl', destfile = './power.zip')
#
col.classes <- c('character', 'character', 'numeric', 'numeric', 'numeric',
                 'numeric', 'numeric', 'numeric', 'numeric')

data <- read.table('../household_power_consumption.txt',
                   sep=';',
                   header=TRUE,
                   na.strings = '?',
                   colClasses = col.classes)

data$datetime <- strptime(paste(data$Date, data$Time),
                          format='%d/%m/%Y %H:%M:%S',
                          tz='')

data <- data[data$datetime > '2007-02-01' & data$datetime < '2007-02-03',]

## to make the plot
#plot 4
png('./plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(data$date, data$Global_active_power, type='l',
     xlab='',
     ylab='Global Active Power (kilowatts)')
plot(data$date, data$Voltage, type='l',
     xlab='datetime',
     ylab='Voltage')
plot(data$date, data$Sub_metering_1,
     type='l',
     xlab='',
     ylab='Energy sub metering')
lines(data$date, data$Sub_metering_2, col='red')
lines(data$date, data$Sub_metering_3, col='blue')
legend('topright', c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'),
       col=c('black', 'red', 'blue'), lty=1,
       bty='o',
       box.lwd=0)
plot(data$date, data$Global_reactive_power, type='l',
     xlab='datetime',
     ylab='Global Reactive Power')
dev.off()
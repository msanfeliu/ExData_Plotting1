### Builds Plot 4

Sys.setlocale("LC_TIME", "English")  ## make sure dates are in the correct format

## Read data

data<- read.table("household_power_consumption.txt",
            sep=";",
            dec=".",
            header=TRUE,
            stringsAsFactors=FALSE,
            na.strings="?",
            colClasses=c(rep("character",2), rep("numeric",7)))

##keep only observations from 2007-02-01 and 2007-02-02
  data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007") 

## generate ONE variable with date and time information, in time format

  Datetime<-strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
  data2<-cbind(data2,Datetime)

## open device

png(filename = "Plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), oma=c(0,0,4,0))

### build plot 1

with(data2, plot(x=Datetime, y=Global_active_power,
     type="l",
     col="black", 
     xlab="",
     ylab="Global Active Power(kilowatts)"))


### build plot 2

with(data2, plot(x=Datetime, Voltage,
                 type="l",
                 col="black"))

### build plot 3

with(data2, plot(x=Datetime, y=Sub_metering_1,
                 type="n",
                 ylab="Energy sub metering",
                 xlab=""))
with(data2, lines(x=Datetime, y=Sub_metering_1, type="l", col="black"))
with(data2, lines(x=Datetime, y=Sub_metering_2, type="l", col="red"))
with(data2, lines(x=Datetime, y=Sub_metering_3, type="l", col="blue"))
legend("topright", 
       lty = 1, 
       xjust=1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       y.intersp=1)

### build plot 4

with(data2, plot(x=Datetime, Global_reactive_power,
                 type="l",
                 col="black"))


mtext("Plot 4", outer = TRUE, adj=0, cex=2.3)

## close device

dev.off() 

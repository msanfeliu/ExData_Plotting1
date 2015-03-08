### Builds Plot 2

Sys.setlocale("LC_TIME", "English")  ## make sure dates are in the correct format

## Read data

data<- read.table("household_power_consumption.txt",
              sep=";",
              dec=".",
              header=TRUE,
              stringsAsFactors=FALSE,
              na.strings="?",
              colClasses=c(rep("character",2), rep("numeric",7)))

## keep only observations from 2007-02-01 and 2007-02-02
  data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007") 

## generate ONE variable with date and time information, in time format

  DateTime<-strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
  data2<-cbind(data2,DateTime)

## open device

png(filename = "Plot2.png", width = 480, height = 480)

par(oma=c(0,0,4,0))

### build the plot

with(data2, plot(x=DateTime, y=Global_active_power,
     type="l",
     col="black", 
     xlab="",
     ylab="Global Active Power(kilowatts)"))

mtext("Plot 2", outer = TRUE, adj=0, cex=2.3)
    
## close device

dev.off() 

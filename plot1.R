### Builds Plot 1

Sys.setlocale("LC_TIME", "English")  ## make sure dates are in the correct format

## Read data

data<- read.table("household_power_consumption.txt",
               sep=";",
               dec=".",
               header=TRUE,
               stringsAsFactors=FALSE,
               na.strings="?",
               colClasses=c(rep("character",2), rep("numeric",7)))

## keeponly observations from 2007-02-01 and 2007-02-02
 data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007") 

## open device

png(filename = "Plot1.png", width = 480, height = 480)

par(oma=c(0,0,4,0), cex.main=1.2)

### build the plot

hist(data2$Global_active_power,
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
axis(side=2, at=c(0,200,400,600,800,1000,1200))


mtext("Plot 1", outer = TRUE, adj=0, cex=2.3)


## close device

dev.off() 

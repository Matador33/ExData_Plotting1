plot4 <- function () {
  h1 <- read.table("~/household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE, quote="\"")
  hdate <- as.Date(h1[,1], format = "%d/%m/%Y")
  hSelect <- (hdate >= "2007-02-01") & (hdate <= "2007-02-02")
  ## should now have a selection vector for 2880 observations
  subDate <- hdate[hSelect]
  ##subTime <- strptime(h1[hSelect,2],format="%T")
  datetime <- strptime(paste(h1[hSelect,1],h1[hSelect,2],sep= " "), format = "%d/%m/%Y %H:%M:%S")
  subActive <- as.numeric(h1[hSelect,3])              ## in kilowatts
  subReactive <- as.numeric(h1[hSelect,4])            ## in kilowatts
  subVoltage <-  as.numeric(h1[hSelect,5])            ## in volts
  ##subIntensity <-  as.numeric(h1[hSelect,6])          ## in amperes
  Sub_metering1 <-  as.numeric(h1[hSelect,7])         ## watt-hours active (kitchen)
  Sub_metering2 <-  as.numeric(h1[hSelect,8])         ## watt-hours active (laundry)
  Sub_metering3 <-  as.numeric(h1[hSelect,9])         ## watt-hours active (water-heater & air-conditioner)
  
  ##plot4
  png(file="plot4.png")
  par(mfrow=c(2,2)) 
  plot(datetime,subActive,type = "l",xlab=" ",ylab = "Global Active Power")
  plot(datetime,subVoltage,type = "l",ylab = "Voltage")
  plot(datetime,Sub_metering1,type = "l",col="black",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering2,type = "l",col="red")
  lines(datetime,Sub_metering3,type = "l",col="blue")
  legend("topright", pch = "_", bty="n",pt.cex=1,cex=0.75,col = c("black","red","blue"), legend = c("Sub_metering1", "Sub_metering2","Sub_metering3"))
  plot(datetime,subReactive,type = "l",ylab = "Global_reactive_power")
  dev.off()
}
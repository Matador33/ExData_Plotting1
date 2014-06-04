plot1 <- function () {
    h1 <- read.table("~/household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE, quote="\"")
    hdate <- as.Date(h1[,1], format = "%d/%m/%Y")
    hSelect <- (hdate >= "2007-02-01") & (hdate <= "2007-02-02")
   ## should now have a selection vector for 2880 observations
    subDate <- hdate[hSelect]
   ##subTime <- strptime(h1[hSelect,2],format="%T")
    datetime <- strptime(paste(h1[hSelect,1],h1[hSelect,2],sep= " "), format = "%d/%m/%Y %H:%M:%S")
    subActive <- as.numeric(h1[hSelect,3])              ## in kilowatts
    ##subReactive <- as.numeric(h1[hSelect,4])            ## in kilowatts
    ##subVoltage <-  as.numeric(h1[hSelect,5])            ## in volts
    ##subIntensity <-  as.numeric(h1[hSelect,6])          ## in amperes
    ##Sub_metering1 <-  as.numeric(h1[hSelect,7])         ## watt-hours active (kitchen)
    ##Sub_metering2 <-  as.numeric(h1[hSelect,8])         ## watt-hours active (laundry)
    ##Sub_metering3 <-  as.numeric(h1[hSelect,9])         ## watt-hours active (water-heater & air-conditioner)
  
    ## plot1
    png(file="plot1.png")
    hist(subActive,freq=TRUE,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",labels = FALSE)
    dev.off()
}

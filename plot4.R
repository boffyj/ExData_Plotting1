plot4 = function() {
  
  #read data from 1/2/2007 to 2/2/2007
  file = "household_power_consumption.txt"
  cnames = read.table(file,sep=";",header=T,nrows=1)
  myData = read.table(file,sep=";",skip=66637,nrows=2880,
                      col.names=colnames(cnames))
  
  #plot2
  par(mfrow=c(2,2),cex=0.6)
  n = dim(myData)[1]
  plot(myData$Global_active_power, type = "l", xaxt="n",
       main="",xlab="",ylab="Global Active Power")
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  
  #plot4a
  with(myData, plot(Voltage, type = "l", xaxt="n",
                    main="",xlab="datetime"))
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  
  #plot3
  plot(myData$Sub_metering_1, type = "l", xaxt="n", 
       main="",xlab="",ylab="Energy sub metering")
  lines(myData$Sub_metering_2, col=2)
  lines(myData$Sub_metering_3, col=4)
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  legend("topright", pch = "_", col = c(1,2,4), bty="n",
         legend = c("Sub_metering_1      ", 
                    "Sub_metering_2      ",
                    "Sub_metering_3      "))
  
  #plot4b
  with(myData,plot(Global_reactive_power, type = "l", xaxt="n",
                   main="",xlab="datetime"))
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  
  #save to png
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
}

plot3 = function() {
  
  #read data from 1/2/2007 to 2/2/2007
  file = "household_power_consumption.txt"
  cnames = read.table(file,sep=";",header=T,nrows=1)
  myData = read.table(file,sep=";",skip=66637,nrows=2880,col.names=colnames(cnames))
  
  #plot
  n = dim(myData)[1]
  par(cex=0.8)
  plot(myData$Sub_metering_1, type = "l", xaxt="n", 
       main="",xlab="",ylab="Energy sub metering")
  lines(myData$Sub_metering_2, col=2)
  lines(myData$Sub_metering_3, col=4)
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  legend("topright", pch = "_", col = c(1,2,4),
         legend = c("Sub_metering_1      ", 
                    "Sub_metering_2      ",
                    "Sub_metering_3      "))
  
  #save to png
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}

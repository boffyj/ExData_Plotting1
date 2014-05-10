plot2 = function() {
  
  #read data from 1/2/2007 to 2/2/2007
  file = "household_power_consumption.txt"
  cnames = read.table(file,sep=";",header=T,nrows=1)
  myData = read.table(file,sep=";",skip=66637,nrows=2880,col.names=colnames(cnames))

  #plot
  n = dim(myData)[1]
  par(cex=0.8)
  plot(myData$Global_active_power, type = "l", xaxt="n",
       main="",xlab="",ylab="Global Active Power (kilowatts)")
  axis(1,at=c(1,n/2,n),labels=c("Thu","Fri","Sat"))
  
  #save to png
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}

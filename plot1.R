plot1 = function() {
  
  #read data from 1/2/2007 to 2/2/2007
  file = "household_power_consumption.txt"
  cnames = read.table(file,sep=";",header=T,nrows=1)
  myData = read.table(file,sep=";",skip=66637,nrows=2880,col.names=colnames(cnames))
  
  #plot histogram
  par(cex=0.8)
  with(myData,hist(Global_active_power,col="red",
       main="Global Active Power",xlab="Global Active Power (kilowatts)"))
  
  #save to png
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
}



#PLot3 Sub-metering active energy timeseries
# A Read in data 
  Alldata<-read.table("./exdata/household_power_consumption.txt",
                     header=TRUE,sep=";",stringsAsFactors=FALSE)

# B set up png 
png(filename = "./Rplot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# c: Narrow to two days of interest, Measure of interest (GAP)
TwoDays<-Alldata[Alldata[ ,1]=="1/2/2007"|Alldata[,1]=="2/2/2007",]
GAP<-as.numeric(TwoDays[ ,3])

# D: Plot

with(TwoDays,plot(DateTime,Sub_metering_1,type="l",ylab="Energy Sub Metering"))
with(TwoDays,lines(DateTime,Sub_metering_2,col="red",type="l"))
with(TwoDays,lines(DateTime,Sub_metering_3,col="blue",type="l"))
legend("topright",lwd='1',col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub metering 3"))

dev.off()
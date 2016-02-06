#plot4 Panel plot 
# A Read in data 
 Alldata<-read.table("./exdata/household_power_consumption.txt",
                   header=TRUE,sep=";",stringsAsFactors=FALSE)


# B set up png 
png(filename = "./Rplot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# c: Narrow to two days of interest, Measure of interest (GAP)
TwoDays<-Alldata[Alldata[ ,1]=="1/2/2007"|Alldata[,1]=="2/2/2007",]
GAP<-as.numeric(TwoDays[ ,3])
dateTime<-paste(TwoDays[ ,1],TwoDays[ ,2])
DateTime<-strptime(dateTime,format="%d/%m/%Y  %H:%M:%S")

# D: altogether as a panel plot
par(mfrow=c(2,2))
plot(DateTime,TwoDays$Global_active_power, type="l",ylab="Global Active Power")
plot(DateTime,TwoDays$Voltage,type="l",ylab="Voltage")
with(TwoDays,plot(DateTime,Sub_metering_1,type="l",ylab="Energy Sub Metering"))
with(TwoDays,lines(DateTime,Sub_metering_2,col="red",type="l"))
with(TwoDays,lines(DateTime,Sub_metering_3,col="blue",type="l"))
plot(DateTime,TwoDays$Global_reactive_power, type="l",ylab="Global Reactive Power")
dev.off()
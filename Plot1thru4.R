

# Plot 1 Global active power histogram 
# A Read in data 
# Alldata<-read.table("./exdata/household_power_consumption.txt",
#                    header=TRUE,sep=";",stringsAsFactors=FALSE)



# B set up png 
png(filename = "./Rplot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# c: Narrow to two days of interest, Measure of interest 
TwoDays<-Alldata[Alldata[ ,1]=="1/2/2007"|Alldata[,1]=="2/2/2007",]
GAP<-as.numeric(TwoDays[ ,3])

# D: Plot 1   Global Active power Histogram

hist(GAP, col="red", main="Global Active Power",
     xlab="Global Active Power (in kilowatts)")

dev.off()


# PLOT 2: Global Active POwer Time series 
# A Read in data 
# Alldata<-read.table("./exdata/household_power_consumption.txt",
 #                   header=TRUE,sep=";",stringsAsFactors=FALSE)


# B set up png 
png(filename = "./Rplot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# c: Narrow to two days of interest, Measure of interest (GAP)
TwoDays<-Alldata[Alldata[ ,1]=="1/2/2007"|Alldata[,1]=="2/2/2007",]
GAP<-as.numeric(TwoDays[ ,3])
 # D: Pull of times 
dateTime<-paste(TwoDays[ ,1],TwoDays[ ,2])
DateTime<-strptime(dateTime,format="%d/%m/%Y  %H:%M:%S")

# E Plot Timeseries of Global active Power 
plot(DateTime,GAP, type="l",xlab="", ylab=
       "Global Active Power(kilowatts)")

dev.off()

#PLot3 Sub-metering active energy timeseries
# A Read in data 
# Alldata<-read.table("./exdata/household_power_consumption.txt",
#                    header=TRUE,sep=";",stringsAsFactors=FALSE)

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
#plot4 Panel plot 
# A Read in data 
#Alldata<-read.table("./exdata/household_power_consumption.txt",
#                    header=TRUE,sep=";",stringsAsFactors=FALSE)


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
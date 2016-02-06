# PLOT 2: Global Active POwer Time series 

# A Read in data 
  Alldata<-read.table("./exdata/household_power_consumption.txt",
                    header=TRUE,sep=";",stringsAsFactors=FALSE)

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

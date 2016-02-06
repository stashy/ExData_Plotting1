# Plot 1 Global active power histogram 

#  A Read in data 
  Alldata<-read.table("./exdata/household_power_consumption.txt",
                    header=TRUE,sep=";",stringsAsFactors=FALSE)

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


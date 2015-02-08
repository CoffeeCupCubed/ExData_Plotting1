##' The four functions plot1.R, plot2.R, plot3.R, plot4.R plot various graphs using png graphics
##' It is assumed the dataset 'household_power_consumption.txt' is in the working directory and
##' assume sqldf is installed

plot3<-function(){
  #opens sqldf library and reads in data for only Feb 1 2007 and Feb 2 2007
  library(sqldf)
  energy<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=';',
                       sql="select * from file where (Date=='1/2/2007' OR Date=='2/2/2007')")
  
  #Combines Date and Time columns in a new column, and formats in Date/Time format (for plotting)
  energy$dateTime<-paste(energy$Date,energy$Time,sep=" ")
  energy$dateTime<-strptime(energy$dateTime,'%d/%m/%Y %H:%M:%S')
  
  #open png device and sets text size to 1
  png(file="plot3.png")
  par(cex=1)
  
  #'plots 3 SubMetering lines, for each sub metering variable, with y axis label, 
  #'in black, red, and blue colors.
  plot(energy$dateTime,energy$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(energy$dateTime,energy$Sub_metering_2,col="red")
  lines(energy$dateTime,energy$Sub_metering_3,col="blue")
  
  #creates a legend in the top right. Sets labels and colors, equivalent to those on the plot.
  legend("topright",y=0,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lwd=c(1,1,1))
  
  #shuts off png device and stores in a variable to prevent the function from returning device status
  g<-dev.off()
}
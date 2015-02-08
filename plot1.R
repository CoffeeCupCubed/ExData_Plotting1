##' The four functions plot1.R, plot2.R, plot3.R, plot4.R plot various graphs using png graphics
##' It is assumed the dataset 'household_power_consumption.txt' is in the working directory and
##' assume sqldf is installed

plot1<-function(){
  #opens sqldf library and reads in data for only Feb 1 2007 and Feb 2 2007
  library(sqldf)
  energy<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=';',
                      sql="select * from file where (Date=='1/2/2007' OR Date=='2/2/2007')")
  
  #Opens png device and sets text size to 1.
  png(file="plot1.png")
  par(cex=1)
  
  #plots the Histogram for plot1 with labels
  hist(energy$Global_active_power,col="red",main="Global Active Power",
       xlab="Global Active Power (kilowatts)",ylab="Frequency")
  
  #shuts off png device and stores in a variable to prevent the function from returning device status
  g<-dev.off()
}
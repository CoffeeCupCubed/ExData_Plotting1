##' The four functions plot1.R, plot2.R, plot3.R, plot4.R plot various graphs using png graphics
##' It is assumed the dataset 'household_power_consumption.txt' is in the working directory and
##' assume sqldf is installed

plot2<-function(){
  #opens sqldf library and reads in data for only Feb 1 2007 and Feb 2 2007
  library(sqldf)
  energy<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=';',
                        sql="select * from file where (Date=='1/2/2007' OR Date=='2/2/2007')")
  
  #Combines Date and Time columns in a new column, and formats in Date/Time format (for plotting)
  energy$dateTime<-paste(energy$Date,energy$Time,sep=" ")
  energy$dateTime<-strptime(energy$dateTime,'%d/%m/%Y %H:%M:%S')
  
  #Opens png device, creates a fresh png file and sets text size to 1.
  png(file="plot2.png")
  par(cex=1)
  
  #plots the line chart for plot2.
  plot(energy$dateTime,energy$Global_active_power,type="l",
       xlab="",ylab="Global Active Power (kilowatts)")
  
  #shuts off png device and stores in a variable to prevent the function from returning device status
  g<-dev.off()
}
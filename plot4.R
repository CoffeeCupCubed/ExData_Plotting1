##' The four functions plot1.R, plot2.R, plot3.R, plot4.R plot various graphs using png graphics
##' It is assumed the dataset 'household_power_consumption.txt' is in the working directory and
##' assume sqldf is installed

plot4<-function(){
  #opens sqldf library and reads in data for only Feb 1 2007 and Feb 2 2007
  library(sqldf)
  energy<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=';',
                       sql="select * from file where (Date=='1/2/2007' OR Date=='2/2/2007')")
  #Combines Date and Time columns in a new column, and formats in Date/Time format (for plotting)
  energy$dateTime<-paste(energy$Date,energy$Time,sep=" ")
  energy$dateTime<-strptime(energy$dateTime,'%d/%m/%Y %H:%M:%S')
  
  #'open png device,creates a fresh png file and sets text size to 0.1, and creates 4 panels 
  #'(ordered column-wise by mfcol) for 4 charts
  png(file="plot4.png")
  par(cex=0.1,mfcol=c(2,2))
  
  #Plots the first chart in the series of 4 charts, in the top left, with only y axis labels.
  plot(energy$dateTime,energy$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  
  #'The second chart is a minimized version of chart 3. The legend's border is removed using bty="n".
  #'Horizontal distances, line length are all reduced in the legend. Plots in the bottom left, with
  #'only y axis labels.
  plot(energy$dateTime,energy$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(energy$dateTime,energy$Sub_metering_2,col="red")
  lines(energy$dateTime,energy$Sub_metering_3,col="blue")
  legend("topright",y=0,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lwd=c(1,1,1),bty="n",x.intersp=0.7)
  
  #Plots the third chart in the top right, with labels.
  plot(energy$dateTime,energy$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  #Plots the fourth chart in the borrom left, with labels
  plot(energy$dateTime,energy$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  #shuts off png device and stores in a variable to prevent the function from returning device status
  g<-dev.off()
}
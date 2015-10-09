setwd("C:/Rjupalli/CourseEra/2015/Exploratory-Data-Analysis/Project-1")

#Reading Data
epc_data <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors = F)

# Removing "NA"s and converting date into correct format
epc_data <- na.omit(epc_data)
epc_data$Date <- as.Date(epc_data$Date,format = "%d/%m/%Y")

#Subsetting data to include data from 2007-02-01 to 2007-02-02
epc_data_needed <- epc_data[epc_data$Date >="2007-02-01" & epc_data$Date <="2007-02-02", ]

# converting Global Active Power into numeric variable
epc_data_needed$Global_active_power <- as.numeric(epc_data_needed$Global_active_power)

#Creating new varaible "datetime" to combine date and time
epc_data_needed$datetime <- as.POSIXct(paste(epc_data_needed$Date, epc_data_needed$Time), format="%Y-%m-%d %H:%M:%S")

# Specifying the plot size of 480 x 480 pixels and saving it to a file
#png("plot4.png",  width = 480, height = 480, units = "px", type = "cairo")
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(epc_data_needed, plot(datetime,Global_active_power,type="n",xlab = "", ylab = "Global Active Power"))
with(epc_data_needed,lines(datetime,Global_active_power),type="l")

with(epc_data_needed, plot(datetime,Voltage,type="n",ylab = "Voltage",yaxp=c(234,246,3)))
with(epc_data_needed,lines(datetime,Voltage,type="l"))

with(epc_data_needed, plot(datetime,Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = ""))
with(epc_data_needed,lines(datetime,Sub_metering_1),type="l")
with(epc_data_needed,lines(datetime,Sub_metering_2,col="Red"),type="l")
with(epc_data_needed,lines(datetime,Sub_metering_3,col="Blue"),type="l")
legend("topright",lty=1,col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

with(epc_data_needed, plot(datetime,Global_reactive_power,type="n",yaxp=c(0.1,0.5,4)))
with(epc_data_needed,lines(datetime,Global_reactive_power,type="l"))
#dev.off()
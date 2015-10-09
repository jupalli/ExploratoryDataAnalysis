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

#Plot - 2
# Specifying the plot size of 480 x 480 pixels and saving it to a file
#png("plot2.png",  width = 480, height = 480, units = "px", type = "cairo")
with(epc_data_needed, plot(datetime,Global_active_power,type="n",xlab = "", ylab = "Global Active Power (kilowatts)"))
with(epc_data_needed,lines(datetime,Global_active_power),type="l")
#dev.off()

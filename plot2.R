#plot2.R

#Unzipping and placing the file in folder ds4 under the working directory
unzip("exdata_data_household_power_consumption.zip", exdir="ds4")

#Reading into a table and extracting the required data
table_orig<-read.table("ds4/household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE, na.strings="?")
table_orig$newdate <- with(table_orig, as.POSIXct(paste(table_orig$Date, table_orig$Time), format="%d/%m/%Y %H:%M:%S"))
table_req<-subset(table_orig, (table_orig$newdate)>='2007-02-01 00:00:00' & (table_orig$newdate)<='2007-02-02 23:59:00')

#Plotting the required graph
png("plot2.png", width = 480, height = 480)
plot(table_req$Global_active_power ~ table_req$newdate, table_req, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#plot4.R

#Unzipping and placing the file in folder ds4 under the working directory
unzip("exdata_data_household_power_consumption.zip", exdir="ds4")

#Reading into a table and extracting the required data
table_orig<-read.table("ds4/household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE, na.strings="?")
table_orig$newdate <- with(table_orig, as.POSIXct(paste(table_orig$Date, table_orig$Time), format="%d/%m/%Y %H:%M:%S"))
table_req<-subset(table_orig, (table_orig$newdate)>='2007-02-01 00:00:00' & (table_orig$newdate)<='2007-02-02 23:59:00')

#Plotting the 4 graphs in the clockwise direction
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(table_req$Global_active_power ~ table_req$newdate, table_req, type = "l", xlab="", ylab="Global Active Power")
plot(table_req$Voltage ~ table_req$newdate, table_req, type = "l", xlab="datetime", ylab="Voltage")
plot(range(table_req$newdate), range(table_req$Sub_metering_1,table_req$Sub_metering_2, table_req$Sub_metering_3),type = "n", xlab="", ylab="Energy sub metering")
        points(table_req$Sub_metering_1~table_req$newdate, table_req, type = "l", col="black")
        points(table_req$Sub_metering_2~table_req$newdate, table_req, type = "l", col="red")
        points(table_req$Sub_metering_3~table_req$newdate, table_req, type = "l", col="blue")
        legend("topright", col=c("purple", "blue", "red"), lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(table_req$Global_reactive_power ~ table_req$newdate, table_req, type = "l", xlab="datetime", ylab="Global_reactive_power")                 
dev.off()

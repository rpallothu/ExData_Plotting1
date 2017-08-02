dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE,dec=".")

filterData<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
filterData$timestamp<-strptime(paste(filterData$Date,filterData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

filterData$Global_active_power<-as.integer(filterData$Global_active_power)
filterData$Sub_metering_1<-as.integer(filterData$Sub_metering_1)
filterData$Sub_metering_2<-as.integer(filterData$Sub_metering_2)
filterData$Sub_metering_3<-as.integer(filterData$Sub_metering_3)

png("plot3.png",width=480,height=480)

plot(filterData$timestamp,filterData$Sub_metering_1,type="l",xlab="",ylab="Energy Submetering")
lines(filterData$timestamp,filterData$Sub_metering_2, col="red")
lines(filterData$timestamp,filterData$Sub_metering_3, col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))
dev.off()
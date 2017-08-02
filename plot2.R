dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE,dec=".")

filterData<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
filterData$timestamp<-strptime(paste(filterData$Date,filterData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
filterData$Global_active_power<-as.integer(filterData$Global_active_power)

png("plot2.png",width=480,height=480)

plot(filterData$timestamp,filterData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

library(dplyr)

df<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
df <- mutate(df,Date=as.Date(strptime(Date,"%d/%m/%Y")))
df1<-filter(df, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
df1[, 3:9] <- sapply(df1[, 3:9], as.numeric)

png(file="plot3.png")
plot(df1$Sub_metering_1,type ="n",xlab = "", ylab ="Energy sub metering",xaxt = "n")
lines(df1$Sub_metering_1, col="black")
lines(df1$Sub_metering_2, col="red")
lines(df1$Sub_metering_3, col="blue")
legend("topright",names(df1[,7:9]), lty=1,col=c("black","red","blue"))

ticks <- weekdays(as.Date(c("2007-02-01", "2007-02-02", "2007-02-03")),TRUE)
ind_fri<- match("Fri",weekdays(df1$Date,TRUE))
axis(1, at=c(1,ind_fri,length(df1$Date)), labels = ticks)
dev.off()
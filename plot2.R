library(dplyr)

df<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
df <- mutate(df,Date=as.Date(strptime(Date,"%d/%m/%Y")))
df1<-filter(df, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
df1[, 3:9] <- sapply(df1[, 3:9], as.numeric)

png(file="plot2.png")
plot(df1$Global_active_power,type ="n",xlab = "", ylab ="Global Active Power (kilowatts)",xaxt = "n")
lines(df1$Global_active_power)
ticks <- weekdays(as.Date(c("2007-02-01", "2007-02-02", "2007-02-03")),TRUE)
ind_fri<- match("Fri",weekdays(df1$Date,TRUE))
axis(1, at=c(1,ind_fri,length(df1$Date)), labels = ticks)
dev.off()
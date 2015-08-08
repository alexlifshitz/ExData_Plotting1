library(dplyr)

df<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
df <- mutate(df,Date=as.Date(strptime(Date,"%d/%m/%Y")))
df1<-filter(df, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
df1[, 3:9] <- sapply(df1[, 3:9], as.numeric)

png(file="plot1.png")
hist(df1$Global_active_power,col ="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
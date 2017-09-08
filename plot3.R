###############################################################¡ª#
#  date: 20170906
#  note:course"Exploratory Data Analysis" week 1 ,project
#  desp: generate file plot3.png 
###############################################################¡ª#
Sys.setlocale("LC_TIME", "English")

df <- ReadData()

png("plot3.png",
    width=480,
    height=480)

plot( x= df$Date_time, y = df$Sub_metering_1,
      xlab = "", ylab = "Energy Sub metering",
      type = "l",col = "black")
points(x = df$Date_time,y = df$Sub_metering_2,type= "l",col = "red")
points(x = df$Date_time,y = df$Sub_metering_3,type= "l",col = "blue")
legend(x = "topright",lwd = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"))
dev.off()
rm(df)
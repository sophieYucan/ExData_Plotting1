###############################################################¡ª#
#  date: 20170906
#  note:course"Exploratory Data Analysis" week 1 ,project
#  desp: generate file plot2.png 
###############################################################¡ª#
Sys.setlocale("LC_TIME", "English")

df <- ReadData()

png("plot2.png",width=480,height=480)

plot( x= df$Date_time,
      y = df$Global_active_power,
      xlab = "",
      ylab = "Global Active Power(kilowatts)",
      type = "l")
dev.off()
rm(df)
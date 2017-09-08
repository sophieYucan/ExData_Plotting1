###############################################################¡ª#
#  date: 20170906
#  note:course"Exploratory Data Analysis" week 1 ,project
#  desp: generate file plot1.png 
###############################################################¡ª#
df <- ReadData()

png("plot1.png",width=480,height=480)
hist(df$Global_active_power,col = "red",
     xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power")
dev.off()

rm(df)
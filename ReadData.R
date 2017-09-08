###############################################################¡ª#
#  date: 20170906
#  note:course"Exploratory Data Analysis" week 1 ,project¡£
#  desp: this script have 1 functon:ReadData. it downloads and reads  data into memory.
###############################################################¡ª#

# rm(list=ls())
# getwd()  
# setwd(".\\data science\\4. Exploratory Data Analysis")

ReadData<- function(){
    #check dir and file 
    if(!file.exists("./data")){
        dir.create("./data")
    }
    destfilepath <- ".//data//Fhousehold_power_consumption.zip"
    if(!file.exists(destfilepath)){
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile=destfilepath, mode = "wb")
        unzip(destfilepath,exdir="./data")
        # list.files("./data")
    }
    
    #read file. 2 methos: 
        # 1,read whole file then subset;
        # 2.filter the file and read lines that fullwith the condition.
    read_whole_file =  TRUE
    if(read_whole_file == TRUE) {
        df <- read.table("./data/household_power_consumption.txt",
                         sep=";",na.strings = "?",
                         stringsAsFactors = FALSE,
                         header = TRUE)
        df <- subset(df,df$Date== "1/2/2007"|df$Date=="2/2/2007")
        
    }else{
        library(sqldf)
        df<- read.csv.sql("./data/household_power_consumption.txt",
                     sql = "select * from file where Date='1/2/2007' or Date = '2/2/2007'",
                     eol = "\n",
                     sep=";",
                     # na.strings = "?",
                     stringsAsFactors = FALSE,
                     header = TRUE)
      
    }
    #add one variable Date_time.
    df$Date_time <- strptime(paste(df$Date,df$Time),
                             format = "%d/%m/%Y %H:%M:%S")
    return(df)
}

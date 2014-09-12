# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
#(sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
#takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor 
#ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the 
#directory specified in the 'directory' argument and returns the mean of the pollutant 
#across all of the monitors, ignoring any missing values coded as NA. A prototype 
#of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
    wd=paste("~/Documents/Work/Work_place/R/learning/R_programming_coursera/",
             directory,"/",sep="")
    if (pollutant %in% c("sulfate","nitrate")){
        data=data.frame()
        for (i in id){
            if (i<10){
                read.in.data=read.csv(paste(wd,"00",i,".csv",sep=""),header=T)
                data=rbind(data,read.in.data)
            }else if (i<100 & i>=10){
                read.in.data=read.csv(paste(wd,"0",i,".csv",sep=""),header=T)
                data=rbind(data,read.in.data)
            }else if (i>=100){
                read.in.data=read.csv(paste(wd,i,".csv",sep=""),header=T)
                data=rbind(data,read.in.data)
            }
        }
        pollutant.mean=mean(data[,pollutant],na.rm=T)
        return(pollutant.mean)
    } else {
        warning("Pollutant can only be sulfate or nitrate!")
    }
   
}
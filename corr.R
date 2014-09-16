# Write a function that takes a directory of data files and a threshold for complete 
# cases and calculates the correlation between sulfate and nitrate for monitor 
# locations where the number of completely observed cases (on all variables) is 
# greater than the threshold. The function should return a vector of correlations 
# for the monitors that meet the threshold requirement. If no monitors meet the 
# threshold requirement, then the function should return a numeric vector of length 
# 0. A prototype of this function follows

corr <- function(directory, threshold = 0) {
    wd=paste("~/Documents/Work/Work_place/R/learning/R_programming_coursera/",
             directory,"/",sep="")
    source("~/Documents/Work/Work_place/R/learning/R_programming_coursera/complete.R")
    data.set=complete("specdata")
    data.set=data.set[data.set$nobs>=threshold,"id"]
    output=c()
    for (i in data.set){
        if (i<10){
            read.in.data=read.csv(paste(wd,"00",i,".csv",sep=""),header=T)
        }else if (i<100 & i>=10){
            read.in.data=read.csv(paste(wd,"0",i,".csv",sep=""),header=T)
        }else if (i>=100){
            read.in.data=read.csv(paste(wd,i,".csv",sep=""),header=T)
        }
        read.in.data=read.in.data[complete.cases(read.in.data),]
        output=append(output,cor(read.in.data$sulfate,read.in.data$nitrate))    
    }
    
    return(output)
}
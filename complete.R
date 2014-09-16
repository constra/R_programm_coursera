#Write a function that reads a directory full of files and reports the number of 
#completely observed cases in each data file. The function should return a data 
#frame where the first column is the name of the file and the second column is 
#the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
    wd=paste("~/Documents/Work/Work_place/R/learning/R_programming_coursera/",
             directory,"/",sep="")
    output=data.frame()
    for (i in id){
        if (i<10){
            read.in.data=read.csv(paste(wd,"00",i,".csv",sep=""),header=T)
        }else if (i<100 & i>=10){
            read.in.data=read.csv(paste(wd,"0",i,".csv",sep=""),header=T)
        }else if (i>=100){
            read.in.data=read.csv(paste(wd,i,".csv",sep=""),header=T)
        }
        output=rbind(output,c(i,sum(complete.cases(read.in.data))))
    }
    colnames(output)=c("id","nobs")
    return(output)
}
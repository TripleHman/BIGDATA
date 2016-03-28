#if(!require('SportsAnalytics')){
#    
#    install.packages("SportsAnalytics")
    
#    library(SportsAnalytics)
    
#}

#NBA1415<-fetch_NBAPlayerStatistics("14-15")

for(i in 1:nrow(NBA1415)){
    if(NBA1415[i,"GamesPlayed"]>70&NBA1415[i,"TotalPoints"]>1500){
        print(NBA1415[i,c("Name","Team","Position")])}}

subset(NBA1415,GamesPlayed>70&TotalPoints>1500)[,c("Name","Team","Position")]
subset(NBA1415,Team=='SAN')[,c("Name","TotalPoints")]
                            
SAN[ order(SAN$TotalPoints,decreasing = T),c("Name","TotalPoints")]





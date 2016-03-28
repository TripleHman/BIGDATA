install.packages("SportsAnalistics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")



TotalMinutesPlayed<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
NBA1415TotalMinutesPlayed<-merge(NBA1415,TotalMinutesPlayed)

Totalpointsmade<-aggregate(TotalPoints~Team,NBA1415,max)
NBA1415Totalpointsmade<-merge(NBA1415,Totalpointsmade)

NBA1415$PointsE<-round(((NBA1415$FieldGoalsMade-NBA1415$ThreesMade)*2+(NBA1415$ThreesMade)*3)/NBA1415$TotalMinutesPlayed,digits=3)
PointsEMax<-merge(NBA1415,aggregate(PointsE~Team,NBA1415,max))

NBA1415$ThreesP<-round(NBA1415$ThreesMade/NBA1415$ThreesAttempted,digits=3)
ThreesPMax<-merge(NBA1415,aggregate(ThreesP~Team,NBA1415,max))

NBA1415$ThreesP<-round(NBA1415$ThreesMade/NBA1415$ThreesAttempted,digits=3)
ThreesPMax<-merge(NBA1415,aggregate(ThreesP~Team,
                                    NBA1415[NBA1415$ThreesMade>mean(NBA1415$ThreesMade),],
                                    max))


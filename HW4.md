---
title: "Facebook粉絲團分析Tsai Ing-wen "
output: html_document
---
##分析日期 2016/01/01至今 Tsai Ing-wen 粉絲團 的貼文 
#讀取Tsai Ing-wen 粉絲團資料
```{r}
if (!require('Rfacebook')){
  install.packages("Rfacebook")
  library(Rfacebook)
}
token<-'CAACEdEose0cBADhN4SZC5FYZAU6MDR0QiLtrcC9AI9cxbBWOH4J3U3scRJcRBYHMZB67jmZCfCZAhDacWcZC2aFJWfLZBRIZBmh3mKvRxwvRZCvZAYayIN37aEBeRN67GCTkgFUn1mTvDDIZA5lJHftbjCFFurw4rXsZBQfQLpK3Vji8uzp2TU46I9r4WBBP7p7eCdYgMTGkmajtMwZDZD'
totalPage<-NULL
lastDate<-Sys.Date()
DateVectorStr<-as.character(seq(as.Date("2016-01-01"),lastDate,by="5 days"))
for(i in 1:(length(DateVectorStr)-1)){
  tempPage<-getPage("tsaiingwen", token,
                   since = DateVectorStr[i],until = DateVectorStr[i+1])
  totalPage<-rbind(totalPage,tempPage)
}
```

#每日發文數分析

```{r}
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))
```

##討論：總統大選前夕發文數比較多

#每日likes數分析

```{r}

likescount<-aggregate(likes_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(likescount[order(likescount$likes_count,decreasing = T),]))
```

##討論：蔡英文當選總統

#Comments數分析

```{r}
commentscount<-aggregate(comments_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(commentscount[order(commentscount$comments_count,decreasing = T),]))
```

##討論：蔡英文公開贊同92共識，被網民灌爆


#shares數分析

```{r}
sharescount<-aggregate(shares_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(sharescount[order(sharescount$shares_count,decreasing = T),]))
```

##討論：蔡英文當選總統


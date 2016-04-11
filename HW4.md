---
title: "Facebook?????Τ��R?]???^?? Tsai Ing-wen?^"
output: html_document
---
##?��R2016/01/01?ܤ????^?? Tsai Ing-wen?????ΩҦ??K??
#Ū?????^?? Tsai Ing-wen?????θ???
```{r}
if (!require('Rfacebook')){
  install.packages("Rfacebook")
  library(Rfacebook)
}
token<-'CAAYbNjv1Q1ABANC4M3z0PzgNg69YPZADsxLmX564UFnIHDXR0X6qs0g55WvdMnttiF1gneRAMqs7iXS91fk5n9SPFAr7WtoJVLVoDyp0z7z5UGwLQ5lxvGjtlFMO5NhCUkk2BCDjFzgZB6llULCci4Ew4Ew4Pn4vxZA154xZAxk44JrGwZCDAkI15rlwHvcSALPXB4gkNX7SAyUmZBJ5bgJn6yr0k2tQIZD'
totalPage<-NULL
lastDate<-Sys.Date()
DateVectorStr<-as.character(seq(as.Date("2016-01-01"),lastDate,by="5 days"))
for(i in 1:(length(DateVectorStr)-1)){
  tempPage<-getPage("tsaiingwen", token,
                   since = DateVectorStr[i],until = DateVectorStr[i+1])
  totalPage<-rbind(totalPage,tempPage)
}
```

#?C???o???Ƥ��R

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

##?Q?סG???e???]

#?C??likes??

```{r}

likescount<-aggregate(likes_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(likescount[order(likescount$likes_count,decreasing = T),]))
```

##?Q?סG?`?ο??|?A???^???????x?W?`??

#?C??Comments??

```{r}
commentscount<-aggregate(comments_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(commentscount[order(commentscount$comments_count,decreasing = T),]))
```

##?Q?סGCNN?I?????y12?k?ʬF?v???S???^???J???A
##???j?T?ʾǥͽ}?ҡA
##???^?????A????92?@?ѥH?Τ??إ��??ˬF

#shares?Ƥ��R

```{r}
sharescount<-aggregate(shares_count~dateTPE,totalPage,sum)
library(knitr)
kable(head(sharescount[order(sharescount$shares_count,decreasing = T),]))
```

##?Q?סG?`?ο??|?A???^???????x?W?`??


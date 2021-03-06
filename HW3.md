NBA 2014-2015球季 各隊分析
================

``` r
#install.packages("SportsAnalistics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")
```

各隊最辛苦的球員
================

上場時間最多
------------

``` r
TotalMinutesPlayed<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
NBA1415TotalMinutesPlayed<-merge(NBA1415,TotalMinutesPlayed)
output<-NBA1415TotalMinutesPlayed[order(NBA1415TotalMinutesPlayed$TotalMinutesPlayed,decreasing=T),c("Team","Name","TotalMinutesPlayed")]
library(knitr)
kable(output, digit=2)
```

|     | Team | Name             |  TotalMinutesPlayed|
|-----|:-----|:-----------------|-------------------:|
| 11  | HOU  | James Harden     |                2979|
| 18  | MIN  | Andrew Wiggins   |                2971|
| 25  | POR  | Damian Lillard   |                2928|
| 13  | LAC  | Chris Paul       |                2860|
| 30  | WAS  | John Wall        |                2841|
| 24  | PHO  | Eric Bledsoe     |                2799|
| 3   | BRO  | Joe Johnson      |                2787|
| 6   | CLE  | Kyrie Irving     |                2735|
| 7   | DAL  | Monta Ellis      |                2698|
| 19  | NOR  | Tyreke Evans     |                2695|
| 15  | MEM  | Marc Gasol       |                2690|
| 5   | CHI  | Pau Gasol        |                2682|
| 26  | SAC  | Ben Mclemore     |                2674|
| 8   | DEN  | Ty Lawson        |                2668|
| 16  | MIA  | Goran Dragic     |                2641|
| 29  | UTA  | Gordon Hayward   |                2618|
| 10  | GSW  | Stephen Curry    |                2613|
| 9   | DET  | Ke Caldwell-pope |                2591|
| 22  | ORL  | Victor Oladipo   |                2572|
| 17  | MIL  | G Antetokounmpo  |                2542|
| 2   | BOS  | Avery Bradley    |                2427|
| 28  | TOR  | Kyle Lowry       |                2422|
| 1   | ATL  | Kyle Korver      |                2418|
| 12  | IND  | Solomon Hill     |                2380|
| 4   | CHA  | Gerald Henderson |                2323|
| 23  | PHI  | Nerlens Noel     |                2311|
| 27  | SAN  | Danny Green      |                2311|
| 21  | OKL  | Russel Westbrook |                2302|
| 14  | LAL  | Wesley Johnson   |                2244|
| 20  | NYK  | Shane Larkin     |                1864|

各隊得分王
==========

總得分最高
----------

``` r
Totalpointsmade<-aggregate(TotalPoints~Team,NBA1415,max)
NBA1415Totalpointsmade<-merge(NBA1415,Totalpointsmade)
output<-NBA1415Totalpointsmade[order(NBA1415Totalpointsmade$TotalPoints,decreasing=T),c("Team","Name","TotalPoints")]
library(knitr)
kable(output, digit=2)
```

|     | Team | Name             |  TotalPoints|
|-----|:-----|:-----------------|------------:|
| 11  | HOU  | James Harden     |         2217|
| 10  | GSW  | Stephen Curry    |         1900|
| 21  | OKL  | Russel Westbrook |         1886|
| 6   | CLE  | Lebron James     |         1740|
| 25  | POR  | Damian Lillard   |         1720|
| 19  | NOR  | Anthony Davis    |         1656|
| 13  | LAC  | Chris Paul       |         1564|
| 7   | DAL  | Monta Ellis      |         1513|
| 29  | UTA  | Gordon Hayward   |         1463|
| 5   | CHI  | Pau Gasol        |         1446|
| 26  | SAC  | Rudy Gay         |         1432|
| 22  | ORL  | Nikola Vucevic   |         1428|
| 15  | MEM  | Marc Gasol       |         1413|
| 18  | MIN  | Andrew Wiggins   |         1387|
| 30  | WAS  | John Wall        |         1385|
| 24  | PHO  | Eric Bledsoe     |         1377|
| 16  | MIA  | Dwyane Wade      |         1331|
| 28  | TOR  | Kyle Lowry       |         1244|
| 3   | BRO  | Brook Lopez      |         1236|
| 1   | ATL  | Paul Millsap     |         1218|
| 8   | DEN  | Ty Lawson        |         1143|
| 9   | DET  | Andre Drummond   |         1130|
| 2   | BOS  | Isaiah Thomas    |         1101|
| 4   | CHA  | Al Jefferson     |         1080|
| 27  | SAN  | Tim Duncan       |         1070|
| 17  | MIL  | Khris Middleton  |         1055|
| 20  | NYK  | Carmelo Anthony  |          966|
| 12  | IND  | C.j. Miles       |          942|
| 23  | PHI  | Robert Covington |          927|
| 14  | LAL  | Jordan Hill      |          841|

各隊最有效率的球員
==================

得分效率最高,三分球擁有1.5倍加權
--------------------------------

``` r
NBA1415$PointsE<-round(((NBA1415$FieldGoalsMade-NBA1415$ThreesMade)*2+(NBA1415$ThreesMade)*3)/NBA1415$TotalMinutesPlayed,digits=3)
PointsEMax<-merge(NBA1415,aggregate(PointsE~Team,NBA1415,max))
output<-PointsEMax[order(PointsEMax$PointsE,decreasing=T),c("Team","Name","Position","PointsE","TotalPoints")]
library(knitr)
kable(output, digit=2)
```

|     | Team | Name             | Position |  PointsE|  TotalPoints|
|-----|:-----|:-----------------|:---------|--------:|------------:|
| 26  | SAC  | Sim Bhullar      | C        |     0.67|            2|
| 27  | SAC  | Eric Moreland    | PF       |     0.67|            2|
| 10  | GSW  | Stephen Curry    | PG       |     0.61|         1900|
| 21  | OKL  | Kevin Durant     | SF       |     0.59|          686|
| 7   | DAL  | Charl Villanueva | PF       |     0.56|          403|
| 6   | CLE  | Lebron James     | SF       |     0.55|         1740|
| 20  | NYK  | Carmelo Anthony  | SF       |     0.54|          966|
| 24  | PHO  | Gerald Green     | SG       |     0.54|          884|
| 25  | POR  | Lamarcu Aldridge | PF       |     0.54|         1661|
| 16  | MIA  | Dwyane Wade      | SG       |     0.53|         1331|
| 4   | CHA  | Jannero Pargo    | PG       |     0.53|           41|
| 19  | NOR  | Anthony Davis    | PF       |     0.52|         1656|
| 11  | HOU  | James Harden     | SG       |     0.50|         2217|
| 22  | ORL  | Nikola Vucevic   | C        |     0.50|         1428|
| 2   | BOS  | Luigi Datome     | SF       |     0.49|          105|
| 13  | LAC  | Blake Griffin    | PF       |     0.49|         1469|
| 5   | CHI  | Derrick Rose     | PG       |     0.49|          904|
| 12  | IND  | Paul George      | SF       |     0.49|           53|
| 14  | LAL  | Kobe Bryant      | SG       |     0.49|          782|
| 3   | BRO  | Brook Lopez      | C        |     0.48|         1236|
| 18  | MIN  | Shabazz Muhammad | SF       |     0.47|          512|
| 17  | MIL  | Ersan Ilyasova   | PF       |     0.46|          669|
| 1   | ATL  | Al Horford       | PF       |     0.45|         1156|
| 29  | TOR  | Louis Williams   | SG       |     0.45|         1242|
| 9   | DET  | Brandon Jennings | PG       |     0.44|          632|
| 23  | PHI  | Tony Wroten      | SG       |     0.43|          507|
| 28  | SAN  | Tony Parker      | PG       |     0.43|          976|
| 30  | UTA  | Derrick Favors   | PF       |     0.42|         1187|
| 15  | MEM  | Mike Conley      | PG       |     0.40|         1107|
| 8   | DEN  | Danilo Gallinari | SF       |     0.40|          734|
| 31  | WAS  | Bradley Beal     | SG       |     0.40|          964|

各隊三分球出手最準的球員
========================

三分球比三分出手數，三分進球數需高於聯盟平均
--------------------------------------------

``` r
NBA1415$ThreesP<-round(NBA1415$ThreesMade/NBA1415$ThreesAttempted,digits=3)
ThreesPMax<-merge(NBA1415,aggregate(ThreesP~Team,
                                    NBA1415[NBA1415$ThreesMade>mean(NBA1415$ThreesMade),],
                                    max))
output<-ThreesPMax[order(ThreesPMax$ThreesP,decreasing=T),c("Team","Name","Position","ThreesP","ThreesMade")]
library(knitr)
kable(output, digit=2)
```

|     | Team | Name             | Position |  ThreesP|  ThreesMade|
|-----|:-----|:-----------------|:---------|--------:|-----------:|
| 21  | NOR  | Luke Babbitt     | SF       |     0.51|          59|
| 1   | ATL  | Kyle Korver      | SG       |     0.49|         221|
| 10  | GSW  | Stephen Curry    | PG       |     0.44|         286|
| 13  | LAC  | J.j. Redick      | SG       |     0.44|         200|
| 23  | OKL  | Anthony Morrow   | SG       |     0.43|         141|
| 7   | DAL  | Richar Jefferson | SF       |     0.43|          66|
| 27  | POR  | Meyers Leonard   | C        |     0.42|          47|
| 29  | SAN  | Danny Green      | SG       |     0.42|         191|
| 6   | CLE  | Kyrie Irving     | PG       |     0.42|         155|
| 22  | NYK  | Jose Calderon    | PG       |     0.42|          59|
| 32  | WAS  | Bradley Beal     | SG       |     0.41|         106|
| 5   | CHI  | Mike Dunleavy    | SF       |     0.41|         107|
| 19  | MIL  | Khris Middleton  | SF       |     0.41|         109|
| 12  | IND  | Damjan Rudez     | SF       |     0.41|          69|
| 25  | PHI  | Hollis Thompson  | SG       |     0.40|         115|
| 15  | MEM  | Jordan Adams     | SG       |     0.40|          10|
| 16  | MEM  | Courtney Lee     | SG       |     0.40|          90|
| 24  | ORL  | Channing Frye    | PF       |     0.39|         136|
| 20  | MIN  | Kevin Martin     | SG       |     0.39|          75|
| 11  | HOU  | Jason Terry      | SG       |     0.39|         126|
| 26  | PHO  | Brandon Knight   | PG       |     0.39|         125|
| 2   | BOS  | Jonas Jerebko    | PF       |     0.39|          54|
| 9   | DET  | Caron Butler     | SF       |     0.38|          83|
| 30  | TOR  | Greivis Vasquez  | PG       |     0.38|         133|
| 17  | MIA  | Chris Bosh       | PF       |     0.38|          63|
| 18  | MIA  | Tyler Johnson    | SG       |     0.38|          18|
| 28  | SAC  | Darren Collison  | PG       |     0.37|          60|
| 14  | LAL  | Wayne Ellington  | SG       |     0.37|          90|
| 3   | BRO  | Deron Williams   | PG       |     0.37|          87|
| 31  | UTA  | Rodney Hood      | SG       |     0.36|          62|
| 4   | CHA  | Troy Daniels     | SG       |     0.36|          43|
| 8   | DEN  | Randy Foye       | SG       |     0.36|          94|

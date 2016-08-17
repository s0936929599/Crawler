Install.packages("tidyr") #rbind packages
library(gtools)
library(tidyr)
getwd()
setwd("C:/Users/BDC/Desktop/etc data")
a=list.files(path="C:/Users/BDC/Desktop/etc data",pattern="*",full.names = T)
b=list.files(path = a,full.names = T)
c_m04a=list.files(path = b[1],full.names = T)
c_m05a=list.files(path = b[2],full.names = T)
m04a=list.files(path = c_m04a,pattern=".csv",full.names = T)
m05a=list.files(path = c_m05a,pattern=".csv",full.names = T)
#讀檔function                               
tmprt = function(rtcsv){
  read.csv( rtcsv,header = FALSE)
 }
# lapply 跟 do.call 第一個都要LIST
class(m04a)
as.list(m04a)
rm04a = lapply(as.list(m04a),tmprt) #將m04a 都讀檔
rm04a = do.call(rbind,rm04a)#將m04a 都合一起
rm05a=lapply(as.list(m05a),tmprt )
rm05a = do.call(rbind,rm05a)
write.csv(rm04a,file = "m04a.csv")
write.csv(rm05a,file = "m05a.csv")
setwd("C:/Users/BDC/Desktop/")
m0405a=cbind(rm04a,rm05a)
m0405b<-m0405a[,-c(7:10,12)]#刪除重複的行
names(m0405b)[1:7]=c("TimeInterval","GantryFrom","GantryTo","VehicleType","TravelTime",
                     "Traffic","SpaceMeanSpeed")#第一列命名 
write.csv(m0405b,file = "m0405b.csv")


t = m0405b
d = list()
i=1
for(v in seq(1,length(m0405b[,1]),by=5))
  { #每五個要的
  d2 = list(t[v,1:3],t[v,4:7],t[v+1,4:7],t[v+2,4:7],t[v+3,4:7],t[v+4,4:7])#五個資料整理成一個
  d[[i]] = do.call(cbind,d2) #整理好的存進去
  i=i+1
  cat(v,"\n")
  }
ab=do.call(rbind,d) #所有資料rbind
names(ab)[1:3]=c("TimeInterval","GantryFrom","GantryTo")
names(ab)[4:length(ab)]=c("VehicleType","TravelTime","Traffic","SpaceMeanSpeed")#第一列命名 
write.csv(ab,file = "m0405bind.csv")

#算出平均旅行時間存在最後一欄
for(i in 1:length(ab[,1])){
  trat= trunc((ab[i,5]*ab[i,6]+ab[i,9]*ab[i,10]+ab[i,13]*ab[i,14]+ab[i,17]*ab[i,18]+ab[i,21]*ab[i,22])/(ab[i,6]+ab[i,10]+ab[i,14]+ab[i,18]+ab[i,22]))
  ab[i,24] =trat
  
  cat(i,"\n")
}

#將多餘的刪掉
aaa=read.csv("m0405bind.csv")
tra=aaa[,-c(5:24)]
names(tra)[5]=c("average travel time")
write.csv(tra,file = "tra.csv")



read.csv("tra.csv")









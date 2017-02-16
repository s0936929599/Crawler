#0.5s~1.7s 
setwd("C:/Users/BDC/Desktop/")
setwd("C:/Users/BDC/Desktop/基隆-新竹")
one=read.csv("1.7s-2.9s.csv",header=TRUE)
one=one[,-c(1)]

normalize=function(data,col,x)
{
  (x-min(data[,col]))/(max(data[,col])-min(data[,col]))
}
data=data.frame()
for (i in 1:nrow(one)) 
{
  data[i,1]=one[i,1]
  cat(i,"\n")
}
for (i in 2:21) {
  data[,i]=normalize(one,i,one[,i])#一次給一整欄
  cat(i,"\n")
}

names(data)=c("time","traffic.5","traffic.10","traffic.15","traffic.20","traffic.25","traffic.30"
            ,"speed.5","speed.10","speed.15","speed.20","speed.25","speed.30"
            ,"traveltime.1day","traveltime.2day","traveltimenow"
            ,"traveltime.5","traveltime.10","traveltime.15","traveltime.20","traveltime.25")

formula.bpn<- traveltimenow++traveltime.5+traveltime.10+traveltime.15+traveltime.20+traveltime.25 ~  traffic.5+traffic.10+traffic.15+traffic.20+traffic.25+traffic.30+speed.5+speed.10+speed.15+speed.20+speed.25+speed.30+traveltime.1day+traveltime.2day
t1<-Sys.time()
t1
set.seed(123)
bpn=neuralnet(formula =formula.bpn,
              data=data[45793:51552,], #七到九月資料為 33121~51552 #訓練九月45793
              hidden =c(6,4),       # 一個隱藏層：2個node
              learningrate = 0.01, # learning rate
              threshold = 0.01,    # partial derivatives of the error function, a stopping criteria
              stepmax = 5e+08      # 最大的ieration數 = 500000(5*10^5)
)
t2<-Sys.time()
t2
plot(bpn)
pre=data.frame()
a=compute(bpn,data[51553:57312,2:15]) #預測10月~56736 (10月完整 57312)
pre=a$net.result
ti=data.frame()
for (i in 1:((57312-51553)+1))
{
  ti[i,1]=data[i+51552,1]
  
}
ti=cbind(ti,pre)
names(ti)=c("time","traveltimenow"
            ,"traveltime.5","traveltime.10","traveltime.15","traveltime.20","traveltime.25")
setwd("C:/Users/BDC/Desktop/基隆-新竹十月測試")
write.csv(ti,file = "18.2s-24.8s.csv")


normalizereturn=function(data,col,nor_x)
{
  nor_x*(max(data[,col])-min(data[,col]))+min(data[,col])
}

preturn=data.frame()
for (i in 1:nrow(ti)) 
{
  preturn[i,1]=ti[i,1]
}

for (i in 2:7) {              
  preturn[,i]=normalizereturn(one,i+14,ti[,i])#第一個為原始資料第二個為原始預測欄位 i+14為原始資料旅行時間
  cat(i,"\n")
}
names(preturn)=c("time","traveltimenow"
                 ,"traveltime.5","traveltime.10","traveltime.15","traveltime.20","traveltime.25")
setwd("C:/Users/BDC/Desktop/基隆-新竹十月預測")
write.csv(preturn,file = "18.2s-24.8s.csv")
setwd("C:/Users/BDC/Desktop/基隆-新竹十月預測")
preturn=read.csv("1.7s-2.9s.csv")
preturn=preturn[,-1]
sum=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,16]-round(preturn[i,2]))/one[51552+i,16]))*100/nrow(preturn)
  sum=sum+a
}
sum1=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,17]-round(preturn[i,3]))/one[51552+i,17]))*100/nrow(preturn)
  sum1=sum1+a
}
sum2=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,18]-round(preturn[i,4]))/one[51552+i,18]))*100/nrow(preturn)
  sum2=sum2+a
}
sum3=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,19]-round(preturn[i,5]))/one[51552+i,19]))*100/nrow(preturn)
  sum3=sum3+a
}
sum4=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,20]-round(preturn[i,6]))/one[51552+i,20]))*100/nrow(preturn)
  sum4=sum4+a
}

sum5=0
for (i in 1:nrow(preturn)) 
{
  a=0
  a=abs(((one[51552+i,21]-round(preturn[i,7]))/one[51552+i,21]))*100/nrow(preturn)
  sum5=sum5+a
}


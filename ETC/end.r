library(stringr)
setwd("C:/Users/BDC/Desktop/")
getwd()
setwd("C:/Users/BDC/Desktop/etc data1")
setwd("D:/etc")
m04a=list.files(path="C:/Users/BDC/Desktop/etc data1/m04A",pattern="*",full.names = T)
m05a=list.files(path="C:/Users/BDC/Desktop/etc data1/m05A",pattern="*",full.names = T)
a=list()
b=list()
c=list()
d=list()
d2=list()
e=list()#M04A
g=list()#M05A
h=list()#M0405A
ii=list()
ab=list()#五行變一行的LIST
tra=list()#平均旅行時間跟車量
Sequence=list()
#讀檔
tmprt = function(rtcsv){
  read.csv( rtcsv,header = FALSE)
}
#讀處理完的檔
tmprt1 = function(rtcsv){
  read.csv( rtcsv,header = TRUE,stringsAsFactors = FALSE)
}
for (i in 292:364) #從2015/8/17開始 #3/26每分鐘的跳過
{
      a[[i]]=list.files(path=m04a[i],full.names = T)#看04A一天內的小時
      b[[i]]=list.files(path=m05a[i],full.names = T)#看05A一天內的小時
      c[[i]]=list.files(path=a[[i]],full.names = T)#看04A小時內的所有CSV
      d[[i]]=list.files(path=b[[i]],full.names = T)#看05A小時內的所有CSV
      f=str_extract_all(a[[i]],"201[0-9]+")#替資料命名
      f=f[seq(1,24,by=24)]
      #04A資料合併
      e[[i]]=lapply(c[[i]],tmprt) 
      e[[i]]=do.call(rbind,e[[i]])
      #05A資料合併
      g[[i]]=lapply(d[[i]],tmprt)
      g[[i]]=do.call(rbind,g[[i]])
      #m0405a
      h[[i]]=cbind(e[[i]],g[[i]])
      #names
      h[[i]]=h[[i]][,-c(7:10,12)]#刪除重複的行
      names(h[[i]])[1:7]=c("TimeInterval","GantryFrom","GantryTo","VehicleType","TravelTime",
                           "Traffic","SpaceMeanSpeed")#第一列命名 
      #將資料五個變一個
      aa=1 #重製LIST
      for (v in seq(1,length(h[[i]][,1]),by=5))#length(h[[i]][,1])
      { 
        d2 = list(h[[i]][v,1:3],h[[i]][v,4:7],h[[i]][v+1,4:7],h[[i]][v+2,4:7],h[[i]][v+3,4:7],h[[i]][v+4,4:7])
        ii[[aa]]=do.call(cbind,d2)
        aa=aa+1
        cat(v,"\n")
      }
      
      ab[[i]]=do.call(rbind,ii) #五個變一個的資料rbind
      names(ab[[i]])[1:3]=c("TimeInterval","GantryFrom","GantryTo")
      names(ab[[i]])[4:length(ab[[i]][1,])]=c("VehicleType","TravelTime","Traffic","SpaceMeanSpeed")#第一列命名
      #偵測站間的旅行時間
      for(j in 1:length(ab[[i]][,1])){
        trat= round((ab[[i]][j,5]*ab[[i]][j,6]+ab[[i]][j,9]*ab[[i]][j,10]+ab[[i]][j,13]*ab[[i]][j,14]+ab[[i]][j,17]*ab[[i]][j,18]+ab[[i]][j,21]*ab[[i]][j,22])/(ab[[i]][j,6]+ab[[i]][j,10]+ab[[i]][j,14]+ab[[i]][j,18]+ab[[i]][j,22]))
        ab[[i]][j,24] =trat
        ab[[i]][j,25]=(ab[[i]][j,6]+ab[[i]][j,10]+ab[[i]][j,14]+ab[[i]][j,18]+ab[[i]][j,22])
        cat(j,"\n")
      }
      tra[[i]]=ab[[i]][,-c(4:23)]
      names(tra[[i]])[4:5]=c("Travel Time","Traffic")
      setwd("D:/etc")
      write.csv(tra[[i]],file =paste(f,".csv",sep=""))
      cat("第",i,"筆完成\n") 
}
#北到南的表

bb=list()
m0405a=list.files(path="D:/etc",pattern="*")#算出旅行時間資料夾
setwd("D:/etc")
bb=lapply(m0405a,tmprt1) 
ff=str_extract_all(m0405a,"201[0-9]+")
km=read.csv("km.csv",stringsAsFactors=FALSE)#2015.6.8
km1=read.csv("2015.10.1.csv",stringsAsFactors=FALSE)#2015.10.1
km2=read.csv("2015.11.20.csv",stringsAsFactors=FALSE)

#北到南的資料
ntos=function(x)
{ tt=list()

#先照順序排
for (p in 1:69)
{
  cat(p,"\n")
  t = subset(x,x$GantryFrom==km[p,1])
  tt[[p]]=subset(t,t$GantryTo==km[p+1,1])
  if(p>1)
  {
    tt[[p]]=tt[[p]][,-c(1,2)]
  }
  else
  {
    tt[[p]]=tt[[p]][,-1]
  }
  setwd("D:/etcntos")
  write.csv(tt,file=paste(ff[i],".csv",sep=""))
}
}  

for (i in 1:30) 
{

  ntos(bb[[i]])
} 

AAAA=subset(bbb[1],"NA")

#北到南交流道
bbb=list()
ntoss=list.files(path="D:/etcntos",pattern="*")
setwd("D:/etcntos")
bbb=lapply(ntoss,tmprt1) 
fff=str_extract_all(ntoss,"201[0-9]+")


ntosend=function(y)
{
  y=as.data.frame(y)
  q=1
  kkk=list()
  for (j in 1:288) #288個時段
  {
    k=2 
    kk=list()
    g=1 #存進LIST
    for (i in seq(3,length(y),by=4)) #基隆到八堵,八堵到大華系統   
    {         #第一段   
      if(g==1) #基隆端到基隆例外處理
      {
        
          kk[[g]]=round(y[j,i+2]/1.2*1.093) 
        
      }
     
       g=g+1
      
      
      kk[[g]]=round((as.numeric(str_extract(str_extract(km[k,1],"F[0-9]+"),"[0-9]+"))/10-km[k,4])/
                      (as.numeric(str_extract(str_extract(y[j,i+1],"F[0-9]+"),"[0-9]+"))/10-
                         as.numeric(str_extract(str_extract(y[j,i],"F[0-9]+"),"[0-9]+"))/10)*y[j,i+2]+
                      #第二段
                      (km[k,5]-as.numeric(str_extract(str_extract(km[k,1],"F[0-9]+"),"[0-9]+"))/10)/
                      (as.numeric(str_extract(str_extract(y[j,i+5],"F[0-9]+"),"[0-9]+"))/10-
                         as.numeric(str_extract(str_extract(y[j,i+4],"F[0-9]+"),"[0-9]+"))/10)*y[j,i+6])
      
      k=k+1 
      
    }
    
    gg=do.call(cbind,kk)
    kkk[[q]]=gg
    q=q+1
    cat(j,"\n")
    
  }
  kkk=do.call(rbind,kkk)
  as.data.frame(kkk)
  ccc=data.frame()#替資料列出時間
  for(w in 1:288)
  {
    ccc[w,1]=y[w,2]
  }
  aaa=cbind(ccc,kkk)
  names(aaa)[1:length(aaa)]=c("時間","基隆端-基隆","基隆-八堵","八堵-大華系統","大華系統-五堵","五堵-汐止","汐止系統-東湖","東湖-內湖","內湖-圓山",
                              "圓山-台北","台北-三重","三重-五股","五股-高公局","高公局-林口(文化一路)","林口(文化一路)-林口(文化北路)","林口(文化北路)-桃園",
                              "桃園-機場系統","機場系統-中壢服務區","中壢服務區-內壢","內壢-中壢","中壢-平鎮系統","平鎮系統-幼獅","幼獅-楊梅","楊梅-湖口","湖口-竹北",
                              "竹北-新竹(公道五路)","新竹(公道五路)-新竹(園區二路)","新竹(園區二路)-新竹系統","新竹系統-頭份","頭份-頭屋","頭屋-苗栗","苗栗-銅鑼","銅鑼-三義",
                              "三義-后里","后里-台中系統","台中系統-豐原","豐原-大雅","大雅-台中","台中-南屯","南屯-王田","王田-彰化系統","彰化系統-彰化","彰化-埔鹽系統","埔鹽系統-員林",
                              "員林-北斗","北斗-西螺","西螺-虎尾","虎尾-斗南","斗南-雲林系統","雲林系統-大林","大林-民雄","民雄-嘉義","嘉義-水上","水上-嘉義系統","嘉義系統-新營","新營-下營系統",
                              "下營系統-麻豆","麻豆-安定","安定-台南系統","台南系統-永康","永康-台南","台南-仁德系統","仁德系統-路竹","路竹-高科","高科-岡山","岡山-楠梓(旗楠路)","楠梓(旗楠路)-楠梓(鳳楠路)","楠梓(鳳楠路)-鼎金系統","鼎金系統-高雄(九如路)","高雄(九如路)-高雄(中正路)"
                              
                              )
  setwd("D:/etcntosend")
  write.csv(aaa,file=paste(fff[f],".csv",sep=""))
  } 


for (f in 1:30) 
{
  ntosend(bbb[[f]])
} 



bbbb=list()
ntossss=list.files(path="D:/etcntosend",pattern="*")
setwd("D:/etcntosend")
bbbb=lapply(ntossss,tmprt1) 

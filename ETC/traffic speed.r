cc=data.frame()
jj=1
d=1
kkk=list()
for (w in seq(5,length(noral_[[1]][1,]),by=5))
{
  
for (j in 3:215) 
{
  
  for (i in 1:288) 
  {
    
    if(i==1)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j-1]][288,w] #前5分交通量
      cc[i,3]=noral_[[j-1]][287,w] #  10
      cc[i,4]=noral_[[j-1]][286,w] 
      cc[i,5]=noral_[[j-1]][285,w]
      cc[i,6]=noral_[[j-1]][284,w]
      cc[i,7]=noral_[[j-1]][283,w]            
  
      
      cc[i,8]=noral_[[j-1]][288,w+1]#前5分速度
      cc[i,9]=noral_[[j-1]][287,w+1]
      cc[i,10]=noral_[[j-1]][286,w+1]
      cc[i,11]=noral_[[j-1]][285,w+1]
      cc[i,12]=noral_[[j-1]][284,w+1]
      cc[i,13]=noral_[[j-1]][283,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==2)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][1,w] #前5分交通量
      cc[i,3]=noral_[[j-1]][288,w] #  10
      cc[i,4]=noral_[[j-1]][287,w] 
      cc[i,5]=noral_[[j-1]][286,w]
      cc[i,6]=noral_[[j-1]][285,w]
      cc[i,7]=noral_[[j-1]][284,w]            
      
      
      cc[i,8]=noral_[[j-1]][1,w+1]#前5分速度
      cc[i,9]=noral_[[j-1]][288,w+1]
      cc[i,10]=noral_[[j-1]][287,w+1]
      cc[i,11]=noral_[[j-1]][286,w+1]
      cc[i,12]=noral_[[j-1]][285,w+1]
      cc[i,13]=noral_[[j-1]][284,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==3)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][2,w] #前5分交通量
      cc[i,3]=noral_[[j]][1,w] #  10
      cc[i,4]=noral_[[j-1]][288,w] 
      cc[i,5]=noral_[[j-1]][287,w]
      cc[i,6]=noral_[[j-1]][286,w]
      cc[i,7]=noral_[[j-1]][285,w]            
      
      
      cc[i,8]=noral_[[j]][2,w+1]#前5分速度
      cc[i,9]=noral_[[j]][1,w+1]
      cc[i,10]=noral_[[j-1]][288,w+1]
      cc[i,11]=noral_[[j-1]][287,w+1]
      cc[i,12]=noral_[[j-1]][286,w+1]
      cc[i,13]=noral_[[j-1]][285,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==4)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][3,w] #前5分交通量
      cc[i,3]=noral_[[j]][2,w] #  10
      cc[i,4]=noral_[[j]][1,w] 
      cc[i,5]=noral_[[j-1]][288,w]
      cc[i,6]=noral_[[j-1]][287,w]
      cc[i,7]=noral_[[j-1]][286,w]            
      
      
      cc[i,8]=noral_[[j]][3,w+1]#前5分速度
      cc[i,9]=noral_[[j]][2,w+1]
      cc[i,10]=noral_[[j]][1,w+1]
      cc[i,11]=noral_[[j-1]][288,w+1]
      cc[i,12]=noral_[[j-1]][287,w+1]
      cc[i,13]=noral_[[j-1]][286,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==5)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][4,w] #前5分交通量
      cc[i,3]=noral_[[j]][3,w] #  10
      cc[i,4]=noral_[[j]][2,w] 
      cc[i,5]=noral_[[j]][1,w]
      cc[i,6]=noral_[[j-1]][288,w]
      cc[i,7]=noral_[[j-1]][287,w]            
      
      
      cc[i,8]=noral_[[j]][4,w+1]#前5分速度
      cc[i,9]=noral_[[j]][3,w+1]
      cc[i,10]=noral_[[j]][2,w+1]
      cc[i,11]=noral_[[j]][1,w+1]
      cc[i,12]=noral_[[j-1]][288,w+1]
      cc[i,13]=noral_[[j-1]][287,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==6)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][5,w] #前5分交通量
      cc[i,3]=noral_[[j]][4,w] #  10
      cc[i,4]=noral_[[j]][3,w] 
      cc[i,5]=noral_[[j]][2,w]
      cc[i,6]=noral_[[j]][1,w]
      cc[i,7]=noral_[[j-1]][288,w]            
      
      
      cc[i,8]=noral_[[j]][5,w+1]#前5分速度
      cc[i,9]=noral_[[j]][4,w+1]
      cc[i,10]=noral_[[j]][3,w+1]
      cc[i,11]=noral_[[j]][2,w+1]
      cc[i,12]=noral_[[j]][1,w+1]
      cc[i,13]=noral_[[j-1]][288,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i>6)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      
      
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#前一天
      cc[i,16]=noral_[[j]][i,w-1]#這五分鐘旅行時間
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j]][i+5,w-1]
    }
    if(i==284)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#
      
      cc[i,16]=noral_[[j]][i,w-1]
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j]][i+4,w-1]
      cc[i,21]=noral_[[j+1]][1,w-1]
    }
    if(i==285)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#
      
      cc[i,16]=noral_[[j]][i,w-1]
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j]][i+3,w-1]
      cc[i,20]=noral_[[j+1]][1,w-1]
      cc[i,21]=noral_[[j+1]][2,w-1]
    }
    
    if(i==286)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#
      
      cc[i,16]=noral_[[j]][i,w-1]
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j]][i+2,w-1]
      cc[i,19]=noral_[[j+1]][1,w-1]
      cc[i,20]=noral_[[j+1]][2,w-1]
      cc[i,21]=noral_[[j+1]][3,w-1]
    }
    if(i==287)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#
      
      cc[i,16]=noral_[[j]][i,w-1]
      cc[i,17]=noral_[[j]][i+1,w-1]
      cc[i,18]=noral_[[j+1]][1,w-1]
      cc[i,19]=noral_[[j+1]][2,w-1]
      cc[i,20]=noral_[[j+1]][3,w-1]
      cc[i,21]=noral_[[j+1]][4,w-1]
    }
    if(i==288)
    {
      cc[i,1]=noral_[[j]][i,1]
      cc[i,2]=noral_[[j]][i-1,w] #前5分交通量
      cc[i,3]=noral_[[j]][i-2,w] #  10
      cc[i,4]=noral_[[j]][i-3,w] 
      cc[i,5]=noral_[[j]][i-4,w]
      cc[i,6]=noral_[[j]][i-5,w]
      cc[i,7]=noral_[[j]][i-6,w]            
      
      
      cc[i,8]=noral_[[j]][i-1,w+1]#前5分速度
      cc[i,9]=noral_[[j]][i-2,w+1]
      cc[i,10]=noral_[[j]][i-3,w+1]
      cc[i,11]=noral_[[j]][i-4,w+1]
      cc[i,12]=noral_[[j]][i-5,w+1]
      cc[i,13]=noral_[[j]][i-6,w+1] 
      cc[i,14]=noral_[[j-2]][i,w-1]#前兩天旅行時間
      cc[i,15]=noral_[[j-1]][i,w-1]#
      
      cc[i,16]=noral_[[j]][i,w-1]
      cc[i,17]=noral_[[j+1]][1,w-1]
      cc[i,18]=noral_[[j+1]][2,w-1]
      cc[i,19]=noral_[[j+1]][3,w-1]
      cc[i,20]=noral_[[j+1]][4,w-1]
      cc[i,21]=noral_[[j+1]][5,w-1]
    }
    
  }
  kkk[[jj]]=cc
  jj=jj+1
  cat(jj,"\n")
 }
  cc=do.call(rbind,kkk)
  names(cc)=c("time","traffic-5","traffic-10","traffic-15","traffic-20","traffic-25","traffic-30"
              ,"speed-5","speed-10","speed-15","speed-20","speed-25","speed-30"
              ,"traveltime-1day","traveltime-2day","traveltimenow"
              ,"traveltime+5","traveltime+10","traveltime+15","traveltime+20","traveltime+25")
  write.csv(cc,file = paste(acd[d],".csv",sep=""))
  kkk=list()
  cc=data.frame()
  jj=1
  d=d+1
}

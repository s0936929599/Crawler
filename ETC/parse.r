library(httr)
library(stringr)
getwd()
setwd("C:/Users/BDC/Desktop/etc data2")

MA=c("04","05")
MxxA=sprintf("M%sA",MA)
for (i in 1:2 ) 
{
  setwd("C:/Users/BDC/Desktop/etc data2")
  dir.create(MxxA[i])
  setwd(MxxA[i])
  url <- paste("http://tisvcloud.freeway.gov.tw/history/TDCS/",MxxA[i],sep = "")
  res <- GET(url)#爬網頁
  restext <- content(res,type="text",encoding = 'utf-8')#轉格式
  folder <- unlist(str_extract_all(restext,"2016[0-9]+/"))
  folder <- folder[seq(1,length(folder),by=3)]
  
  

  for (j in 2:length(folder)) 
   { 
    dir.create(folder[j])
    setwd(folder[j])
    url1 <- paste("http://tisvcloud.freeway.gov.tw/history/TDCS/",MxxA[i],"/",folder[j],sep="")
    res1 <- GET(url1)
    restext1 <- content(res1,type="text",encoding = 'utf-8')
    
    folder1 <- unlist(str_extract_all(restext1,"[0-2][0-9][/]"))
    folder1 <- folder1[seq(1,length(folder1),by=3)]
  
    for (k in 1:length(folder1)) 
    { dir.create(folder1[k])
      setwd(folder1[k])
      url2 <- paste("http://tisvcloud.freeway.gov.tw/history/TDCS/",MxxA[i],"/",folder[j],folder1[k],sep="")
      res2 <- GET(url2)
      restext2 <- content(res2,type="text",encoding = 'utf-8')
      folder2 <- unlist(str_extract_all(restext2,"TDCS[\\w]+.csv"))
      folder2 <- folder2[seq(1,length(folder2),by=3)]
      l=1
      for(l in 1:length(folder2))
      {
      url3 <- paste("http://tisvcloud.freeway.gov.tw/history/TDCS/",MxxA[i],"/",folder[j],folder1[k],folder2[l],sep="")
      download.file(url3,destfile=folder2[l])
      }
      setwd(paste("C:/Users/BDC/Desktop/etc data2","/",MxxA[i],"/",folder[j],sep=""))
      
    }  
    setwd(paste("C:/Users/BDC/Desktop/etc data2","/",MxxA[i],"/",sep=""))
    
     }
}

#gz
for (i in 1:2 )
{
i=1
setwd(paste("C:/Users/BDC/Desktop/etc data2","/",MxxA[i],"/",sep=""))
  
gz <- str_extract_all(res,"M[0-9]+A_[0-9]+.tar.gz")
gz <- unlist(gz)
gz <- gz[seq(1,length(gz),by=3)]

for(h in 1:length(gz))
  {
  gz_url <- paste("http://tisvcloud.freeway.gov.tw/history/TDCS/",MxxA[i],"/",gz[h],sep="")
  download.file(gz_url,destfile=gz[h])
  untar(gz[h])  ## unzip
  Sys.sleep(5)
  }
}

# coding=utf-8
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.support.ui import Select
import time
import re
import pandas as pd
import os
url = "https://ecolife.epa.gov.tw/Cooler/effect/Electricity_Area.aspx"
chrome_path    = "C:\selenium_driver_chrome\chromedriver.exe"
driver = webdriver.Chrome(chrome_path)
driver.get(url)
os.chdir("C:/Users/BDC/Desktop/ele")  
SaveDirectory = os.getcwd()

cc=0
ccc=0
year=[2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017]
month=[1,2,3,4,5,6,7,8,9,10,11,12]
city=[63000,10001,10003,10019,10021,64000,10002,10004,10005,10007,10008,10009,10010,10013,10014,10015,10016,10017,10018,10020,'09020','09007']
for ii in year:
    
    for jj in month:
      
        for kk in city:
            select_year  = Select(driver.find_element_by_name('ctl00$ctl00$cphMain$cphMain$ucStatisticsType$ddlMonthStatistics_Year'))
            select_year.select_by_value(str(ii))
            time.sleep(1)
            select_month = Select(driver.find_element_by_name('ctl00$ctl00$cphMain$cphMain$ucStatisticsType$ddlMonthStatistics_Month')) 
            select_month.select_by_value(str(jj))
            time.sleep(1)
            select_city  = Select(driver.find_element_by_name('ctl00$ctl00$cphMain$cphMain$ucPubQryArea$cboCity'))
            select_city.select_by_value(str(kk))
            time.sleep(1)
            find_button = driver.find_element_by_id('ctl00_ctl00_cphMain_cphMain_btnAdvanceSearch')
            find_button.click()
            time.sleep(1)
            html_source = driver.page_source
            bsobj   = BeautifulSoup(html_source)
            content = bsobj.find("div",{"id":"ctl00_ctl00_cphMain_cphMain_up_List"})

            a = []
            for i in content.findAll("tr"):
                for j in i.findAll("td")[:]:
                    c  = j.get_text()
                    c1 = c.replace(" ","").replace("\xa0\xa0","").replace("\n","").replace("\xa0","")
                    a.append(c1)
            subDistrict = []
            this_year_electricity = []
            last_year_electricity = []
            Subtract = []
            num = int(len(a))
            for i in range(1,num,4):
                subDistrict.append(a[i])
            for i in range(2,num,4):
                this_year_electricity.append(a[i])
            for i in range(3,num,4):
                last_year_electricity.append(a[i])
            for i in range(4,num,4):
                Subtract.append(a[i])
            dic ={
             "鄉鎮市區"          : subDistrict , 
             "本期用電量(度)" : this_year_electricity ,
             "去年同期用電量(度)" : last_year_electricity ,
             "與去年用電量比較(度)" : Subtract , 
                 }
            rownames=[]
            for i in range(len(Subtract)):
                rownames.append(a[0])

            data = pd.DataFrame(dic,index= rownames)
            data=data[["鄉鎮市區","本期用電量(度)","去年同期用電量(度)","與去年用電量比較(度)"]]
            file_name=str(str(year[cc])+"年"+str(month[ccc])+"月"+str(a[0]))
            data.to_csv(file_name+".csv")
        ccc=ccc+1
    cc=cc+1

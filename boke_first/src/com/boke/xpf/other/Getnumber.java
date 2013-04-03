package com.boke.xpf.other;

import java.util.*;


public class Getnumber 
{
	private String time = null;
	private String number = null;
	
	public Getnumber()
	{
		deal();
	}
	
	public String getNumber()
	{
		return this.number;
	}
	
	public String getTime()
	{
		return this.time;
	}
	
	
	
	public void deal()
	{
		this.number = "";
		int log_year,log_month,log_day,log_hour,log_minute; 
		Calendar log_c = Calendar.getInstance(); 
		 log_year = log_c.get(Calendar.YEAR); //年 
		 log_month = log_c.get(Calendar.MONTH) + 1; //月 
		 log_day = log_c.get(Calendar.DAY_OF_MONTH); //日 
		 log_hour = log_c.get(Calendar.HOUR_OF_DAY); //时（HOUR——十二小时制；HOUR_OF_DAY——二十四小时制） 
		 log_minute = log_c.get(Calendar.MINUTE); //分 
		 
		 String log_hour1 = "";
		 String log_minute1 = "";
		 
		 if(log_hour < 10)
		 {
		 	log_hour1 += "0";
		 	log_hour1 += log_hour;
		 }
		 else 
		 {
		 	log_hour1 += log_hour;
		 }
		 
		 if(log_minute < 10)
		 {
		 	log_minute1 += "0";
		 	log_minute1 += log_minute;
		 }
		 else
		 {
		 	log_minute1 += log_minute;
		 }
		 
		 
		 String log_time_yearmonthday = "";
		 log_time_yearmonthday += log_year;
		 log_time_yearmonthday += "-";
		 log_time_yearmonthday += log_month;
		 log_time_yearmonthday += "-";
		 log_time_yearmonthday += log_day;
		 
		 String log_time_hourminute = "";
		 log_time_hourminute += log_hour1;
		 log_time_hourminute += ":";
		 log_time_hourminute += log_minute1;
		 this.time = log_time_yearmonthday + " " +log_time_hourminute;
		 
		 this.number += log_year;
		 this.number += log_month;
		 this.number += log_day;
		 this.number += log_hour1;
		 this.number += log_minute1;
		 
		 Random random = new Random(); 
	 	 int x = 1000 + random.nextInt(9000);
	 	 
	 	this.number += x;
	
	}
}

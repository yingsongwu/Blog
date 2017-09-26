package com.blog.utils;

import java.text.SimpleDateFormat;

import javax.xml.crypto.Data;

public class TimeUtils {
	
	SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
	
	public String getDataTime(Data data){
		return ft.format(ft.format(data));
	}
	
}

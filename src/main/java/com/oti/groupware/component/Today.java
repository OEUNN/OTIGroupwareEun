package com.oti.groupware.component;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Today {
	
	//Method
	public static String TodayDate() {
		Date nowDate = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		String today = format.format(nowDate);
		
		return today;
	}
}

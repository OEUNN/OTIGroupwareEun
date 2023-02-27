package com.oti.groupware.hr.service;

public interface HrService {
	public int attendanceToday(String empId);
	public int inTime(String empId, String now);
	public int outTime();
}

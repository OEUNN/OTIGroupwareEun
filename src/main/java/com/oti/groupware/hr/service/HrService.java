package com.oti.groupware.hr.service;

public interface HrService {
	public int attendanceToday(String empId);
	public void inTime(String empId);
	public void outTime(String empId);
}

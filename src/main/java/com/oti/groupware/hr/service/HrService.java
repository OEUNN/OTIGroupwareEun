package com.oti.groupware.hr.service;

import java.util.HashMap;

import org.json.JSONArray;

import com.oti.groupware.hr.dto.Attendance;

public interface HrService {
	public Attendance attendanceToday(String empId);
	public HashMap<String, Object> attendanceState(String empId);
	public JSONArray attendanceCalendarList(String empId);
	public void inTime(String empId);
	public void outTime(String empId);
	public void attendanceStateAll();
}

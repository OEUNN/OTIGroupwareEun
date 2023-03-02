package com.oti.groupware.hr.service;

import java.util.List;

import org.json.JSONArray;

import com.oti.groupware.hr.dto.Attendance;

public interface HrService {
	public Attendance attendanceToday(String empId);
	public List<Attendance> attendanceList(String empId);
	public JSONArray attendanceCalendarList(String empId);
	public void inTime(String empId);
	public void outTime(String empId);
	public void attendanceStateAll();
}

package com.oti.groupware.hr.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;

import com.oti.groupware.common.Pager;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.AttendanceException;

public interface HrService {
	public Attendance attendanceToday(String empId);
	public HashMap<String, Integer> attendanceStats(String empId);
	public JSONArray attendanceCalendarList(String empId);
	public void inTime(String empId);
	public void outTime(String empId);
	public void attendanceStateAll();
	public HashMap<String, String> empFormInfoMap(String empId);
	public void writeAttendanceExceptionApplication(AttendanceException attendanceException);
	public int attendanceExceptionCount(String startDate, String endDate, String empId);
	public List<AttendanceException> attendanceExceptionList(String startDate, String endDate, String empId,
			Pager pager);
	public AttendanceException attendanceExcptionDetail(int atdExcpId);
	public HashMap<String, Integer> attendanceExceptionStats(String empId);
}

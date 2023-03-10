package com.oti.groupware.hr.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.AttendanceException;
import com.oti.groupware.hr.dto.LeaveApplication;

public interface HrService {
	public Attendance attendanceToday(String empId);
	public HashMap<String, Integer> attendanceStats(String empId);
	public JSONArray attendanceCalendarList(String empId);
	public void inTime(String empId);
	public void outTime(String empId);
	public void attendanceStateAll();
	public HashMap<String, String> empFormInfoMap(String empId);
	public Employee empReserveInfo(String empId);
	public void writeAttendanceExceptionApplication(AttendanceException attendanceException);
	public int attendanceExceptionRowsCount(String startDate, String endDate, String empId);
	public List<AttendanceException> attendanceExceptionList(String startDate, String endDate, String empId, Pager pager);
	public AttendanceException attendanceExceptionDetail(int atdExcpId);
	public HashMap<String, Integer> attendanceExceptionStats(String empId);
	public int leaveApplicationRowsCount(String startDate, String endDate, String empId);
	public List<LeaveApplication> leaveApplicationList(String startDate, String endDate, String empId, Pager pager);
	public LeaveApplication leaveApplicationDetail(int levAppId);
	public void writeleaveApplication(LeaveApplication leaveApplication);
	public int attendanceExceptionApprovalRowsCount(String startDate, String endDate, String empId);
	public List<AttendanceException> attendanceExceptionApprovalList(String startDate, String endDate, String empId, Pager pager);
	public int leaveApplicationApprovalRowsCount(String startDate, String endDate, String empId);
	public List<AttendanceException> leaveApplicationApprovalList(String startDate, String endDate, String empId, Pager pager);
	public AttendanceException attendanceExceptionApprovalDetail(int atdExcpId, String atdExcpCategory);
	
	public LeaveApplication leaveApplicationApprovalDetail(int levAppId);
	public int leaveApplicationApprovalProcessState(LeaveApplication leaveApplication);
	public int attendanceExceptionApprovalProcessState(AttendanceException atdExcp);
}

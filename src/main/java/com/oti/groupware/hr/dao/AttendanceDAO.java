package com.oti.groupware.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.AttendanceException;
import com.oti.groupware.hr.dto.LeaveApplication;

@Mapper
public interface AttendanceDAO {
	public Attendance getAttendanceToday(@Param("empId") String empId);
	public Attendance getAttendanceYesterday(@Param("empId") String empId);
	public List<Attendance> getAttendanceList(@Param("empId")String empId);
	public HashMap<String, Integer> getAttendanceStats(@Param("empId") String empId, @Param("chartDate") String chartDate);
	public void insertAttendance(@Param("empId") String empId);
	public void updateAttendance(@Param("empId") String empId);
	public List<Employee> getEmployeeList(); //나중에 EmployeeDAO에 넣기!
	public List<Attendance> getAttendanceNullList();
	public void updateAttendanceState(Attendance attendance);
	public HashMap<String, String> getEmpNames(@Param("empId") String empId, @Param("posName") String posName); //나중에 EmployeeDAO에 넣기!
	public void updateAttendanceOverTime(@Param("empId") String empId, @Param("overTimeHours") double overTimeHours);
	public void updateAttendanceUpdateTime(AttendanceException attendanceException);
	public void updateAttendanceLeaveState(LeaveApplication leaveApplication);
	public void deleteAttendance(LeaveApplication leaveApplication);
	public List<Attendance> getEmployeeLeaveList(@Param("depName") String depName);
	public void insertAttendanceState(@Param("empId") String empId);
	public Attendance getAttendanceDay(LeaveApplication leaveApplication);
	public void updateExistAttendanceState(LeaveApplication leaveApplication);
	public Attendance getAttendanceOverTime(@Param("empId") String empId);
}
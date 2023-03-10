package com.oti.groupware.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.LeaveApplication;

@Mapper
public interface AttendanceDAO {
	public Attendance getAttendanceToday(@Param("empId") String empId);
	public List<Attendance> getAttendanceList(@Param("empId")String empId);
	public HashMap<String, Integer> getAttendanceStats(@Param("empId") String empId);
	public void insertAttendance(@Param("empId") String empId);
	public void updateAttendance(@Param("empId") String empId);
	public void deleteAttendance(@Param("atdId") int atdId, @Param("empId") String empId);
	public List<Employee> getEmployeeList(); //나중에 EmployeeDAO에 넣기!
	public List<Attendance> getAttendanceNullList(@Param("empId") String empId);
	public void updateAttendanceState(Attendance attendance);
	public HashMap<String, String> getEmpNames(@Param("empId") String empId); //나중에 EmployeeDAO에 넣기!
	public void insertBeforehandAttendance(LeaveApplication leaveApplication);
	public void updateAttendanceOverTime(@Param("empId") String empId);
}
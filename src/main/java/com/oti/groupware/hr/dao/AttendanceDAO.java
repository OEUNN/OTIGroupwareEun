package com.oti.groupware.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.Attendance;

@Mapper
public interface AttendanceDAO {
	public Attendance getAttendanceToday(@Param("empId") String empId);
	public List<Attendance> getAttendanceList(@Param("empId")String empId);
	public HashMap<String, Object> countAttendanceState(@Param("empId") String empId);
	public void insertAttendance(@Param("empId") String empId);
	public void updateAttendance(@Param("empId") String empId);
	public void deleteAttendance(@Param("atdId") int atdId, @Param("empId") String empId);
	public List<Employee> getEmployeeList(); //나중에 EmployeeDAO에 넣기!
	public List<Attendance> getAttendanceNullList(@Param("empId") String empId);
	public void updateAttendanceState(Attendance attendance);
	public HashMap<String, String> getEmpNamesMap(@Param("empId") String empId);
}
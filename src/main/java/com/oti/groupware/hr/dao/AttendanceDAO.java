package com.oti.groupware.hr.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.hr.dto.Attendance;

public interface AttendanceDAO {
	public Attendance getAttendanceById(@Param("atdId") int atdId, @Param("empId") String empId);
	public void insertAttendance(Attendance attendance);
	public void updateAttendance(Attendance attendance);
	public void deleteAttendance(@Param("atdId") int atdId, @Param("empId") String empId);
}
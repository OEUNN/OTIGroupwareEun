package com.oti.groupware.hr.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.hr.dto.Attendance;

@Mapper
public interface AttendanceDAO {
	public Attendance getAttendanceToday(@Param("empId") String empId, @Param("now") String now);
	public void insertAttendance(@Param("empId") String empId, @Param("now") String now);
	public void updateAttendance(Attendance attendance);
	public void deleteAttendance(@Param("atdId") int atdId, @Param("empId") String empId);
}
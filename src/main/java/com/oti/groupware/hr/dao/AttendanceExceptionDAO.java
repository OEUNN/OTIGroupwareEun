package com.oti.groupware.hr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.hr.dto.AttendanceException;

@Mapper
public interface AttendanceExceptionDAO {
	public int getAttendanceExceptionCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<AttendanceException> getAttendanceExceptionList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
    public void insertAttendanceException(AttendanceException attendanceException);
    public void updateAttendanceException(AttendanceException attendanceException);
    public void deleteAttendanceException(@Param("atdExcpId") int atdExcpId, @Param("empId") String empId);
}
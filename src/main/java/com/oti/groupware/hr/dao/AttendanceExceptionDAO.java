package com.oti.groupware.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.hr.dto.AttendanceException;

@Mapper
public interface AttendanceExceptionDAO {
	public int getAttendanceExceptionRowsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<AttendanceException> getAttendanceExceptionList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
	public AttendanceException getAttendanceExceptionDetail(@Param("atdExcpId") int atdExcpId);
    public void insertAttendanceException(AttendanceException attendanceException);
	public HashMap<String, Integer> getAttendanceExceptionStats(@Param("empId") String empId);
	public void updateAttendanceException(AttendanceException attendanceException);
	public void deleteAttendanceException(@Param("atdExcpId") int atdExcpId, @Param("empId") String empId);

	public int getAttendanceExceptionApprovalRowsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<AttendanceException> getAttendanceExceptionApprovalList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
	public AttendanceException getattendanceExceptionApprovalDetail(@Param("atdExcpId") int atdExcpId, @Param("atdExcpCategory") String atdExcpCategory);
}
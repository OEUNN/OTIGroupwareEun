package com.oti.groupware.hr.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.hr.dto.AttendanceException;

public interface AttendanceExceptionDAO {
    public void insertAttendanceException(AttendanceException attendanceException);
    public void updateAttendanceException(AttendanceException attendanceException);
    public void deleteAttendanceException(@Param("atdExcpId") int atdExcpId, @Param("empId") String empId);
    public AttendanceException getAttendanceExceptionById(@Param("atdExcpId") int atdExcpId, @Param("empId") String empId);
}
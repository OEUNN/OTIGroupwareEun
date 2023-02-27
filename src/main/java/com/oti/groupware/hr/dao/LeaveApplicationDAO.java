package com.oti.groupware.hr.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.hr.dto.LeaveApplication;

public interface LeaveApplicationDAO {
	public LeaveApplication getLeaveApplicationById(@Param("empId") String empId, @Param("levAppId") int levAppId);
	public int insertLeaveApplication(LeaveApplication leaveApplication);
	public int updateLeaveApplication(LeaveApplication leaveApplication);
	public int deleteLeaveApplication(@Param("empId") String empId, @Param("levAppId") int levAppId);
}

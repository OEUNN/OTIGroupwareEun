package com.oti.groupware.hr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.hr.dto.LeaveApplication;

@Mapper
public interface LeaveApplicationDAO {
	public int getLeaveApplicationRowsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<LeaveApplication> getLeaveApplicationList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
	public LeaveApplication getLeaveApplicationDetail(@Param("levAppId") int levAppId);
	public int insertLeaveApplication(LeaveApplication leaveApplication);
	public int updateLeaveApplication(LeaveApplication leaveApplication);
	public void updateEmployeeReserve(@Param("empId") String empId);
	public int deleteLeaveApplication(@Param("empId") String empId, @Param("levAppId") int levAppId);
}
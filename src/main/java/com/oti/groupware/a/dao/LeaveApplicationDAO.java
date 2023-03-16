package com.oti.groupware.a.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.AttendanceException;
import com.oti.groupware.hr.dto.LeaveApplication;

@Mapper
public interface LeaveApplicationDAO {
	public int getLeaveApplicationRowsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<LeaveApplication> getLeaveApplicationList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
	public LeaveApplication getLeaveApplicationDetail(@Param("levAppId") int levAppId);
	public int insertLeaveApplication(LeaveApplication leaveApplication);
	public int updateLeaveApplication(LeaveApplication leaveApplication);
	public int deleteLeaveApplication(@Param("levAppId") int levAppId);
	
	public int getLeaveApplicationApprovalRowsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId);
	public List<AttendanceException> getLeaveApplicationApprovalList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("empId") String empId, @Param("pager") Pager pager);
	public LeaveApplication getLeaveApplicationApprovalDetail(@Param("levAppId") int levAppId);
	public Employee getEmpReserveInfo(@Param("empId") String empId);
	public void updateEmployeeReserve(LeaveApplication leaveApplication);
	public int updateLeaveApplicationProcessState(LeaveApplication leaveApplication);
	public HashMap<String, Integer> getLeaveApplicationApprovalStats(@Param("empId") String empId);
	public HashMap<String, Integer> getLeaveApplicationStats(@Param("empId") String empId);
}
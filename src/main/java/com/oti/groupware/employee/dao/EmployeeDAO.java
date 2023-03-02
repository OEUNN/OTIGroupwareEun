package com.oti.groupware.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;

public interface EmployeeDAO {
    public Employee getEmployeeById(String empId);
    public void updateLoginFailCnt(Employee employee);
    public void updateLoginSuccessCnt(Employee employee);
	public List<String> getPhoneNumber();
	public List<String> getMailId();
	public List<String> getEmpId(@Param("completeId") String completeId);
	public int getLeaveReserve(int posId);
	public int insertEmployee(Employee employee);
	public void insertEmployeeDetail(EmployeeDetail employeeDetail);
	
	public int updateEmployee(Employee employee);
    public int deleteEmployee(String empId);
	
}
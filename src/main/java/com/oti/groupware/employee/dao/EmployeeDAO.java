package com.oti.groupware.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.Employee;

public interface EmployeeDAO {
    public Employee getEmployeeById(String empId);
    public void updateLoginFailCnt(Employee employee);
    public void updateLoginSuccessCnt(Employee employee);
	public List<String> getPhoneNumber();
	public List<String> getMailId();
	public List<String> getEmpId(@Param("completeId") String completeId);
	public int insertEmployee(Employee employee);
	public int updateEmployee(Employee employee);
    public int deleteEmployee(String empId);
	public void updateImg(Employee employee);
	
}
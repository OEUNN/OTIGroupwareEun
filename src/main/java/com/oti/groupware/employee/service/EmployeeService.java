package com.oti.groupware.employee.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;

@Repository
public interface EmployeeService {
	public String login(Employee employee);
	public String phoneCheck(String phoneNumber);
	public String mailIdCheck(String mailId);
	public void insertEmployee(Employee employee, EmployeeDetail employeeDetail);
	public Employee getEmployee(String empId);
	public EmployeeDetail getEmployeeDetail(String empId, Date now);
	public void updateImg(Employee employee);
	public void updatePassword(String empId, String password);
	public List<String> getDepartment(int depId);
}

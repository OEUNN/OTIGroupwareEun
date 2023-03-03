package com.oti.groupware.employee.service;

import org.springframework.stereotype.Repository;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;

@Repository
public interface EmployeeService {
	public String login(Employee employee);
	public String phoneCheck(String phoneNumber);
	public String mailIdCheck(String mailId);
	public void insertEmployee(Employee employee, EmployeeDetail employeeDetail);
	
}

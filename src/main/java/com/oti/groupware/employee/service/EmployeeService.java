package com.oti.groupware.employee.service;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;
import com.oti.groupware.employee.service.EmployeeServiceImpl.LoginResult;

public interface EmployeeService {
	public LoginResult login(Employee employee);
	public boolean phoneCheck(String phoneNumber);
	public boolean tleCheck(String telNumber);
	public boolean mailIdCheck(String mailId);
	public void insertEmployee(Employee employee, EmployeeDetail employeeDetail, String str);
}

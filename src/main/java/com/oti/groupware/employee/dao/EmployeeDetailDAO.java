package com.oti.groupware.employee.dao;

import com.oti.groupware.employee.dto.EmployeeDetail;

public interface EmployeeDetailDAO {
	public EmployeeDetail getEmployeeDetailById(String empId);
    public void insertEmployeeDetail(EmployeeDetail employeeDetail);
    public void updateEmployeeDetail(EmployeeDetail employeeDetail);
    public void deleteEmployeeDetail(String empId);
}
package com.oti.groupware.employee.dao;

import com.oti.groupware.employee.dto.Employee;

public interface EmployeeDAO {
    public Employee getEmployeeById(String empId);
    public int insertEmployee(Employee employee);
    public int updateEmployee(Employee employee);
    public int deleteEmployee(String empId);
}

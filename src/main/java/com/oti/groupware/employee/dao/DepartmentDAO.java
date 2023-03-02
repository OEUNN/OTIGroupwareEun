package com.oti.groupware.employee.dao;

import com.oti.groupware.employee.dto.Department;

public interface DepartmentDAO {
	public Department getDepartmentById(int depId);
    public void insertDepartment(Department department);
    public void updateDepartment(Department department);
    public void deleteDepartment(int depId);
}
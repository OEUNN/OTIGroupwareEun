package com.oti.groupware.a.dao;

import com.oti.groupware.employee.dto.Department;

public interface DepartmentDAO {
	public String getDepartmentById(int depId);
    public void insertDepartment(Department department);
    public void updateDepartment(Department department);
    public void deleteDepartment(int depId);
}
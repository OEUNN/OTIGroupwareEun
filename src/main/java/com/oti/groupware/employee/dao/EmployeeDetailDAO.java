package com.oti.groupware.employee.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.EmployeeDetail;

public interface EmployeeDetailDAO {
    public void insertEmployeeDetail(EmployeeDetail employeeDetail);
    public EmployeeDetail getEmployeeDetail(String empId);
	public void updateSeniority(@Param("empId") String empId, @Param("year") int year);
}
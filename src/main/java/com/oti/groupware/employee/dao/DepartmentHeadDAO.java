package com.oti.groupware.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.employee.dto.DepartmentHead;

public interface DepartmentHeadDAO {
	public List<DepartmentHead> getDepartmentHeadByDepartmentId(int depId);
	public List<DepartmentHead> getDepartmentHeadByEmployeeId(String empId);
    public void insertDepartmentHead(DepartmentHead departmentHead);
    public void deleteDepartmentHead(@Param("empId") String empId, @Param("depId") int depId);
}

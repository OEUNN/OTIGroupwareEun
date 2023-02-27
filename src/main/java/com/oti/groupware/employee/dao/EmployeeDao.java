package com.oti.groupware.employee.dao;

import org.apache.ibatis.annotations.Mapper;

import com.oti.groupware.employee.dto.Employee;

/**
 * 
 * @author 장영은
 *
 */
@Mapper
public interface EmployeeDao {
	public Employee selectByEmpId(String empId);
	public void updateLoginFailCnt(Employee employee);
	public void updateLoginSuccessCnt(Employee employee);
}

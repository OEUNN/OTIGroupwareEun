package com.oti.groupware.employee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dto.EmployeeInfo;

public interface EmployeeDAO {
    public Employee getEmployeeById(String empId);
    public void updateLoginFailCnt(Employee employee);
    public void updateLoginSuccessCnt(Employee employee);
	public List<String> getPhoneNumber();
	public List<String> getMailId();
	public List<String> getEmpId(@Param("completeId") String completeId);
	public int insertEmployee(Employee employee);
	public int updateEmployee(Employee employee);
    public int deleteEmployee(String empId);
	public void updateImg(Employee employee);
	public void updatePassword(@Param("empId")String empId, @Param("password")String password);
	public List<Employee> getDepartment(int depId);
	public Employee getEmployeeByName(String empName);
	public int getPositionIdById(String empId);
	public int employeeRowsCount();
	public List<Employee> getEmployees(@Param("pager") Pager pager);
	public Employee getCeoInformation();
	public List<Employee> getemp();
	public EmployeeInfo mailInfo(String empId);
	
}
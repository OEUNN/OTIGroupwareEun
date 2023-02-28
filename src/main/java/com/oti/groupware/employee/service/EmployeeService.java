package com.oti.groupware.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dto.Employee;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Service
@Log4j2
public class EmployeeService {
	
	public enum LoginResult{
		SUCCESS, WRONE_ID, WRONG_PASSWPRD, FIVE_WRONG_PASSWORD
	}
	
	@Autowired
	private EmployeeDAO employeeDao;
	
	public LoginResult login(Employee employee) {
		log.info("login result service");
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Employee dbEmployee = getEmployee(employee.getEmpId());
		if(dbEmployee == null) {
			return LoginResult.WRONE_ID;
		}else {
			boolean checkPass = pe.matches(employee.getEmpPassword(), dbEmployee.getEmpPassword());
			if(checkPass == false) {
				updateLoginFailCnt(employee);
				employee.setEmpLoginFailuresCnt(employee.getEmpLoginFailuresCnt());
				if(employee.getEmpLoginFailuresCnt()==5) {
					return LoginResult.FIVE_WRONG_PASSWORD;
				}
				return LoginResult.WRONG_PASSWPRD;
			}
		}
		updateLoginSuccessCnt(employee);
		employee = getEmployee(employee.getEmpId());
		return LoginResult.SUCCESS;
	}


	/**
	 * 
	 * @param 작성 아이디
	 * @return 해당 아이디에 해당하는 직원의 정보
	 */
	private Employee getEmployee(String empId) {
		return employeeDao.getEmployeeById(empId);
	}
	
	/**
	 * 비밀번호가 틀렸을 때 fail count +1
	 * @param employee
	 * @return employee
	 */ 
	private void updateLoginFailCnt(Employee employee) {
		employee.setEmpLoginFailuresCnt(employee.getEmpLoginFailuresCnt()+1);
		employeeDao.updateLoginFailCnt(employee);
	}
	
	/**
	 * 모든 로그인 성공시 fail count reset
	 * @param employee
	 * @return employee 
	 */
	private void updateLoginSuccessCnt(Employee employee) {
		employee.setEmpLoginFailuresCnt(0);
		employeeDao.updateLoginSuccessCnt(employee);
	}
}

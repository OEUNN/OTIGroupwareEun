package com.oti.groupware.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Service
@Log4j2
public class EmployeeServiceImpl implements EmployeeService {
	
	public enum LoginResult{
		SUCCESS, WRONE_ID, WRONG_PASSWPRD, FIVE_WRONG_PASSWORD
	}
	
	@Autowired
	private EmployeeDAO employeeDao;
	
	@Override
	public LoginResult login(Employee employee) {
		log.info("login result service");
		Employee dbEmployee = getEmployee(employee.getEmpId());
		if(dbEmployee == null) {
			return LoginResult.WRONE_ID;
		}else {
			boolean checkPass = matchPassword(employee.getEmpPassword(), dbEmployee.getEmpPassword());
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
	
	private boolean matchPassword(String rawPassword, String encodedPassword) {
		//encodedPassword를 읽고 bcrypt로 복호화해서 비교
		/*BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 * return passwordEncoder.matchs(rawPassword, encodedPassword);*/
		
		//{alogrithmID}encodedPassword를 읽고 해당 알고리즘으로 복호화해서 비교
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	private String getEncodedPassword(String password) {
		//encodedPassword 리턴
		/*PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.encode(password);*/
		
		//{bcrypt}encodedPassword 리턴
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.encode(password);
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

	@Override
	public boolean phoneCheck(String phoneNumber) {
		List<String> phoneNumberList = employeeDao.getPhoneNumber();
		boolean result = true;
		for(String phone : phoneNumberList) {
			if(phoneNumber.equals(phone)) {
				result = false;
			}
		}
		return result;
	}

	@Override
	public boolean tleCheck(String telNumber) {
		List<String> telNumberList = employeeDao.getTelNumber();
		boolean result = true;
		for(String tel : telNumberList) {
			if(!telNumber.equals(tel)) {
				result = false;
			}
		}
		return result;
	}

	@Override
	public boolean mailIdCheck(String mailId) {
		List<String> mailIdList = employeeDao.getMailId();
		boolean result = true;
		for(String mail : mailIdList) {
			if(mailId.equals(mail)) {
				result = false;
			}
		}
		return result;
	}

	@Override
	public void insertEmployee(Employee employee, EmployeeDetail employeeDetail, String completeId) {
		List<String> empId = employeeDao.getEmpId(completeId);
		boolean result = true; 
		//id가 존재하지 않으면
		if(!empId.isEmpty()) {
			for(String id : empId) {
				String endId = id.substring(6);
				int endNum = (Integer.parseInt(endId))+1;
				endId = Integer.toString(endNum);
				employee.setEmpId(completeId+endId);
			}
			result = false;
		}else {
			employee.setEmpId(completeId+"1");
		}
		if(!result) {
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			//직급에 따른 연차 갯수 얻어오기
			int leaveReserve = employeeDao.getLeaveReserve(employee.getPosId());
			employee.setEmpLeaveReserve(leaveReserve);
			employee.setEmpPassword(pe.encode(employee.getEmpPassword()));
			employeeDao.insertEmployee(employee);
			employeeDetail.setEmpId(employee.getEmpId());
			employeeDao.insertEmployeeDetail(employeeDetail);
		}
		
	}
}

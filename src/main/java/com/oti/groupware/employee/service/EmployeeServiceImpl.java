package com.oti.groupware.employee.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
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
@Log4j2
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	public enum LoginResult {
		SUCCESS, WRONE_ID, WRONG_PASSWPRD, FIVE_WRONG_PASSWORD
	}

	@Autowired
	private EmployeeDAO employeeDao;

	@Override
	public LoginResult login(Employee employee) {
		log.info("login result service");
		Employee dbEmployee = getEmployee(employee.getEmpId());
		if (dbEmployee == null) {
			return LoginResult.WRONE_ID;
		} else {
			boolean checkPass = matchPassword(employee.getEmpPassword(), dbEmployee.getEmpPassword());
			if (checkPass == false) {
				updateLoginFailCnt(employee);
				employee.setEmpLoginFailuresCnt(employee.getEmpLoginFailuresCnt());
				if (employee.getEmpLoginFailuresCnt() == 5) {
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
		// encodedPassword를 읽고 bcrypt로 복호화해서 비교
		/*
		 * BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); return
		 * passwordEncoder.matchs(rawPassword, encodedPassword);
		 */

		// {alogrithmID}encodedPassword를 읽고 해당 알고리즘으로 복호화해서 비교
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	private String getEncodedPassword(String password) {
		// encodedPassword 리턴
		/*
		 * PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); return
		 * passwordEncoder.encode(password);
		 */

		// {bcrypt}encodedPassword 리턴
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
	 * 
	 * @param employee
	 * @return employee
	 */
	private void updateLoginFailCnt(Employee employee) {
		employee.setEmpLoginFailuresCnt(employee.getEmpLoginFailuresCnt() + 1);
		employeeDao.updateLoginFailCnt(employee);
	}

	/**
	 * 모든 로그인 성공시 fail count reset
	 * 
	 * @param employee
	 * @return employee
	 */
	private void updateLoginSuccessCnt(Employee employee) {
		employee.setEmpLoginFailuresCnt(0);
		employeeDao.updateLoginSuccessCnt(employee);
	}

	@Override
	public String phoneCheck(String phoneNumber) {
		List<String> phoneNumberList = new ArrayList<>();
		phoneNumberList = employeeDao.getPhoneNumber();
		String result = "true";
		if(!phoneNumberList.isEmpty() && phoneNumberList != null) {
			for (String phone : phoneNumberList) {
				if (phoneNumber.equals(phone)) {
					result = "false";
				}
			}
		}
		return result;
	}

	@Override
	public String mailIdCheck(String mailId) {
		List<String> mailIdList = employeeDao.getMailId();
		String result = "true";
		if(!mailIdList.isEmpty() && mailIdList != null) {
			for (String mail : mailIdList) {
				if (mailId.equals(mail)) {
					result = "false";
				}
			}
		}
		return result;
	}

	@Override
	public void insertEmployee(Employee employee, EmployeeDetail employeeDetail) {
		String completeId = employee.getEmpId().replace("-","");
		completeId = completeId.substring(2,8)+"%";
		List<String> empId = employeeDao.getEmpId(completeId);
		completeId=completeId.replace("%", "");
		boolean result = true;
		// id가 존재하지 않으면
		if (!empId.isEmpty() && empId != null) {
			int endNum=0;
			String endId=null;
			int highNum = 0;
			for (String id : empId) {
				endId = id.substring(6);
				endNum = (Integer.parseInt(endId)) + 1;
				if(endNum>highNum) {
					highNum=endNum;
				}
			}
			endId = Integer.toString(highNum);
			employee.setEmpId(completeId + endId);
			result = false;
		} else {
			employee.setEmpId(completeId + "1");
		}
		if (!result) {
			// 랜덤 숫자로만 이뤄진 4개 문자열 반환
			employee.setEmpPassword(RandomStringUtils.randomNumeric(4));
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			employee.setEmpPassword(pe.encode(employee.getEmpPassword()));
			// 직급에 따른 연차 갯수 얻어오기
			int leaveReserve = employeeDao.getLeaveReserve(employee.getPosId());
			employee.setEmpLeaveReserve(leaveReserve);
			employeeDao.insertEmployee(employee);
			employeeDetail.setEmpId(employee.getEmpId());
//			log.info(employeeDetail);
			employeeDao.insertEmployeeDetail(employeeDetail);
		}

	}

}

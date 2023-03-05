package com.oti.groupware.employee.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.oti.groupware.employee.dao.DepartmentDAO;
import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dao.EmployeeDetailDAO;
import com.oti.groupware.employee.dao.PositionDAO;
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

	@Autowired
	private EmployeeDAO employeeDao;
	@Autowired
	private PositionDAO positionDao;
	@Autowired
	private EmployeeDetailDAO employeeDetailDao;
	@Autowired
	private DepartmentDAO departmentDao;

	@Override
	public String login(Employee employee) {
		log.info("login result service");
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Employee dbEmployee = getEmployee(employee.getEmpId());
		if (dbEmployee == null) {
			return "WRONE_ID";
		} else {
			boolean checkPass = pe.matches(employee.getEmpPassword(), dbEmployee.getEmpPassword());
			if (checkPass == false) {
				int cnt = updateLoginFailCnt(dbEmployee);
				employee.setEmpLoginFailuresCnt(cnt);
				if (employee.getEmpLoginFailuresCnt() >= 5) {
					return "FIVE_WRONG_PASSWORD";
				}
				return "WRONG_PASSWPRD";
			}
		}
		updateLoginSuccessCnt(employee);
		employee.setEmpId(dbEmployee.getEmpId());
		employee.setEmpPassword(null);
		employee.setEmpMail(dbEmployee.getEmpMail());
		employee.setEmpName(dbEmployee.getEmpName());
		employee.setEmpLeaveReserve(dbEmployee.getEmpLeaveReserve());
		employee.setEmpSubstitueReserve(dbEmployee.getEmpSubstitueReserve());
		employee.setEmpFileData(dbEmployee.getEmpFileData());
		employee.setEmpFileType(dbEmployee.getEmpFileType());
		employee.setEmpFileName(dbEmployee.getEmpFileName());
		employee.setPosName(getPositionName(dbEmployee.getDepId()));
		employee.setDepName(getDepartmentName(dbEmployee.getDepId()));
		return "SUCCESS";
	}

	/**
	 * 
	 * @param 작성 아이디
	 * @return 해당 아이디에 해당하는 직원의 정보
	 */
	@Override
	public Employee getEmployee(String empId) {
		return employeeDao.getEmployeeById(empId);
	}

	/**
	 * 비밀번호가 틀렸을 때 fail count +1
	 * @param employee
	 * @return employee
	 */
	private int updateLoginFailCnt(Employee dbEmployee) {
		dbEmployee.setEmpLoginFailuresCnt(dbEmployee.getEmpLoginFailuresCnt() + 1);
		log.info("failCnt :" +dbEmployee.getEmpLoginFailuresCnt());
		employeeDao.updateLoginFailCnt(dbEmployee);
		return dbEmployee.getEmpLoginFailuresCnt();
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
	
	private String getDepartmentName(int depId) {
		String depStr = departmentDao.getDepartmentById(depId);
		return depStr;
	}
	
	private String getPositionName(int posId) {
		String posStr = positionDao.getPositionById(posId);
		return posStr;
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
		log.info("insert service 실행");
		String completeId = employee.getEmpId().replace("-","");
		completeId = completeId.substring(2,8)+"%";
		List<String> empId = employeeDao.getEmpId(completeId);
		completeId=completeId.replace("%", "");
		//사번 만들기
		//해당 날짜에 사번이 존재한다면
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
		//해당날짜에 사번이 없다면
		} else {
			employee.setEmpId(completeId + "1");
		}
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPassword(pe.encode("12345"));
		// 직급에 따른 연차 갯수 얻어오기
		int leaveReserve = positionDao.getLeaveReserve(employee.getPosId());
		employee.setEmpLeaveReserve(leaveReserve);
		employeeDao.insertEmployee(employee);
		employeeDetail.setEmpId(employee.getEmpId());
		employeeDetailDao.insertEmployeeDetail(employeeDetail);

	}
	
	@Override
	public EmployeeDetail getEmployeeDetail(String empId, Date now) {
		EmployeeDetail employeeDetail = employeeDetailDao.getEmployeeDetail(empId);
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM");
		String nowStr = format.format(now);
		String employmentStr = format.format(employeeDetail.getEmpDetailEmploymentDate());
		String[] nowSplit = nowStr.split("/");
		String[] employmentSplit = employmentStr.split("/");
		int year = (Integer.parseInt(nowSplit[0]))-(Integer.parseInt(employmentSplit[0]));
		int month=0;
		if((Integer.parseInt(nowSplit[1]))>(Integer.parseInt(employmentSplit[1]))){
			month=1;
		}
		year = year + month;
		employeeDetail.setEmpDetailSeniority(year);
		employeeDetailDao.updateSeniority(empId, year);
		return employeeDetailDao.getEmployeeDetail(empId);
	}
	
	@Override
	public void updateImg(Employee employee) {
		employeeDao.updateImg(employee);
	}
	
}

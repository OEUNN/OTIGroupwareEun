package com.oti.groupware.employee.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;
import com.oti.groupware.employee.service.EmployeeServiceImpl;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@RequestMapping("/employee")
@Controller
@Log4j2
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl employeeService;
	
	//휴대전화 유효성 체크
	@RequestMapping(value="/phonecheck")
	public boolean phoneCheck(String phoneNumber) {
		log.info("phoneCheckt실행");
		boolean result = employeeService.phoneCheck(phoneNumber);
		return result;
	}
	
	//휴대전화 유효성 체크
	@RequestMapping(value = "/telcheck")
	public boolean telCheck(String telNumber) {
		log.info("telCheck실행");
		boolean result = employeeService.tleCheck(telNumber);
		return result;
	}
	
	//이메일 유효성 체크
	@RequestMapping(value="/mailidcheck")
	public boolean mailIdCheck(String mailId) {
		log.info("telCheck실행");
		boolean result = employeeService.mailIdCheck(mailId);
		return result;
	}
	
	/**
	 * Join - 임직원 등록
	 * @param employee - DTO
	 * @param employeeDetail - DTO
	 * @param empBirthdayStr - 생년월일이 String이므로 따로 받아옴
	 * @param employmentDateStr - 입사일에 대한 String
	 * @return 성공시 redirect를 통해 인사관리의 메인인 select 페이지로 이동한다.
	 */
	@RequestMapping(value = "/insertemployee", method = RequestMethod.POST)
	public String insertEmployee(Employee employee, EmployeeDetail employeeDetail, String empBirthdayStr, String employmentDateStr) {
		log.info("insert employee 실행");
		//String을 원하는 형태로 Date타입으로 바꾸기
		SimpleDateFormat formatYear = new SimpleDateFormat("yyyy-MM-dd");
		//사번을 비교하기 위한 로직
		String completeId = employmentDateStr.replace("-","");
		completeId = completeId.substring(2,7);
		//string to date
		try {
			employeeDetail.setEmpDetailBirthday(formatYear.parse(empBirthdayStr));
			employeeDetail.setEmpDetailEmploymentDate(formatYear.parse(employmentDateStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("employeeDetail : "+employeeDetail);
		//파일 데이터
		MultipartFile employeeFile = employee.getEmpFileData();
		if(employeeFile.isEmpty()) {
			//파일의 타입 설정
			employee.setEmpFileType(employeeFile.getContentType());
		}
		//insert를 위한 service
		employeeService.insertEmployee(employee, employeeDetail, completeId);
		System.out.println("성공?");
		return "redirect:/employee/selectemployee";
	}
	
	
	// 임직원 등록
	@RequestMapping(value = "/insertemployee", method = RequestMethod.GET)
	public String insertEmployee() {
		return "employee/insertemployee";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "employee/mypage";
	}

	//임직원 조회
	@RequestMapping(value = "/selectemployee", method = RequestMethod.GET)
	public String selectEmployee() {
		return "employee/selectemployee";
	}
	
	// 임직원 조회
	@RequestMapping(value = "/updateemployee", method = RequestMethod.GET)
	public String updateEmployee() {
		return "employee/updateemployee";
	}


	// 조직도
	@RequestMapping(value = "/organizationchart", method = RequestMethod.GET)
	public String organizationChart() {
		return "employee/organizationchart";
	}
	
	//직원정보 디테일 popup
	@RequestMapping(value = "/detailpopup", method = RequestMethod.GET)
	public String detailPopup() {
		return "employee/detailpopup";
	}
	
	//비밀번호 초기화popup
	@RequestMapping(value = "/deletepasswordpopup", method = RequestMethod.GET)
	public String deletePasswordPopup() {
		return "employee/deletePasswordPopup";
	}
	
	//접근권한 페이지
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String errorEmployee() {
		return "employee/error";
	}
}

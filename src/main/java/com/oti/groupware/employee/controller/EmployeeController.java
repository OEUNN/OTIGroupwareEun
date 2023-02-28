package com.oti.groupware.employee.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;
import com.oti.groupware.employee.service.EmployeeService;

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
	private EmployeeService employeeService;

	// 임직원 등록
	@RequestMapping(value = "/insertemployee", method = RequestMethod.POST)
	public String insertEmployee(EmployeeDetail employeeDetail, String empBirthdayStr,String employmentDateStr, HttpSession session, Model model) {
		log.info("insert employee 실행");
		SimpleDateFormat formatYear = new SimpleDateFormat("yyyy-MM-dd");
		try {
			employeeDetail.setEmpDetailBirthday(formatYear.parse(empBirthdayStr));
			employeeDetail.setEmpDetailEmploymentDate(formatYear.parse(employmentDateStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("employeeDetail : "+employeeDetail);
		
		return "redirect:/employee/insertemployee";
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

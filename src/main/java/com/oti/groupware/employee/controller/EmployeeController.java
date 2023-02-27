package com.oti.groupware.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.groupware.employee.dto.EmployeeDTO;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Controller
@Log4j2
public class EmployeeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "login/login";
	}
	
	@PostMapping("/")
	public String login(EmployeeDTO employeeDto, Model model, HttpSession session) {
		log.info("login post 실행");
		
		return "";
	}
	
	@RequestMapping(value = "/loginpopup", method = RequestMethod.GET)
	public String loginPopup() {
		log.error("popup 에러로그");
		return "login/loginpopup";
	}
	
	@RequestMapping(value = "/errorloginpopup", method = RequestMethod.GET)
	public String errorLoginPopup() {
		log.error("popup 에러로그");
		return "login/errorloginpopup";
	}
	
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/mypage";
	}

	//임직원 조회
	@RequestMapping(value = "/selectemployee", method = RequestMethod.GET)
	public String selectEmployee() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/selectemployee";
	}
	
	//임직원 조회
		@RequestMapping(value = "/updateemployee", method = RequestMethod.GET)
		public String updateEmployee() {
			log.debug("디버그 로그");
			log.info("정보 로그");
			log.warn("경고 로그");
			log.error("에러 로그");
			return "employee/updateemployee";
		}

	//임직원 등록
	@RequestMapping(value = "/insertemployee", method = RequestMethod.GET)
	public String insertEmployee() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/insertemployee";
	}

	// 조직도
	@RequestMapping(value = "/organizationchart", method = RequestMethod.GET)
	public String organizationChart() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/organizationchart";
	}
	
	//직원정보 디테일 popup
	@RequestMapping(value = "/detailpopup", method = RequestMethod.GET)
	public String detailPopup() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/detailpopup";
	}
	
	//비밀번호 초기화popup
	@RequestMapping(value = "/deletepasswordpopup", method = RequestMethod.GET)
	public String deletePasswordPopup() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "employee/deletePasswordPopup";
	}
}

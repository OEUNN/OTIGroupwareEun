package com.oti.groupware.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.service.EmployeeService;
import com.oti.groupware.employee.service.EmployeeServiceImpl;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Controller
@Log4j2
public class LoginController {
	
	@Autowired
	private EmployeeService employeeService;
 
	/**
	 * 로그인 Controller
	 * @return 로그인 페이지
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Employee employee, Model model, HttpSession session) {
		log.info("login post 실행");
		EmployeeServiceImpl.LoginResult loginResult = employeeService.login(employee);
		if(loginResult == EmployeeServiceImpl.LoginResult.SUCCESS) {
			session.setAttribute("employee", employee);
			return "redirect:/home";
		}else {
			model.addAttribute("employee", employee);
			model.addAttribute("result", loginResult);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/failidpopup", method = RequestMethod.GET)
	public String failIdPopup() {
		return "login/failidpopup";
	}
	
	@RequestMapping(value = "/failpwpopup", method = RequestMethod.GET)
	public String failPwPopup() {
		return "login/failpwpopup";
	}
	
	@RequestMapping(value = "/fivefailpwpopup", method = RequestMethod.GET)
	public String fiveFailPwPopup() {
		return "login/fivefailpwpopup";
	}
	
	@RequestMapping(value ="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("employee");
		return "redirect:/";
	}
	
}
package com.oti.groupware.employee.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	public String login(HttpServletRequest request, Model model) {
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);  
		if (redirectMap != null) {
			int failCnt = (int)redirectMap.get("failCnt");
			String result= (String) redirectMap.get("result");
			model.addAttribute("failCnt",failCnt);
			model.addAttribute("result", result);
		}
		return "login/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Employee employee, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		log.info("login post 실행");
		String loginResult = employeeService.login(employee);
		log.info("loginResult : "+loginResult);
		if(loginResult.equals("SUCCESS")) {
			session.setAttribute("employee", employee);
			return "redirect:/home";
		}else {
			redirectAttr.addFlashAttribute("failCnt",employee.getEmpLoginFailuresCnt());
			redirectAttr.addFlashAttribute("result", loginResult);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/failidpopup", method = RequestMethod.GET)
	public String failIdPopup() {
		log.info("faildpopup");
		return "login/failidpopup";
	}
	
	@RequestMapping(value = "/failpwpopup", method = RequestMethod.GET)
	public String failPwPopup() {
		log.info("failpwpopup");
		return "login/failpwpopup";
	}
	
	@RequestMapping(value = "/fivefailpwpopup", method = RequestMethod.GET)
	public String fiveFailPwPopup() {
		log.info("failfivepopup");
		return "login/fivefailpwpopup";
	}
	
	@RequestMapping(value ="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("employee");
		return "redirect:/";
	}
	
}
package com.oti.groupware.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.service.EmployeeService;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Controller
@RequestMapping("/login")
@Log4j2
public class LoginController {
	
	@Autowired
	private EmployeeService employeeService;
 
	/**
	 * 로그인 Controller
	 * @return 로그인 페이지
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Employee employee, Model model, HttpSession session) {
		String loginResult = employeeService.login(employee);
		log.info(loginResult);
		if(loginResult.equals("SUCCESS")) {
			session.setAttribute("employee", employee);
			model.addAttribute("result", loginResult);
			return "redirect:/home";
		}else {
			model.addAttribute("employee", employee);
			model.addAttribute("result", loginResult);
			return "login/login";
		}
	}
	
	@GetMapping("/filedownload")
	public ResponseEntity<byte[]> filedownload(HttpSession session) throws Exception {
		Employee employee = (Employee)session.getAttribute("employee");
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = employee.getEmpFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0],mtypes[1]));
		headers.setContentDispositionFormData("attachment",new String(employee.getEmpFileName().getBytes("UTF-8"), "ISO-8859-1") );
		return new ResponseEntity<byte[]>(employee.getEmpFileData(), headers, HttpStatus.OK);
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
		return "redirect:/login/login";
	}
	
}
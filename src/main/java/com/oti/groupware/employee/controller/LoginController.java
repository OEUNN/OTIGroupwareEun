package com.oti.groupware.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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
	public void filedownload(@RequestHeader("User-Agent")String userAgent, HttpServletResponse response, HttpSession session) throws Exception {
		Employee employee = (Employee)session.getAttribute("employee");
		if(employee != null) {
			String originalName = employee.getEmpId();
			String savedName = employee.getEmpFileName();
			String contentType = employee.getEmpFileType();
			
			//originalName이 한글이 포함되어 있을 경우, 브라우저 별로 한글을 인코딩하는 방법
			if(userAgent.contains("Trident")||userAgent.contains("MSIE")) {
				//Trident : IE 11
				//MSIE : IE 10 이하
				originalName = URLEncoder.encode(originalName, "UTF-8");
			}else {
				//Edge, Chrome, Safari
				originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			//응답 해더 설정
			response.setHeader("Content-Disposition","attachment; filename=\""+ originalName +"\"");
			response.setContentType(contentType);
			
			//응답 바디에 파일 데이터 실기
			String filePath = "C:/Temp/uploadfiles/"+savedName;
			File file = new File(filePath);
			if(file.exists()) {
				InputStream is = new FileInputStream(file);
				OutputStream os = response.getOutputStream();
				FileCopyUtils.copy(is, os);
				os.flush();
				os.close();
				is.close();
			}
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
		return "redirect:/login/login";
	}
	
}
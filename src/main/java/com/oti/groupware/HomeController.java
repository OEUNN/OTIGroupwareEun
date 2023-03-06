package com.oti.groupware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String login() {
		return "home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "redirect:/login/login";
	}
	
}

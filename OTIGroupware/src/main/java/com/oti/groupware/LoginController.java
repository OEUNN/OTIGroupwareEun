package com.oti.groupware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class LoginController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "login";
	}
	@RequestMapping(value = "/errorLogin", method = RequestMethod.GET)
	public String errorLogin() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "errorLogin";
	}
	@RequestMapping(value = "/loginReTry", method = RequestMethod.GET)
	public String loginReTry() {
		log.error("popup 에러로그");
		return "loginReTry";
	}
	
	
}

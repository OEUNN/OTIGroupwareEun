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
		return "login/login";
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
	
	
}

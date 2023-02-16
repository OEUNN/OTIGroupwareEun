package com.oti.groupware.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MailController {
	
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public String mail() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "mail/sendmail";
	}
	
}

package com.oti.groupware.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MailController {
	
	//받은 메일
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "mail/sendMail";
	}
	
	//받은메일
	@RequestMapping(value = "/receivedMail", method = RequestMethod.GET)
	public String receivedMail() {
		return "mail/receivedMail";
	}
	
	//중요메일
	@RequestMapping(value = "/importMail", method = RequestMethod.GET)
	public String importMail() {
		return "mail/importMail";
	}

	// 중요메일 팝업창
	@RequestMapping(value = "/importpopup", method = RequestMethod.GET)
	public String importpopup() {
		return "mail/importpopup";
	}
	
	//임시 보관함
	@RequestMapping(value = "/tempMail", method = RequestMethod.GET)
	public String tempMail() {
		return "mail/tempMail";
	}
	
	//휴지통
	@RequestMapping(value = "/trashMail", method = RequestMethod.GET)
	public String trashMail() {
		return "mail/trashMail";
	}
	
	//휴지통 팝업창
	@RequestMapping(value = "/trashpopup", method = RequestMethod.GET)
	public String trashpopup() {
		return "mail/trashpopup";
	}
	
	//메일쓰기
	@RequestMapping(value = "/writeMail", method = RequestMethod.GET)
	public String writeMail() {
		return "mail/writeMail";
	}
	
	//주소록 팝업창
	@RequestMapping(value = "/addresspopup", method = RequestMethod.GET)
	public String addresspopup() {
		return "mail/addresspopup";
	}
	
	//메일 자세히보기
	@RequestMapping(value = "/detailMail", method = RequestMethod.GET)
	public String detailMail() {
		return "mail/detailMail";
	}
	
}

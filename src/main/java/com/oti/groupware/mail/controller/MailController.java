package com.oti.groupware.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/mail")
public class MailController {
	
	//받은 메일
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String sendMail() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "mail/sendmail";
	}
	
	//받은메일
	@RequestMapping(value = "/receivedmail", method = RequestMethod.GET)
	public String receivedMail() {
		return "mail/receivedmail";
	}
	
	//중요메일
	@RequestMapping(value = "/importmail", method = RequestMethod.GET)
	public String importMail() {
		return "mail/importmail";
	}

	// 중요메일 팝업창
	@RequestMapping(value = "/importpopup", method = RequestMethod.GET)
	public String importPopup() {
		return "mail/importpopup";
	}
	
	//임시 보관함
	@RequestMapping(value = "/tempmail", method = RequestMethod.GET)
	public String tempMail() {
		return "mail/tempmail";
	}
	
	// 임시 보관함 팝업
	@RequestMapping(value = "/temppopup", method = RequestMethod.GET)
	public String tempPopup() {
		return "mail/temppopup";
	}
	
	//휴지통
	@RequestMapping(value = "/trashmail", method = RequestMethod.GET)
	public String trashMail() {
		return "mail/trashmail";
	}
	
	//휴지통 팝업창
	@RequestMapping(value = "/trashpopup", method = RequestMethod.GET)
	public String trashpopup() {
		return "mail/trashpopup";
	}
	
	//메일쓰기
	@RequestMapping(value = "/mailwrite", method = RequestMethod.GET)
	public String writeMail() {
		log.info("실행");
		return "mail/mailwrite";
	}
	
	//주소록 팝업창
	@RequestMapping(value = "/addresspopup", method = RequestMethod.GET)
	public String addressPopup() {
		return "mail/addresspopup";
	}
	
	//메일자세히보기
	@RequestMapping(value = "/detailmail", method = RequestMethod.GET)
	public String detailMail() {
		return "mail/detailmail";
	}
	
}

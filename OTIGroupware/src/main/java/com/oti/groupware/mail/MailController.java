package com.oti.groupware.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MailController {
	
	//받은 메일
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public String mail() {
		log.debug("디버그 로그");
		log.info("정보 로그");
		log.warn("경고 로그");
		log.error("에러 로그");
		return "mail/sendmail";
	}
	
	//받은메일
	@RequestMapping(value = "/recivedmail", method = RequestMethod.GET)
	public String recivedmail() {
		return "mail/recivedmail";
	}
	
	//중요메일
	@RequestMapping(value = "/importmail", method = RequestMethod.GET)
	public String importmail() {
		return "mail/importmail";
	}
	
	//임시 보관함
	@RequestMapping(value = "/tempmail", method = RequestMethod.GET)
	public String tempmail() {
		return "mail/tempmail";
	}
	
	//휴지통
	@RequestMapping(value = "/trashmail", method = RequestMethod.GET)
	public String trashmail() {
		return "mail/trashmail";
	}
	
	//휴지통 팝업창
	@RequestMapping(value = "/trashpopup", method = RequestMethod.GET)
	public String trashpopup() {
		return "mail/trashpopup";
	}
	
	//메일쓰기
	@RequestMapping(value = "/writemail", method = RequestMethod.GET)
	public String writemail() {
		return "mail/writemail";
	}
	
	//주소록 팝업창
	@RequestMapping(value = "/addresspopup", method = RequestMethod.GET)
	public String addresspopup() {
		return "mail/addresspopup";
	}
	
	//메일 자세히보기
	@RequestMapping(value = "/detailmail", method = RequestMethod.GET)
	public String detailmail() {
		return "mail/detailmail";
	}
	
}

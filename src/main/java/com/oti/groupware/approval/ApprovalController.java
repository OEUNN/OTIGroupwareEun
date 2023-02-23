package com.oti.groupware.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(value="/approval")
public class ApprovalController {
	
	@RequestMapping(value = "/main")
	public String main() {
		log.info("정보 로그");
		return "approval/main";
	}

	//전체문서함
	@RequestMapping(value = "/totaldocument", method=RequestMethod.GET)
	public String totalDocumentBox() {
		log.info("정보 로그");
		return "approval/totaldocument";
	}
	
	//기안함
	@RequestMapping(value = "/draftdocument", method=RequestMethod.GET)
	public String draftDocumentBox() {
		log.info("정보 로그");
		return "approval/draftdocument";
	}
	
	//임시저장함
	@RequestMapping(value = "/tempdocument", method=RequestMethod.GET)
	public String tempDocumentBox() {
		log.info("정보 로그");
		return "approval/tempdocument";
	}
	
	//반려/회수함
	@RequestMapping(value = "/returneddocument", method=RequestMethod.GET)
	public String returnedDocumentBox() {
		log.info("정보 로그");
		return "approval/returneddocument";
	}
	
	//결재대기함
	@RequestMapping(value = "/pendeddocument", method=RequestMethod.GET)
	public String pendedDocumentBox() {
		log.info("정보 로그");
		return "approval/pendeddocument";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public String write() {
		log.info("정보 로그");
		return "approval/write";
	}
	
	//주소록 화면
	@RequestMapping(value = "/organization", method=RequestMethod.GET)
	public String organization() {
		log.info("정보 로그");
		return "approval/organization";
	}
	
	//결재 문서 자세히 보기
	@RequestMapping(value = "/viewdetail", method=RequestMethod.GET)
	public String approvalDetail() {
		log.info("정보 로그");
		return "approval/viewdetail";
	}
	
}
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
	@RequestMapping(value = "/totaldocumentbox", method=RequestMethod.GET)
	public String totalDocumentBox() {
		log.info("정보 로그");
		return "approval/totaldocumentbox";
	}
	
	//기안함
	@RequestMapping(value = "/draftdocumentbox", method=RequestMethod.GET)
	public String draftDocumentBox() {
		log.info("정보 로그");
		return "approval/draftdocumentbox";
	}
	
	//임시저장함
	@RequestMapping(value = "/tempdocumentbox", method=RequestMethod.GET)
	public String tempDocumentBox() {
		log.info("정보 로그");
		return "approval/tempdocumentbox";
	}
	
	//반려/회수함
	@RequestMapping(value = "/returneddocumentbox", method=RequestMethod.GET)
	public String returnedDocumentBox() {
		log.info("정보 로그");
		return "approval/returneddocumentbox";
	}
	
	//결재대기함
	@RequestMapping(value = "/pendeddocumentbox", method=RequestMethod.GET)
	public String pendedDocumentBox() {
		log.info("정보 로그");
		return "approval/pendeddocumentbox";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/aprvwrite", method=RequestMethod.GET)
	public String write() {
		log.info("정보 로그");
		return "approval/aprvwrite";
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
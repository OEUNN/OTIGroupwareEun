package com.oti.groupware.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.service.ApprovalLineService;
import com.oti.groupware.approval.service.ApprovalService;
import com.oti.groupware.common.dto.Organization;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(value="/approval")
public class ApprovalController {
	Document document;
	ApprovalLine approvalLine;
	DocumentFile documentFile;
	List<ApprovalLine> approvalLines;
	List<DocumentFile> documentFiles;
	List<Organization> organizations;
	Map<Integer , List<Organization>> organizationsMap;
	
	@Autowired
	ApprovalService approvalService;
	
	@Autowired
	ApprovalLineService approvalLineService;
	
	@RequestMapping(value = "/main")
	public String main() {
		log.info("정보 로그");
		return "approval/main";
	}
	
	//기안함
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
	
	//완결문서함
	@RequestMapping(value = "/completeddocument", method=RequestMethod.GET)
	public String completedDocumentBox() {
		log.info("정보 로그");
		return "approval/completeddocument";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/approvalwrite", method=RequestMethod.GET)
	public String getApprovalWrite() {
		log.info("정보 로그");
		return "approval/approvalwrite";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/approvalwrite", method=RequestMethod.POST)
	public String postApprovalWrite(@RequestParam("document") String document, @RequestParam("empId") String drafterId) {
		log.info("정보 로그");
		int result = approvalService.saveDraft(document, drafterId);
		return "approval/approvalwrite";
	}
	
	//주소록 화면
	@RequestMapping(value = "/organization", method=RequestMethod.GET)
	public String organization(Model model) {
		log.info("정보 로그");
		
		organizations = approvalService.getOrganization();
		organizationsMap = new HashMap<Integer , List<Organization>>();
		
		for (Organization organization : organizations) {
			int depId = organization.getDepId();
			
			List<Organization> list = organizationsMap.getOrDefault(depId, new ArrayList<Organization>());
			
			list.add(organization);
			
			organizationsMap.put(depId, list);
		}
		
		model.addAttribute("organizationsMapKeySet", organizationsMap.keySet());
		model.addAttribute("organizationsMap", organizationsMap);
		return "approval/organization";
	}
	
	//결재 문서 자세히 보기
	@RequestMapping(value = "/viewdetail/{docId}", method=RequestMethod.GET)
	public String getApprovalDetail(@PathVariable String docId, Model model) {
		log.info("정보 로그");
		approvalLines = approvalLineService.readApprovalLines(docId);
		
		
		
		model.addAttribute("approvalLines", approvalLine);
		return "approval/viewdetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/viewdetail/{docId}/documentdetail", method=RequestMethod.GET)
	public Document getDocumentDetail(@PathVariable String docId) {
		document = approvalService.readDocument(docId);
		return document;
	}
	
	//반려 의견 작성 화면
	@RequestMapping(value = "/opinion", method=RequestMethod.GET)
	public String writeOpinion() {
		log.info("정보 로그");
		return "approval/opinion";
	}
	
}
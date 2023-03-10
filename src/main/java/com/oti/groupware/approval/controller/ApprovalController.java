package com.oti.groupware.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.service.ApprovalLineService;
import com.oti.groupware.approval.service.DocumentService;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;
import com.oti.groupware.employee.dto.Employee;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(value="/approval")
public class ApprovalController {
	Document document;
	ApprovalLine approvalLine;
	DocumentFile documentFile;
	Pager pager;
	
	List<Document> documents;
	List<ApprovalLine> approvalLines;
	List<DocumentFile> documentFiles;
	List<Organization> organizations;
	List<List<ApprovalLine>> approvalLinesList;
	
	Map<Integer, List<Organization>> organizationsMap;
	
	@Autowired
	DocumentService documentService;
	
	@Autowired
	ApprovalLineService approvalLineService;

	//기안함
	@RequestMapping(value = "/draftdocument", method=RequestMethod.GET)
	public String getDraftDocumentList(HttpSession session, Model model) {
		log.info("실행");
		
		return getDraftDocumentList(1, session, model);
	}
	
	//기안함
	@RequestMapping(value = "/draftdocument/{pageNo}", method=RequestMethod.GET)
	public String getDraftDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getDraftDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		
		model.addAttribute("pager", pager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/draftdocument";
	}
	
	//완결문서함
	@RequestMapping(value="/completeddocument", method=RequestMethod.GET)
	public String getCompletedDocumentList(HttpSession session, Model model) {
		return getCompletedDocumentList(1, session, model);
	}
	
	//완결문서함
	@RequestMapping(value="/completeddocument/{pageNo}", method=RequestMethod.GET)
	public String getCompletedDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getCompletedDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		
		model.addAttribute("pager", pager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/completeddocument";
	}
	
	//결재대기함
	@RequestMapping(value = "/pendeddocument", method=RequestMethod.GET)
	public String getPendedDocumentList(HttpSession session, Model model) {
		log.info("실행");
		
		return getPendedDocumentList(1, session, model);
	}
	
	//결재대기함
	@RequestMapping(value = "/pendeddocument/{pageNo}", method=RequestMethod.GET)
	public String getPendedDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getpendedDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		model.addAttribute("pager", pager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/pendeddocument";
	}
	
	//반려/회수함
	@RequestMapping(value = "/returneddocument", method=RequestMethod.GET)
	public String returnedDocumentBox(HttpSession session, Model model) {
		log.info("실행");
		
		return returnedDocumentBox(1, session, model);
	}
	
	//반려/회수함
	@RequestMapping(value = "/returneddocument/{pageNo}", method=RequestMethod.GET)
	public String returnedDocumentBox(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getReturnedDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		
		model.addAttribute("pager", pager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/returneddocument";
	}
	
	//임시저장함
	@RequestMapping(value = "/tempdocument", method=RequestMethod.GET)
	public String tempDocumentBox() {
		log.info("실행");
		
		return "approval/tempdocument";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/approvalwrite", method=RequestMethod.GET)
	public String getApprovalWrite(HttpSession session) {
		log.info("실행");
		
		return "approval/approvalwrite";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/approvalwrite", method=RequestMethod.POST)
	public String postApprovalWrite(@RequestParam("document") String document, @RequestParam("docTempYn") String docTempYn, DocumentContent documentContent) {
		log.info("저장 하려는 HTML이 존재하는가:" + !(document.isEmpty()));
		
		int result = documentService.saveDraft(document, documentContent, docTempYn);
		
		log.info("저장 결과" + result);
		return "redirect:/approval/draftdocument";
	}
	
	//주소록 화면 요청
	@RequestMapping(value = "/organization", method=RequestMethod.GET)
	public String organization(Model model) {
		log.info("실행");
		
		organizations = documentService.getOrganization();
		organizationsMap = new HashMap<Integer , List<Organization>>();
		
		for (Organization organization : organizations) {
			int depId = organization.getDepId();
			
			List<Organization> list = organizationsMap.getOrDefault(depId, new ArrayList<Organization>());
			
			list.add(organization);
			
			organizationsMap.put(depId, list);
		}
		
		Set<Integer> keySet = organizationsMap.keySet();
		
		model.addAttribute("organizationsMapKeySet", keySet);
		model.addAttribute("organizationsMap", organizationsMap);
		
		for (Integer key : keySet) {
			log.info("부서 Id: " + key);
			log.info("부서 목록: " + organizationsMap.get(key));
		}
		return "approval/organization";
	}
	
	//결재 문서 자세히 보기
	@RequestMapping(value = "/viewdetail/{docId}", method=RequestMethod.GET)
	public String getApprovalDetail(@PathVariable String docId, HttpSession session, Model model) {
		log.info("문서 번호: " + docId);
		
		document = documentService.readDocument(docId);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		approvalLines = approvalLineService.getApprovalLines(docId);
		
		for(ApprovalLine approvalLine : approvalLines) {
			if (empId.equals(approvalLine.getEmpId())) {
				model.addAttribute("reader", approvalLine);
			}
		}
		
		model.addAttribute("document", document);
		model.addAttribute("approvalLines", approvalLines);
		
		log.info("문서 정보: " + document);
		for (ApprovalLine approvalLine : approvalLines) {
			if (!empId.equals(approvalLine.getEmpId())) {
				log.info("결재자 정보: " + approvalLine);
			}
			else {
				log.info("현재 문서를 읽는 결재자 정보: " + approvalLine);
			}
		}
		return "approval/viewdetail";
	}

	//결재 문서 내용 요청
	@RequestMapping(value = "/viewdetail/{docId}/documentdetail", method=RequestMethod.GET)
	public @ResponseBody Document getDocumentDetail(@PathVariable String docId) {
		log.info("문서 번호: " + docId);
		
		document = documentService.readDocument(docId);
		
		log.info("보여줄 HTML이 비었는가: " + "".equals(document.getDocContent()));
		return document;
	}
	
	//결재 문서 승인 또는 반려 요청
	@RequestMapping(value = "/viewdetail/{docId}", method=RequestMethod.POST)
	public String postApprovalDetail(@RequestParam("aprvLineState") String state, @RequestParam("aprvLineOpinion") String opinion, @PathVariable("docId") String docId, HttpSession session, Model model) {
		log.info("문서 번호: " + docId);
		log.info("상태: " + state);
		log.info("의견: " + opinion);

		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		boolean result = documentService.processApprovalRequest(state, opinion, docId, empId);
		
		log.info("요청 처리에 성공 했는가: " + result);
		return "redirect:/approval/viewdetail/" + docId;
	}
	
	
	//결재문서 열람 상태 변경 요청
	@RequestMapping(value = "/viewdetail/{docId}/open")
	public void openDocument(String state, @PathVariable("docId") String docId, HttpSession session) {
		log.info("문서 번호: " + docId);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		boolean result = documentService.processApprovalRequest(state, null, docId, empId);
		
		log.info("요청 처리에 성공했는가: " + result);
	}
	
	//반려 의견 작성 화면 요청
	@RequestMapping(value = "/opinion/{approvalLineState}", method=RequestMethod.GET)
	public String writeOpinion(@PathVariable("approvalLineState") String approvalLineState, Model model) {
		log.info("문서 상태: " + approvalLineState);
		
		if ("approve".equals(approvalLineState)) {
			model.addAttribute("approvalLineState", "승인");
			return "approval/opinion";
		}
		else if ("return".equals(approvalLineState)){
			model.addAttribute("approvalLineState", "반려");
			return "approval/opinion";
		}
		else if ("retrieve".equals(approvalLineState)){
			model.addAttribute("approvalLineState", "회수");
			return "approval/retrieve";
		}
		else {
			return "home";
		}
	}
}
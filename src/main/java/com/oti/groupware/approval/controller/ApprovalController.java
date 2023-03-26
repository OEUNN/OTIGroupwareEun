package com.oti.groupware.approval.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oti.groupware.approval.component.QueryHandler;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.ApprovalLines;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.dto.SearchQuery;
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
	
	@Autowired
	QueryHandler queryHandler;

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
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/draftdocument";
	}
	
	//열람문서함
	@RequestMapping(value="/takepartindocument", method=RequestMethod.GET)
	public String getTakePartInDocumentList(HttpSession session, Model model) {
		return getTakePartInDocumentList(1, session, model);
	}
	
	//열람문서함
	@RequestMapping(value="/takepartindocument/{pageNo}", method=RequestMethod.GET)
	public String getTakePartInDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getTakePartInDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/takepartindocument";
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
		
		documents = documentService.getPendedDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
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
	public String getReturnedDocumentList(HttpSession session, Model model) {
		log.info("실행");
		
		return getReturnedDocumentList(1, session, model);
	}
	
	//반려/회수함
	@RequestMapping(value = "/returneddocument/{pageNo}", method=RequestMethod.GET)
	public String getReturnedDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("페이지 번호: " + pageNo);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getReturnedDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
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
	public String getTempDocumentList(HttpSession session, Model model) {
		log.info("실행");
		
		return getTempDocumentList(1, session, model);
	}
	
	//임시저장함
	@RequestMapping(value = "/tempdocument/{pageNo}", method=RequestMethod.GET)
	public String getTempDocumentList(@PathVariable int pageNo, HttpSession session, Model model) {
		log.info("실행");
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		documents = documentService.getTempDocumentList(pageNo, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		
		return "approval/tempdocument";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/documentwrite", method=RequestMethod.GET)
	public String getApprovalWrite(HttpSession session) {
		log.info("실행");
		
		return "approval/approvalwrite";
	}
	
	//결재 문서 작성 화면
	@RequestMapping(value = "/documentwrite/{docId}", method=RequestMethod.GET)
	public String getApprovalWrite(@PathVariable("docId") String docId, HttpSession session, Model model) {
		log.info("문서번호: " + docId);
		
		document = documentService.readDocument(docId);
		approvalLines = approvalLineService.getApprovalLines(docId);
		
		model.addAttribute("document", document);
		model.addAttribute("approvalLines", approvalLines);

		return "approval/approvalwrite";
	}
	
	//결재 문서 저장
	@RequestMapping(value = "/documentwrite", method=RequestMethod.POST)
	public String postApprovalWrite(ApprovalLines approvalLines, DocumentContent documentContent, @RequestParam("files") MultipartFile[] multipartFiles) throws IOException {
		log.info("받음:" + documentContent);
		log.info(approvalLines);
		Jsoup.clean(documentContent.getDocContent(), Safelist.none());
		document = new Document();
		document.setDocId(documentContent.getDocId());
		document.setDocState(documentContent.getDocState());
		document.setDocTempYn(documentContent.getDocTempYn());
		document.setDocTitle(documentContent.getDocTitle());
		document.setDocContent(documentContent.getDocContent());
		document.setDocType(documentContent.getDocType());
		
		documentService.saveDocument(approvalLines, document, multipartFiles);
		
		if ("N".equals(document.getDocTempYn())) {
			return "redirect:/approval/draftdocument";
		}
		else {
			return "redirect:/approval/tempdocument";
		}
	}
	
	//결재 문서 업데이트(같은 문서를 임시저장 2번 한 경우)
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String postApprovalUpdate(ApprovalLines approvalLines, DocumentContent documentContent, @RequestParam("files") MultipartFile[] multipartFiles) throws IOException {
		log.info("받음:" + documentContent);
		log.info(approvalLines);
		
		document = new Document();
		document.setDocId(documentContent.getDocId());
		document.setDocState(documentContent.getDocState());
		document.setDocTempYn(documentContent.getDocTempYn());
		document.setDocTitle(documentContent.getDocTitle());
		document.setDocContent(documentContent.getDocContent());
		document.setDocType(documentContent.getDocType());
		
		documentService.updateDocument(approvalLines, document, multipartFiles);
		
		if ("N".equals(document.getDocTempYn())) {
			return "redirect:/approval/draftdocument";
		}
		else {
			return "redirect:/approval/tempdocument";
		}
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
	public ResponseEntity<Document> getDocumentDetail(@PathVariable String docId) {
		log.info("문서 번호: " + docId);
		
		if (!("".equals(docId)) && !(docId.isEmpty())) {
			document = documentService.readDocument(docId);
			return new ResponseEntity<Document>(document, new HttpHeaders(), HttpStatus.OK);
		}
		else {
			return new ResponseEntity<Document>(document, new HttpHeaders(), HttpStatus.NOT_FOUND);
		}
	}
	
	//결재 문서 결재선 요청
	@RequestMapping(value = "/viewdetail/{docId}/approvallinedetail", method=RequestMethod.GET)
	public ResponseEntity<List<ApprovalLine>> getApprovalLineDetail(@PathVariable String docId) {
		log.info("문서 번호: " + docId);
		
		if (!("".equals(docId)) && !(docId.isEmpty())) {
			approvalLines = approvalLineService.getApprovalLines(docId);
			return new ResponseEntity<List<ApprovalLine>>(approvalLines, new HttpHeaders(), HttpStatus.OK);
		}
		else {
			return new ResponseEntity<List<ApprovalLine>>(approvalLines, new HttpHeaders(), HttpStatus.NOT_FOUND);
		}
	}
	
	//첨부파일 다운로드
	@RequestMapping(value ="/filedownload/{docFileId}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getDocumentFile(@PathVariable int docFileId) throws UnsupportedEncodingException {
		DocumentFile documentFile = documentService.downloadDocumentFile(docFileId);
		HttpHeaders headers = new HttpHeaders();
		String[] mtypes = documentFile.getDocFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(documentFile.getDocFileLength());
		headers.setContentDispositionFormData("attachment", URLEncoder.encode(documentFile.getDocFileName(), "UTF-8"));
		return new ResponseEntity<byte[]>(documentFile.getDocFileData(), headers, HttpStatus.OK);
	}
	
	//결재 문서 승인 또는 반려 요청
	@RequestMapping(value = "/viewdetail/{docId}", method=RequestMethod.POST)
	public String postApprovalState(@RequestParam("aprvLineState") String state, @RequestParam("aprvLineOpinion") String opinion, @RequestParam("attached") boolean attached, @RequestParam("docType") String docType, @PathVariable("docId") String docId, HttpSession session, Model model) {
		log.info("문서 번호: " + docId);
		log.info("상태: " + state);
		log.info("의견이 있는가: " + attached);
		log.info("의견: " + opinion);
		
		boolean result = false;
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		
		if ("승인".equals(state)) {
			if (attached) {
				result = documentService.handleApproveRequest(state, opinion, docId, empId, docType);
			}
			else {
				result = documentService.handleApproveRequest(state, null, docId, empId, docType);
			}
		}
		else if ("반려".equals(state)) {
			result = documentService.handleReturnRequest(state, opinion, docId, empId);
		}
		else if ("회수".equals(state)) {
			result = documentService.handleRetrieveRequest(state, docId, empId);
		}
		else {
			return "home";
		}
		
		log.info("요청 처리에 성공 했는가: " + result);
		if ("회수".equals(state)) {
			return "redirect:/approval/returneddocument";
		}
		else {
			return "redirect:/approval/viewdetail/" + docId;
		}
	}
	
	
	//결재문서 열람 상태 변경 요청
	@RequestMapping(value = "/viewdetail/{docId}/open")
	public void openDocument(String state, @PathVariable("docId") String docId, HttpSession session) {
		log.info("문서 번호: " + docId);
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		
		boolean result = documentService.handleOpenRequest(state, docId, empId);
		
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
	
	//selectbox 삭제 및 회수
	@RequestMapping(value = "/selected", method=RequestMethod.POST)
	public String handleSelected(String docType, String type, @RequestParam("docId") List<String> docId, HttpServletRequest httpServletRequest, HttpSession session, RedirectAttributes redirectAttributes) {
		log.info("문서 목록: " + docId);
		
		String result;
		if ("삭제".equals(type) && type != null) {
			int resultCount = 0;
			
			for(String docIdElement : docId) {
				log.info("문서 번호: " + docIdElement);
				resultCount += documentService.deleteDocument(docIdElement);
			}
			
			if (resultCount == 0) {
				result = "unchanged";
			}
			else {
				result = "changed";
			}
			
			redirectAttributes.addFlashAttribute("result", result);
			redirectAttributes.addFlashAttribute("resultCount", resultCount);
			redirectAttributes.addFlashAttribute("type", type);
			
			return "redirect:/approval/" + docType + "document";
		}
		
		else if("회수".equals(type) && type != null) {
			String empId = ((Employee)session.getAttribute("employee")).getEmpId();
			int resultCount = 0;
			
			for(String docIdElement : docId) {
				log.info("문서 번호: " + docIdElement);
				if (documentService.handleRetrieveRequest("회수", docIdElement, empId)) {
					resultCount++;
				}
			}
			
			if (resultCount == 0) {
				result = "unchanged";
			}
			else {
				result = "changed";
			}
			
			redirectAttributes.addFlashAttribute("result", result);
			redirectAttributes.addFlashAttribute("resultCount", resultCount);
			redirectAttributes.addFlashAttribute("type", type);
			
			return "redirect:/approval/" + docType + "document";
		}
		
		else {
			return "redirect:/approval/" + docType + "document";
		}
	}
	
	
	//기안함 검색
	@RequestMapping(value = "/draftdocument/search", method=RequestMethod.GET)
	public String getDraftDocumentListByQuery(@ModelAttribute SearchQuery searchQuery, @RequestParam("searchBar") String searchBar, HttpSession session, Model model) {
		log.info("검색 질의: " + searchQuery);
		
		if (searchQuery.getDocTitle() == null || searchQuery.getDocTitle().isEmpty()) {
			if (searchBar != null && !searchBar.isEmpty()) {
				searchQuery.setDocTitle(searchBar);
			}	
		}
		
		if (searchQuery.getPageNo() <= 0) {
			searchQuery.setPageNo(1);
		}
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		queryHandler.appendTimeToReportDate(searchQuery);
		queryHandler.appendTimeToCompleteDate(searchQuery);
		
		documents = documentService.getDraftDocumentListByQuery(searchQuery, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		queryHandler.deleteTimeFromReportDate(searchQuery);
		queryHandler.deleteTimeFromCompleteDate(searchQuery);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), searchQuery.getPageNo());
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("searchQuery", searchQuery);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/draftdocument";
	}
	
	//열람문서함 검색
	@RequestMapping(value = "/takepartindocument/search", method=RequestMethod.GET)
	public String getCompletedDocumentListByQuery(@ModelAttribute SearchQuery searchQuery, @RequestParam("searchBar") String searchBar, HttpSession session, Model model) {
		log.info("검색 질의: " + searchQuery);
		
		if (searchQuery.getDocTitle() == null || searchQuery.getDocTitle().isEmpty()) {
			if (searchBar != null && !searchBar.isEmpty()) {
				searchQuery.setDocTitle(searchBar);
			}	
		}
		
		if (searchQuery.getPageNo() <= 0) {
			searchQuery.setPageNo(1);
		}
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		queryHandler.appendTimeToReportDate(searchQuery);
		queryHandler.appendTimeToCompleteDate(searchQuery);
		
		documents = documentService.getTakePartInDocumentListByQuery(searchQuery, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		queryHandler.deleteTimeFromReportDate(searchQuery);
		queryHandler.deleteTimeFromCompleteDate(searchQuery);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), searchQuery.getPageNo());
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("searchQuery", searchQuery);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/takepartindocument";
	}
	
	//결재하기 검색
	@RequestMapping(value = "/pendeddocument/search", method=RequestMethod.GET)
	public String getPendedDocumentListByQuery(@ModelAttribute SearchQuery searchQuery, @RequestParam("searchBar") String searchBar, HttpSession session, Model model) {
		log.info("검색 질의: " + searchQuery);
		
		if (searchQuery.getDocTitle() == null || searchQuery.getDocTitle().isEmpty()) {
			if (searchBar != null && !searchBar.isEmpty()) {
				searchQuery.setDocTitle(searchBar);
			}	
		}
		
		if (searchQuery.getPageNo() <= 0) {
			searchQuery.setPageNo(1);
		}
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		queryHandler.appendTimeToReportDate(searchQuery);
		queryHandler.appendTimeToCompleteDate(searchQuery);
		
		documents = documentService.getPendedDocumentListByQuery(searchQuery, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		queryHandler.deleteTimeFromReportDate(searchQuery);
		queryHandler.deleteTimeFromCompleteDate(searchQuery);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), searchQuery.getPageNo());
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("searchQuery", searchQuery);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/pendeddocument";
	}
	
	//반려 및 회수함 검색
	@RequestMapping(value = "/returneddocument/search", method=RequestMethod.GET)
	public String getReturnedDocumentListByQuery(@ModelAttribute SearchQuery searchQuery, @RequestParam("searchBar") String searchBar, HttpSession session, Model model) {
		log.info("검색 질의: " + searchQuery);
		
		if (searchQuery.getDocTitle() == null || searchQuery.getDocTitle().isEmpty()) {
			if (searchBar != null && !searchBar.isEmpty()) {
				searchQuery.setDocTitle(searchBar);
			}	
		}
		
		if (searchQuery.getPageNo() <= 0) {
			searchQuery.setPageNo(1);
		}
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		queryHandler.appendTimeToReportDate(searchQuery);
		
		documents = documentService.getReturnedDocumentListByQuery(searchQuery, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		queryHandler.deleteTimeFromReportDate(searchQuery);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), searchQuery.getPageNo());
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("searchQuery", searchQuery);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/returneddocument";
	}
	
	//임시저장함 검색
	@RequestMapping(value = "/tempdocument/search", method=RequestMethod.GET)
	public String getTempDocumentListByQuery(@ModelAttribute SearchQuery searchQuery, @RequestParam("searchBar") String searchBar, HttpSession session, Model model) {
		log.info("검색 질의: " + searchQuery);
		
		if (searchQuery.getDocTitle() == null || searchQuery.getDocTitle().isEmpty()) {
			if (searchBar != null && !searchBar.isEmpty()) {
				searchQuery.setDocTitle(searchBar);
			}	
		}
		
		if (searchQuery.getPageNo() <= 0) {
			searchQuery.setPageNo(1);
		}
		
		String empId = ((Employee)session.getAttribute("employee")).getEmpId();
		pager = new Pager();
		
		queryHandler.appendTimeToWriteDate(searchQuery);
		
		documents = documentService.getTempDocumentListByQuery(searchQuery, pager, empId);
		approvalLinesList = approvalLineService.getApprovalLinesList(documents);
		
		queryHandler.deleteTimeFromWriteDate(searchQuery);
		
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), searchQuery.getPageNo());
		
		model.addAttribute("pager", returnPager);
		model.addAttribute("searchQuery", searchQuery);
		model.addAttribute("documents", documents);
		model.addAttribute("approvalLinesList", approvalLinesList);
		if (documents != null) {
			model.addAttribute("documentsSize", documents.size());
		}
		else {
			model.addAttribute("documentsSize", 0);
		}
		
		for (Document document : documents) {
			log.info("문서 목록: " + document.getDocTitle());
		}
		for (List<ApprovalLine> approvalLines : approvalLinesList) {
			log.info("결재자 목록: " + approvalLines);
		}
		return "approval/tempdocument";
	}
}
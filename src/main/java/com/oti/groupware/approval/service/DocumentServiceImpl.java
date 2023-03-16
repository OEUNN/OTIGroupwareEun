package com.oti.groupware.approval.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.approval.component.ApprovalHandler;
import com.oti.groupware.approval.component.DocumentContentProvider;
import com.oti.groupware.approval.component.DocumentParser;
import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dao.DocumentDAO;
import com.oti.groupware.approval.dao.DocumentFileDAO;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.dto.SearchQuery;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;
import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.mail.dto.EmployeeInfo;
@Service
public class DocumentServiceImpl implements DocumentService {
	Document document;
	ApprovalLine approvalLine;
	List<ApprovalLine> approvalLines;
	List<Organization> employees;
	DocumentFile documentFile;
	
	/*
	 * Request로 들어온 HTML을 Parse
	 * - Document getParsedDocument()
	 */
	@Autowired
	DocumentParser documentParser;
	
	/*
	 * Document Type에 따라 document의 Id와 Retention Period를 제공
	 * -String getDocumentIdByDocumentType()
	 * -String getDocumentRetentionPeriodByDocumentType()
	 */
	@Autowired
	DocumentContentProvider documentContentProvider;
	
	/*
	 * Request로 들어온 요청에 따라서 결재를 처리하기 위한 Handler
	 * int process() (0: 처리하지 못함, 1: 처리)
	 */
	@Autowired
	ApprovalHandler approvalHandler;

	@Autowired
	DocumentDAO documentDAO;
	
	@Autowired
	ApprovalLineDAO approvalLineDAO;
	
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
	DocumentFileDAO documentFileDAO;
	
	@Override
	@Transactional
	public Document readDocument(String docId) {
		document = documentDAO.getDocumentById(docId);
		document.setDocumentFiles(documentFileDAO.getDocumentFilesById(docId));
		return document;
	}
	
	@Override
	public DocumentFile downloadDocumentFile(int docFileId) {
		return documentFileDAO.getDocumentFileById(docFileId);
	}
	
	@Override
	public void applyDocumentContentToHTML(Document document, String html, String drafterId, DocumentContent documentContent) {
		EmployeeInfo drafter = employeeDAO.mailInfo(drafterId);
		document.setDocContent(documentParser.initializetHTML(html, document, documentContent, drafter));
	}
	
	//기안 문서를 저장
	@Override
	@Transactional
	public void saveDraftDocument(String html, DocumentContent documentContent, String docTempYn, MultipartFile[] multipartFiles) throws IOException {
		documentParser.setParsingTarget(html);
		
		document.setEmpId(documentContent.getDrafterId());
		document.setDocContent(html);
		document.setDocType(documentParser.getTokenById("documentType"));
		document.setDocTitle(documentParser.getTokenById("documentTitle"));
		document.setDocMaxStep(documentParser.getTokenSizeById("formApprovalState"));
		document.setDocReportDate(Timestamp.valueOf(LocalDateTime.now()));
		if (document.getDocWriteDate() == null) {
			document.setDocWriteDate(Timestamp.valueOf(LocalDateTime.now()));
		}
		document.setDocState("결재중");
		document.setDocTempYn("N");
		
		//결재문서는 타입에 따라 보관기간, 아이디를 받음
		String documentType = document.getDocType();
		document.setDocRetentionPeriod(documentContentProvider.getDocumentRetentionPeriodByDocumentType(documentType));
		document.setDocId(documentContentProvider.getDocumentIdByDocumentType(documentType, "N"));
		//html도 바꿔야함(applyDocumentContentToHTML)
		documentDAO.insertDraftDocument(document);
		
		String docId = document.getDocId();
		if (multipartFiles != null && multipartFiles.length > 0) {
			for (MultipartFile multipartFile : multipartFiles) {
				if (!("".equals(multipartFile.getOriginalFilename())) && multipartFile.getOriginalFilename() != null) {
					documentFile = new DocumentFile();
					documentFile.setDocId(docId);
					documentFile.setDocFileData(multipartFile.getBytes());
					documentFile.setDocFileLength(multipartFile.getSize());
					documentFile.setDocFileName(multipartFile.getOriginalFilename());
					documentFile.setDocFileType(multipartFile.getContentType());
					documentFileDAO.insertDocumentFile(documentFile);
				}
			}
		}

		approvalLine = new ApprovalLine();
		approvalLine.setEmpId(documentContent.getDrafterId());
		approvalLine.setDocId(document.getDocId());
		approvalLine.setAprvLineState("승인");
		approvalLine.setAprvLineOrder(0);
		approvalLine.setAprvLineRole("기안");
		approvalLineDAO.defaultInsertApprovalLine(approvalLine);
		
		int approvalLineLength = documentContent.getApprovalId().length;			
		for (int i = 0; i < approvalLineLength; i++) {
			approvalLine = new ApprovalLine();
			approvalLine.setEmpId(documentContent.getApprovalId()[i]);
			approvalLine.setDocId(document.getDocId());
			approvalLine.setAprvLineState(documentContent.getApprovalState()[i]);
			approvalLine.setAprvLineOrder(documentContent.getApprovalOrder()[i]);
			approvalLine.setAprvLineRole("결재");
			approvalLineDAO.defaultInsertApprovalLine(approvalLine);
		}
	}
	
	//임시상태의 문서를 저장
	@Override
	@Transactional
	public void saveTempDocument(String html, DocumentContent documentContent, String docTempYn, MultipartFile[] multipartFiles) throws IOException {
		documentParser.setParsingTarget(html);
		
		document.setEmpId(documentContent.getDrafterId());
		document.setDocContent(html);
		document.setDocType(documentParser.getTokenById("documentType"));
		document.setDocTitle(documentParser.getTokenById("documentTitle"));
		document.setDocWriteDate(Timestamp.valueOf(LocalDateTime.now()));
		document.setDocTempYn(docTempYn);
		
		String documentType = document.getDocType();
		
		//임시 상태의 문서를 기안
		if ("N".equals(docTempYn)) {
			document.setDocMaxStep(documentParser.getTokenSizeById("formApprovalState"));
			document.setDocReportDate(Timestamp.valueOf(LocalDateTime.now()));
			document.setDocRetentionPeriod(documentContentProvider.getDocumentRetentionPeriodByDocumentType(documentType));
			document.setDocId(documentContentProvider.getDocumentIdByDocumentType(documentType, docTempYn));
			document.setDocState("결재중");
			documentDAO.insertTempDocument(document);
		}
		//임시 상태의 문서를 다시 임시저장 -> update
		//update 시 DB 상에 있는 결재선과 첨부파일 초기화
		else {
			//html도 바꿔야함(applyDocumentContentToHTML)
			documentDAO.updateDocument(document);
			approvalLineDAO.deleteApprovalLineByDocId(document.getDocId());
			documentFileDAO.deleteDocumentFile(document.getDocId());
		}
		
		String docId = document.getDocId();
		if (multipartFiles != null && multipartFiles.length > 0) {
			for (MultipartFile multipartFile : multipartFiles) {
				if (!("".equals(multipartFile.getOriginalFilename())) && multipartFile.getOriginalFilename() != null) {
					documentFile = new DocumentFile();
					documentFile.setDocId(docId);
					documentFile.setDocFileData(multipartFile.getBytes());
					documentFile.setDocFileLength(multipartFile.getSize());
					documentFile.setDocFileName(multipartFile.getOriginalFilename());
					documentFile.setDocFileType(multipartFile.getContentType());
					documentFileDAO.insertDocumentFile(documentFile);
				}
			}
		}

		approvalLine = new ApprovalLine();
		approvalLine.setEmpId(documentContent.getDrafterId());
		approvalLine.setDocId(document.getDocId());
		approvalLine.setAprvLineState("승인");
		approvalLine.setAprvLineOrder(0);
		approvalLine.setAprvLineRole("기안");
		approvalLineDAO.defaultInsertApprovalLine(approvalLine);
		
		//임시 상태의 문서는 결재선이 없을 수 있음
		if ("Y".equals(docTempYn)) {
			int approvalLineLength = documentContent.getApprovalId().length;			
			for (int i = 0; i < approvalLineLength; i++) {
				approvalLine = new ApprovalLine();
				approvalLine.setEmpId(documentContent.getApprovalId()[i]);
				approvalLine.setDocId(document.getDocId());
				approvalLine.setAprvLineState(documentContent.getApprovalState()[i]);
				approvalLine.setAprvLineOrder(documentContent.getApprovalOrder()[i]);
				approvalLine.setAprvLineRole("결재");
				
				approvalLineDAO.defaultInsertApprovalLine(approvalLine);
			}
		}
	}
	
	//승인 처리
	@Override
	@Transactional
	public boolean handleApproveRequest(String state, String opinion, String docId, String empId) {
		document = documentDAO.getDocumentById(docId);
		approvalLine = approvalLineDAO.getApprovalLineById(empId, docId);
		approvalHandler.setDocument(document);
		approvalHandler.setApprovalLine(approvalLine);
		
		int documentMaxStep = document.getDocMaxStep();
		
		boolean isApproved = approvalHandler.handleApprove(state, opinion, documentMaxStep);
		
		if (isApproved) {
			document = approvalHandler.getDocument();
			approvalLine = approvalHandler.getApprovalLine();
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			
			return true;
		}
		else {
			return false;
		}
	}
	
	//반려 처리
	@Override
	@Transactional
	public boolean handleReturnRequest(String state, String opinion, String docId, String empId) {
		document = documentDAO.getDocumentById(docId);
		approvalLine = approvalLineDAO.getApprovalLineById(empId, docId);
		approvalHandler.setDocument(document);
		approvalHandler.setApprovalLine(approvalLine);
		
		boolean isReturned = approvalHandler.handleReturn(state, opinion);
		
		if (isReturned) {
			document = approvalHandler.getDocument();
			approvalLine = approvalHandler.getApprovalLine();
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			
			return true;
		}
		else {
			return false;
		}
	}
	
	//회수 처리
	@Override
	@Transactional
	public boolean handleRetrieveRequest(String state, String docId, String empId) {
		document = documentDAO.getDocumentById(docId);
		approvalLine = approvalLineDAO.getApprovalLineById(empId, docId);
		approvalLines = approvalLineDAO.getApprovalLinesBydocId(docId);
		approvalHandler.setDocument(document);
		approvalHandler.setApprovalLine(approvalLine);
		approvalHandler.setApprovalLines(approvalLines);
		
		boolean isRetrieved = approvalHandler.handleRetrieve(state);
		
		if (isRetrieved) {
			document = approvalHandler.getDocument();
			approvalLine = approvalHandler.getApprovalLine();
			approvalLines = approvalHandler.getApprovalLines();
			for(ApprovalLine approvalLinesElement : approvalLines) {
				if (!"기안".equals(approvalLinesElement.getAprvLineRole())) {
					document.setDocContent(documentParser.setHTML(document.getDocContent(), approvalLinesElement)); 
				}
			}
			
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			approvalLines = approvalHandler.getApprovalLines();
			for (ApprovalLine approvalLine : approvalLines) {
				approvalLineDAO.updateApprovalLine(approvalLine);
			}
			
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	@Transactional
	public boolean handleOpenRequest(String state, String docId, String empId) {
		boolean isOpened = approvalHandler.handleOpen();
		
		if (isOpened) {
			document = approvalHandler.getDocument();
			approvalLine = approvalHandler.getApprovalLine();
			
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	@Transactional
	public int deleteDocument(List<String> docIds) {
		int result = 0;
		for (String docId : docIds) {
			result += documentDAO.deleteDocument(docId);
		}
		return result;
	}
	
	
	//목록 조회 메소드들
	@Override
	@Transactional
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getDraftDocumentCount(empId);
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getDraftDocumentList(pager, empId);
	}
	
	@Override
	@Transactional
	public List<Document> getPendedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getPendedDocumentCount(empId);
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getPendedDocumentList(pager, empId);
	}
	
	@Override
	@Transactional
	public List<Document> getReturnedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getReturnedDocumentCount(empId);
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getReturnedDocumentList(pager, empId);
	}

	@Override
	@Transactional
	public List<Document> getCompletedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getCompletedDocumentCount(empId);
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getCompletedDocumentList(pager, empId);
	}

	@Override
	@Transactional
	public List<Document> getTempDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getTempDocumentCount(empId);
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getTempDocumentList(pager, empId);
	}
	
	
	//검색
	@Override
	@Transactional
	public List<Document> getDraftDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId) {
		int totalRows = documentDAO.getDraftDocumentCountByQuery(empId, searchQuery);
		int pageNo = searchQuery.getPageNo();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getDraftDocumentListByQuery(pager, empId, searchQuery);
	}
	
	@Override
	@Transactional
	public List<Document> getCompletedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId) {
		int totalRows = documentDAO.getCompletedDocumentCountByQuery(empId, searchQuery);
		int pageNo = searchQuery.getPageNo();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getCompletedDocumentListByQuery(pager, empId, searchQuery);
	}

	@Override
	@Transactional
	public List<Document> getPendedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId) {
		int totalRows = documentDAO.getPendedDocumentCountByQuery(empId, searchQuery);
		int pageNo = searchQuery.getPageNo();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getPendedDocumentListByQuery(pager, empId, searchQuery);
	}

	@Override
	@Transactional
	public List<Document> getReturnedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId) {
		int totalRows = documentDAO.getReturnedDocumentCountByQuery(empId, searchQuery);
		int pageNo = searchQuery.getPageNo();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getReturnedDocumentListByQuery(pager, empId, searchQuery);
	}

	@Override
	@Transactional
	public List<Document> getTempDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId) {
		int totalRows = documentDAO.getTempDocumentCountByQuery(empId, searchQuery);
		int pageNo = searchQuery.getPageNo();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(10);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return documentDAO.getTempDocumentListByQuery(pager, empId, searchQuery);
	}
	
	//임시
	@Override
	public List<Organization> getOrganization() {
		employees = approvalLineDAO.getOrganization();
		return employees;
	}

}

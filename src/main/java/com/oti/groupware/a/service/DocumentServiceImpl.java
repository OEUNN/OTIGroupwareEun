package com.oti.groupware.a.service;

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

import lombok.extern.log4j.Log4j2;
@Log4j2
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
	@Transactional
	public int saveDocument(String html, DocumentContent documentContent, String docTempYn, String drafterId, MultipartFile[] multipartFiles) throws IOException {
		if (html != null) {
			documentParser.parseDocument(html, documentContent.getDrafterId());
			document = documentParser.getParsedDocument();
			document.setDocTempYn(docTempYn);
			
			String documentType = document.getDocType();

			String documentRetentionPeriod = documentContentProvider.getDocumentRetentionPeriodByDocumentType(documentType);
			document.setDocRetentionPeriod(documentRetentionPeriod);
			if (document.getDocReportDate() == null) {
				document.setDocReportDate(Timestamp.valueOf(LocalDateTime.now()));
			}
			if (document.getDocWriteDate() == null) {
				document.setDocWriteDate(Timestamp.valueOf(LocalDateTime.now()));
			}
			
			EmployeeInfo drafter = employeeDAO.mailInfo(drafterId);
			
			//첫 상신 또는 첫 임시저장
			if ("공란".equals(document.getDocId())) {
				
				String documentId = documentContentProvider.getDocumentIdByDocumentType(documentType);
				document.setDocId(documentId);
				document.setDocContent(documentParser.initializetHTML(html, document, documentContent, drafter));
				documentDAO.insertDraft(document);
				
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
			}
			else {
				document.setDocContent(documentParser.initializetHTML(html, document, documentContent, drafter));
				documentDAO.updateDocument(document);
				approvalLineDAO.deleteApprovalLineByDocId(document.getDocId());
				documentFileDAO.deleteDocumentFile(document.getDocId());
				
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
							documentFileDAO.updateDocumentFile(documentFile);
						}
					}
				}
			}

			approvalLine = new ApprovalLine();
			approvalLine.setEmpId(documentContent.getDrafterId());
			approvalLine.setDocId(document.getDocId());
			approvalLine.setAprvLineState("승인");
			approvalLine.setAprvLineOrder(0);
			approvalLine.setAprvLineRole("기안");
			
			approvalLineDAO.insertDraftApprovalLine(approvalLine);
			
			//임시저장 시 결재선이 없을 수 있음
			if (documentContent.getApprovalId() != null) {
				int approvalLineLength = documentContent.getApprovalId().length;			
				for (int i = 0; i < approvalLineLength; i++) {
					approvalLine = new ApprovalLine();
					approvalLine.setEmpId(documentContent.getApprovalId()[i]);
					approvalLine.setDocId(document.getDocId());
					approvalLine.setAprvLineState(documentContent.getApprovalState()[i]);
					approvalLine.setAprvLineOrder(documentContent.getApprovalOrder()[i]);
					approvalLine.setAprvLineRole("결재");
					
					approvalLineDAO.insertDraftApprovalLine(approvalLine);
				}
			}
			
		}
		else {
			System.out.println("html is null");
		}
		return 0;
	}
	
	@Override
	@Transactional
	public boolean handleApprovalRequest(String state, String opinion, String docId, String empId) {
		document = documentDAO.getDocumentById(docId);
		approvalLine = approvalLineDAO.getApprovalLineById(empId, docId);
		
		//회수하면 기안자를 제외한 모든 결재자의 상태를 초기화 해야함
		if ("회수".equals(state)) {
			approvalLines = approvalLineDAO.getApprovalLinesBydocId(docId);
			approvalHandler.setApprovalLines(approvalLines);
			log.info(approvalLines);
		}
		
		approvalHandler.setDocument(document);
		approvalHandler.setApprovalLine(approvalLine);
		
		int documentMaxStep = document.getDocMaxStep();
		
		boolean isProcessed = approvalHandler.process(state, opinion, documentMaxStep);
		
		if (isProcessed) {
			document = approvalHandler.getDocument();
			approvalLine = approvalHandler.getApprovalLine();
			
			if ("회수".equals(state)) {
				approvalLines = approvalHandler.getApprovalLines();
				
				for(ApprovalLine approvalLinesElement : approvalLines) {
					if (!"기안".equals(approvalLinesElement.getAprvLineRole())) {
						document.setDocContent(documentParser.setHTML(document.getDocContent(), approvalLinesElement)); 
					}
				}
			}
			
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			
			if ("회수".equals(state)) {
				approvalLines = approvalHandler.getApprovalLines();
				for (ApprovalLine approvalLine : approvalLines) {
					approvalLineDAO.updateApprovalLine(approvalLine);
				}
			}
			
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

package com.oti.groupware.approval.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.groupware.approval.ApprovalProcessor;
import com.oti.groupware.approval.DocumentContentProvider;
import com.oti.groupware.approval.DocumentParser;
import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dao.DocumentDAO;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;
import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dto.Employee;

import oracle.jdbc.logging.annotations.DisableTrace;

@Service
public class DocumentServiceImpl implements DocumentService {
	Document document;
	ApprovalLine approvalLine;
	List<ApprovalLine> approvalLines;
	List<Organization> employees;
	
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
	 * Request로 들어온 요청에 따라서 결재를 처리하기 위한 Processor
	 * int process() (0: 처리하지 못함, 1: 처리)
	 */
	@Autowired
	ApprovalProcessor approvalProcessor;

	@Autowired
	DocumentDAO documentDAO;
	
	@Autowired
	ApprovalLineDAO approvalLineDAO;
	
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public Document readDocument(String docId) {
		document = documentDAO.getDocumentById(docId);
		return document;
	}
	
	@Override
	@Transactional
	public int saveDocument(String html, DocumentContent documentContent, String docTempYn, String drafterId) {
		if (html != null) {
			documentParser.parseDocument(html, documentContent.getDrafterId());
			document = documentParser.getParsedDocument();
			document.setDocTempYn(docTempYn);
			
			String documentType = document.getDocType();

			String documentRetentionPeriod = documentContentProvider.getDocumentRetentionPeriodByDocumentType(documentType);
			document.setDocRetentionPeriod(documentRetentionPeriod);
			if (document.getDocReportDate() == null) {
				document.setDocReportDate(Date.valueOf(LocalDate.now()));
			}
			if (document.getDocWriteDate() == null) {
				document.setDocWriteDate(Date.valueOf(LocalDate.now()));
			}
			
			Employee drafter = employeeDAO.getEmployeeById(drafterId);
			
			if ("공란".equals(document.getDocId())) {
				String documentId = documentContentProvider.getDocumentIdByDocumentType(documentType);
				document.setDocId(documentId);
				//document.setDocContent(documentParser.setHTML(html, document, documentContent, drafter));
				documentDAO.insertDraft(document);
				
			}
			else {
				//document.setDocContent(documentParser.setHTML(html, document, documentContent, drafter));
				documentDAO.updateDocument(document);
				approvalLineDAO.deleteApprovalLineByDocId(document.getDocId());
			}

			approvalLine = new ApprovalLine();
			approvalLine.setEmpId(documentContent.getDrafterId());
			approvalLine.setDocId(document.getDocId());
			approvalLine.setAprvLineState("승인");
			approvalLine.setAprvLineOrder(0);
			approvalLine.setAprvLineRole("기안");
			
			approvalLineDAO.insertDraftApprovalLine(approvalLine);
			
			int approvalLineLength = documentContent.getApprovalId().length;			
			for (int i = 0; i < approvalLineLength; i++) {
				approvalLine = new ApprovalLine();
				approvalLine.setEmpId(documentContent.getApprovalId()[i]);
				approvalLine.setDocId(document.getDocId());
				approvalLine.setAprvLineState(documentContent.getApprovalState()[i]);
				approvalLine.setAprvLineOrder(documentContent.getApprovalOrder()[i]);
				approvalLine.setAprvLineRole("결재");
				
				//동적 Query로 최적화가 가능
				approvalLineDAO.insertDraftApprovalLine(approvalLine);
			}
		}
		else {
			System.out.println("html is null");
		}
		return 0;
	}

	
	@Override
	@Transactional
	public boolean processApprovalRequest(String state, String opinion, String docId, String empId) {
		document = documentDAO.getDocumentById(docId);
		approvalLine = approvalLineDAO.getApprovalLineById(empId, docId);
		if ("회수".equals(state)) {
			approvalLines = approvalLineDAO.getApprovalLinesBydocId(docId);
			approvalProcessor.setApprovalLines(approvalLines);
		}
		
		approvalProcessor.setDocument(document);
		approvalProcessor.setApprovalLine(approvalLine);
		
		int documentMaxStep = document.getDocMaxStep();
		
		boolean isProcessed = approvalProcessor.process(state, opinion, documentMaxStep);
		
		if (isProcessed) {
			document = approvalProcessor.getDocument();
			approvalLine = approvalProcessor.getApprovalLine();
			
			documentDAO.updateDocument(document);
			approvalLineDAO.updateApprovalLine(approvalLine);
			
			if ("회수".equals(state)) {
				approvalLines = approvalProcessor.getApprovalLines();
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

	
	
	
	
	//목록 조회 메소드들
	@Override
	@Transactional
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getDraftDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getDraftDocumentList(pager, empId);
	}
	
	@Override
	@Transactional
	public List<Document> getpendedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getPendedDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getPendedDocumentList(pager, empId);
	}
	
	@Override
	@Transactional
	public List<Document> getReturnedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getReturnedDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getReturnedDocumentList(pager, empId);
	}

	@Override
	@Transactional
	public List<Document> getCompletedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getCompletedDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getCompletedDocumentList(pager, empId);
	}

	@Override
	@Transactional
	public List<Document> getTempDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getTempDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getTempDocumentList(pager, empId);
	}
	
	@Override
	@Transactional
	public List<Document> getDraftDocumentListByState(int pageNo, Pager pager, String empId, String state) {
		int totalRows = documentDAO.getDraftDocumentCountByState(empId, state);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getDraftDocumentListByState(pager, empId, state);
	}
	
	/*
	 * 임시
	 */
	@Override
	public List<Organization> getOrganization() {
		employees = approvalLineDAO.getOrganization();
		return employees;
	}

}

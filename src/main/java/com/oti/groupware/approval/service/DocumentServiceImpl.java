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
	DocumentContentProvider documentContentSupplier;
	
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

	@Override
	@Transactional
	public int saveDraft(String html, DocumentContent documentContent) {
		if (html != null) {
			documentParser.ParseDraft(html, documentContent.getDrafterId());
			document = documentParser.getParsedDocument();
			
			String documentType = document.getDocType();
			String documentId = documentContentSupplier.getDocumentIdByDocumentType(documentType);
			String documentRetentionPeriod = documentContentSupplier.getDocumentRetentionPeriodByDocumentType(documentType);
			document.setDocId(documentId);
			document.setDocRetentionPeriod(documentRetentionPeriod);
			
			if (document.getDocWriteDate() == null) {
				document.setDocWriteDate(Date.valueOf(LocalDate.now()));
			}
			documentDAO.insertDraft(document);
			
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
	public Document readDocument(String docId) {
		document = documentDAO.getDocumentById(docId);
		return document;
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
	public List<Document> getCompletedDocumentList(int pageNo, String empId) {
		return null;
	}

	@Override
	public List<Document> getTempDocumentList(int pageNo, String empId) {
		return null;
	}

	@Override
	public List<Document> getReturnedDocumentList(int pageNo, String empId) {
		return null;
	}

	@Override
	@Transactional
	public List<Document> getpendedDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getPendedDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getPendedDocumentList(pager, empId);
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

package com.oti.groupware.approval.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.print.Doc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.groupware.approval.DocumentContentSupplier;
import com.oti.groupware.approval.DocumentParser;
import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dao.DocumentDAO;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	Document document;
	ApprovalLine approvalLine;
	List<Organization> employees;
	
	@Autowired
	DocumentParser documentParser;
	
	@Autowired
	DocumentContentSupplier documentContentSupplier;

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
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId) {
		int totalRows = documentDAO.getDraftDocumentCount(empId);
		pager = new Pager(10, 10, totalRows, pageNo);
		return documentDAO.getDraftDocumentList(pager, empId);
	}

	@Override
	public List<Document> getCompletedDocumentList(int pageNo, String empId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Document> getTempDocumentList(int pageNo, String empId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Document> getReturnedDocumentList(int pageNo, String empId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Document> getpendedDocumentList(int pageNo, String empId) {
		// TODO Auto-generated method stub
		return null;
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

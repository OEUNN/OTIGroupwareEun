package com.oti.groupware.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.groupware.approval.DocumentParser;
import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dao.DocumentDAO;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.common.dto.Organization;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	Document document;
	ApprovalLine approvalLine;
	List<ApprovalLine> approvalLines;
	List<Organization> employees;
	
	@Autowired
	DocumentParser documentParser;

	@Autowired
	DocumentDAO documentDAO;
	
	@Autowired
	ApprovalLineDAO approvalLineDAO;

	@Override
	@Transactional
	public int saveDraft(String html, String drafterId) {
		if (html != null) {
			documentParser.ParseDraft(html, drafterId);
			document = documentParser.getParsedDocument();
			approvalLines = documentParser.getParsedApprovalLines();
			
			documentDAO.insertDraft(document);
			for (ApprovalLine approvalLine : approvalLines) {
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
	public List<Document> getDraftDocumentList(int pageNo, String empId) {
		// TODO Auto-generated method stub
		return null;
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

package com.oti.groupware.approval.service;

import java.util.List;

import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.common.dto.Organization;

public interface ApprovalService {
	public int saveDraft(String html, String empId);
	public Document readDocument(String docId);
	
	public List<Document> getDraftDocumentList(int pageNo, String empId);
	public List<Document> getCompletedDocumentList(int pageNo, String empId);
	public List<Document> getTempDocumentList(int pageNo, String empId);
	public List<Document> getReturnedDocumentList(int pageNo, String empId);
	public List<Document> getpendedDocumentList(int pageNo, String empId);
	
	public List<Organization> getOrganization();
}
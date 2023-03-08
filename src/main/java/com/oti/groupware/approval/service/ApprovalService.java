package com.oti.groupware.approval.service;

import java.util.List;

import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;

public interface ApprovalService {
	public int saveDraft(String html, DocumentContent documentContent);
	public Document readDocument(String docId);
	
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getCompletedDocumentList(int pageNo, String empId);
	public List<Document> getTempDocumentList(int pageNo, String empId);
	public List<Document> getReturnedDocumentList(int pageNo, String empId);
	public List<Document> getpendedDocumentList(int pageNo, String empId);
	
	public List<Organization> getOrganization();
}
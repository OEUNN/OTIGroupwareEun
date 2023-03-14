package com.oti.groupware.approval.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.dto.SearchQuery;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;

public interface DocumentService {
	public Document readDocument(String docId);
	DocumentFile downloadDocumentFile(int docFileId);
	public int saveDocument(String html, DocumentContent documentContent, String docTempYn, String drafterId, MultipartFile[] multipartFiles) throws IOException;
	public boolean handleApprovalRequest(String state, String opinion, String docId, String empId);
	public int deleteDocument(List<String> docIds);
	
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getCompletedDocumentList(int pageNo, Pager pager,String empId);
	public List<Document> getPendedDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getReturnedDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getTempDocumentList(int pageNo, Pager pager, String empId);
	
	public List<Organization> getOrganization();

	List<Document> getDraftDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	List<Document> getCompletedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	List<Document> getPendedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	List<Document> getReturnedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	List<Document> getTempDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
}
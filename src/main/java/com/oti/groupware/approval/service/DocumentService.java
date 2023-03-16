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
	void applyDocumentContentToHTML(Document document, String html, String drafterId, DocumentContent documentContent);
	public void saveDraftDocument(String html, DocumentContent documentContent, String docTempYn, MultipartFile[] multipartFiles) throws IOException;
	public void saveTempDocument(String html, DocumentContent documentContent, String docTempYn, MultipartFile[] multipartFiles) throws IOException;
	public int deleteDocument(List<String> docIds);
	public boolean handleApproveRequest(String state, String opinion, String docId, String empId);
	public boolean handleReturnRequest(String state, String opinion, String docId, String empId);
	public boolean handleRetrieveRequest(String state, String docId, String empId);
	public boolean handleOpenRequest(String state, String docId, String empId);
	
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
package com.oti.groupware.approval.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.approval.dto.ApprovalLines;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.approval.dto.DocumentFile;
import com.oti.groupware.approval.dto.SearchQuery;
import com.oti.groupware.common.Pager;
import com.oti.groupware.common.dto.Organization;

public interface DocumentService {
	public Document readDocument(String docId);
	DocumentFile downloadDocumentFile(int docFileId);
	
	void saveDocument(ApprovalLines approvalLines, Document document, MultipartFile[] multipartFiles)
			throws IOException;
	void updateDocument(ApprovalLines approvalLines, Document document, MultipartFile[] multipartFiles)
			throws IOException;
	
	public int deleteDocument(List<String> docIds);

	public List<Organization> getOrganization();
	
	public boolean handleApproveRequest(String state, String opinion, String docId, String empId);
	public boolean handleReturnRequest(String state, String opinion, String docId, String empId);
	public boolean handleRetrieveRequest(String state, String docId, String empId);
	public boolean handleOpenRequest(String state, String docId, String empId);
	
	public List<Document> getDraftDocumentListForHome(int pageNo, Pager pager, String empId);
	public List<Document> getDraftDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getTakePartInDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getPendedDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getReturnedDocumentList(int pageNo, Pager pager, String empId);
	public List<Document> getTempDocumentList(int pageNo, Pager pager, String empId);
	
	public List<Document> getDraftDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	public List<Document> getCompletedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	public List<Document> getPendedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	public List<Document> getReturnedDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	public List<Document> getTempDocumentListByQuery(SearchQuery searchQuery, Pager pager, String empId);
	
}
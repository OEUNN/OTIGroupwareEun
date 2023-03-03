package com.oti.groupware.approval.dao;

import org.springframework.stereotype.Repository;

import com.oti.groupware.approval.dto.Document;

@Repository
public interface DocumentDAO {
	public Document getDocumentById(String docId);
	public void insertDocument(Document document);
	public void updateDocument(Document document);
	public void deleteDocument(String docId);
	
	public void insertDraft(Document draft);
}
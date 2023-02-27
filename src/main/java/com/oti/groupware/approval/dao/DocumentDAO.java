package com.oti.groupware.approval.dao;

import com.oti.groupware.approval.dto.Document;

public interface DocumentDAO {
	public Document getDocumentById(Long docId);
	public void insertDocument(Document document);
	public void updateDocument(Document document);
	public void deleteDocument(Long docId);
}
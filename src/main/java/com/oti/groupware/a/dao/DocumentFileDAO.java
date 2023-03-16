package com.oti.groupware.a.dao;

import java.util.List;

import com.oti.groupware.approval.dto.DocumentFile;

public interface DocumentFileDAO {
	public DocumentFile getDocumentFileById(int docFileId);
	public List<DocumentFile> getDocumentFilesById(String docId);
    public void insertDocumentFile(DocumentFile documentFile);
    public void updateDocumentFile(DocumentFile documentFile);
    public void deleteDocumentFile(String docId);
}

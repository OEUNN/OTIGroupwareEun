package com.oti.groupware.approval.dao;

import com.oti.groupware.approval.dto.DocumentFile;

public interface DocumentFileDAO {
	public DocumentFile getDocumentFileById(int docFileId);
    public void insertDocumentFile(DocumentFile documentFile);
    public void updateDocumentFile(DocumentFile documentFile);
    public void deleteDocumentFile(int docFileId);
}

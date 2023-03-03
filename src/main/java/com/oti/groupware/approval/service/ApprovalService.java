package com.oti.groupware.approval.service;

import com.oti.groupware.approval.dto.Document;

public interface ApprovalService {
	public int saveDraft(String html, String empId);
	public Document readDocument(String docId);
}
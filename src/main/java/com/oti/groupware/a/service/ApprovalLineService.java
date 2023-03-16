package com.oti.groupware.a.service;

import java.util.List;

import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;

public interface ApprovalLineService {
	public List<ApprovalLine> getApprovalLines(String docId);
	public List<List<ApprovalLine>> getApprovalLinesList(List<Document> documents);
	int writeOpinion(ApprovalLine approvalLine);
}

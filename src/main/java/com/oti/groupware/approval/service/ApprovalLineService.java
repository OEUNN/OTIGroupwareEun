package com.oti.groupware.approval.service;

import java.util.List;

import com.oti.groupware.approval.dto.ApprovalLine;

public interface ApprovalLineService {
	public List<ApprovalLine> readApprovalLines(String docId);
}

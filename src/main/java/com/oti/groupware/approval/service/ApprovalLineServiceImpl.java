package com.oti.groupware.approval.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dto.ApprovalLine;

@Service
public class ApprovalLineServiceImpl implements ApprovalLineService{
	List<ApprovalLine> approvalLines;
	ApprovalLine approvalLine;
	
	@Autowired
	ApprovalLineDAO approvalLineDAO;

	@Override
	public List<ApprovalLine> readApprovalLines(String docId) {
		approvalLines = approvalLineDAO.getApprovalLinesBydocId(docId);
		return approvalLines;
	}
}

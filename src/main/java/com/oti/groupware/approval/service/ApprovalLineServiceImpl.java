package com.oti.groupware.approval.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.approval.dao.ApprovalLineDAO;
import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;

@Service
public class ApprovalLineServiceImpl implements ApprovalLineService{
	ApprovalLine approvalLine;
	List<ApprovalLine> approvalLines;
	List<List<ApprovalLine>> approvalLineList;
	
	@Autowired
	ApprovalLineDAO approvalLineDAO;

	@Override
	public List<ApprovalLine> getApprovalLines(String docId) {
		approvalLines = approvalLineDAO.getApprovalLinesBydocId(docId);
		return approvalLines;
	}

	@Override
	public List<List<ApprovalLine>> getApprovalLinesList(List<Document> documents) {
		approvalLineList = new ArrayList<List<ApprovalLine>>();
		for (Document document : documents) {
			approvalLines = approvalLineDAO.getApprovalLinesBydocId(document.getDocId());
			approvalLineList.add(approvalLines);
		}
		return approvalLineList;
	}
}

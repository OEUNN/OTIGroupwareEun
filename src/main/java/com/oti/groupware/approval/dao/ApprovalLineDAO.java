package com.oti.groupware.approval.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.approval.dto.ApprovalLine;

public interface ApprovalLineDAO {
	public ApprovalLine getApprovalLineById(@Param("empId") String empId, @Param("docId") int docId);
	public void insertApprovalLine(ApprovalLine approvalLine);
	public void updateApprovalLine(ApprovalLine approvalLine);
	public void deleteApprovalLine(@Param("empId") String empId, @Param("docId") int docId);
}
package com.oti.groupware.approval.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.approval.dto.ApprovalLine;

public interface ApprovalLineDAO {
	ApprovalLine getApprovalLineById(@Param("empId") String empId, @Param("docId") int docId);
    void insertApprovalLine(ApprovalLine approvalLine);
    void updateApprovalLine(ApprovalLine approvalLine);
    void deleteApprovalLine(@Param("empId") String empId, @Param("docId") int docId);
}
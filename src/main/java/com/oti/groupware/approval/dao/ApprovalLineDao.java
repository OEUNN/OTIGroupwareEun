package com.oti.groupware.approval.dao;

import com.oti.groupware.approval.dto.ApprovalLine;

public interface ApprovalLineDao {
    void insertApprovalLine(ApprovalLine approvalLine);
    ApprovalLine getApprovalLineById(String empId, int docId);
    void updateApprovalLine(ApprovalLine approvalLine);
    void deleteApprovalLine(String empId, int docId);
}
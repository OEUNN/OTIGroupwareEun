package com.oti.groupware.approval.dto;

import java.sql.Timestamp;

import com.oti.groupware.employee.dto.Employee;

import lombok.Data;

@Data
public class ApprovalLine {
    private String empId;
    private String docId;
    private String aprvLineState;
    private int aprvLineOrder;
    private String aprvLineRole;
    private Timestamp aprvLineApprovalDate;
    private char aprvLineOpenYn;
    private String aprvLineOpinion;
    
    private Employee employee;
}
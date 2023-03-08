package com.oti.groupware.approval.dto;

import java.sql.Timestamp;

import com.oti.groupware.employee.dto.Department;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.Position;

import lombok.Data;

@Data
public class ApprovalLine {
    private String empId;
    private String docId;
    private String aprvLineState;
    private int aprvLineOrder;
    private String aprvLineRole;
    private Timestamp aprvLineApprovalDate;
    private String aprvLineOpenYn;
    private String aprvLineOpinion;
    
    private Employee employee;
    private Position position;
    private Department department;
}
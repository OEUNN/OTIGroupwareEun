package com.oti.groupware.approval.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalLineDTO {
    private String empId;
    private int docId;
    private String aprvLineState;
    private int aprvLineOrder;
    private String aprvLineRole;
    private Date aprvLineApprovalDate;
    private char aprvLineOpenYn;
    private String aprvLineOpinion;
}
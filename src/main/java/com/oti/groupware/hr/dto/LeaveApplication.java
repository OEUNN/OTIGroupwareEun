package com.oti.groupware.hr.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LeaveApplication {
    private int levAppId;
    private String empId;
    private Date levAppDate;
    private String levAppReason;
    private String levAppCategory;
    private Date levAppStartDate;
    private Date levAppEndDate;
    private String levAppProcessState;
    private Date levAppProcessDate;
    private String levAppApprovalEmpName;
    private String levAppApprovalEmpId;
    private String levAppOpinion;
}
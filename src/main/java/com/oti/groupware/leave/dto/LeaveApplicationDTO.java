package com.oti.groupware.leave.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LeaveApplicationDTO {

    private int levAppId;
    private String empId;
    private Date levAppDate;
    private String levAppReason;
    private String levAppCategory;
    private Date levAppStartDate;
    private Date levAppEndDate;
    private String levAppProcessState;
    private Date levAppProcessDate;
    private String levAppApprovalEmp;
    private String levAppOpinion;
}
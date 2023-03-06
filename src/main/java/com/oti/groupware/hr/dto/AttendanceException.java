package com.oti.groupware.hr.dto;

import lombok.Data;

@Data
public class AttendanceException {
    private int atdExcpId;
    private String empId;
    private String atdExcpReason;
    private String atdExcpCategory;
    private String atdExcpInTime;
    private String atdExcpOutTime;
    private String atdExcpDate;
    private String atdExcpProcessDate;
    private String atdExcpApprovalEmp;
    private String atdExcpOpinion;
    private String atdExcpProcessState;
    private String empName; //new - 작성자 이름
    private String atdInTime; //new - 기존 출근시간
    private String atdOutTime; //new - 기존 퇴근시간
}
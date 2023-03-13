package com.oti.groupware.hr.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AttendanceException {
    private int atdExcpId;
    private String empId;
    private String atdExcpReason;
    private String atdExcpCategory;
    private String atdExcpInTime; //수정출근시간
    private String atdExcpOutTime; //수정퇴근시간
    private Date atdExcpDate;
    private String atdExcpProcessDate;
    private String atdExcpApprovalEmpName;
    private String atdExcpApprovalEmpId;
    private String atdExcpOpinion;
    private String atdExcpProcessState;
    private String empName; //new - 작성자 이름
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date atdOriginInTime; //new - 기존출근시간
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date atdOriginOutTime; //new - 기존퇴근시간
}
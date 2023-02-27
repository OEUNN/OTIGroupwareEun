package com.oti.groupware.hr.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AttendanceDTO {
    private int atdId;
    private String empId;
    private Date atdInTime;
    private Date atdOutTime;
    private String atdState;
}
package com.oti.groupware.hr.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Attendance {
    private int atdId;
    private String empId;
    private Date atdInTime;
    private Date atdOutTime;
    private String atdState;
    private String atdOverTimeYN;
    private String atdOverTimeHours;
}
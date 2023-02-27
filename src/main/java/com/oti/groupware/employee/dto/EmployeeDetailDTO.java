package com.oti.groupware.employee.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeDetailDTO {

    private String empId;
    private char empDetailGender;
    private Date empDetailBirthday;
    private String empDetailWorkplace;
    private char empDetailMarriedYN;
    private Date empDetailEmploymentDate;
    private String empDetailEducation;
    private int empDetailSeniority;
    private String empDetailEmploymentState;
    private char empDetailMilitaryServiceYN;
    private String empDetailMajor;
    private Date empDetailQuitDate;
}
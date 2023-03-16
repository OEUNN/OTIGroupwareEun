package com.oti.groupware.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeeDetail {
    private String empId; //사번
    private char empDetailGender; //성별
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailBirthday; //생일
    private String empDetailWorkplace; //근무지
    private char empDetailMarriedYN; //결현여부
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailEmploymentDate; //입사날짜
    private String empDetailEducation; //최종학력
    private int empDetailSeniority; //근속년수
    private String empDetailEmploymentState; //재직상태
    private char empDetailMilitaryServiceYN; //병역여부
    private String empDetailMajor; //전공
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailQuitDate; //퇴사날짜
}